class Vote < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :photo_id, :uniqueness => { :scope => [:fan_id], :message => "already liked" }

  validates :photo_id, :presence => true

end
