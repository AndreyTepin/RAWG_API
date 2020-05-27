require "httparty"
    Dir[File.dirname(__FILE__) + '/RAWG_API/*.rb'].each do |file|
    require file
end