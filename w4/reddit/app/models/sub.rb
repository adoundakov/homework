class Sub < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :moderator_id, presence: true

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User

  has_many :postsubs,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :Postsub

  has_many :posts,
    through: :postsubs,
    source: :post

end
