def first_anagram(str_first, checker)
  str_total = str_first.permutation.to_a
  
  str_total.include?(checker)
end 


def second_anagram(str_first, second_str)
  scnd_str_arr = second_str.chars
  
  str_first.each_char do |c|
    return false if scnd_str_arr.empty?
    found = scnd_str_arr.index(c)
    scnd_str_arr.delete_at(found) unless found.nil?
  end
  scnd_str_arr.empty?
end


def third_anagram(str_first, second_str)
  first = str_first.chars.sort
  second = second_str.chars.sort
  first == second
  
end

def fourth_anagram(str_first, second_str)
  first = Hash.new(0)
  str_first.each_char {|ch| first[ch] += 1}
  second = Hash.new(0)
  second_str.each_char{|ch| second[ch] += 1 }
  
  second.each do |k,v|
    return false unless first[k] == v
  end 
  true 
end 

def fourth_one_hash(str_first, str_second)
  first = Hash.new(0)
  str_first.each_char {|ch| first[ch] += 1}
  
  str_second.each_char do |c|
    if first.key?(c)
      first[c] -= 1 
    end 
  end 
  
  first.all? { |k, v| v == 0  }
end 

p fourth_one_hash("cat", "bear")
p fourth_one_hash("cats up", "s u")
p fourth_one_hash("wrap", "parw")

