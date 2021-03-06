class LocationsController < ApplicationController
  before_filter :authenticate_user!, :except => [:api]
  
  def api
    sqland = ""
    if (params[:y]!=nil)
      sqland = "AND v.year_of = #{params[:y]}"
    end
    sql = "SELECT
            l.lat, l.lon, l.city, l.department, v.location_id, v.year_of, 
            SUM(CASE actor_id WHEN 1 THEN death_count END) AS total_1,
            SUM(CASE actor_id WHEN 2 THEN death_count END) AS total_2,
            SUM(CASE actor_id WHEN 3 THEN death_count END) AS total_3,
            SUM(CASE actor_id WHEN 4 THEN death_count END) AS total_4,
            SUM(death_count) as total
            FROM
            violences v, locations l
            WHERE v.location_id = l.id
            #{sqland}
            GROUP BY
            v.location_id, v.year_of, l.city, l.department, l.lat, l.lon
            ORDER BY
            year_of,location_id;"
    q = Location.find_by_sql(sql)
    g = []
    #  require 'csv'
    #  CSV.open('dump.csv', 'wb') do |ccc|
    #  ccc << ["lat", "lon", "year", "total", "total_1", "total_2", "total_3", "total_4", "city", "department"]
    q.each do |l|
      t = {
        :type => "Feature",
        :geometry => {:type => "Point", :coordinates => [l.lon.to_f, l.lat.to_f]},
        :properties => {
          :year_of => l.year_of.to_i, 
          :total => l.total.to_i, 
          :total_1 => l.total_1.to_i, 
          :total_2 => l.total_2.to_i, 
          :total_3 => l.total_3.to_i, 
          :total_4 => l.total_4.to_i, 
          :city => l.city, 
          :department => l.department
        }
      }
      g.push(t)
      #  ccc << [l.lat.to_f, l.lon.to_f, l.year_of, l.total, l.total_1, l.total_2, l.total_3, l.total_4, l.city, l.department]
    end
    # end
    r = {:type => "FeatureCollection", :features => g}

    respond_to do |format|
      format.json { render :json => r.as_json }
    end
  end
  
  # GET /locations
  # GET /locations.json
  def index
    per = 100
    page = params[:page] == nil ? 1 : params[:page]
    @locations = Location.order('department ASC, city ASC').page(page).per(per)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, :notice => 'Location was successfully created.' }
        format.json { render :json => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.json { render :json => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, :notice => 'Location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :ok }
    end
  end
end
