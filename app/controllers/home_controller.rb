class HomeController < ApplicationController
  def index
  end

  def page_top
  end

  def dateselect
  end

  def calendar
  end

  def button_param
    @sample_data = params[:sample_data]
  end
end
