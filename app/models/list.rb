# frozen_string_literal: true

class List < ApplicationRecord
  has_many :tasks
  
  validates :name, presence: true
end
