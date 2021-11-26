class AddStudentMsgToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :student_msg, :string
  end
end
