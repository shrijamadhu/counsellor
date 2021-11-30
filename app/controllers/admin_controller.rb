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

  def destroy
    session[:role]=nil
    session[:current_user_id]=nil
    flash[:success]=" "
    redirect_to "/admin"
  end

end
