class SessionsController < ApplicationController

  def index
    render "index"
    if session[:role]==nil
      session[:role]="Parent"
    end
  end

  def new
    session[:role]="Parent"
  end

  def create
    faculty = Faculty.find_by(email: params[:email])
    student = Student.find_by(email: params[:email])
    if faculty && faculty.authenticate(params[:password])
      session[:current_user_id] = faculty.id
      session[:role]="Faculty"
      flash[:success]= "Welcome dear #{session[:role]} #{faculty.name}"
      redirect_to show_faculties_path
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
      redirect_to sessions_path
    end
  end

  def show
    if session[:role] == "Student"
      @students =Student.find(session[:current_user_id])
    elsif session[:role]== "Parent"
      @students= Student.find_by(pin: params[:pin])
    else
      @faculty =Faculty.find(session[:current_user_id])
      @students1 = Student.where("faculty_id=?",session[:current_user_id])
    end

  end

  def update
    redirect_to  "/"
  end

  def destroy
    session[:role]=nil
    session[:current_user_id]=nil
    redirect_to "/"
  end
end
