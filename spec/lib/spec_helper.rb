#we need the actual library file
require_relative '../../lib/RAWG_API'
# For Ruby < 1.9.3, use this instead of require_relative
# require(File.expand_path('../../lib/RAWG_API', __FILE__))

#dependencies
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'JSON'


#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/RAWG_API_cassettes'
  c.hook_into :webmock
end