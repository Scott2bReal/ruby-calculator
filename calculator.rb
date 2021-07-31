def valid_number(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def acquire_number
  # This will sanitize input for the eval later
  print('Please enter a number: ')
  loop do
    answer = gets.chomp
    return answer if valid_number(answer)

    print('Invalid input. Please enter a number: ')
  end
end

def operate(num1, num2)
  loop do
    print('What would you like to do with these numbers? ')
    operator = gets.chomp
    # Not working yet
    begin
      operation = "#{num1} #{operator} #{num2}"
      puts "#{operation} = #{eval(operation)}"
      break
    rescue
      puts "Sorry, I couldn't understand that."
      next
    end
  end
end

loop do
  puts "Welcome to Scott's Calculator!"

  number1 = acquire_number
  number2 = acquire_number
  
  # Needs error catching!!
  operate(number1, number2)
  print('Press q to stop calculating (any key to continue)')
  answer = gets.chomp
  break if answer.downcase == 'q'
end
