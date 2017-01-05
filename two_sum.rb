def bad_two_sum?(arr, target)
  arr.each_with_index do |el1, i|
    arr.each_with_index do |el2, j|
      next if i == j
      return true if el1 + el2 == target
    end
  end
  false
end


# Time COmplexity O(n^2) - Absolute worst case

def okay_two_sum?(arr, target) #[1, 2, 3, 4, 6], 6
  arr.sort!



end

def my_bsearch(arr, target)
  return nil if arr.length < 1

  mid = arr.length / 2
  case arr[mid] <=> target
  when -1
    result = my_bsearch(arr[mid + 1..-1], target)
    result.nil? ? 0 : result + mid + 1
  when 0
    return mid
  when 1
    my_bsearch(arr[0...mid], target)
  end
end
