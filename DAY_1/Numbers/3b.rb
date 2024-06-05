#!/usr/bin/env ruby

# ########################################################################## #
# Abstract
# Exercise 3b: Write a oct to hex converter
# Ref: Not available
# In this exercise, we have to convert a octal number to hexadecimal number
# ########################################################################## #

# ########################################################################## #
# INITIAL SECTION
# ########################################################################## #
# #### #
require 'pp'

# Note: the documentation given below follow the rdoc format
##
# Class OctToHexConverter
# A class to convert octal value to Hexadecimal value
# The given string contains a octal value which should  be /0-7/
# For example octal value looks like 22(any integer from 0-7)
# the Output looks like 12
# Octal value 22 is 12 in hexadecimal value
class OctToHexConverter
  # This automatically creates a getter method for these attributes
  attr_reader :input , :output

  ## 
  # Constructor 
  # Input  : Octal value, which contain only integer (0-7) only 
  # Output : Hexadecimal  value, which contain only integer (0 - 9) and alphabets (A - F)
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
  # Setter methof for setting the input string
  # Set input as a single string.
  # Raise ArgumentError if any of the given value is not a octal value.
  #

  def validate_input(input_value)
    if input_value.to_s.match?(/\A[0-7]+\z/)
      @input = input_value
    else 
      raise ArgumentError, "Invalid octal number"
    end
  end

  ##
  # Utility method to print log messages.
  #
  def logr(mesg)
    puts mesg if @verbose
  end

  ##
  # Method to convert octal number to hexadecimal number
  # Inputs: Octal value (0-7)
  # Checks:

  def convert_oct_to_hex
    logr "-- ----------------------------------------------------------------"
    logr "-- Starting convert_oct_to_hex('#{@input}')"
    # Converting octal value to hexadecimal value
    logr "-- Converting octal value to hexadecimal value"
    # Converting octal value to decimal value
    decimal_value = @input.to_i(8)
    # Converting decimal value to hexadecimal value
    hexadecimal_value = decimal_value.to_s(16)
    @output = hexadecimal_value
    logr "-- Octal value of the given hexadecimal value is #{@output}"
    logr "-- Finished convert_oct_to_hex"
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
  STDERR.puts "Where: <input value> is a Octal integer"
  # Non-zero exit value indicates an error state in Linux/Unix OS-es
  exit 1
end

begin 
  # #### #
  # Instantiate the class and invoke the methods 
  # #### #
  coth = OctToHexConverter.new
  coth.validate_input(input_value)
  pp coth.input
  coth.convert_oct_to_hex
  # Zero exit value indicates a normal state in Linux/Unix OS-es
  exit 0
rescue => e
  STDERR.puts "Error: #{e.to_s}"
  # Non-zero exit value indicates an error state in Linux/Unix OS-es
  exit 1
end