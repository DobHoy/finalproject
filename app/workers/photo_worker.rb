class PhotoWorker
  include Sidekiq::Worker 
  sidekiq_options backtrace: 100, retry: false

  def perform(instagram_id, instagram_url, customer_id, order_id)
    # photo = Photo.create!(
    #   instagram_id: instagram_id,
    #   instagram_url: instagram_url,
    #   customer_id: customer_id,
    #   remote_image_url: instagram_url
    # )
  end
end





    #store pics using worker using the instagram id and array 
    #pass in the instagram id and the array and worker goes off and grabs the photo later 

    # - step through the array
    # - find the pic in the array with same id
    # - create the pic
    # - link to customer with his id, just do photo.customer_id = customer_id
    # - finsish!

    #  photosArray.each do |instagram|
    #     # puts "insta ids are  #{instagram_id} and #{instagram.id} "

    #       # if instagram_id == instagram.id
          
    #       #   @photo = Photo.new({remote_image_url: params[:image_url]})
    #       #   @photo.customer_id = params[:customer_id]
    #       #   @photo.save!
    #       # end
          

    #       # logger.info instagram[:type]

    #   end


    
    # logger.info message


