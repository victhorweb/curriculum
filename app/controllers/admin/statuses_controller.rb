 class Admin::StatusesController < ApplicationController
  def load_cities
    @city = City.for_select
  end