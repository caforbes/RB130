# create Series object
# input string of integers on object creation
# has instance method slices
# take argument of integer
# if equal to or lower than length of string, produces consecutive integers of that length
  # returns an array of ordered arrays of integers
  # main list ordered by appearance in the string
# if higher than length of string, blows up
  # raises argument error

class Series
  def initialize(string)
    @sequence = string
  end

  def slices(length)
    unless (0..@sequence.length).include? length
      raise ArgumentError, "can't get a sequence of that size from this series"
    end

    sequence_numbers = @sequence.chars.map(&:to_i)

    sequence_numbers.each_index.with_object([]) do |start_ind, result|
      end_ind = start_ind + length - 1
      break result if end_ind >= @sequence.length

      result << sequence_numbers[start_ind..end_ind]
    end

    # @sequence.chars.map(&:to_i).each_cons(length).to_a
  end
end

# raise an error if specified length not between 0 and sequence length
# convert string to list of component integers
  # split substring into array of chars
  # convert each digit char to integer
# create reference to a result array
# get array of subarrays of specified length from the series
  # iterate through the array indices
  # start at beginning index
  # add specified length -1 to the index to get the ending index
  # break out of the iteration if end index is past end of the array
  # get a slice from starting index to ending index
  # add the slice to result array
# return the result array