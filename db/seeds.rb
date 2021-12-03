# Create an test team
Team.create!(name: "Test Team",
             description: "This is the first test team")

# Create an admin user
User.create!(name: "Jesse Zheng",
             email: "jessezheng@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true)

# Create a main sample user.
User.create!(name: "Test User",
             email: "test_user@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false)

# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  email = "test-user-#{n+1}@yahoo.com"
  password = "password"
  admin=false
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: admin)
end
# Create 5 admin users.
User.create!(name: "Admin User",
             email: "admin_user@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true)

# Generate a bunch of additional users.
5.times do |n|
  name = Faker::Name.name
  email = "admin-user-#{n+1}@yahoo.com"
  password = "password"
  admin=true
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: admin)
end