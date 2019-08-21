class AddProviderUidToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :provider, :string
    add_column :teachers, :uid, :string
  end
end
