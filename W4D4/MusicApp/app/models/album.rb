class Album < ActiveRecord::Base
  validates :title, :band_id, :recording_type, presence: true

  has_many(
    :tracks,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id
  )

  belongs_to(
    :band,
    class_name: "Band",
    foreign_key: :band_id,
    primary_key: :id
  )

end
