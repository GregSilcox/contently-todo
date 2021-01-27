class List < ApplicationRecord
  has_may :tasks
  
  validates :name, presence: true
end
