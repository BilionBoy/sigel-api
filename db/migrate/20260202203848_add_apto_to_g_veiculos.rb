class AddAptoToGVeiculos < ActiveRecord::Migration[7.2]
  def change
    unless column_exists?(:g_veiculos, :apto)
      add_column :g_veiculos, :apto, :boolean, default: false, null: false
    end
  end
end
