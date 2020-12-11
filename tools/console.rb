require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

ins1 = Instructor.new("Sylwia") #has stu1 & stu3
ins2 = Instructor.new("Hasibul") #has #stu2
ins3 = Instructor.new("Danny") #has no students

stu1 = Student.new("Spongebob") #has taken two tests
stu2 = Student.new("Patrick") #has taken one test
stu3 = Student.new("Squidward") #has tekn zero tests


test1 = BoatingTest.new(stu1,"Unit 1",ins1)
test2 = BoatingTest.new(stu1,"Unit 2", ins1)
test3 = BoatingTest.new(stu2,"Unit 1", ins2)

binding.pry

stu3.add_boating_test("Safety", ins1)

0 #leave this here to ensure binding.pry isn't the last line

