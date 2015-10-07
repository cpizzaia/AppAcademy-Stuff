require 'deck'
require 'byebug'

class Hand
  attr_reader :hand
  def initialize(deck, hand = nil)
    @hand = hand
    if @hand.nil?
      @hand = deck.draw(5)
    end
  end

  def find_value

  end

  def create_hand_hash
    result = Hash.new(0)
    @hand.each do |card|
      result[card.value] += 1
    end
    result
  end

  def royal_flush?
    unless flush? && straight?
      return false
    else
      looking_for_aces = []
      @hand.each do |card|
        return true if card.value == 14
      end
    end
    false
  end

  def straight_flush?
    if straight? && flush?
      [create_hand_hash.keys.sort.last] + [:straight_flush]
    else
      false
    end
  end

  def four_of_a_kind?
    hand_hash = create_hand_hash
    if hand_hash.has_value? 4
      hand_hash.keep_if { |k,v| v == 4}
      hand_hash.keys + [:four_of_a_kind]
    else
      false
    end
  end

  def full_house?
    hand_hash = create_hand_hash
    if hand_hash.values.sort == [2, 3]
      hand_hash.keep_if { |k,v| v == 3}
      hand_hash.keys + [:full_house]
    else
      false
    end
  end


  def three_of_a_kind?
    hand_hash = create_hand_hash
    if hand_hash.has_value? 3
      hand_hash.keep_if { |k,v| v == 3}
      hand_hash.keys + [:three_of_a_kind]
    else
      false
    end

  end

  def two_pair?
    hand_hash = create_hand_hash
    if hand_hash.values.uniq.length == 2
      hand_hash.keep_if { |k,v| v == 2}
      hand_hash.keys + [:two_pair]
    else
      false
    end
  end

  def pair?
    hand_hash = create_hand_hash
    if hand_hash.values.sort == [1,1,1,2]
      hand_hash.keep_if { |k,v| v == 2}
      hand_hash.keys + [:pair]
    else
      false
    end
  end

  def high_card
    create_hand_hash.keys.sort.last
  end

  def flush?
    last_card = nil
    @hand.each do |card|
      if last_card.nil?
        last_card = card
      elsif last_card.suit != card.suit
        return false
      end
    end
    [create_hand_hash.keys.sort.last] + [:flush]
  end

  def straight?
    values = []
    @hand.each do |card|
      values << card.value
    end
    values.sort!
    prev_val = nil
    values.each do |value|
      #debugger
      if prev_val.nil?
        prev_val = value
      elsif value - prev_val != 1
        return false
      else
        prev_val = value
      end
    end
    [create_hand_hash.keys.sort.last] + [:straight]
  end






end
