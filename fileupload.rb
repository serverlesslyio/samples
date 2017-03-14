

gem "google-cloud-storage"
require "google/cloud/storage"


storage = Google::Cloud::Storage.new(
                    project: "whatevreryourprojectid",
                    keyfile: "keyfile.json" #You can download this json from google console
                  )

bucket_name = "yourbucket"
bucket = storage.bucket bucket_name
file2 = bucket.create_file params[:file][:tempfile], params[:file][:filename], acl: "public"
file2.url   # returning file public url
