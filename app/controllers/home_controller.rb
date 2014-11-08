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
    work_path = 'tmp/files'
    FileUtils.mkdir_p(work_path) unless FileTest.exist?(work_path)
    @filenames = (params[:uploads] || []).each_with_object([]) do |file, files|
      FileUtils.cp file.tempfile, "#{work_path}/#{file.original_filename}"
      files << file.original_filename
    end

    render :file_upload
  end
end
