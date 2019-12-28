require 'yaml'

def load_library(file)
  data = YAML.load_file(file)

  meaning  = {}
  emoticon = {}

  data.each do |k, v|
    meaning[v[1]]  = k
    emoticon[v[0]] = v[1]
  end

  new_data = {
    get_meaning:  meaning,
    get_emoticon: emoticon
  }
  new_data
end

def get_japanese_emoticon(file, emoticon)
  data = load_library(file)


  jp_emoticon = data[:get_emoticon].values_at(emoticon).join

  if jp_emoticon.length < 1
    p 'Sorry, that emoticon was not found'
  else
    jp_emoticon
  end
end

def get_english_meaning(file, emoticon)
  data = load_library(file)

  meaning = data[:get_meaning].values_at(emoticon).join

  if meaning.length < 1
    p 'Sorry, that emoticon was not found'
  else
    meaning
  end
end
