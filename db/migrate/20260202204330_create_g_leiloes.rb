# frozen_string_literal: true

class CreateGLeilaos < ActiveRecord::Migration[7.2]
  def up
    return if table_exists?(:g_leiloes)

    create_table :g_leiloes do |t|
      t.string :titulo
      t.string :codigo
      t.date :data_inicio_prevista
      t.date :data_termino_prevista
      t.text :observacoes
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :g_leiloes, :deleted_at
  end

  def down
    drop_table :g_leiloes if table_exists?(:g_leiloes)
  end
end
