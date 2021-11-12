class SessionsController < ApplicationController

  def index

  end

  def new
    render "sessions/new", locals: {role: " "}
  end


  def create
    faculty = Faculty.find_by(email: params[:email])
    student = Student.find_by(email: params[:email])
    if faculty && faculty.authenticate(params[:password])
      session[:current_user_id] = faculty.id
      session[:role]="Faculty"
      flash[:success]= "Welcome dear #{session[:role]} #{faculty.name}"
      redirect_to show_sessions_path
    elsif student && student.authenticate(params[:password])
      session[:current_user_id] = student.id
      session[:role]="Student"
      flash[:success]= "Welcome dear #{session[:role]} #{student.name}"
      redirect_to show_sessions_path
    else
      if !params[:email].present?
        flash[:error] = "Email can't be Empty"
      elsif !params[:password].present?
        flash[:error] = "Password can't be Empty"
      else
        flash[:error] = "Invalid Login attempt.Please retry."
      end
      redirect_to faculties_path
    end
  end

  def show
    if session[:role] == "Student"
      @students =Student.find(session[:current_user_id])
    else
      @faculty =Faculty.find(session[:current_user_id])
    end
  end
end
