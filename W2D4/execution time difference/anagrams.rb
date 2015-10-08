require 'byebug'
def first_anagram(word)
  return [word] if word.length == 1

  words = []
  char = word[0]
  sub_word = word[1..(word.length - 1)]
  sub_anagram = first_anagram(sub_word)
  sub_anagram.each do |anagram|
    word.each_char.with_index do |_, j|
      if j == 0
        words << char + anagram
      elsif j == anagram.length
        words << anagram + char
        break
      else
        temp = anagram[0...j] + char + anagram[j...anagram.length]
        words << temp unless words.include?(temp)
      end
    end
  end

  words
end

def second_anagram(word1,word2)
  word1_dup = word1.dup
  word2_dup = word2.dup
  word1.each_char do |char1|
    if word2.include?(char1)
      word1_dup.delete!(char1)
      word2_dup.delete!(char1)
    end
  end
  
  word1_dup.empty? && word2_dup.empty?
end


def third_anagram(word1,word2)
  word1_dup = word1.dup.split("").sort.join("")
  word2_dup = word2.dup.split("").sort.join("")
  word1_dup == word2_dup
end

def fourth_anagram(word1,word2)
  word1_hash = string_to_hash(word1)
  word2_hash = string_to_hash(word2)
  word1_hash == word2_hash
end

def string_to_hash(string)
  string_hash = Hash.new(0)
  string.each_char do |char|
    string_hash[char] += 1
  end
  string_hash
end
