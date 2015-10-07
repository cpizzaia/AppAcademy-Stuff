require 'rspec'
require "enumerables"

describe "Array#my_uniq" do
  let(:array) {[1,1,2,3,2]}

  it "doesn't modify the original array" do
    duped_array = array.dup
    duped_array.my_uniq
    expect(duped_array).to eq(array)
  end

  it "returns an array with no duplicates" do
    expect(array.my_uniq).to eq([1,2,3])
  end

  it "doesn't call ruby's uniq method" do
    expect(array.my_uniq).not_to receive(:uniq)
    array.my_uniq
  end

end

describe "Array#two_sum" do
  let(:array) {[-1,0,2,-2,1]}

  it "doesn't modify original array" do
    duped_array = array.dup
    duped_array.two_sum
    expect(duped_array).to eq(array)
  end

  it "returns an empty array if no position pairs sum to zero" do
    array = [1,2,3,4]
    expect(array.two_sum).to eq([])
  end

  it "it finds all pairs of positions that sum to zero" do
    expect(array.two_sum).to eq([[0,4], [2,3]])
  end
end

describe "Array#my_transpose" do
  let (:square_array) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}
  let (:tall_rect_array) {[
    [0,1],
    [2,3],
    [4,5]
  ]}
  let (:short_rect_array) {[
    [0,2,4],
    [1,3,5]
  ]}
  let (:transposed_square) {[
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]}

  it "doesn't modify the original array" do
    duped_array = square_array.dup
    duped_array.my_transpose
    expect(duped_array).to eq(square_array)
  end

  it "transposes the array" do
    expect(square_array.my_transpose).to eq(transposed_square)
  end

  it "it works for rectangular arrays" do
    expect(tall_rect_array.my_transpose).to eq(short_rect_array)
 end
end

describe "Array#stock_picker" do
  let(:prices) {[10, 30, 70, 20, 40, 50]}

  it "doesn't modify the original array" do
    duped_array = prices.dup
    duped_array.my_uniq
    expect(duped_array).to eq(prices)
  end

  it "returns the most profitable pair of days in an array" do
    expect(prices.stock_picker).to eq([0, 2])
  end







end
