class Student < ApplicationRecord
  has_secure_password
  belongs_to :faculty
end
