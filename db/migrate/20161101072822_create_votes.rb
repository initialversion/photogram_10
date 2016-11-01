class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :fan_id
      t.integer :photo_id

      t.timestamps

    end
  end
end
