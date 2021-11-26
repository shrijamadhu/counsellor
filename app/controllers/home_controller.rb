class HomeController < ApplicationController

  def index
      render "index"
      if params[:id]=="faculty"
        session[:role]="Faculty"
      elsif params[:id]=="student"
        session[:role]="Student"
      else
        session[:role]="Parent"
      end




  end

end
