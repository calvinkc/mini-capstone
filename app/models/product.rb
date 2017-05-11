class Product < ApplicationRecord

  def sale_message
    # • Create a model method called sale_message that does as follows: If an item is under $2, it returns the string “Discount Item!” - otherwise, it should return the string “Everyday Value!!” Then, have this message appear on the product’s show page.
    if price < 2
      return "Discount Item!" 
    else
      return "Everyday Value!"
    end
  end

  def tax
    #• Create a model method called tax which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)
    tax = (price * 0.09).to_d
    "Tax: #{tax}"
  end

  def total
   # • Create a model method called total which will return the sum of the price + tax.
    total = ((price * 0.09).to_d) + price
    "Total: #{total}"
  end

  
end
