# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


# click logic to implement
# when a picture is clicked 
#   class has been slected-> true 
#   on up click -> data-id-quanity ++
#   on down click -> data-id-quanity -- unless = 0 (set still zero)


$(document).ready ->

  # $('#orderButton').click (e) ->
  #   # e.preventDefault()
  #   # implement clcik logic
  #   $orderSubmitButton = $(this)
  $(".glyphicon-search").click (e) ->
    url = $(this).attr("data-img-url")
    $("#myModal img").attr "src",  url

  $(".glyphicon-plus").click (e) ->
    $clickedLink = $(this) #store object
    instagramPhotoId = ($clickedLink.parent().parent().parent().parent()).attr("data-instagram-tag-id")
    console.log instagramPhotoId
    $quantFormField = $( "input[data-instagram-form-id='#{instagramPhotoId}']" )
    currentQuant = $quantFormField.val()
    currentQuant++
    $quantFormField.val(currentQuant) 
    console.log currentQuant

  $(".glyphicon-minus").click (e) ->
    $clickedLink = $(this) #store object
    instagramPhotoId = ($clickedLink.parent().parent().parent().parent()).attr("data-instagram-tag-id")
    console.log instagramPhotoId
    $quantFormField = $( "input[data-instagram-form-id='#{instagramPhotoId}']" )
    currentQuant = $quantFormField.val()
    currentQuant--  if currentQuant > 0
    $quantFormField.val(currentQuant) 
    console.log currentQuant



