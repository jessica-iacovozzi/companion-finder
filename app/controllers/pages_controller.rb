class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    # DogCreator.call
    if params[:query].present?
      @dogs = Dog.search_by_address(params[:query])
    else
      @dogs = Dog.all
    end
    markers
  end

  def markers
    @markers = @dogs.geocoded.map do |dog|
      {
        id: dog.id,
        lat: dog.latitude,
        lng: dog.longitude,
        info_window: render_to_string(partial: "info_window", locals: { dog: }),
        image_url: helpers.asset_url("pin.png")
      }
    end
  end
end
