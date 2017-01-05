require 'byebug'
# phase 1
def my_min(list)
  list.each_with_index do |el1, i|
    min = true

    list.each_with_index do |el2, j|
      next if j == i

      min = false if el2 < el1
    end
    return el if min
  end
end

# time complexity = n^2

def my_min_better(list)
  min = list.first
  list.each do |el|
    min = el if el < min
  end
  min
end

# time complexity = O(n)


def sub_sum(list)
  subs = []

  list.each_with_index do |el1, i|
    # debugger
    (0...list.length - i).each do |len|
      subs << list[i..i + len]
    end

  end

  subs.map! do |subset|
    subset.inject(:+)
  end

  subs.max
end

# time complexity = O(n^2)


def sub_sum_better(list)
  largest_sum = list.first

  #iterate over once.
  # as you iterate keep a tally of the sum.
  # indexing into an array is O(1)
  # [2, 3, -6, 7, -6, 7]

  sub_sum = 0
  list.each do |el|
    sub_sum += el
    largest_sum = sub_sum if sub_sum > largest_sum

    sub_sum = 0 if sub_sum < 0
  end

  largest_sum
end

# time complexity = O(n)
# space complexity = O(1)
