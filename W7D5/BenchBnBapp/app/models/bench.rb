class Bench < ActiveRecord::Base
  validates :description, :lat, :lng, presence: true;

  def self.in_bounds(bounds, seating = nil)
    seating == nil ? benches = self.all : benches = self.all.where("seating >=" + seating)
    neb = bounds["northEast"]
    seb = bounds["southWest"]
    results = []
    benches.each do |bench|
      results << bench if bench.lat.between?(seb["lat"].to_f, neb["lat"].to_f) && bench.lng.between?(seb["lng"].to_f, neb["lng"].to_f)
    end
    results
  end

end
