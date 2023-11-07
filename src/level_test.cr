require "crsfml"
module Geometry_Test
#..................................................................................................................................................
#                                                                 Ground
#..................................................................................................................................................
 #-----------------------------------------------------------------Main----------------------------------------------------------------------------

  def Geometry_Test.test(window, debug_draw)
    window.clear(SF::Color::Transparent);
    space = CP::Space.new
    space.iterations = 30
    space.gravity = CP.v(0, -500)
    space.sleep_time_threshold = 0.5
    space.collision_slop = 0.5

     width = 10000 # Width of the rectangle
     height = 500 # Height of the rectangle

           # Create a body
       mass = 1.0 # Mass of the rectangle
       #moment = CP.moment_for_box(mass, width, height) # Calculate the moment of inertia
       body = CP::Body.new(mass)
       body.position = CP::Vect.new(0, 800) # Set the position of the body
      
    #   # Create a rectangle shape

       shape = CP::Shape::Poly.new(body, [
       CP::Vect.new(-width / 2, -height / 2),
       CP::Vect.new(-width / 2, height / 2),
       CP::Vect.new(width / 2, height / 2),
       CP::Vect.new(width / 2, -height / 2)
     ])
     pc_body = CP::Body.new(96, 256)
     pc_skin = CP::Box.new(pc_body, 96, 256)
     pc_body.position = CP.v(660, 715)
     shape.friction = 1.0
     space.add(shape, pc_body, pc_skin)
     window.draw(Ground)
   end


end