def input_students
	print "please enter the names of the students\n"
	print "To finish, just hit return twice\n"
	# create empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => :september}
		print "Now we have #{students.length} students\n"
		# get another name from the user
		name = gets.chomp
	end
	# return array of students
	students
end

def print_header
	print "Students in the September 2014 Makers Academy cohort\n"
	print "-----------------\n"
end

def printout(students)

	students.each_with_index do |student, index|
		print student[:name].length < 12 ? "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)\n" : ""
		
	end
end

def print_footer(names)
	print "Currently, we have #{names.length} great students\n"
end
#nothing happens until we call the methods
students = input_students
print_header
printout(students)
print_footer(students)