
require 'json'

begin
    {"file_contents" => File.read(params[:file][:tempfile])}.to_json
  rescue
    {"error" => "Invalid File"}.to_json
  end
