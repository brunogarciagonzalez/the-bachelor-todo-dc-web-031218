def get_first_name_of_season_winner(data, season)
  #Build a method, get_first_name_of_season_winner,
  # that takes in two arguments, a hash called data (i.e. the data structure described above),
  # and a season. The method should return the first name of that season's winner.
  #Hint: you'll need to do some string manipulation to return only the first name of the winning lady.
  winner_namestring = ""
  data[season].each do |array_element|
     #each array element is the hash of information per contestant
     contestant_status = array_element["status"]

     if contestant_status == "Winner"
       winner_namestring =  array_element["name"]
     end

   end

   split_winner_namestring = winner_namestring.split(" ")

   winner_firstname = split_winner_namestring[0]
   #end of function
end

def get_contestant_name(data, occupation)
  #that takes in the data hash and an occupation string
  #and returns the name of the woman who has that occupation.
  person_namestring = ""

  data.each_pair do |season, contestants_array|
    contestants_array.each do |a_contestant_hash|
      if a_contestant_hash["occupation"] == occupation
        person_namestring = a_contestant_hash["name"]
        return person_namestring
      end
    end
  end
  #end of function
end

def count_contestants_by_hometown(data, hometown)
  #takes in two arguments––the data hash and a string of a hometown.
  #This method should return a counter of the number of contestants who are from that hometown.
  hometown_counter = 0

  data.each_pair do |season, contestants_array|
    contestants_array.each do |a_contestant_hash|
      if a_contestant_hash["hometown"] == hometown
        hometown_counter += 1
      end
    end
  end

  return hometown_counter
  #end of function
end

def get_occupation(data, hometown)
  #It returns the occupation of the first contestant who hails from that hometown.

  data.each_pair do |season, contestants_array|
    contestants_array.each do |a_contestant_hash|
      if a_contestant_hash["hometown"] == hometown
        return a_contestant_hash["occupation"]
      end
    end
  end

  #end of function
end

def get_average_age_for_season(data, season)
  # Iterate through the data_hash and return the average age of all of the contestants for that season.
  season_age_sum = 0
  season_num_contestants = data[season].length

  data.each_pair do |season_key, contestants_array|

    if season_key == season
      contestants_array.each do |a_contestant_hash|
        contestant_age = a_contestant_hash["age"].to_f
        season_age_sum += contestant_age
      end
    end

  end

  average_age_for_season_float = season_age_sum / season_num_contestants


  average_age_for_season_i = average_age_for_season_float.round.to_i
  #end of function
end
