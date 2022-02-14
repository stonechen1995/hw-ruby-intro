# When done, submit this entire file to the autograder.

# Part 1 (You can check your progress on all of the above by running $ rspec spec/part1_spec.rb.)

# Define a method sum(array) that takes an array of integers as an argument and returns the sum of its elements. 
# For an empty array it should return zero. Run associated tests via: $ rspec -e '#sum ' spec/part1_spec.rb 
# (Make sure you are in the correct directory: cd assignment and rspec is installed)
def sum arr
  # result = 0
  # for num in arr
  #   result += num
  # end
  # return result
  
  # result = arr.inject(0) do |memo, num|
  #     memo + num
  # end
  # return result
  
  result = arr.inject(0) {|memo, num| memo + num}
  return result
end

# Define a method max_2_sum(array) which takes an array of integers as an argument and returns the sum of its two largest elements. 
# For an empty array it should return zero. For an array with just one element, 
# it should return that element (Consider if the two largest elements are the same value as well). 
# Run associated tests via: $ rspec -e '#max_2_sum' spec/part1_spec.rb
def max_2_sum arr
  if arr.length == 0
    return 0
  end
  if arr.length == 1
      return arr[0]
  end
  
  first = arr[0]
  second = arr[1]
  arr.drop(2).each do |num|
    if num > first
        if first > second
            second = first
        end
        first = num
    elsif num > second
        second = num
    end
  end
  first + second
end

# Define a method sum_to_n?(array, n) that takes an array of integers and an additional integer, n, 
# as arguments and returns true if any two elements in the array of integers sum to n. sum_to_n?([], n) 
# should return false for any value of n, by definition. Run associated tests via: $ rspec -e '#sum_to_n' spec/part1_spec.rb
def sum_to_n? arr, n
  arr_hash = {}
  arr.each do |num|
    if arr_hash.has_key?(num)
      arr_hash[num] = arr_hash[num] << num     #
    else
      arr_hash[num] = [num]
    end
  end
  arr_hash.each do |key, value|
    if arr_hash.has_key?(n-key)
      next if key == (n - key) && (arr_hash[key].length == 1)      #
      return true
    end
  end
  return false
end

# Part 2 (You can check your progress on all of the above by running $ rspec spec/part2_spec.rb.)

# Define a method hello(name) that takes a string representing a name and returns the string "Hello, " 
# concatenated with the name. Run associated tests via: $ rspec -e '#hello' spec/part2_spec.rb 
# (Make sure you are in the correct directory: cd assignment)
def hello(name)
  return "Hello, #{name}"
end

# Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false otherwise. 
# (For our purposes, a consonant is any English letter other than A, E, I, O, U.) Make sure it works for both upper and lower case and for non-letters. 
# Run associated tests via: $ rspec -e '#starts_with_consonant?' spec/part2_spec.rb
def starts_with_consonant? s
  if s[0] == nil
    return false
  end
  vowel = "AEIOU".split('')
  alpha = 'A'..'Z'
  alpha = [*alpha]
  vowel.each {|v| alpha.delete(v)}
  first_letter = s[0].upcase
  if alpha.include?(first_letter)
      return true
  end
  return false
end

# Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary number 
# that is a multiple of 4, such as '1000'. Make sure it returns false if the string is not a valid binary number. 
# Run associated tests via: $ rspec -e '#binary_multiple_of_4?' spec/part2_spec.rb
def binary_multiple_of_4? s
  if s.length == 0
    return false
  end
  num = s.to_i(2)
  if num == 0 && s != "0"
    return false
  end
  if num%4 == 0
    return true
  end
  return false
end

# Part 3
# rspec -e 'getters and setters' spec/part3_spec.rb
# rspec -e 'constructor' spec/part3_spec.rb
# rspec -e '#price_as_string' spec/part3_spec.rb
# rspec spec/part3_spec.rb
class BookInStock
  attr_reader :isbn, :price
  
  def initialize(isbn, price)
    self.isbn = isbn
    self.price = price
  end
  
  #isbn_writter
  def isbn=(value)
    raise ArgumentError if value.length <= 0 || !value.is_a?(String)
    @isbn = value
  end
  
  #price_writter
  def price=(value)
    raise ArgumentError if value <= 0
    @price = value
  end
  
  #display price
  def price_as_string
    "$" + '%.2f' % "#{price}"
  end
end
