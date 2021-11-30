class StudentsController < ApplicationController
  def index
    session[:role]="Student"
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
      password: params[:password],
      faculty_id: params[:faculty_id]
    )
    redirect_to "/admin"
  end

  def show
    @students= Student.where("pin = ?",params[:pin])
    student = Student.find_by(pin: params[:pin])
    if !student
      flash[:error]="Student doesn't exist"
      redirect_to students_path
    end
    session[:role]= " "
    session[:current_user_id]= nil
  end

  def update
    student = Student.find_by(pin: params[:pin])
    student.student_msg= params[:student_msg]
    student.save!
    session[:role]= " "
    session[:current_user_id]= nil
    redirect_to "/"
  end

  def edit
    @student = Student.find(params[:id])

  end

  def back
    redirect_to "/"
  end

end
