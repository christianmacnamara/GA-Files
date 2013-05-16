###############################################################################
#
# Introduction to Ruby on Rails
#
# Homework 03
#
# Purpose:
#
# Read the links below and complete the exercises in this file. This Lab
# is to help you better understand Arrays, Hashes and Loops that we
# learned in Lesson 03.
#
###############################################################################
#
# 1. Review your solution to Lab 02. Copy and Paste your solution to
#    this file.
#
# 2. Create a new Array variable called `set_of_numbers`, this will be
#    a range between 1 - 10 that our Player will guess from. Each value
#    in the Array should be an integer.

set_of_numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]

#
# 3. Change the variable `secret_number` (HW_02) so that instead of a hard-coded
#    Integer, it randomly chooses one of the options from `set_of_numbers`
#    ('secret_number' is the integer our Player will try to guess).

#      Hint: Look up Array#sample in the Ruby documentation.

secret_number = set_of_numbers.sample
#
# 4. Create a new Hash variable called `messages`. In this Hash will be
#    four Keys Value pairs:
#
#    1. :win - A String telling the Player that they have won.
#
#    2. :lose - A String telling the Player that they have lost and what
#       the correct number was.
#
#    3. :too_low - A String telling the Player that their guess was too
#       low.
#
#    4. :too_high - A String telling the Player that their guess was too
#       high.
#
messages = Hash.new

messages[:win] =  [ "Congratulations - You've won!" ]
messages[:lose] = [ "Sorry - You guessed wrong. The correct answer is #{secret_number}" ]
messages[:too_low] = [ "Sorry - Your guess was too low"]
messages[:too_high] = [ "Sorry - Your guess was too high"]

# 5. Change the behavior of your program, so instead of hard coding, use the principles of DRY(don't repeat yourself). 
#    This means using a Loop to iterate over your code either until the Player has guessed the
#    correct number, or they have tried to guess 3 times.

first = "Christian"
last = "MacNamara"

puts "\nWelcome to the secret number game, created by #{first} #{last}"

puts "\nType your name:"

input_name = $stdin.gets.chomp

name = "#{input_name}"

puts "\nHi #{name}! You have 3 guesses to guess the Secret Number between 1 and 10."

guesses_left = 3

3.times do |count|
	puts "\nYou have #{guesses_left} guesses left!"
	puts "Guess a number between 1 and 10:"
	guess_number = $stdin.gets.strip.to_i
	guesses_left -= 1
	if guess_number == secret_number
		puts messages [:win]
		puts "You got it in #{count + 1} turns"
		exit
	elsif guess_number < secret_number
		puts messages[:too_low]
	elsif guess_number > secret_number 
		puts messages[:too_high]
	end
end

puts messages[:lose]
puts "The secret number was #{secret_number}"
#
# 6. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
#Put your solution below this line.
#
###############################################################################
