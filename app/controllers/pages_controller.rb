class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    DogCreator.call
    @dogs = Dog.all
  end
end
