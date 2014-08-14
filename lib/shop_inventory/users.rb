#!/usr/bin/ruby
=begin
  User class performs various operations
  viewing list of product, search by product id, buy produt
=end
class User
  include ListProduct
   @@filename = "inventory.txt"
  def choose_option
    puts "enter your choice"
    puts "1. List product"
    puts "2. Search product"
    puts "3. Buy product"
    choice = gets.chomp
    object = User.new
    case choice
      when "1"
        ListProduct.list_product
      when "2"
        puts "enter id of product you want to search"
        product_id = gets.chomp
        object.search_product(product_id)
      when "3"
       object.buy_product
      else
        "wrong selection made"
    end
  end

# search_product method will search product with argument passes either id or name
  def search_product(arg)
    puts "id \t name \t stock \t company name "
    File.open(@@filename ,"r") do |file|
      file.each_line do |line|
        temp_array = line.split("*")
        unless temp_array[0] == arg

        else
          puts "#{temp_array[0]}\t#{temp_array[1]}\t#{temp_array[2]}\t #{temp_array[3]}"
        end
      end
    end
  end

  # method for buy product
  def buy_product
    puts "in buy priduct"
    puts "enter id of product you want to buy"
    p_id = gets.chomp
    puts p_id
    write_file = File.open("orders.txt", "a")
    File.open(@@filename,"r") do |file|
      File.open("file.txt", "a") do |fp|
        file.each_line do |line|
          temp_array =line.split("*")
          if temp_array[0]==p_id && Integer(temp_array[2])>0
            puts "product is present and stock :#{temp_array[2]}"
            puts "enter your name"
            customer_name = gets.chomp
            puts "enter credit card number"
            credit_number = gets.chomp
            puts "enter ccv number"
            ccv_number = gets.chomp
            write_file.write("#{customer_name}*#{credit_number}*#{ccv_number}\n")
            stock = Integer(temp_array[2])-1

            puts "stock : #{stock}"
           end
            unless line.start_with? "#{p_id}"
              fp.write("#{temp_array[0]}*#{temp_array[1]}*#{temp_array[2]}*#{temp_array[3]}")
            else
              fp.write("#{temp_array[0]}*#{temp_array[1]}*#{stock}*#{temp_array[3]}")
            end

        end
        File.rename("file.txt",@@filename)
      end
    end
  end
end
require 'shop_inventory/modules.rb'