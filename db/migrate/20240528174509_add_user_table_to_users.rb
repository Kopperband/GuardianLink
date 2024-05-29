class AddUserTableToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :background_check, :boolean
    add_column :users, :hours_per_week, :integer
    add_column :users, :point_of_contact_email, :string
    add_column :users, :organization_name, :string
    add_column :users, :areas_of_concern, :string
    add_column :users, :role, :integer
  end
end
