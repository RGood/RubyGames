require './Horse.rb'

class Track
	@racers = []
	@trackSize = 0
	@stepSize = 0
	
	@largestName = 0
	
	def initialize(r,t,s)
		@racers = r
		@trackSize = t
		@stepSize = s
		@largestName = getLargestName()
	end
	
	def move
		@racers.each {|r| r.move}
	end
	
	def isWinner
		@racers.each do |r|
			if(r.getPos >= @trackSize)
				return true
			end
		end
		return false
	end
	
	def getWinners
		winners = []
		@racers.each do |r|
			if(r.getPos>=@trackSize)
				winners += [r.getName]
			end
		end
		return winners
	end
	
	def getLargestName
		largest = 0
		@racers.each do|r|
			if(r.getName.length>largest)
				largest = r.getName.length
			end
		end
		return largest
	end
	
	def toString
		line = ""
		@racers.each do |r|
			line+= (" "*(@largestName - r.getName.length))
			line+= r.getName + "|"
			line+= ("-"*(r.getPos))+"H"
			line+= ("-"*(@trackSize-r.getPos))+"|\n"
		end
		return line
	end
end