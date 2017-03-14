
  gem "google-cloud-vision"
  require "google/cloud/vision"

  vision = Google::Cloud::Vision.new(
                project: "Googleprojectid",
                keyfile: "keyfile.json"  # You can download keyfile from console.developers.google.com
              )

     image = vision.image(params[:file][:tempfile])

     a = vision.annotate image

     result = {}
     features = {}
     likelihood = {}

     a.faces.each{|k|
        features["confidence"] = k.features.confidence
        likelihood["joy"] = k.likelihood.joy?
        likelihood["sorrow"] = k.likelihood.sorrow?
        likelihood["anger"] = k.likelihood.anger?
        likelihood["surprise"] =k.likelihood.surprise?
        likelihood["under_exposed"]=k.likelihood.under_exposed?
        likelihood["blurred"]=k.likelihood.blurred?
        likelihood["headwear"]=k.likelihood.headwear?
     }

     result["faces"] = {"features" => features, "likelihood" => likelihood}

     landmarks = []

     a.landmarks.each{|l|
              landmarks << l.description
     }

     result["landmarks"] = landmarks

     logos= []
     a.logos.each{|l|
              logos << l.description
     }

     result["logos"] = logos

     labels = []
     a.labels.each{|l|
       labels << l.description
    }

    result["labels"] = labels

    result["text"] = a.text && a.text.text

    safesearch = {}
    safesearch["adult"]=a.safe_search.adult?
    safesearch["spoof"]=a.safe_search.spoof?
    safesearch["medical"]=a.safe_search.medical?
    safesearch["violence"]=a.safe_search.violence?

    result["safe_search"]=safesearch

    properties = []

    a.properties.colors.each{|c| properties << c.rgb}

    result["colors"]=properties

    entities = []

    a.web.entities.each{|k| entities << k.description}

    result["webentities"]=entities


     result.to_json
