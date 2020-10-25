class RobotController < ApplicationController

	def get_robot_place
		if params["commands"].present?
			params["commands"] = eval(params["commands"])		
			result = Roboting::Placement.getting_position(params["commands"])
			render json: result
		else
			render json: {success: false, msg: "command not found"}
		end
	end

	#PostMan Data
	# API:- localhost:3000/api/robot/0/orders
	# Request:- { "commands": "[ 'PLACE 1,2,EAST', 'MOVE', 'MOVE', 'LEFT', 'MOVE', 'REPORT' ]"}
	# Response:- {"location": [3,3,"NORTH"]}

	# API:- localhost:3000/api/robot/0/orders
	# Request:- { "commands": "[ 'PLACE 0,0,NORTH', 'LEFT', 'REPORT' ]"}
	# Response:- {"location": [0,0,"WEST"]}

	# API:- localhost:3000/api/robot/0/orders
	# Request:- { "commands": "[ 'PLACE 0,0,NORTH',  'MOVE', 'REPORT' ]"}
	# Response:- {"location": [0,1,"NORTH"]}

end