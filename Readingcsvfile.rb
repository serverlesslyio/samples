
require 'csv'
require 'json'

csv = CSV.new(File.read(params[:file][:tempfile]), :headers => true, :header_converters => :symbol, :converters => :all)

extracted_data =  csv.to_a.map {|row| row.to_hash }

extracted_data.to_json


