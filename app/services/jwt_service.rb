class JwtService
  SECRET = Rails.application.secret_key_base
  ALG = "HS256"

  def self.encode(payload)
    JWT.encode(
      payload.merge(exp: 24.hours.from_now.to_i),
      SECRET,
      ALG
    )
  end

  def self.decode(token)
    JWT.decode(token, SECRET, true, algorithm: ALG).first
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end
end
