class AddGoalsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :start_date, :datetime
    add_column :projects, :finish_date, :datetime
    add_column :projects, :funding_goal, :decimal
  end
end
