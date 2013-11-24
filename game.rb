time = Time.new
current_time = time.strftime( "The game started on %A %d/%m/%Y %R%p")
puts current_time
health1 = 60
health2 = health1
health3 = 100
name1 = "larry".capitalize
name2 = "curly".upcase
name3 = "moe".capitalize
title3 = "#{name3} has a health of #{health3}.".center(50,"*")
health1 = 30
health4 = 90
name4 = "shemp".capitalize
title4 = "#{name4.ljust(30,".")} #{health4} health"
puts "#{name1} has a health of #{health1}"
puts "#{name2} has a health of #{health2}."

puts title3
puts title4
