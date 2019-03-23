class AddColumnToPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :name, :string
    add_column :plans, :price, :decimal
  end
end
