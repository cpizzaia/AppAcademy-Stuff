class Sub < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true
  validates :description, :moderator_id, presence: true

  has_many(
    :posts,
    through: :post_subs,
    source: :post
  )
  
  has_many(
    :post_subs,
    class_name: "PostSub",
    foreign_key: :sub_id,
    primary_key: :id
  )

  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :moderator_id,
    primary_key: :id
  )


end
