class AddRegisterToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :register, :boolean, default: true, null: false;
  end
end
