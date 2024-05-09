class WiseAppsController < ApplicationController
  def index
    if params[:app_type].present?
      @wise_apps = WiseApp.where(app_type: params[:app_type]).all
    else
      @wise_apps = WiseApp.all
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end