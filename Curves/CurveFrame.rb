class CurveFrame
	
	Pi = 3.141592654
	@width
	@height
	@power
	@angle
	@frame
	@defaultChar
	
	def initialize(w,h,p,a,dc=" ")
		@width = w
		@height = h
		@power = p
		@angle = a
		@frame = []
		@defaultChar = dc
	end
	
	def createFrame
		@frame = []
		(1..@height).each do |i|
			@frame+=[Array.new(@width,@defaultChar)]
		end
	end
	
	def setAngle(a)
		@angle = a
	end
	
	def setPower(p)
		@power = p
	end
	
	def getFrame
		return @frame
	end
	
	def getPrettyFrame #for pre-rendering
		toReturn = ""
		toReturn += ("-"*(@width+2)) + "\n\r"
		@frame.each do |row|
			niceRow = ""
			row.each do |char|
				niceRow+=char
			end
			toReturn+= "|"+niceRow+"|\n\r"
		end
		toReturn += ("-"*(@width+2)) + "\n\r"
		return toReturn
	end
	
	def printFrame
		puts ("-"*(@width+2))+"\r"
		@frame.each do |row|
			niceRow = ""
			row.each do |char|
				niceRow+=char
			end
			puts "|"+niceRow+"|\r"
		end
		puts ("-"*(@width+2))+"\r"
	end
	
	def mapLine
		radians = @angle * Pi / 180.0
		xVel = Math.cos(radians)*@power
		if(xVel == 0)
			return false
		end
		times = Array.new(@width,0)
		interval = (@width/xVel)/@width
		counter = 0
		times.each do |e|
			times[counter] = interval*counter
			counter+=1
		end
		counter = 0
		times.each do |t|
			yVel = Math.sin(radians)*@power
			place = (yVel * t + 0.5 * -10 * t * t)
			if(place.to_i >=0 && place.to_i<@height)
				@frame[(@height - place.to_i)-1][counter] = "."
			end
			counter+=1
		end
	end

end