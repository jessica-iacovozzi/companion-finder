class Api::V1::DogsController < Api::V1::BaseController
  def index
    @dogs = policy_scope(Dog)
  end
end
