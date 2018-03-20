# require modules here
require "yaml"

def load_library(file_path)
  emoticons_hash = Hash.new
  emoticons_hash = {"get_meaning"=>{}, "get_emoticon"=>{}}
  YAML.load_file(file_path).each do |meaning, array|
    english, japanese = array
    emoticons_hash["get_emoticon"][english] = japanese
    emoticons_hash["get_meaning"][japanese] = meaning
  end
  emoticons_hash
end



def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_emoticon"][emoticon]
  if result
    result
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  result = library["get_meaning"][emoticon]
  if result
    result
  else
    return "Sorry, that emoticon was not found"
  end
end
