#!/usr/bin/env ruby

# ########################################################################## #
# Abstract
# Exercise 6b: Bubble sort an array
# Ref: https://www.geeksforgeeks.org/bubble-sort/
# In this exercise, we have to sort the an array using bubble sort
# ########################################################################## #

# ########################################################################## #
# INITIAL SECTION
# ########################################################################## #
# #### #
# Includes
# #### #
require 'pp'

# Note: the documentation given below follows the rdoc format
##
# Class BubbleSort
# A class to sort a given array in increasing order
# BubbleSort  sort all the elements in an array in increasing order
# for example list of elements in the array are : 64, 34, 25, 12, 22, 11, 90
# the output looks like 11, 12, 22, 25, 34, 64, 90
class BubbleSort
  # This automatically creates a getter methods for these attributes
  attr_reader :inputs

  ##
  # Constructor
  #   Inputs : An array of integers , which we use it both input and output as well
  #
  def initialize
    # Note: the prefix '@' marks the variable as an instance variable.
    # Initalize the inputs array to an empty array
    @inputs = []
    # Verbose output for logging
    @verbose = true
  end

  ##
  # Setter method for setting the list of input strings.
  # Set inputs from a comma-separated string.
  # Raise Argumenterror if any of the given value is not a integer.
  #
  def set_inputs_from_csv(input_value)
    if input_value.empty?
      raise ArgumentError, 'Input must contain at least two values'
    end
    input_value.each do |val|
      if val.to_s.match?(/^\d+$/)
        @inputs << val.to_i
      else
        raise ArgumentError, "Inputs value '#{val}' is not valid integer"
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
  # Method to sort all given elements in increasing order.
  # Inputs : intergers(both negative and non-negative numbers).
  # Checks:
  #     -
  #
  def sort_by_bubble_sort
    logr "-- ----------------------------------------------------------------"
    logr "-- Starting sort_by_bubble_sort('#{@inputs}')"
    # Length of the given strings
    n = @inputs.length
    # Iterating through each elements to
    logr "-- Comparing each elements to sort"
    (0...n).each do |i|
      (0...n-i-1).each do |j|
        if @inputs[j] > @inputs[j+1]
          @inputs[j], @inputs[j+1] = @inputs[j+1], @inputs[j]
        end
      end
    end
    logr "-- Sorted elements in the array is #{@inputs}"
    logr "-- Finished sort_by_bubble_sort"
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
  sbbs = BubbleSort.new
  sbbs.set_inputs_from_csv(input_values)
  pp sbbs.inputs
  sbbs.sort_by_bubble_sort
  # Zero exit value indicates a normal state in Linux/Unix-like OS-es
  exit 0
rescue => e
  STDERR.puts "Error: #{e.to_s}"
  # Non-zero exit value indicates an error state in Linux/Unix-like OS-es
  exit 1
end

