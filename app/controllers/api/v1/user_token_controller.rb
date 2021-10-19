class Api::V1::UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token, raise: false

  def entity_name
    'User'
  end
end
