# frozen_string_literal: true

class CreateGVeiculos < ActiveRecord::Migration[7.2]
  def up
    return if table_exists?(:g_veiculos)

    create_table :g_veiculos do |t|
      t.string :numero_interno
      t.string :placa
      t.string :chassi
      t.string :renavam
      t.string :marca
      t.string :modelo
      t.integer :ano
      t.string :cor
      t.string :motor
      t.references :g_tipo_veiculo, null: false, foreign_key: true
      t.string :tombamento
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :g_veiculos, :deleted_at
  end

  def down
    drop_table :g_veiculos if table_exists?(:g_veiculos)
  end
end
