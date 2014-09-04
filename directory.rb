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

def print_header
	puts "Students in the September 2014 Makers Academy cohort"
	puts "-----------------"
end

def print(names)
	names.each do |name|
	puts name
	end
end

def print_footer(names)
	puts "Currently, we have #{names.length} great students"
end
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)