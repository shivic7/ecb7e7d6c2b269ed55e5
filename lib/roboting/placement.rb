module Roboting
  class Placement
  	def self.getting_position(commands)
  		placement = commands[0].split(",")
  		x = placement[0].gsub("PLACE ","").to_i
  		y = placement[1].to_i
  		arr = Array.new(5){Array.new(5,'0')}
  		if arr[x][y].present?
  			arr[x][y] = placement[2]
  			commands.delete_at(0)
  			commands.each_with_index do |cmd,index|
  				if cmd == 'REPORT'
  					return {location: [x,y,arr[x][y]]}
  				else
  					x,y,arr = get_current_pos(x,y,arr,cmd)
  				end
  			end
			else
				return {success: false, msg: "Placement not possible"}
			end
  	end

  	def self.get_current_pos(x,y,arr,cmd)
  		temp = arr[x][y]
  		x1 = x
  		y1 = y
  		if cmd == "MOVE"  			
  			if arr[x][y] == "NORTH"
  				y = y+1
  			elsif arr[x][y] == "EAST"
  				x = x+1
  			elsif arr[x][y] == "WEST"
  				x = x-1
  			else
  				y = y-1
  			end
  			if x<5 && y<5
	  			arr[x][y] = temp
	  			arr[x1][y1] = '0'			
	  		end  
  		elsif cmd == "LEFT"
  			arr[x][y] = get_left_direction(arr[x][y])
  		elsif cmd == "RIGHT"
  			arr[x][y] = get_right_direction(arr[x][y])
  		end  		
  		return x, y, arr
  	end

  	def self.get_left_direction(dircn)
	    dircn_hash = Hash["NORTH" => 'WEST', "EAST" => 'NORTH', "WEST" => 'SOUTH', "SOUTH" => 'EAST']  
	    return dircn_hash[dircn]
	  end

	  def self.get_right_direction(dircn)
	   	dircn_hash = Hash["NORTH" => 'EAST', "EAST" => 'SOUTH', "WEST" => 'NORTH', "SOUTH" => 'WEST']  
	    return dircn_hash[dircn] 
	  end


  end
end