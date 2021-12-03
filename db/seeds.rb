#Create a course
Course.create!(course_no: "CSE-3901",
semester: "Fall")
# Create an test team
Team.create!(name: "Test Team",
             description: "This is the first test team")

# Create an admin user
User.create!(name: "Jesse Zheng",
             email: "jessezheng@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Super user")

# Create a main sample user.
User.create!(name: "Test User",
             email: "test_user@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role: "student")

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
               admin: admin,
               user_role: "student")
end
# Create 5 admin users.
User.create!(name: "Admin User",
             email: "admin_user@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"instructor")

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
               admin: admin,
               user_role:"instructor")
end