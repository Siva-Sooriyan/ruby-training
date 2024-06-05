#!/usr/bin/env ruby

# ########################################################################## #
# Abstract
# Exercise 3a: Write a hex to oct converter
# Ref: Not available
# In this exercise, we have to convert a hexadecimal number to octal decimal number
# ########################################################################## #

# ########################################################################## #
# INITIAL SECTION
# ########################################################################## #
# #### #
require 'pp'

# Note: the documentation given below follow the rdoc format
##
# Class HexToOctConverter
# A class to convert hexadecimal value to octadecimal value
# The given string contains a hexadecimal value which should  be /0-9a-f/
# For example hexadecimal looks like 1a or 1A both are same
# the Output looks like 32
# hexadecimal value 1a is 32 in octal value
class HexToOctConverter
  # This automatically creates a getter method for these attributes
  attr_reader :input , :output

  ##
  # Constructor
  # Input  : Hexadecimal value , which contain only integer (0 - 9) and alphabets (A - F)
  # Output : Octal Value , which contain integer (0 - 7)
  ##
  def initialize
    # Note: the prefix '@' marks the variable as an instance variable
    # Initalize the input string to empty string
    @input = ""
    # Initalize the output string to store the value of the octal value in string
    @output = ""
    # Verbose output for logging
    @verbose = true
  end

  ##
  # Setter method for setting the input string
  # Set input as a single string.
  # Raise ArgumentError if any of the given value is not a hexadecimal value.
  #

  def validate_input(input_value)
    if input_value.to_s.match?(/\A[0-9A-Fa-f]+\z/)
      @input = input_value
    else
      raise ArgumentError, "Invalid hexadecimal number"
    end
  end

  ##
  # Utility method to print log messages.
  #
  def logr(mesg)
    puts mesg if @verbose
  end

  ##
  # Method to convert hexadecimal integer to octal integer
  # Inputs: Hexadecimal value (0-9,a-f)
  # Checks:

  def convert_hex_to_oct
    logr "-- ----------------------------------------------------------------"
    logr "-- Starting convert_hex_to_oct('#{@input}')"
    # Converting hexadecimal value to octal value
    logr "-- Converting Hexadecimal value to Octal Value"
    # Converting hexadecimal value to decimal value
    decimal_value = @input.hex
    # Converting decimal value to Octal value
    octal_value = decimal_value.to_s(8)
    @output = octal_value
    logr "-- Octal value of the given hexadecimal value is #{@output}"
    logr "-- Finished convert_hex_to_oct"
    logr "-- ----------------------------------------------------------------"
  end
end

# ########################################################################## #
# MAIN SECTION
# ########################################################################## #
# #### #
# Check to see if an input value was given: print usage and exit if not given.
# #### #
# Assiging ARGV[0] to input_value
input_value = ARGV[0]
if input_value.nil?
  STDERR.puts "Error: Missing input value"
  STDERR.puts "Usage: #{$0} <input value>"
  STDERR.puts "Where: <input value> is a hexadecimal integer"
  # Non-zero exit value indicates an error state in Linux/Unix OS-es
  exit 1
end

begin
  # #### #
  # Instantiate the class and invoke the methods
  # #### #
  chto = HexToOctConverter.new
  chto.validate_input(input_value)
  pp chto.input
  chto.convert_hex_to_oct
  # Zero exit value indicates a normal state in Linux/Unix OS-es
  exit 0
rescue => e
  STDERR.puts "Error: #{e.to_s}"
  # Non-zero exit value indicates an error state in Linux/Unix OS-es
  exit 1
end
