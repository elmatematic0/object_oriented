 

class Product
  attr_accessor :quantity, :name, :price

  def initialize (quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price 
    @status = "n"
       
  end
  
  def tax_rate
    0.10
  end
  
  def import_rate
    0.05
  end


  def sales_tax
     if @status == "s"                                           #sales tax only
       (@price * @quantity) * (tax_rate)
    elsif @status == "si"                                        #sales tax and import duty
       (@price * @quantity) * (tax_rate + import_rate)
    elsif @status == "i"                                         #import duty only, sales tax exempt
       (@price * @quantity) * (import_rate)
    elsif @status == "n"                                         #no sales tax, no import duty
       (@price * @quantity) * 0
    end
  end

  
  def total_cost
    if @status == "s"                                            #sales tax only
       (@price * @quantity) * (1 + tax_rate)
    elsif @status == "si"                                        #sales tax and import duty
       (@price * @quantity) * (1 + tax_rate + import_rate)
    elsif @status == "i"                                         #import duty only, sales tax exempt
       (@price * @quantity) * (1 + import_rate)
    elsif @status == "n"                                         #no sales tax, no import duty
       (@price * @quantity)
    end
  end
end

class Sales_only < Product
  def initialize(quantity, name, price)
    super(quantity, name, price)
    @status = "s"
  end
end

class Sales_and_import<Product
  def initialize(quantity, name, price)
    super(quantity, name, price)
    @status = "si"
  end
end

class Import_only<Product
  def initialize(quantity, name, price)
    super(quantity, name, price)
    @status = "i"
  end
end

class No_tax_or_duty<Product
  def initialize(quantity, name, price)
    super(quantity, name, price)
    @status = "n"
  end
end


#Input 1
product1 = No_tax_or_duty.new(1, "book", 12.49)
product2 = Sales_only.new(1, "CD", 14.99)
product3 = No_tax_or_duty.new(1, "chocolate bar", 0.85)


#Input 2
product4 = Import_only.new(1, "imported box of chocolates", 10.00)
product5 = Sales_and_import.new(1, "imported bottle of perfume", 47.50)

#Input 3
product6 = Sales_and_import.new(1, "imported bottle of perfume", 27.99)
product7 = Sales_only.new(1, "bottle of perfume", 18.99)
product8 = No_tax_or_duty.new(1, "bottle of headache pills", 9.75)
product9 = Import_only.new(1, "box of imported chocolates", 11.25)

puts "OUTPUT"

puts "Output 1:"
puts "#{product1.quantity} #{product1.name}: " + sprintf("%.2f","#{product1.total_cost}") 
puts "#{product2.quantity} music #{product2.name}: " + sprintf("%.2f","#{product2.total_cost}")
puts "#{product3.quantity} #{product3.name}: " + sprintf("%.2f","#{product3.total_cost}")
puts "Sales Taxes: " + sprintf("%.2f","#{product1.sales_tax + product2.sales_tax + product3.sales_tax}")
puts "Total: " + sprintf("%.2f","#{product1.total_cost + product2.total_cost + product3.total_cost}")
puts
puts "Output 2:"
puts "#{product4.quantity} #{product4.name}: " + sprintf("%.2f","#{product4.total_cost}")
puts "#{product5.quantity} #{product5.name}: " + sprintf("%.2f","#{product5.total_cost}")
puts "Sales Taxes: " + sprintf("%.2f","#{product4.sales_tax + product5.sales_tax}")
puts "Total: " + sprintf("%.2f","#{product4.total_cost + product5.total_cost}")
puts
puts "Output 3:"
puts "#{product6.quantity} #{product6.name}: " + sprintf("%.2f","#{product6.total_cost}")
puts "#{product7.quantity} #{product7.name}: " + sprintf("%.2f","#{product7.total_cost}")
puts "#{product8.quantity} #{product8.name}: " + sprintf("%.2f","#{product8.total_cost}")
puts "#{product9.quantity} #{product9.name}: " + sprintf("%.2f","#{product9.total_cost}")
puts "Sales Taxes: " + sprintf("%.2f","#{product6.sales_tax + product7.sales_tax + product8.sales_tax + product9.sales_tax}")
puts "Total: " + sprintf("%.2f","#{product6.total_cost + product7.total_cost + product8.total_cost + product9.total_cost}")


# class Basket
#   def initialize
#     @shoplist = []
#   end
#   def add_product(product)
#     @shoplist << product
#   end

#   def to_s
#     result = ""
#       @shoplist.each do |item|
#       result << item.to_s + "\n"
#     end
#     result
#   end
# end

# basket1 = Basket.new
# basket1.add_product(product1)
# basket1.add_product(product2)
# basket1.add_product(product3)
# puts basket1



