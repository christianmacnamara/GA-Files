###############################################################################
#
# Introduction to Ruby on Rails
#
# Lab 04
#
# Purpose:
#
# Read the steps below and complete the exercises in this file. This Lab
# will help you to review the basics of Object-Oriented Programming that
# we learned in Lesson 04.
#
###############################################################################
#
# 1. Review your solution to Lab 03. Copy and Paste your solution to
#    this file.
#
# 2. Create a new method called `increment_guess_count` that takes
#    an integer parameter and increments it by 1.
#
# 3. Create a new method called `guesses_left` that calculates how many guesses 
#	 out of 3 the Player has left. The method should take one parameter that is the 
#	 number of guesses the player has guessed so far. Use this new method in your 
#	 code to tell the user how many guesses they have remaining. 
#
# 4. Make sure to remove your local variable `guesses_left` and use the
#    new method instead.
#
# 5. Make sure to comment your code so that you have appropriate
#    documentation for you and for the TAs grading your homework. :-)
#
###############################################################################
#
# Student's Solution
#
###############################################################################\

set_of_numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]

secret_number = set_of_numbers.sample

messages = Hash.new

messages[:win] =  [ "Congratulations - You've won!" ]
messages[:lose] = [ "Sorry - You guessed wrong. The correct answer is #{secret_number}" ]
messages[:too_low] = [ "Sorry - Your guess was too low"]
messages[:too_high] = [ "Sorry - Your guess was too high"]

@current_guess_count = 0

def guesses_left
	3 - @current_guess_count
end

def increment_guess_count
	@current_guess_count += 1
end

first = "Christian"
last = "MacNamara"

puts "\nWelcome to the secret number game, created by #{first} #{last}"

puts "\nType your name:"

input_name = $stdin.gets.chomp

name = "#{input_name}"

puts "\nHi #{name}! You have 3 guesses to guess the Secret Number between 1 and 10."

3.times do |count|
	puts "\nYou have #{ guesses_left } guesses left!"
	puts "Guess a number between 1 and 10:"
	guess_number = $stdin.gets.strip.to_i
	if guess_number == secret_number
		puts messages [:win]
		puts "You got it in #{@current_guess_count} turns"
		exit
	elsif guess_number < secret_number
		increment_guess_count
		puts messages[:too_low]
	elsif guess_number > secret_number 
		increment_guess_count
		puts messages[:too_high]
	end
end

puts messages[:lose]
puts "The secret number was #{secret_number}"