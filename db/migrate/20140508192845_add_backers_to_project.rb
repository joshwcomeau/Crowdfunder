class AddBackersToProject < ActiveRecord::Migration
  def change
    add_column :projects, :funded, :integer
  end
end
