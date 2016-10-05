# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string           default("PENDING"), not null
#

class CatRentalRequest < ActiveRecord::Base
  validates :start_date, :end_date, :cat_id, presence: true
  validates :status, presence: true,
            inclusion: { in: %w(PENDING DENIED APPROVED),
                         message: "%(status) not valid status"}
  validate :valid_date_range, :valid_rental_availability


  belongs_to :cat

  def approve!
    self.status = "APPROVED"
    overlapping_rentals.each do |other|
      other.deny!
    end

    self.save
  end

  def deny!
    self.status = "DENIED"
    self.save
    print self.status * 50
  end

  def overlapping_rentals
    options = [self.cat_id, self.start_date, self.end_date, self.start_date, self.end_date]
    CatRentalRequest.where(
      "status != 'DENIED' AND
        cat_id = ? AND
          ((start_date BETWEEN ? AND ?)
          OR (end_date BETWEEN ? AND ? ))", *options)
  end
  def overlapping_approved_rentals
    options = [self.id, self.cat_id, self.start_date, self.end_date, self.start_date, self.end_date]
    CatRentalRequest.where(
      "status = 'APPROVED' AND
      id != ? AND
      cat_id = ? AND
          ((start_date BETWEEN ? AND ?)
          OR (end_date BETWEEN ? AND ? ))", *options)
  end

  def valid_rental_availability
    unless overlapping_approved_rentals.empty?
      errors[:cat] << "is not available for the date range selected."
    end
  end

  def valid_date_range
    if self.start_date > self.end_date
      errors[:date_range] << 'is invalid. Start cannot be before end'
    end
  end
end
