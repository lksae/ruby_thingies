def caesar_cipher(input_string, shift_factor)
    intermediate_array = input_string.split("")
    output_array = intermediate_array.map{|character| character.ord} #.map{|number| (number+5).chr if number != 32 or number != 33  }
    
    ouput_string = ""
    output_array.each do |number|
      if number != 32 or number != 33
        output_string = output_string & (number+5).ord
      else
        ouput_string = noutput_string & umber.ord
      end
    end
  

    p ouput_string

    #p "a".ord
    #p 122.chr
end

# a = 97
# z = 122
caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"