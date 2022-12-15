class DogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @dog = Dog.find(params[:id])
  end
end
