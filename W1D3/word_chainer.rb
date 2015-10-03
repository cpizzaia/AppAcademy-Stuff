require 'byebug'
class WordChainer
  def initialize(dictionary_file_name = "dictionary.txt")
    @dictionary = File.readlines(dictionary_file_name)
    self.clean_up
  end
  def clean_up
    @dictionary.map! do |word|
      word.chomp
    end
  end
  def adjacent_words(word)
    adjacent_words = []
    @dictionary.each do |dict_word|
      differences = 0
      next if dict_word.length != word.length
      for i in 0..word.length-1
        if word[i] != dict_word[i]
          differences += 1
        end
        if differences > 1
          break
        end
      end
      if differences == 1
        adjacent_words << dict_word
      end
    end
    adjacent_words
  end


  def run(source, target)
    @current_words = [source]
    @all_seen_words = {source => nil}
    while (!@current_words.empty?)
      @current_words = explore_current_words
    end
    build_path(target, source)
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |word|
      adj_words = self.adjacent_words(word)
      adj_words.each do |ad_word|
        if !@all_seen_words.include?(ad_word)
          new_current_words << ad_word
          @all_seen_words[ad_word] = word
        end
      end
    end
    new_current_words
  end

  def print_word_and_origin
    @all_seen_words.each do |key,value|
      puts "#{key} #{value}"
    end
  end

  def build_path(target,source)
    path = []
    value = target
    while value != source
      path << value
      value = @all_seen_words[value]
    end
    path << source
    path.reverse!
    print "path = #{path}"
  end
end
