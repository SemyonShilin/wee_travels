module Core
  class Jwt < Operation
    def encode(payload, exp = 1.year.from_now)
      payload[:exp] = exp.to_i
      token = JWT.encode(payload, Rails.application.secrets.secret_key_base)

      Success(token)
    end

    def decode(token)
      result =
        Try() do
          body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
          body.symbolize_keys
        end.to_result

      result.success? ? result : Failure(nil)
    end
  end
end
