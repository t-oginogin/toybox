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

  def file_upload
  end

  def upload
    @filenames = (params[:uploads] || []).each_with_object([]) do |file, files|
      files << file.original_filename
    end

    render :file_upload
  end
end
