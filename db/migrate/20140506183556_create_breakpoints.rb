class CreateBreakpoints < ActiveRecord::Migration
  def change
    create_table :breakpoints do |t|
      t.integer :project_id
      t.integer :user_id
      t.decimal :amount
      t.text :breakpoint_description

      t.timestamps
    end
  end
end
