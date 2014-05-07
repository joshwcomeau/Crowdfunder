class ChangeBreakpointNameInPledgeTable < ActiveRecord::Migration
  def change
    rename_column :pledges, :breakpoint_id, :tier_id
  end
end
