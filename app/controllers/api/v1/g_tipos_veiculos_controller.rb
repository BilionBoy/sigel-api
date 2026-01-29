# frozen_string_literal: true

module Api
  module V1
    class GTiposVeiculosController < ApplicationController
      before_action :set_g_tipo_veiculo, only: [ :show, :update, :destroy ]

      def index
        query  = GTipoVeiculo.ransack(params[:q])
        result = paginate(
          query.result.order(:id),
          params[:per_page]
        )

        render_success(
          data: result,
          message: "GTipoVeiculos listados com sucesso"
        )
      end

      def show
        render_success(
          data: @g_tipo_veiculo,
          message: "GTipoVeiculo encontrado com sucesso"
        )
      end

      def create
        g_tipo_veiculo = GTipoVeiculo.new(g_tipo_veiculo_params)

        if g_tipo_veiculo.save
          render_success(
            data: g_tipo_veiculo,
            message: "GTipoVeiculo criado com sucesso",
            status: :created
          )
        else
          render_error(
            message: "Erro ao criar gtipoveiculo",
            errors: g_tipo_veiculo.errors.full_messages
          )
        end
      end

      def update
        if @g_tipo_veiculo.update(g_tipo_veiculo_params)
          render_success(
            data: @g_tipo_veiculo,
            message: "GTipoVeiculo atualizado com sucesso"
          )
        else
          render_error(
            message: "Erro ao atualizar gtipoveiculo",
            errors: @g_tipo_veiculo.errors.full_messages
          )
        end
      end

      def destroy
        @g_tipo_veiculo.destroy
        render_success(
          message: "GTipoVeiculo removido com sucesso"
        )
      end

      private

      def set_g_tipo_veiculo
        @g_tipo_veiculo = GTipoVeiculo.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_error(
          message: "GTipoVeiculo não encontrado",
          status: :not_found
        )
      end

      def g_tipo_veiculo_params
        params
          .require(:g_tipo_veiculo)
          .permit(:descricao)
      end
    end
  end
end
