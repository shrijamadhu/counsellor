class FacultiesController < ApplicationController

  def index
    @faculty = Faculty.all
  end
  def new
    render "faculties/new"
  end

  def create
    new_faculty = Faculty.create!(
      name: params[:name],
      branch: params[:branch],
      year: params[:year],
      section: params[:section],
      email: params[:email],
      password: params[:password]
    )
    flash[:success]= "Welcome dear faculty #{new_faculty.name}"
    redirect_to faculties_path
  end

  def show
    @students = Student.where("faculty_id = ?",session[:current_user_id])

    @faculty =Faculty.find(params[:id])
  end
end
