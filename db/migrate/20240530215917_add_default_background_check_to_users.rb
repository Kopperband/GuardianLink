class AddDefaultBackgroundCheckToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :background_check, from: nil, to: false
  end
end
