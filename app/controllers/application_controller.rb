class ApplicationController < ActionController::API
  require 'roku'

  before_action :get_roku

  def apps
    render json: @roku.apps
  end

  def active_app
    render json: @roku.active_app
  end

  def keypress
    command = params.require(:command)

    @roku.keypress(command)

    render json: { response: 200, keyPressed: command }
  end

  def launch_app
    app_id = params.require(:app_id)

    @roku.launch_app(app_id)

    render json: { response: 200, app_id: app_id }
  end

  private
  def get_roku
    @roku = Roku.new RokuBox.first
  end
end
