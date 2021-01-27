# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    list
    name { 'MyString' }
    completed { false }
  end
end
