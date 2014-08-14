#!/usr/bin/ruby
=begin
module will include common methods like list_product and search which are common
for both shopkeepres and users.
=end
module ListProduct
  @@filename = "inventory.txt"
  # list_product method will list all products with id and their details
  def self.list_product
    puts "product information :"
    puts "id \t name \t stock \t company name "
    File.open(@@filename, "r").each_line do |line|
      temp_array = line.split("*")
      puts "#{temp_array[0]}\t#{temp_array[1]}\t#{temp_array[2]}\t #{temp_array[3]}"
    end
  end
end