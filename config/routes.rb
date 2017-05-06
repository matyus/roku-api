Rails.application.routes.draw do
  post "/apps" => "application#apps"
  post "/active-app" => "application#active_app"
  post "/keypress/:command" => "application#keypress"
  post "/launch-app/:app_id" => "application#launch_app"
end
