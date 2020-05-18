require_relative '../../../spec/lib/spec_helper'
# For Ruby < 1.9.3, use this instead of require_relative
# require (File.expand_path('./../../../spec_helper', __FILE__))

describe RAWG_API::Game do

  describe "default attributes" do

    it "must include httparty methods" do
      RAWG_API::Game.must_include HTTParty
    end

    it "must have the base url set to the RAWG API endpoint" do
      RAWG_API::Game.base_uri.must_equal 'https://api.rawg.io'
    end

  end

  describe "default instance attributes" do

    let(:game) { RAWG_API::Game.new('starcraft') }

    it "must have an slug attribute" do
      game.must_respond_to :slug
    end

    it "must have the right slug" do
      game.slug.must_equal 'starcraft'
    end

  end

  describe "GET details" do

    let(:game) { RAWG_API::Game.new('starcraft') }

    before do
      VCR.insert_cassette 'base', :record => :new_episodes
    end

    after do
      VCR.eject_cassette
    end

    it "must have a game details method" do
      game.must_respond_to :details
    end

    it "must parse the api response from JSON to Hash" do
      JSON.parse(game.details.to_s, {'a':1})
    end

    it "must perform the request and get the data" do
      game.details["name"].must_equal 'StarCraft'
    end

    it "records the fixture" do
      RAWG_API::Game.get('/games/starcraft')
    end

    describe "dynamic attributes" do

      before do
        game.details
      end

      it "must return the attribute value if present in details" do
          game.id.must_equal 32716
       end

      it "must raise method missing if attribute is not present" do
        lambda { game.foo_attribute }.must_raise NoMethodError
      end

    end

  end
end