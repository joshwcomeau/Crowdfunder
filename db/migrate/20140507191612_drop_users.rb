class DropUsers < ActiveRecord::Migration
  def change
    drop_table(User)
  end
end
