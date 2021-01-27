# frozen_string_literal: true

class Task < ActiveRecord::Base
  validates :name, presence: true
  validates :completed, presense: false, on: :create

  scope :complete, -> { where completed: true }
  scope :incomplete, -> { where completed: false }
end
