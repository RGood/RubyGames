require './CurveFrame.rb'
print "Enter width: "
width = Integer(gets().chomp)
print "Enter height: "
height = Integer(gets().chomp)
print "Enter power: "
power = Integer(gets().chomp)
frameGen = CurveFrame.new(width,height,power,0)

swivel = Thread.new do
	counter = 0
	frameGen.setAngle(counter % 90)
	frameGen.createFrame()
	frameGen.mapLine()
	frameGen.printFrame()
	up = true
	while(true)
		print "\r" + ("\e[A\e[K"*(height+2))
		frameGen.setAngle(counter % 90)
		frameGen.createFrame()
		frameGen.mapLine()
		frameGen.printFrame()
		if(up)
			counter+=2
			if(counter>=88)
				up = false
			end
		else
			counter-=2
			if(counter<=0)
				up = true
			end
		end
		sleep(0.1)
	end
end

swivel.run

begin
  system("stty raw -echo")
  str = STDIN.getc
ensure
  system("stty -raw echo")
end

print "\r" + ("\e[A\e[K"*(height+2))

swivel.kill

swivel = Thread.new do
	counter = power
	frameGen.setPower(counter % (2*power))
	frameGen.createFrame()
	frameGen.mapLine()
	frameGen.printFrame()
	up = true
	while(true)
		print "\r" + ("\e[A\e[K"*(height+2))
		frameGen.setPower(counter % (2*power))
		frameGen.createFrame()
		frameGen.mapLine()
		frameGen.printFrame()
		if(up)
			counter+=1
			if(counter>=(2*power))
				up = false
			end
		else
			counter-=1
			if(counter<=0)
				up = true
			end
		end
		sleep(0.05)
	end
end

swivel.run

begin
  system("stty raw -echo")
  str = STDIN.getc
ensure
  system("stty -raw echo")
end

swivel.kill