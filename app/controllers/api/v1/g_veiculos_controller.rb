# frozen_string_literal: true

module Api
  module V1
    class GVeiculosController < ApplicationController
      before_action :set_g_veiculo, only: %i[show update destroy]

      def index
        veiculos = GVeiculo.where(deleted_at: nil)

        veiculos = aplicar_filtro_status(veiculos)

        query  = veiculos.ransack(params[:q])
        result = paginate(
          query.result.order(:id),
          params[:per_page]
        )

        render_success(
          data: result,
          message: "Veículos listados com sucesso"
        )
      end

      def show
        render_success(
          data: @g_veiculo,
          message: "Veículo encontrado com sucesso"
        )
      end

      def create
        g_veiculo = GVeiculo.new(g_veiculo_params)

        if g_veiculo.save
          render_success(
            data: g_veiculo,
            message: "Veículo criado com sucesso",
            status: :created
          )
        else
          render_error(
            message: "Erro ao criar veículo",
            errors: g_veiculo.errors.full_messages
          )
        end
      end

      def update
        if @g_veiculo.update(g_veiculo_params)
          render_success(
            data: @g_veiculo,
            message: "Veículo atualizado com sucesso"
          )
        else
          render_error(
            message: "Erro ao atualizar veículo",
            errors: @g_veiculo.errors.full_messages
          )
        end
      end

      def destroy
        @g_veiculo.update(deleted_at: Time.current)

        render_success(
          message: "Veículo removido com sucesso"
        )
      end

      private

      def aplicar_filtro_status(veiculos)
        return veiculos if params[:status].blank? || params[:status] == "todos"

        status_validos = %w[verificado_apto pendente impedido em_leilao arrematado]

        if status_validos.include?(params[:status])
          veiculos.where(status: params[:status])
        else
          veiculos
        end
      end

      def set_g_veiculo
        @g_veiculo = GVeiculo.where(deleted_at: nil).find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_error(
          message: "Veículo não encontrado",
          status: :not_found
        )
      end

      def g_veiculo_params
        params
          .require(:g_veiculo)
          .permit(
            :numero_interno,
            :placa,
            :chassi,
            :renavam,
            :marca,
            :modelo,
            :ano,
            :cor,
            :moto,
            :g_tipo_veiculo_id,
            :tombamento,
            :apto,
            :status
          )
      end
    end
  end
end
