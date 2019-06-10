require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |attr, value|
    value.push ("Balloons")
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above

  # add the second argument to the memorial day array
  holiday_supplies[:spring][:memorial_day].push (supply)

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_supplies[season] = {}
  holiday_supplies[season][holiday_name] = supply_array
  holiday_supplies
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_supplies[:winter].each do |hol, sup|
    winter_supplies << sup
  end
  return winter_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_supplies.each do |season, hol|
    puts season.to_s.capitalize + ":"
    holiday_supplies[season].each do |hol, ar|
      hol_str = hol.to_s
      hol_str = hol_str.split("_").each {|word| word.capitalize!}
      hol_str = hol_str.join(" ")
      str = "  " + hol_str + ": "
      ar.each {|item| str += item + ", "}
      str.chomp!(", ")
      puts str

    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  hol_array = []
  holiday_supplies.each do |season, holidays|
    holidays.each do |holiday, items|
      
      if items.value.include? ("BBQ")
        hol_array.push holiday
      end
    end

  end
  return hol_array


end
