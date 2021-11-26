class AddFacultyMsgToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :faculty_msg, :string

  end
end
