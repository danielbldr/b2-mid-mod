class WelcomeController < ApplicationController
  def index
    @amusement_parks = AmusementPark.all
  end
end
