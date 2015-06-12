usernames = ["abby", "alex", "mike", "raghu"]

usernames.each do |username|
  user = User.new
  user.username = username
  user.email = "#{username}@example.com"
  user.password = "12341234"
  user.password_confirmation = "12341234"
  user.save
end

puts "There are now #{User.count} users in the database."

