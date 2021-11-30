class AdminController < ApplicationController
  def index
    session[:role]="Admin"
  end

  def new
    render "/admin/new"
  end

  def show
  end

  def facultyshow
    @faculty= Faculty.all

  end

  def studentshow
    @students= Student.all
  end

end
