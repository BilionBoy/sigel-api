class AddStatusToGVeiculos < ActiveRecord::Migration[7.2]
  def change
    add_column :g_veiculos, :status, :string, default: "pendente", null: false
  end
end
