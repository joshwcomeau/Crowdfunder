class AddFieldsToPledge < ActiveRecord::Migration
  def change
    add_column :pledges, :project_id, :integer
    add_column :pledges, :user_id, :integer
    add_column :pledges, :breakpoint_id, :integer
  end
end
