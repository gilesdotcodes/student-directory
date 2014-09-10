require 'csv'

# declare as a global variable
@students =[]

# method to allow user to choose their action using infinite loop
def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp.to_i)
	end
end

# ronseal method
def print_menu
	puts "Please make a selection from the menu by typing the appropriate number:"
	puts "1. Input the students."
	puts "2. Show the students."
	puts "3. Save the list to a file of your choice"
	puts "4. Load the list from a file of your choice"
	puts "9. Exit."
end

# method to run other methods based on user input
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

# ronseal method
def input_students
	print "\nPlease enter the name of the first student and follow the prompts\n"
	print "To finish, just hit return twice\n"
	# get the first name
	name = get_input
	# while the name is not empty, repeat this code
	while !name.empty? do
		# ask for their cohort
		print "Now enter #{name}'s cohort\n"
		cohort = get_input
		#set default if they leave it blank
		cohort=="" ? cohort=:September : ""
		# check spelling!
		cohort = spelling(cohort)
		# ask for their favourite hobby
		print "Now enter #{name}'s favourite hobby\n"
		hobby = get_input
		# add the student hash to the array
		put_student_into_array(name, cohort, hobby)
		print @students.length==1 ? "Now we have 1 student\n" : "Now we have #{@students.length} students\n"
		# get another name from the user
		print "Enter the name of the next student\n"
		print "Note: to finish, just hit return twice\n"
		name = get_input
	end
	# return array of students
	@students
end

# methods to improve the code --> D.R.Y.
def get_input
	input_data = STDIN.gets.chomp.capitalize
	return input_data
end

def put_student_into_array(name, cohort, hobby)
	@students << {:name => name, :cohort => cohort.to_sym, :hobby => hobby}
end

# 4 ronseal methods
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

# method to check the spelling of the cohort
def spelling(cohort_to_check)
	if cohort_to_check == "January" || cohort_to_check == "February" || cohort_to_check == "March" || cohort_to_check == "April" || cohort_to_check == "May" || cohort_to_check == "June" || cohort_to_check == "July" || cohort_to_check == "August" || cohort_to_check == "September" || cohort_to_check == "October" || cohort_to_check == "November" || cohort_to_check == "December" || cohort_to_check ==:September
		return cohort_to_check
	else
		print "Please check your spelling and re-enter the cohort (month only)\n"
		cohort_again = get_input
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
	return cohort_list.uniq.sort
end

def save_students
	# requests the filename to be saved to
	puts "What would you like to name your file? (no need to add .csv)"
	# gets filename. Not using method here because no need to capitalize and need to add .csv suffix
	filename = STDIN.gets.chomp + ".csv"
	# open the file for writing (must do this)
	CSV.open(filename, "w") do |row|
	# iterate over the array of students
		@students.each do |student|
			row << [student[:name], student[:cohort], student[:hobby]]
		end
	end
end

# setting a nil default value for when this method is called from the menu, whilst still be useful if a file is passed as argument
def load_students(filename=nil)
	if filename.nil? 
		puts "What file would you like to load student data from? (no need to add .csv)"
		# gets filename. Not using method here because no need to capitalize and need to add .csv suffix
		filename = STDIN.gets.chomp + ".csv"
	end
	# If passed as an argument this will be re-tested. Waste of time and memory but need to check whether user defined file exists.
	if File.exists?(filename)
		# use built in CSV library to add to array (I believe this means we don't deal directly with the file)
		CSV.foreach(filename) do |row|
			put_student_into_array(row[0], row[1], row[2])			
			end
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist. Please try again using Option 4 below."
		return
	end
end

# test removed and now included in load_students method --> D.R.Y.
def try_load_students
	filename = ARGV.first
	return if filename.nil?
	load_students(filename)
end

try_load_students
interactive_menu