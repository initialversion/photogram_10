class FriendRequest < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :accepted, :presence => true

  validates :accepted, :inclusion => { :in => [ 'pending', ' accepted', ' declined' ]  }

  validates :recipient_id, :uniqueness => { :scope => [:sender_id], :message => "already requested" }

  validates :recipient_id, :presence => true

  validates :sender_id, :presence => true

end
