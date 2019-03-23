class AddContactInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :name, :string
    add_column :contacts, :email, :string
    add_column :contacts, :comments, :text
    add_column :contacts, :created_at, :datetime
    add_column :contacts, :updated_at, :datetime
  end
end
