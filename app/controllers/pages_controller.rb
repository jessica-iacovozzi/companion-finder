class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @orgs = Organization.near(params[:query], 100)
    else
      @orgs = Organization.all
    end
    markers
    @dogs = Dog.all
  end

  def markers
    @markers = @orgs.geocoded.map do |org|
      {
        id: org.id,
        lat: org.latitude,
        lng: org.longitude,
        info_window: render_to_string(partial: "info_window", locals: { org: }),
        image_url: helpers.asset_url("pin.png")
      }
    end
  end
end
