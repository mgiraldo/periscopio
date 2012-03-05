class VisualizerController < ApplicationController
  def html
    respond_to do |format|
      format.html { render :layout => "viz" }
      format.json { render :json => @violence_types }
    end
  end

  def p5
  end

end
