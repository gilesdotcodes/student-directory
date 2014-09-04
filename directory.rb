def input_students
	puts "please enter the names of the students"
	puts "To finish, just hit return twice"
	# create empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => :september}
		puts "Now we have #{students.length} students"
		# get another name from the user
		name = gets.chomp
	end
	# return array of students
	students
end

def print_header
	puts "Students in the September 2014 Makers Academy cohort"
	puts "-----------------"
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Currently, we have #{names.length} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)