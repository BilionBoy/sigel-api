class GVeiculo < ApplicationRecord
  belongs_to :g_tipo_veiculo

  STATUSES = %w[verificado_apto pendente impedido em_leilao arrematado].freeze

  validates :status, inclusion: { in: STATUSES }

  scope :ativos, -> { where(deleted_at: nil) }
end
