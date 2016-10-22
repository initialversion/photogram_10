class Vote < ApplicationRecord
  # Direct associations

  belongs_to :fan,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :fan_id, :presence => true

  validates :photo_id, :uniqueness => { :scope => [:fan_id], :message => "already liked" }

  validates :photo_id, :presence => true

end
