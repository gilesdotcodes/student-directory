def input_students
	print "\nPlease enter the names of the students\n"
	print "To finish, just hit return twice\n"
	# create empty array
	students = []
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# ask for their favourite hobby
		print "Now enter #{name}'s favourite hobby\n"
		hobby = gets.chomp
		# add the student hash to the array
		students << {:name => name, :hobby => hobby, :cohort => :September}
		print "Now we have #{students.length} students\n"
		# get another name from the user
		name = gets.chomp
	end
	# return array of students
	students
end

def print_header
	print "\n"
	print "Students in the September 2014 Makers Academy cohort".center(60)
	print "\n\n"
	print "-----------------".center(60)
	print "\n\n"
end

def printout(students)

	counter = 1	
	
	while counter <= students.length do
		print "#{counter}. #{students[counter-1][:name]} (#{students[counter-1][:cohort]} Cohort)(Hobby: #{students[counter-1][:hobby]})".center(60)
		print "\n"
		counter += 1		
	end
end

def print_footer(names)
	print "\n"
	print "Currently, we have #{names.length} great students".center(60)
	print "\n\n"
end
#nothing happens until we call the methods
students = input_students
print_header
printout(students)
print_footer(students)