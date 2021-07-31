def valid_number(num)
  num.to_i.to_s == num || num.to_f.to_s == num
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

loop do
  puts "Welcome to Scott's Calculator!"

  num1 = acquire_number
  num2 = acquire_number

  loop do
    print('What would you like to do with these numbers? ')
    operator = gets.chomp
    # Ruby needs an operator it can use
    begin
      operation = "#{num1} #{operator} #{num2}"
      puts "#{operation} = #{eval(operation)}"
      break
      # This was the only error type I saw in testing. More could be possible...
    rescue SyntaxError
      puts "Sorry, I couldn't understand that."
      next
    end
  end

  print('Press q to stop calculating (any key to continue)')
  answer = gets.chomp
  break if answer.downcase == 'q'
end
