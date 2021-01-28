# frozen_string_literal: true

# frozen_string_literal: true

class ListsController < ApplicationController
  include BasicActions
  
  private

  def model_params
    params.require(:list).permit(:name)
  end
end

