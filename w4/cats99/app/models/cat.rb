# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  validates :description, :name, :birth_date, presence: true
  validates :color, presence: true,
        inclusion: { in: %w(red orange yellow green blue purple brown black white),
                     message: "%(color) is not a valid color"}
  validates :sex, presence: true,
        inclusion: { in: %w(M F), message: "%{sex} not a valid sex"}

  has_many :cat_rental_requests, dependent: :destroy
end
