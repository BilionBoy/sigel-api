class GVeiculo < ApplicationRecord
  belongs_to :g_tipo_veiculo

  scope :ativos, -> { where(deleted_at: nil) }
end
