require 'byebug'

# PHase 1
def first_anagram?(str1, str2)
  # permuattions
  anagrams = []
  permutations(str1.split('')).each do |perm|
    anagrams << perm.join('')
  end

  anagrams.include?(str2)
end



def permutations(arr)
  return [arr] if arr.length <= 1

  first = arr.shift
  perms = permutations(arr)
  all_perms = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      all_perms << perm[0...i] + [first] + perm[i..-1]
    end
  end

  all_perms
end

# Time Complexity - O(n!)


# Phase 2
def second_anagram?(str1, str2)
  str1.each_char do |s|
    if str2.chars.include?(s)
      str1 = str1.sub(s, '')
      str2 = str2.sub(s, '')
    end
  end

  str1.empty? && str2.empty?
end

# Time complexity - O(n^2)

#Phase 3
def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

# Time complexity - O(n log n)


#Phase 4
def fourth_anagram?(str1,str2)
  first_hash = Hash.new(0)
  second_hash = Hash.new(0)

  str1.each_char { |char| first_hash[char] += 1 }
  str2.each_char { |char| second_hash[char] += 1 }

  first_hash == second_hash
end


def fifth_anagram?(str1, str2)
  hash = Hash.new(0)

  str1.each_char { |char| hash[char] += 1 }
  str2.each_char { |char| hash[char] -= 1 }

  hash.values.all? { |v| v == 0 }
end
