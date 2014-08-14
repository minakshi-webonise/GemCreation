class ShopInventory
  def main_method
    puts "Enter which user you are"
    puts "1. Shop keeper"
    puts "2 . User"
    user_type = gets.chomp
    case user_type
      when "1"
        puts "shop keeper"
        object = ShopKeeper.new
        object.choose_option
      when "2"
        puts "user"
        object = User.new
        object.choose_option
      else
        puts "incorrect type of user"
    end
  end
end
require 'shop_inventory/shopkeepers.rb'
require 'shop_inventory/users.rb'