class ChangeBirthdayDefaultValueInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :birthday, 'January 1st, 1998'
  end
end
