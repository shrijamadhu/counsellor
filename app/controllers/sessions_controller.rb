class SessionsController < ApplicationController

  def index
    render "index"
  end

  def new
  end

  def create
    faculty = Faculty.find_by(email: params[:email])
    student = Student.find_by(email: params[:email])

    if session[:role]!="Admin"
      if faculty && faculty.authenticate(params[:password])
        session[:current_user_id] = faculty.id
        session[:role]="Faculty"
        @students = Student.where("faculty_id = ?",session[:current_user_id])

        if @students.count >= 1
          redirect_to show_faculties_path
        else
          flash[:error]="Faculty is not assigned any student"
          redirect_to sessions_path
        end

      elsif student && student.authenticate(params[:password])
        session[:current_user_id] = student.id
        session[:role]="Student"

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
    else
      admin= Faculty.find_by(email: params[:email])
      if admin && admin.email=="admin@admin.com"
        flash[:success]="Welcome Admin"
        render "/admin/new"
      else
        flash[:error] = "Invalid Login attempt.Please retry."
        render "/admin/index"
      end
    end
  end

  def show
    @students= Student.find_by(pin: params[:pin])
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
