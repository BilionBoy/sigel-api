# frozen_string_literal: true

module Api
  module V1
    class GLeilaosController < ApplicationController
      before_action :set_g_leilao, only: [ :show, :update, :destroy ]

      def index
        query  = GLeilao.ransack(params[:q])
        result = paginate(
          query.result.order(:id),
          params[:per_page]
        )

        render_success(
          data: result,
          message: "GLeilaos listados com sucesso"
        )
      end

      def show
        render_success(
          data: @g_leilao,
          message: "GLeilao encontrado com sucesso"
        )
      end

      def create
        g_leilao = GLeilao.new(g_leilao_params)

        if g_leilao.save
          render_success(
            data: g_leilao,
            message: "GLeilao criado com sucesso",
            status: :created
          )
        else
          render_error(
            message: "Erro ao criar gleilao",
            errors: g_leilao.errors.full_messages
          )
        end
      end

      def update
        if @g_leilao.update(g_leilao_params)
          render_success(
            data: @g_leilao,
            message: "GLeilao atualizado com sucesso"
          )
        else
          render_error(
            message: "Erro ao atualizar gleilao",
            errors: @g_leilao.errors.full_messages
          )
        end
      end

      def destroy
        @g_leilao.destroy
        render_success(
          message: "GLeilao removido com sucesso"
        )
      end

      private

      def set_g_leilao
        @g_leilao = GLeilao.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_error(
          message: "GLeilao não encontrado",
          status: :not_found
        )
      end

      def g_leilao_params
        params
          .require(:g_leilao)
          .permit(:titulo, :codigo, :data_inicio_prevista, :data_termino_prevista, :observacoes)
      end
    end
  end
end
