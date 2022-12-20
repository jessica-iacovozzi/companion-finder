class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    DogCreator.call
    @dogs = Dog.all

    @markers = @dogs.geocoded.map do |dog|
      {
        lat: dog.latitude,
        lng: dog.longitude,
        info_window: render_to_string(partial: "info_window", locals: { dog: }),
        image_url: helpers.asset_url("pin.png")
      }
    end
  end
end
