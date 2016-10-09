class Post < ActiveRecord::Base
  validates :title, :author_id, :content, presence: true

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :subs,
    through: :postsubs,
    source: :sub

  has_many :comments

  has_many :postsubs
end
