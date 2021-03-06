class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Direct associations

  has_many   :received_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :posted_photos,
             :class_name => "Photo",
             :foreign_key => "owner_id",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  has_many   :votes,
             :foreign_key => "fan_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :timeline,
             :through => :follows,
             :source => :posted_photos

  has_many   :followers,
             :through => :received_friend_requests,
             :source => :sender

  has_many   :follows,
             :through => :sent_friend_requests,
             :source => :recipient

  has_many   :liked_photos,
             :through => :votes,
             :source => :photo

  # Validations

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
