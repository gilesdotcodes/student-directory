#put students into array
students = [
	{:name => "Bernard - bmordan", :cohort => :september},
	{:name => "Nicole - NicolePell", :cohort => :september},
	{:name => "Yvette - yvettecook", :cohort => :september},
	{:name => "Elena - elenagarrone", :cohort => :september},
	{:name => "Fadie - fadieh", :cohort => :september},
	{:name => "Tim - Scully87", :cohort => :september},
	{:name => "Ella - EllaNancyFay", :cohort => :september},
	{:name => "Andrew - andrewhercules", :cohort => :september},
	{:name => "Camilla - camillavk", :cohort => :september},
	{:name => "Sandrine - MadameSardine", :cohort => :september},
	{:name => "Pablo - galicians", :cohort => :september},
	{:name => "Rachel - SBLLB", :cohort => :september},
	{:name => "Steve - HatStephens", :cohort => :september}
]

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
print_header
print(students)
print_footer(students)