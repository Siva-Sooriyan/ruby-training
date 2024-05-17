# !/usr/bin/env/ ruby

# ########################################################################## #
# Abstract
# 13) Scripting for files and directories
# Exercise 13a: Write a script that concatenates two files with alternating lines
# Ref: For now now available (Will be updated)
# In this exercise, we have to concatenate two file with alternating lines
# ########################################################################## #

# ########################################################################## #
# INITIAL SECTION
# ########################################################################## #
# #### #
require 'pp'

# Note: the documentation given below follow the rdoc format
##
# Class ConcatenateFile
# A class to concatenate two files with alternating lines
# There should be two files
# For example file1.txt , file2.txt  - contains a data line by line
# Like in file1.txt - 1 ,2 ,3 ,4 ,5(line-by-line) and in file2.txt - a ,b ,c ,d ,e (line-by-line)
# the output looks like 1 ,a ,2 ,b ,3 ,c ,4 ,d ,5 ,e (line-by-line)
class ConcatenateFile
  # This autmatically creates a getter method for these attributes
  attr_reader :file1, :file2 ,:output

  ##
  # Constructor
  # file1 : An file which contains the line-by-line values as input
  # file2 : An file which contains the line-by-line values as input
  # output : An array which we use to store the concatenated values in alternating lines
  ##
  def initialize
    # Note : the prefix '@' marks the variable as an instance variable.
    # Initialize the file1 , file2 to be readable files
    @file1 = []
    @file2 = []

    # @file1 = File.readlines(input_value[0])
    # @file2 = File.readlines(input_value[1])

    # Initialize the output to store the concatenated values in aternating line in an array.
    @output = []
    # Verbose output for logging
    @verbose = true
  end

  ##
  # Setter method for setting the list of input strings
  # Set inputs from a text file
  # Raise ArgumentError if any of the given value is not a integer.
  #

  def set_inputs_from_text_files(input_value)
    if input_value.compact.length != 2
      raise ArgumentError, "Input must contain two files"
    end
    input_value.each_with_index do |val, index|
      if val.match(/\.txt$/)
        if index == 0
          @file1 = File.readlines(val)
        elsif index == 1
          @file2 = File.readlines(val)
        end
      else
        raise ArgumentError, " Invalid file format: #{val} , File must have .txt extension"
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
  # Method to concatenate two file in alternating lines.
  # Inputs : Any types of data
  # Checks :
  #
  #

  def concatenate_two_file_in_alternating_lines
    logr "-- ----------------------------------------------------------------"
    logr "-- Starting concatenate_two_file_in_alternating_lines('#{@file1}'and '#{@file2}')"
    n = [@file1.length,@file2.length].max
    logr "-- Iterating each line in both files"
    (0...n).each_with_index do |value1, value2|
      @output << @file1[value1].chomp
      @output << @file2[value2].chomp
    end
    logr "-- Concatenation of two files with alternative lines are #{@output}"
    logr "-- Finished concatenate_two_file_in_alternating_lines"
    logr "-- ----------------------------------------------------------------"
  end
end

# ########################################################################## #
# MAIN SECTION
# ########################################################################## #
# #### #
# Check to see if an input value was given: print usage and exit if not given.
# #### #
# Assinging ARGV[0],ARGV[1] to input_value
input_value_1 = ARGV[0]
input_value_2 = ARGV[1]
input_value = input_value_1,input_value_2

if input_value.compact.empty?
  STDERR.puts "Error: Missing input values"
  STDERR.puts "Usage: #{$0} <input value>"
  STDERR.puts "Where: <input value> is a text file separated by space"
  # Non-zero exit value indicates an error state in Linux/Unix OS-es
  exit 1
end


begin
  # #### #
  # Instantiate the class and invoke the methods
  # #### #
  cf = ConcatenateFile.new
  cf.set_inputs_from_text_files(input_value)
  cf.concatenate_two_file_in_alternating_lines
  # Zero exit value indicates a normal state in Linux/Unix OS-es
  exit 0
rescue => e
  STDERR.puts "Error: #{e.to_s}"
  # Non-zero exit value indicates an error state in Linux/Unix OS-es
  exit 1
end
