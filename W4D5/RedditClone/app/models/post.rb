class Post < ActiveRecord::Base
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :comments,
    class_name: "Comment",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )

  has_many(
    :post_subs,
    class_name: "PostSub",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post
  )

  def top_level_comments
    self.comments.where("parent_comment_id IS NULL")
  end

end
