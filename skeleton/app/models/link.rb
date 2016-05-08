class Link < ActiveRecord::Base
  validates :title, :url, :user_id, presence: true

  has_many(
    :comments,
    class_name: 'Comment',
    foreign_key: :link_id,
    primary_key: :id
  )

  belongs_to(
    :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )
end
