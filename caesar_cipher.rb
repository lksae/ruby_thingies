def caesar_cipher(input_string, shift_factor)
    intermediate_array = input_string.split("")
    output_array = intermediate_array.map{|character| character.ord} #.map{|number| (number+5).chr if number != 32 or number != 33  }
    
    output_string = ""
    output_array.each do |number|
       #puts number.chr
      if number == 32 or number == 33
        
        output_string = output_string.concat( number.chr)
      else
        if number + 5 > 122
            output_string = output_string.concat((122-number+5+97).chr)
        else
            #p number 
            output_string = output_string.concat((number+5).chr)
        end

        
      end
    end
  
    #p output_array
    #p output_string

    #p "B".ord
   # p 92.chr

   alphabet_numbers_first = (1..26).zip('a'..'z').to_h
   alphabet_numbers_first[27] = "!"
   alphabet_numbers_first[28] = " "

   alphabet_chars_first =('a'..'z').zip(1..26).to_h
   alphabet_chars_first["!"] = 27
   alphabet_chars_first[" "] = 28



   intermediate_array = input_string.split("")
   intermediate_hash = {}

   intermediate_array.each do |character|
     character_for_hash = character.downcase.to_sym
     key_for_hash = alphabet_chars_first[character.downcase]
     uppercase_for_hash = is_upcase?(character)
     intermediate_hash[character_for_hash] = {key: key_for_hash, uppercase: uppercase_for_hash }
   end

   output_string = ""
  

   intermediate_array.each do |character|
    #p character
    character_symbol = character.downcase.to_sym
    character_upcase = intermediate_hash[character_symbol][:uppercase]
    character_to_add = ""
    if intermediate_hash[character_symbol][:key] == 27 or intermediate_hash[character_symbol][:key] == 28
        character_to_add = alphabet_numbers_first[intermediate_hash[character_symbol][:key]]
    elsif intermediate_hash[character_symbol][:key] + shift_factor > 26
        character_to_add =  alphabet_numbers_first[intermediate_hash[character_symbol][:key] + shift_factor-26]
    else
        character_to_add =  alphabet_numbers_first[intermediate_hash[character_symbol][:key] + shift_factor]
    end
    if character_upcase
        output_string = output_string + character_to_add.upcase
    else
        output_string = output_string + character_to_add
    end

    

   end
   #p intermediate_hash
   #p intermediate_hash[:w][:uppercase]
   #p alphabet_chars_first
   #p alphabet_numbers_first

   p output_string
   
end

def is_upcase?(character) 
    character == character.upcase
end

caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"