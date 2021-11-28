class AdminController < ApplicationController
  def index
    session[:role]="Admin"

  end

  def new

  end

  def show
  end
end
