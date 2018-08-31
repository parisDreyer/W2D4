require 'set'

def two_sum_slow?(arr, target_sum)
  (0...arr.length - 1).each do |i|
    (i+1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum 
    end
  end 
  false 
end 

def two_sum_sort?(arr, target_sum)
  arr = mergeSort(arr)
  puts arr
  left = 0
  right = arr.length - 1
  until left > right || right > arr.length - 1 || left < 0

    return true if arr[left] + arr[right] == target_sum
       
    if arr[left] + arr[right] > target_sum
      right -= 1
    else
      left += 1
    end
    
  end 
  false
end
  
  
def mergeSort(arr)
  return arr if arr.length < 2 
  mid = arr.length / 2 
  left = mergeSort(arr[0...mid])
  right = mergeSort(arr[mid..-1])
  merge(left, right)
end 

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    if left.first < right.first
      merged << left.shift 
    else 
      merged << right.shift 
    end 
  end 
  merged + left + right 
end 


def two_sum_fast?(arr, target)
  given_set = Set.new
  arr.each do |el|
    temp = target - el 
    return true if given_set.include?(temp)
    given_set.add(el)
  end
  false
end


# p two_sum_sort?([1,3,5,8,9, -1], 0)
# p two_sum_sort?(['cat', 'banana', 'dog'], 'catdog')

p two_sum_fast?([1,3,5,8,9, -1], 0)
