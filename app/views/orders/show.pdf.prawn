require "open-uri"

prawn_document(force_download: true, page_layout: :landscape, filename: "odrderdetailshere.pdf") do |pdf|
  pdf.text "hi you should be able to see info about orders "
  puts "hi im in prawn"
    pdf.text @current_order.total.to_s, size:33
    #   pdf.text @order.address, size:33
      # pdf.text current_customer.current_order, size:33
      # pdf.text current_customer.current_order.address, size:40
end