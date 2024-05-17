#!/usr/bin/env ruby

# ########################################################################## #
# Abstract
# Exercise 4j: Script to solve the shortest superstring problem.
# Ref: https://www.geeksforgeeks.org/shortest-superstring-problem/?ref=lbp
# This is a NP-hard problem. To simplify, we only consider five input strings
# in this exercise. Additionally, each input string must be less than ten
# characters in length and must only be lower-case alphabetic strings.
# ########################################################################## #

# ########################################################################## #
# INITIAL SECTION
# ########################################################################## #
# #### #
# Includes
# #### #
require 'pp'

# Note: the documentation given below follows the rdoc format.

##
# Class ShortestSuperStringFinder
#   A class to find the shortest superstring given a list of strings.
#   The shortest superstring is the shortest possible string that contains
#   each of the input strings as a substring.
#   For e.g. for the list of strings: abc, def, ghi, ijk, jkl,
#   the shortest superstring is abcdefghijkl
class ShortestSuperStringFinder
  # This automatically creates getter methods for these attributes
  attr_reader :inputs, :output

  ##
  # Constructor
  #   Inputs: An array of strings, maximum length is 5 (for this exercise).
  #   Output: An instance of this class.
  #
  def initialize
    # Note: the prefix '@' marks the variable as an instance variable.
    # Initialize the inputs array to an empty array
    @inputs = []
    # Initialize the output to an empty string (to avoid concatenation errors)
    @output = ''
    # Verbose output for logging
    @verbose = true
  end

  ##
  # Setter method for setting the list of input strings.
  # Set inputs from a comma-separated string.
  # Raises ArgumentError if any of the given strings is not alphabetic.
  #
  def set_inputs_from_csv(input_value)
    # Split on ','
    input_values = input_value.split(',')
    if input_values.size < 2
      raise ArgumentError, 'Input must contain at least two values'
    end
    if input_values.size > 5
      raise ArgumentError, 'Input must not contain more than five values'
    end
    input_values.each do |val|
      # Check if the length of the value string is between 1 and 9 characters
      len = val.length
      if len < 1
        raise ArgumentError, "Input value '#{val}' is too short"
      end
      if len > 9
        raise ArgumentError, "Input value '#{val}' is too long"
      end
      # Check if value is a lower case alphabetic string
      if val !~ /^([a-z]+)$/
        raise ArgumentError, "Input value '#{val}' is not valid"
      end
      @inputs << val
    end
  end

  ##
  # Utility method to print log messages.
  #
  def logr(mesg)
    puts mesg if @verbose
  end

  ##
  # Method to compute the shortest superstring of two strings
  # Inputs: two strings (both non-empty lower-case alphabetical strings).
  # Checks:
  #   - Given two strings A and B, find the shorter of the two strings
  #   - Assume S1 is the shorter string and S2 is the longer string
  #     (Note: just assign S1 as A and S2 as B if the lengths are equal)
  #   - 01: Iterate over the characters in the S1 to find:
  #     - 01.1: The longest prefix of S2 that is also a suffix of S1
  #     - 01.2: The longest suffix of S2 that is also a prefix of S1
  #   - If both 01.1 and 01.2 don't exist then:
  #     - 01.3: Check if S1 is a substring of S2
  #   - If either 01.1 or 01.2 (or both) and if S1 is not a substring of S2
  #     then the shortest superstring is the longest of 01.1 and 01.2
  #   - If 01.1, 01.2, and 01.3 all of them don't exist then the shortest
  #     superstring is just the concatenation of S1 and S2
  #
  def shortest_super_string(a, b)
    logr "-- ----------------------------------------------------------------"
    logr "-- Starting shortest_super_string('#{a}', '#{b}')"
    # Initialize S1 and S2
    s1 = s2 = ''
    if a.length <= b.length
      s1 = a
      s2 = b
    else
      s1 = b
      s2 = a
    end
    logr "-- S1 = '#{s1}', S2 = '#{s2}'"
    s1_len = s1.length
    s2_len = s2.length
    # Check prefix of S1 is a suffix of S2
    logr "-- Check if a prefix of S1 is a suffix of S2"
    prefix_match = false
    # continue = true
    (s2_len-s1_len).upto(s2_len-1) do |j|
      0.upto(s1_len-1) do |i|
        logr "-- i='#{i}', s1[i]='#{s1[i]}', j='#{j}', s2[j]='#{s2[j]}'"
        #continue = false if s1[i] != s2[s2_len - i]
        #break if i >= s1_len
      end
    end
    logr "-- Check if a prefix of S1 is a suffix of S2 is #{prefix_match}"
    logr "-- Finished shortest_super_string"
    logr "-- ----------------------------------------------------------------"
  end
end

# ########################################################################## #
# MAIN SECTION
# ########################################################################## #
# #### #
# Check to see if an input value was given; print usage and exit if not given.
# #### #
if ARGV.size < 1
  STDERR.puts "Error: Missing input value"
  STDERR.puts "Usage: #{$0} <input value>"
  STDERR.puts "Where: <input value> is a comma-separated list of strings"
  # Non-zero exit value indicates an error state in Linux/Unix-like OS-es
  exit 1
end

begin
  # #### #
  # Instantiate the class and invoke the methods
  # #### #
  ssf = ShortestSuperStringFinder.new
  ssf.set_inputs_from_csv ARGV[0]
  pp ssf.inputs
  ssf.shortest_super_string('ab','abcd')
  # Zero exit value indicates a normal state in Linux/Unix-like OS-es
  exit 0
rescue => e
  STDERR.puts "Error: #{e.to_s}"
  # Non-zero exit value indicates an error state in Linux/Unix-like OS-es
  exit 1
end
