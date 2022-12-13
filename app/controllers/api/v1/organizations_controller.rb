class Api::V1::OrganizationsController < Api::V1::BaseController
  def index
    @organizations = policy_scope(Organization)
  end
end
