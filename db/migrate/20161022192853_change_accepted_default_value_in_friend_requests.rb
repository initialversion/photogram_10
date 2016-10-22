class ChangeAcceptedDefaultValueInFriendRequests < ActiveRecord::Migration[5.0]
  def change
    change_column_default :friend_requests, :accepted, 'pending'
  end
end
