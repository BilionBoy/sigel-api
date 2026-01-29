# frozen_string_literal: true

class GTipoVeiculoSerializer < ActiveModel::Serializer
  attributes :id, :descricao,  :created_at, :updated_at
end
