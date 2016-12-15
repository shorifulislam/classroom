class Student < ApplicationRecord
  EXPECTED_COUNT = 5
  def self.numerous?
    nombre = Student.count
    nombre > EXPECTED_COUNT
  end
end
