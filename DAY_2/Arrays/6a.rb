#!/usr/bin/env ruby

# ########################################################################## #
# Abstract
# Exercise 6a: All Unique Elements
# Ref: https://www.geeksforgeeks.org/print-distinct-elements-given-integer-array/?ref=lbp
# In this exercise, we have to print all distinct elements in the array
# ########################################################################## #

# ########################################################################## #
# INITIAL SECTION
# ########################################################################## #
# #### #
require 'pp'

# Note: the documentaiton given below follow the rdoc format
##
# Class UniqueElements
# A class to find all distinct elements in the given array
# The given array may contain duplicates and the output should print every element only ones
# for example list of all elements in the array are : 1,2,3,4,5,5,6,7,
# the output looks like 1,2,3,4,5,6,7
class UniqueElements
  # This automatically creates a getter method for these attributes
  attr_reader :inputs, :outputs

  ##
  # Constructor
  # Inputs : An array of integers , which we use it for input
  # Ouputs : An array on integers, which we use it for store the distinct values
  ##
  def initialize
    # Note: the prefix '@' marks the variable as an instance variable.
    # Initalize the inputs array to a empty array
    @inputs = []
    # Initalize the outputs array to store the distinct value of the given array
    @outputs = []
    # Verbose output for logging
    @verbose = true
  end

  ##
  # Setter method for setting the list of input strings
  # Set inputs from a comma-separated string.
  # Raise Argumenterror if any of the given value is not a integer.
  #

  def set_inputs_from_csv(input_value)
    if input_value.length != 2
      raise ArgumentError, 'Input must contain at least two values'
    end
    input_value.each do |val|
      if val.to_s.match?(/^\d+$/)
        @inputs << val.to_i
      else
        raise ArgumentError, "Input value '#{val}' is not valid integer"
      end
    end
  end

  ##
  # Utility method to print log messages.
  #
  def logr(mesg)
    puts mesg if @verbose
  end

  ##
  # Method to print all distinct elements.
  # Inputs : Integers(both negative and non-negative numbers).
  # Checks :
  #
  #

  def find_distinct_elements
    logr "-- ----------------------------------------------------------------"
    logr "-- Starting find_distinct_elements('#{@inputs}')"
    # Iterating through each elements
    logr "-- Iterating each elements to find the distinct elements"
    @inputs.each do |value|
      @outputs << value unless @outputs.include?(value)
    end
    logr "-- Distinct elements in the array is #{@outputs}"
    logr "-- Finished find_distinct_elements"
    logr "-- ----------------------------------------------------------------"
  end

end

# ########################################################################## #
# MAIN SECTION
# ########################################################################## #
# #### #
# Check to see if an input value was given: print usage and exit if not given.
# #### #
# Assinging ARGV[0] to input_value
input_value = ARGV[0]
if input_value.nil?
  STDERR.puts "Error: Missing input value"
  STDERR.puts "Usage: #{$0} <input value>"
  STDERR.puts "Where: <input value> is a comma-separated list of integers"
  # Non-zero exit value inidcates an error state in Linux/Unix-like OS-es
  exit 1
end

begin
  # #### #
  # Instantiate the class and invoke the methods
  # #### #
  input_values = input_value.split(',')
  fde = UniqueElements.new
  fde.set_inputs_from_csv(input_values)
  pp fde.inputs
  fde.find_distinct_elements
  # Zero exit value indicates a normal state in Linux/Unix-like OS-es
  exit 0
rescue => e
  STDERR.puts "Error: #{e.to_s}"
  # Non-zero exit value indicates an error state in Linux/Unix-like OS-es
  exit 1
end
