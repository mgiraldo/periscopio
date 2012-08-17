class ViolenceTypesController < ApplicationController
  before_filter :authenticate_user!
  # GET /violence_types
  # GET /violence_types.json
  def index
    @violence_types = ViolenceType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @violence_types }
    end
  end

  # GET /violence_types/1
  # GET /violence_types/1.json
  def show
    @violence_type = ViolenceType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @violence_type }
    end
  end

  # GET /violence_types/new
  # GET /violence_types/new.json
  def new
    @violence_type = ViolenceType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @violence_type }
    end
  end

  # GET /violence_types/1/edit
  def edit
    @violence_type = ViolenceType.find(params[:id])
  end

  # POST /violence_types
  # POST /violence_types.json
  def create
    @violence_type = ViolenceType.new(params[:violence_type])

    respond_to do |format|
      if @violence_type.save
        format.html { redirect_to @violence_type, :notice => 'Violence type was successfully created.' }
        format.json { render :json => @violence_type, :status => :created, :location => @violence_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @violence_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /violence_types/1
  # PUT /violence_types/1.json
  def update
    @violence_type = ViolenceType.find(params[:id])

    respond_to do |format|
      if @violence_type.update_attributes(params[:violence_type])
        format.html { redirect_to @violence_type, :notice => 'Violence type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @violence_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /violence_types/1
  # DELETE /violence_types/1.json
  def destroy
    @violence_type = ViolenceType.find(params[:id])
    @violence_type.destroy

    respond_to do |format|
      format.html { redirect_to violence_types_url }
      format.json { head :ok }
    end
  end
end
