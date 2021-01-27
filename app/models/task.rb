# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :list
  
  validates :name, presence: true
  validates :completed, absence: true, on: :create

  scope :complete, -> { where completed: true }
  scope :incomplete, -> { where completed: false }
end
