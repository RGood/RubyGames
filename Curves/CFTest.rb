require './CurveFrame'

def initTest
	frameGen = CurveFrame.new(7,6,10,45)
	if(frameGen!=nil)
		return 1
	else
		return 0
	end
end

def createFrameTest
	frameGen = CurveFrame.new(7,6,10,45)
	frameGen.createFrame()
	if(frameGen.getFrame.size==6&&frameGen.getFrame[0].size==7)
		return 1
	else
		return 0
	end
end

def printFrameTest
	frameGen = CurveFrame.new(50,13,10,30," ")
	frameGen.createFrame()
	frameGen.printFrame()
end

def mapLineTest
	frameGen = CurveFrame.new(50,13,20,40," ")
	frameGen.createFrame()
	frameGen.mapLine()
	frameGen.printFrame()
end

def TestAll
	total = 2
	count = 0
	count += initTest()
	count += createFrameTest()
	
	printFrameTest()
	
	mapLineTest()
	
	print count, " / ", total,"\n"
end


TestAll()