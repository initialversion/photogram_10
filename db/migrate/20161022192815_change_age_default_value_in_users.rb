class ChangeAgeDefaultValueInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :age, '18'
  end
end
