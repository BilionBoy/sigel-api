# frozen_string_literal: true

class GLeilaoSerializer < ActiveModel::Serializer
  attributes :id,
             :titulo, :codigo, :data_inicio_prevista, :data_termino_prevista, :observacoes,
             :created_at,
             :updated_at
end
