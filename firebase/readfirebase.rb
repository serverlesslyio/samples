gem 'firebase'


require 'firebase'

base_uri = 'https://dinosaur-facts.firebaseio.com/'
firebase = Firebase::Client.new(base_uri)

firebase.set("dinosaurs", "newdinosaurs")
