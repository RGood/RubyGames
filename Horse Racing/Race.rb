require './Track.rb'

trackSize = 5

print "Enter num horses: "
numHorses = Integer(gets)

racers = []

(0..numHorses-1).each do |i|
	print "Enter the name of horse "+(i+1).to_s+": "
	name = gets
	racers += [Horse.new(10,trackSize,name.chomp)]
end

track = Track.new(racers,15,trackSize)
track.getLargestName

puts(track.toString)

while(!track.isWinner)
	sleep(0.5)
	track.move
	toPrint = track.toString
	print "\r" + ("\e[A\e[K"*racers.length)
	puts(toPrint)
end
winners = track.getWinners

line = ""
winners.each do |w|
	line += w + " and "
end

puts(line[0..line.length-6] + " wins!")
