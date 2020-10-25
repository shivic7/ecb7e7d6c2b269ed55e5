Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    post "/api/robot/0/orders", to: "robot#get_robot_place"
end
