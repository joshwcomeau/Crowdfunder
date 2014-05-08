class ChangeBreakpointDescriptionName < ActiveRecord::Migration
  def change
    rename_column :tiers, :breakpoint_description, :tier_description
  end
end
