print "Enter Player1 Name:"
@name1 = gets.chomp
print "Enter Player2 Name:"
@name2 = gets.chomp

@health1 = 500
@health2 = 500
def genHealthBar
	barLength = 10
	bar1 = @health1/50
	bar2 = @health2/50
	if(bar1 < 0)
		bar1 = 0
	end
	if(bar2 < 0)
		bar2 = 0
	end
	barLine = ""
	hString1 = @health1.to_s
	hString2 = @health2.to_s
	hString1 = (" " * (4-hString1.length)) + hString1
	hString2 = (" " * (4-hString2.length)) + hString2
    barLine += @name1 + "|" + ((219.chr)*bar1) + (" "*(barLength-bar1))+"|"+hString1+"     "
	barLine += @name2 + "|" + ((219.chr)*bar2) + (" "*(barLength-bar2))+"|"+hString2
end

def hit(health)
	return health - rand(35)
end

def isWinner
	if(@health1 <=0 || @health2 <=0)
		return true
	else
		return false
	end
end

def getWinner
	if(@health1<@health2)
		return @name2
	elsif(@health2<@health1)
		return @name1
	else
		return "Nobody "
	end
end

image1 = 
"
                /|
     ___       //       /\\
    /   \\     //        ||
   (     )  _//_        ||
    \\___/   /           ||
      |    o           _||_   ___
  \\  /|\\  /              |   /   \\
   \\/ | \\/               o  (     )
      |                  \\\\  \\___/
      |____  _            \\\\===|
     /    / //                 |
    /	 / //                  |
___/    / //                   |
  ==========                  / \\
      ||                     /   \\
    __||__                   |    \\
   /      \\                  |     \\
_______________________________________
"

image2 =
"

     ___
    /   \\
   (     )
    \\___/
      |         |\\            ___
  \\  /|\\         \\\\          /   \\
   \\/ | \\____o-|==\\\\====>   (     )
      |           _\\\\_       \\___/
      |____  _       \\o========|
     /    / //                 |
    /	 / //                  |
___/    / //                   |
  ==========                  / \\
      ||                     /   \\
    __||__                   |    \\
   /      \\                  |     \\
_______________________________________
"
while(!isWinner)
	puts genHealthBar
	puts image1
	sleep(0.1)
	print "\r" + ("\e[A\e[K"*20)
	@health1 = hit(@health1)
	@health2 = hit(@health2)
	puts genHealthBar
	puts image2
	sleep(0.1)
	print "\r" + ("\e[A\e[K"*20)
end

puts getWinner + " wins!"