class GetflowsController < ApplicationController
  before_action :set_getflow, only: [:show, :edit, :update, :destroy]

  # GET /getflows
  # GET /getflows.json
  def index
    @getflows = Getflow.all
    @todos = Todo.includes(:getflow)
    @groups = Group.all
  end

  # GET /getflows/1
  # GET /getflows/1.json
  def show
    @todos = @getflow.todos
    @groups = @getflow.groups
  end

  # GET /getflows/new
  def new
    @getflows = Getflow.all
    @getflow = Getflow.new
  end

  # GET /getflows/1/edit
  def edit
  end

  # POST /getflows
  # POST /getflows.json
  def create
    @getflow = Getflow.new(getflow_params)

    respond_to do |format|
      if @getflow.save
        format.html { redirect_to @todo, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @getflow }
      else
        format.html { render :new }
        format.json { render json: @getflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /getflows/1
  # PATCH/PUT /getflows/1.json
  def update
    respond_to do |format|
      if @getflow.update(getflow_params)
        format.js 
        format.json { render :show, status: :ok, location: @getflow }
      else
        format.html { render :edit }
        format.json { render json: @getflow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /getflows/1
  # DELETE /getflows/1.json
  def destroy
    @getflow.destroy
    respond_to do |format|
      format.html { redirect_to getflows_url, notice: 'Getflow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_getflow
      @getflow = Getflow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def getflow_params
      params.require(:getflow).permit(:name, :title, :completed)
    end
end
