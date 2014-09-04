#put students into array
students = [
	"Bernard - bmordan",
	"Nicole - NicolePell",
	"Yvette - yvettecook",
	"Elena - elenagarrone",
	"Fadie - fadieh",
	"Tim - Scully87",
	"Ella - EllaNancyFay",
	"Andrew - andrewhercules",
	"Camilla - camillavk",
	"Sandrine - MadameSardine",
	"Pablo - galicians",
	"Rachel - SBLLB",
	"Steve - HatStephens"
]
#and then we print the list of students
puts "Students in the September 2014 Makers Academy cohort"
puts "-----------------"
students.each do |student|
	puts student
end
#finally, we print the total
print "Currently, we have #{students.length} great students"