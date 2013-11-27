def converstion
  puts "Hello"
  yield
  puts "Goodbye"
end
converstion { puts "Good to meet you!"}

def five_times
  1.upto(5) {|n| yield(n)}
end

five_times do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end
