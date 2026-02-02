# frozen_string_literal: true

class GLeilao < ApplicationRecord
  
  validates :titulo, :codigo, :data_inicio_prevista, :data_termino_prevista, :observacoes, presence: true
  
end
