
def my_min_slow(array)
  min = array.max
  (0...array.length).each do |i|
    (i + 1...array.length).each do |j|
      minimum = [array[i], array[j]].min 
      min = [minimum, min].min 
    end
  end
  min
end

def my_min_fast(array)
  min = array[0]
  (1...array.length).each do |i|
    min = [array[i], min].min 
  end
  min
end

def sub_sum_slow(array)
  res = []
  (0...array.length - 1).each do |i|
    (i + 1...array.length).each do |j|
      if array[i..j].sum > res.sum
        res = array[i..j]
      end
    end
  end
  res
end

def sub_sum_fast(array)
  counter = array.sum 
  res = array 
  left = 0
  right = array.length - 1 
  while left < right 
    if array[left] < array[right] 
      array.shift 
    else 
      right -= 1 
    end 
  end 
  res 
end 


def largest_contiguous_subsum2(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  (1...arr.length).each do |i|
    current = 0 if current < 0
    current += arr[i]
    largest = current if current > largest
  end

  largest
end



p largest_contiguous_subsum2([2, 3, -6, 7, -6, 7, 0, 0])