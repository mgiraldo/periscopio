class ViolencesController < ApplicationController
  # GET /violences
  # GET /violences.json
  def index
    per = 50
    page = params[:page] == nil ? 1 : params[:page]
    @violences = Violence.page(page).per(per)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @violences }
    end
  end

  # GET /violences/1
  # GET /violences/1.json
  def show
    @violence = Violence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @violence }
    end
  end

  # GET /violences/new
  # GET /violences/new.json
  def new
    @violence = Violence.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @violence }
    end
  end

  # GET /violences/1/edit
  def edit
    @violence = Violence.find(params[:id])
  end

  # POST /violences
  # POST /violences.json
  def create
    @violence = Violence.new(params[:violence])

    respond_to do |format|
      if @violence.save
        format.html { redirect_to @violence, :notice => 'Violence was successfully created.' }
        format.json { render :json => @violence, :status => :created, :location => @violence }
      else
        format.html { render :action => "new" }
        format.json { render :json => @violence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /violences/1
  # PUT /violences/1.json
  def update
    @violence = Violence.find(params[:id])

    respond_to do |format|
      if @violence.update_attributes(params[:violence])
        format.html { redirect_to @violence, :notice => 'Violence was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @violence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /violences/1
  # DELETE /violences/1.json
  def destroy
    @violence = Violence.find(params[:id])
    @violence.destroy

    respond_to do |format|
      format.html { redirect_to violences_url }
      format.json { head :ok }
    end
  end
end
