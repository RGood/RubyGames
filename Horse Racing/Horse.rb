class Horse

	@name = ""

	@ability = 0
	@position = 0
	@step = 0
	@track = 0
	
	def initialize(a,t,n="Default Horse Name")
		@ability = a
		@track = t
		@name = n
		@position = 0
		@step = 0
	end
	
	def move
		@step += rand(0..@ability)
		if(@step>=@track)
			@position += 1
			@step = 0
		end
	end
	
	def getName
		return @name
	end
	
	def getPos
		return @position
	end
end