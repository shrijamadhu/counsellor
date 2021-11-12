class Faculty < ApplicationRecord
  has_secure_password
  has_many :students
end
