class StudentsController < ApplicationController

  def index
    @students=Student.all
  end
  def new
    render "students/new"
  end

  def create
    new_student = Student.create!(
      pin: params[:pin],
      name: params[:name],
      branch: params[:branch],
      year: params[:year],
      section: params[:section],
      email: params[:email],
      password: params[:password]
    )
    session[:name]=new_student.name
    redirect_to students_path
  end

  def show
    @students =Student.find(params[:id])
  end
end
