class Postsub < ActiveRecord::Base
  belongs_to :sub

  belongs_to :post
end
