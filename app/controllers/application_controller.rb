class ApplicationController < ActionController::API
  include JsonResponse
  include PagyPagination

  before_action :authenticate_user!

  attr_reader :current_user

  private

  def authenticate_user!
    header = request.headers["Authorization"]
    token  = header&.split(" ")&.last

    payload = JwtService.decode(token)

    return unauthorized! unless payload

    @current_user = User.find_by(id: payload["user_id"])

    unauthorized! unless @current_user
  end

  def unauthorized!
    render json: { error: "Não autorizado" }, status: :unauthorized
  end
end
