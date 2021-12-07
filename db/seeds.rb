
# Create 1 super user
User.create!(name: "Jesse Zheng",
             email: "jessezheng@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Super user")


# Create 5 teachers
User.create!(name: "Professor A",
             email: "pa@yahoo.com",

             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Instructor")

User.create!(name: "Professor B",
             email: "pb@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Instructor")

User.create!(name: "Professor C",
             email: "pc@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Instructor")

User.create!(name: "Professor D",
             email: "pd@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Instructor")



User.create!(name: "Professor E",
             email: "pe@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Instructor")

# Create 10 TAs
User.create!(name: "TA 1",
             email: "ta1@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Teaching Assistant")

User.create!(name: "TA 2",
             email: "ta2@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Teaching Assistant")

User.create!(name: "TA 3",
             email: "ta3@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Teaching Assistant")

User.create!(name: "TA 4",
             email: "ta4@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Teaching Assistant")

User.create!(name: "TA 5",
             email: "ta5@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Teaching Assistant")

User.create!(name: "TA 6",
             email: "ta6@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Teaching Assistant")

User.create!(name: "TA 7",
             email: "ta7@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Teaching Assistant")

User.create!(name: "TA 8",
             email: "ta8@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: true,
             user_role:"Teaching Assistant")

#Create 10 students             

User.create!(name: "Student 1",
             email: "s1@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role:"Student")

User.create!(name: "Student 2",
             email: "s2@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role:"Student")

User.create!(name: "Student 3",
             email: "s3@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role:"Student")

User.create!(name: "Student 4",
             email: "s4@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role:"Student")

User.create!(name: "Student 5",
             email: "s5@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role:"Student")

User.create!(name: "Student 6",
             email: "s6@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role:"Student")

User.create!(name: "Student 7",
             email: "s7@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role:"Student")

User.create!(name: "Student 8",
             email: "s8@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role:"Student")

User.create!(name: "Student 9",
             email: "s9@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role:"Student")

User.create!(name: "Student 10",
             email: "s10@yahoo.com",
             password:"password",
             password_confirmation: "password",
             admin: false,
             user_role:"Student")

# Generate 30 more students.
32.times do |n|
  name = Faker::Name.name
  email = "test-user-#{n+1}@yahoo.com"
  password = "password"
  admin=false
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               admin: admin,
               user_role: "Student")
  @user=User.find_by(email: email)
end
