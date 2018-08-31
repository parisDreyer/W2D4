def max_window_range_slow(arr, window_size)
  return nil if window_size > arr.length 
  res = 0
  (0..arr.length-window_size).each do |i|
    max = i + window_size
    (i + 1...max).each do |j|
      puts i 
      puts j 
      the_max = [arr[i], arr[j]].max
      the_min = [arr[i], arr[j]].min
      res = the_max - the_min if the_max - the_min > res 
    end 
  end 
  res 
        
end




class MyQueue
  
  def initialize
    @array = []
  end
   
  def enqueue(element)
    @array.push(element)
  end
   
  def dequeue
    @array.shift
  end
  
  def peek
    @array[0]
  end
  
  def empty?
    @array.empty?
  end
    
end

class MyStack
  def initialize
    @array = []
  end 
  
  def push(element)
    @array.push(element)
  end 
  
  def pop
    @array.pop
  end 
  
  def peek
    @array.last 
  end 
  
  def empty?
    @array.empty?
  end
  
end

class StackQueue
  
  def initialize
    @main = MyStack.new 
    @secondary = MyStack.new 
  end
  
  def enqueue(element)
    @main.push(element)
  end
  
  def dequeue
    unless @secondary.empty?
      return @secondary.pop
    end
    until @main.empty?
      element = @main.pop
      @secondary.push(element)
    end
    @secondary.pop
  end
  
  def size 
    @main.length + @secondary.length
  end 
  
  def empty?
    @main.empty? && @secondary.empty?
  end
  
end


class MinMaxStack
  def initialize
    @main = MyStack.new 
    @max_stack = MyStack.new 
    @min_stack = MyStack.new
    @size = 0
  end 
  
  def push(el)
    if @max_stack.empty?
      @max_stack.push(el)
    elsif el > @max_stack.peek
      @max_stack.push(el) 
    end  
    
    
    if @min_stack.empty?
      @min_stack.push(el)
    elsif el < @min_stack.peek
      @min_stack.push(el)
    end 
    @size += 1
    @main.push(el)
  end 
  
  def pop
    temp = @main.pop
    
    if temp == @min_stack.peek 
      @min_stack.pop 
    end 
    
    if temp == @max_stack.peek 
      @max_stack.pop 
    end 
  
    @size -= 1
    temp 
  end 
  
  def max 
    @max_stack.peek 
  end 
  
  def min 
    @min_stack.peek 
  end 
  
  def empty?
    @main.empty?
  end 
  
end

class MinMaxStackQueue
  
  def initialize
    @main = MinMaxStack.new 
    @main_helper = MinMaxStack.new
  end
  
  def enqueue(el)
    @main.push(el)
    
  end
  
  def dequeue
    unless @main_helper.empty?
      @main_helper.pop
    end
    
    until @main.empty?
      temp = @main.pop
      @main_helper.push(temp)
    end
    
    @main_helper.pop
  end
  
  def max
    unless @main_helper.empty?
      return @main_helper.max 
    end 
    @main.max 
  end 
  
  def min
    unless @main_helper.empty?
      return @main_helper.min
    end 
    @main.min 
  end 
  
end

def max_window(array, window_size)
  queue = MinMaxStackQueue.new 
  n = 0
  
  until n == window_size
    queue.enqueue(array[n])
    n += 1
  end
  res = queue.max - queue.min 
  (window_size+1...array.length).each do |i|

    queue.enqueue(array[i])
    queue.dequeue
    res = [res, queue.max - queue.min].max 
  end
  
  res 
end

p max_window([1, 0, 2, 5, 4, 8], 5)


