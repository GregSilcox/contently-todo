# frozen_string_literal: true

class TasksController < ApplicationController
  include BasicActions

  def index
    @models = case params['show'] 
      when 'complete'
        Task.complete
      when 'incomplete'
        Task.incomplete
      when 'all'
        Task.all
      else
        Task.incomplete
      end
  end

  def create
    @model = Task.new(model_params)
    @model.completed = false
    create_response
  end

  private

  def model_params
    params.require(:task).permit(:name, :completed)
  end
end
