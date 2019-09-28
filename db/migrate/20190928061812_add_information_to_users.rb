class AddInformationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :information, :string
  end
end
