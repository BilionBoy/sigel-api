# frozen_string_literal: true

class GTipoVeiculo < ApplicationRecord
  
  validates :descricao, presence: true
  
end
