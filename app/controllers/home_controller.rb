class HomeController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  def index
  end
  
end