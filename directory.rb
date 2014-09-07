# declare as a global variable
@students =[]

# method to allow user to choose their action
def interactive_menu
	loop do
		print_menu
		process(gets.chomp.to_i)
	end
end

def print_menu
	puts "Please make a selection from the menu by typing the appropriate number:"
	puts "1. Input the students."
	puts "2. Show the students."
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit."
end

def process(selection)
	case selection
			when 1
				students = input_students
			when 2
				show_students
			when 3
				save_students
			when 4
				load_students
			when 9
				exit
			else
			puts "Sorry, but I did not recognise that selection, please try again"
	end
end

def input_students
	print "\nPlease enter the name of the first student and follow the prompts\n"
	print "To finish, just hit return twice\n"
	# get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		# ask for their favourite hobby
		print "Now enter #{name}'s favourite hobby\n"
		hobby = gets.chomp
		# ask for their cohort
		print "Now enter #{name}'s cohort\n"
		cohort = gets.chomp.capitalize
		#set default if they leave it blank
		cohort=="" ? cohort=:September : ""
		# check spelling!
		cohort = spelling(cohort)
		# add the student hash to the array
		@students << {:name => name.capitalize, :hobby => hobby.capitalize, :cohort => cohort.to_sym}
		print @students.length==1 ? "Now we have 1 student\n" : "Now we have #{@students.length} students\n"
		# get another name from the user
		print "Enter the name of the next student\n"
		print "Note: to finish, just hit return twice\n"
		name = gets.chomp
	end
	# return array of students
	@students
end

def show_students
	print_header
	print_students_list
	print_footer
end

def print_header
	print "\n"
	print "Students in the September 2014 Makers Academy cohort".center(60)
	print "\n\n"
	print "-----------------".center(60)
	print "\n\n"
end

def print_students_list
	# call the function to create a list of the cohorts
	cohorts = sort_into_cohort

	# iterate over each different cohort
	cohorts.each do | month |

		# iterate over the students
		@students.each_with_index do | student, index |	
			# locate whether there is a match and if so print the student details
			if student[:cohort] == month
				print "#{index+1}. #{student[:name]} (#{student[:cohort]} Cohort)(Hobby: #{student[:hobby]})".center(60)
				print "\n"
			end	
		end

	end
end

def print_footer
	print "\n"
	print "Currently, we have #{@students.length} great students".center(60)
	print "\n\n"
end

def spelling(cohort_check)
	if cohort_check == "January" || cohort_check == "February" || cohort_check == "March" || cohort_check == "April" || cohort_check == "May" || cohort_check == "June" || cohort_check == "July" || cohort_check == "August" || cohort_check == "September" || cohort_check == "October" || cohort_check == "November" || cohort_check == "December" || cohort_check ==:September
		return cohort_check
	else
		print "Please check your spelling and re-enter the cohort\n"
		cohort_again = gets.chomp.capitalize
		# again set default if they leave blank
		cohort_again=="" ? cohort_again=:September : ""
		return spelling(cohort_again)
	end
end

def sort_into_cohort
	cohort_list = []
	# maps over students and adds the cohort to our array
	@students.map do |student|
		cohort_list << student[:cohort]
	end
	# returns the array of cohorts but removes duplicates
	return cohort_list.uniq
end

def save_students
	# open the file for writing (must do this)
	file = File.open("students.csv", "w")
	# iterate over the arrat of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

def load_students
	file = File.open("students.csv", "r")
	file.readlines.each do | line |
		name, cohort = line.chomp.split(',')
			@students << {:name => name, :cohort => cohort.to_sym}
	end
	file.close
end

interactive_menu