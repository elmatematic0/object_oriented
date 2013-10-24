
class Person
  def initialize(name)
    @name = name
    puts "Hi, my name is #{name}!"
  end
end

class Student<Person
  def learn
    puts "I get it!"
  end
end

class Instructor<Person
  def teach
    puts "Everything in Ruby is an Object"
  end
end

chris = Instructor.new("Chris")
chris.teach
cristina = Student.new("Cristina")
cristina.learn

cristina.teach  #the method "teach" is undefined because it is a method in Instructor; christina is a Student and can only access methods there. 

