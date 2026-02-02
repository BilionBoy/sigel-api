# frozen_string_literal: true

class GVeiculoSerializer < ActiveModel::Serializer
  attributes :id,
             :numero_interno,
             :placa,
             :chassi,
             :renavam,
             :marca,
             :modelo,
            :apto,
             :ano,
             :cor,
             :moto,
             :tombamento,
             :created_at,
             :updated_at

  belongs_to :g_tipo_veiculo
end
