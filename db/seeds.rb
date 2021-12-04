#Create a course
Course.create!(course_no: "CSE-3901",
semester: "Fall")
# Create an test team
Team.create!(name: "Test Team")

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
50.times do |n|
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
# Create 1 TA.
User.create!(name: "TA User",
             email: "ta_user@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Teaching Assistant")
# Create 5 more TAs.
5.times do |n|
  name = Faker::Name.name
  email = "ta-user-#{n+1}@yahoo.com"
  password = "password"
  admin=true
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: admin,
               user_role:"Teaching Assistant")
end

# Create 1 instructor.
User.create!(name: "Admin User",
             email: "admin_user@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"instructor")

# Create 5 more instructors.
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