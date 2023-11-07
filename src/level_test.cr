require "crsfml"
module Geometry_Test
#..................................................................................................................................................
#                                                                 Ground
#..................................................................................................................................................
 #-----------------------------------------------------------------Main----------------------------------------------------------------------------
   Ground = SF::RectangleShape.new(SF.vector2(10000, 500)); Ground.fill_color = SF.color(0, 0, 255)
   Ground.position = SF.vector2(0, 0)
  def Geometry_Test.test(window)
     gravity = CP.v(0, -100)
     space = CP::Space.new
     space.gravity = gravity
     width = 10000 # Width of the rectangle
     height = 500 # Height of the rectangle

           # Create a body
       mass = 1.0 # Mass of the rectangle
       #moment = CP.moment_for_box(mass, width, height) # Calculate the moment of inertia
       body = CP::Body.new(mass)
       body.position = CP::Vect.new(0, 0) # Set the position of the body
      
    #   # Create a rectangle shape

       shape = CP::Shape::Poly.new(body, [
       CP::Vect.new(-width / 2, -height / 2),
       CP::Vect.new(-width / 2, height / 2),
       CP::Vect.new(width / 2, height / 2),
       CP::Vect.new(width / 2, -height / 2)
     ])
     #platform = CP::Shape::Poly.new(shape, 5)
     shape.friction = 1.0
     space.add(shape)
     window.draw(Ground)
   end


end