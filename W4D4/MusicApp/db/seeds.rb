

User.create!(email: "cody", password: "overpower16")

Band.create!(name: "Daft Punk")
Band.create!(name: "Rise Against")
Band.create!(name: "Gorillaz")
Band.create!(name: "Rage Against The Machine")

Album.create!(title: "Random Access Memories", band_id: Band.find_by_name("Daft Punk").id, recording_type: "Studio")
Album.create!(title: "Discovery", band_id: Band.find_by_name("Daft Punk").id, recording_type: "Live")
Album.create!(title: "Appeal to Reason", band_id: Band.find_by_name("Rise Against").id, recording_type: "Studio")
Album.create!(title: "The Fall", band_id: Band.find_by_name("Gorillaz").id, recording_type: "Studio")
Album.create!(title: "Evil Empire", band_id: Band.find_by_name("Rage Against The Machine").id, recording_type: "Live")

5.times do |i|
  Track.create!(title: "Track#{i}", album_id: Album.find_by_title("Random Access Memories").id, track_type: "Regular")
end

10.times do |i|
  Track.create!(title: "Track#{i}", album_id: Album.find_by_title("Discovery").id, track_type: "Regular")
end

7.times do |i|
  Track.create!(title: "Track#{i}", album_id: Album.find_by_title("Appeal to Reason").id, track_type: "Regular")
end

12.times do |i|
  Track.create!(title: "Track#{i}", album_id: Album.find_by_title("The Fall").id, track_type: "Regular")
end

22.times do |i|
  Track.create!(title: "Track#{i}", album_id: Album.find_by_title("Evil Empire").id, track_type: "Regular")
end
