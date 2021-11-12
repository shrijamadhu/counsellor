class AddFacultyIdToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :faculty_id, :bigint
  end
end
