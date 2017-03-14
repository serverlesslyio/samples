
  gem 'alchemy-api-rb'
  require 'alchemy_api'
  require 'json'

  begin
    AlchemyAPI.key = "71e******05808"
    {"result" => AlchemyAPI::EntityExtraction.new.search(text: File.read(params[:file][:tempfile]))}.to_json
  rescue
    {"error" => "Invalid File"}.to_json
  end
