# frozen_string_literal: true

module BasicActions
  # basic actions

  def index
    @models = @lists = identifier.all
  end

  def show
    set_model
  end

  def new
    @model = identifier.new
  end
  
  def create
    @model = identifier.new model_params
    create_response
  end

  def edit
    set_model
  end

  def update
    set_model

    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to url_for(action: 'index'), 
          notice: "#{ identifier } was successfully updated." }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_model
    @model.destroy
    
    respond_to do |format|
      format.html { redirect_to url_for(action: 'destroy'), 
        notice: "#{ identifier } was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # support methods

  def set_model
    @model = identifier.find params[:id]
  end

  def identifier
    controller_name.singularize.titleize.constantize
  end

  def create_response
    respond_to do |format|
      if @model.save
        format.html { redirect_to url_for(action: 'index'), 
          notice: "#{ identifier } was successfully created." }
        format.json { render :show, status: :created, location: @model}
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end
end
