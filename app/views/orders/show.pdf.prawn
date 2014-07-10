require "open-uri"

prawn_document(force_download: true, page_layout: :landscape, filename: "odrderdetailshere.pdf") do |pdf|

  pdf.text "Thank you for shopping at Katalyst, here's a simple copy of your order"

  pdf.move_down 20
  # pdf.stroke_horizontal_rule
  pdf.text "Your order total was " + @current_order.total.to_s, size:33
  
  pdf.move_down 20
  # pdf.stroke_horizontal_rule
  pdf.text "And you bought the following"
    @current_order.lineitems.each do |li|
      pdf.move_down 10
      pdf.text li.quantity.to_s + " " + Product.find(li.product_id).name + "at " + li.unit_price.to_s + "p each"


      
      # pdf.image URI.parse(li.photo.image.thumb).open, width: 100
  end  
  pdf.move_down 40
  pdf.text "Please come back again!"

end