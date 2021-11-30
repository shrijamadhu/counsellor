class FacultiesController < ApplicationController

  def index
    @faculty = Faculty.all
    session[:role]="Faculty"
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
    if session[:role]=="Admin"
      render  "/admin/new"
    else
      render "/"
    end
  end

  def show
    @students = Student.where("faculty_id = ?",session[:current_user_id])
    @faculty =Faculty.find(session[:current_user_id])
  end

  def update
    @students = Student.where("faculty_id=?",session[:current_user_id])
    @students.each do|student|
        student.faculty_msg= params[:faculty_msg]
        student.save!
    end
    flash[:success]="Message sent to students"
    redirect_to "/faculties/show"
  end

  def back
    redirect_to "/"
  end

  def destroy
    faculty= Faculty.find(params[:id])
    faculty.destroy
    flash[:success]="Faculty deleted"
    render "/admin/new"

  end


end
