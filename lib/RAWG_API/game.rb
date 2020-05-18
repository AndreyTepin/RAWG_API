module RAWG_API
  class Game

    attr_accessor :slug

    include HTTParty

    base_uri 'https://api.rawg.io'

    def initialize(slug)
      self.slug = slug
    end

    def details(force = false)
      force ? @details = get_details : @details ||= get_details
    end

    def method_missing(name, *args, &block)
      details.has_key?(name.to_s) ? details[name.to_s] : super
    end

    private

    def get_details
      self.class.get("/api/games/#{self.slug}")
    end

  end
end