class Roku
  include HTTParty

  def initialize(roku_box, debug = true)
    self.class.debug_output if debug

    self.class.base_uri roku_box.base_uri
  end

  def keypress(command)
    self.class.post("/keypress/#{command}")
  end

  def apps
    self.class.get("/query/apps").parsed_response
  end

  def active_app
    self.class.get("/query/active-app").parsed_response
  end

  def launch_app(app_id)
    self.class.post("/launch/#{app_id}")
  end
end
