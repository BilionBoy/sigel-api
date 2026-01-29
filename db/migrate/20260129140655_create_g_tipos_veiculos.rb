# frozen_string_literal: true

class CreateGTiposVeiculos < ActiveRecord::Migration[7.2]
  def up
    return if table_exists?(:g_tipos_veiculos)

    create_table :g_tipos_veiculos do |t|
      t.string :descricao
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :g_tipos_veiculos, :deleted_at
  end

  def down
    drop_table :g_tipos_veiculos if table_exists?(:g_tipos_veiculos)
  end
end
