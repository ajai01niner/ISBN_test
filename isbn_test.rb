def input_isbn()
	puts "Enter 13 Digit ISBN Number"
		isbn = gets
	eval_input(isbn)
end

def eval_input(str)
  check_isbn = str.delete("^0-9").chars								#removes all non-numeric characters in input   
  if check_isbn.size == 12
  	 check_isbn.push(calculate_check(check_isbn, 1).abs).join.to_i	#calls calculate_check function
  	 puts "Final ISBN #{check_isbn}"
  elsif (check_isbn.size < 12) || (check_isbn.size > 13)			#if ISBN value is less than 12 or more than 13 it is not a valid ISBN 
  	puts "ISBN is not valid!"
  else
  	 if calculate_check(check_isbn, 2)
  		puts "Valid ISBN"
  	 else 
  	 	puts "Check Number Not correct"
  	end
  end
end

def calculate_check(int1, int2)
	if int2 == 1
		return check_val(int1)-10
	elsif int2 == 2
		return true if check_val(int1) == 0
	end		
end

def check_val(chck)
	return chck.each_slice(2).sum{|d1, d2| d1.to_i + d2.to_i*3}.remainder(10)	#here goes the main computation of the ISBN value
end	
 
input_isbn()
