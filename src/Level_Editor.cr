require "../src/Textures.cr"
require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Textures.cr"
require "../src/Items.cr"
require "../src/Custom_Body.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "../src/Fonts.cr"
require "../src/level_test.cr"
require "x11"
#require "crystal/system/te"
require "chipmunk/chipmunk_crsfml"
require "file_utils"

module Level_Editor
include Map_Geometry
 class Editor_Controls
 #********************************************************************************************************************************************************
 #*                                                              Variables                                                                               *
 #********************************************************************************************************************************************************
  #-----------------------------------------------------------------Maps----------------------------------------------------------------------------------
   #................................................................Areas.................................................................................
    Area_Array = ["test", "doll factory"]
   #................................................................Test..................................................................................
    Test_Map_Area = ["test", "test_ore", "test_garden"]
   #............................................................Doll Factory..............................................................................
    Doll_Factory_Map_Array = ["factory_map_01", "factory_home"]
  #-------------------------------------------------------------Current File------------------------------------------------------------------------------
   @@current_file : String; @@current_file = "maps/current_file.yml"
  #---------------------------------------------------------------Category--------------------------------------------------------------------------------
   @@current_category : String; @@current_category = "platform"
  #---------------------------------------------------------------Platform--------------------------------------------------------------------------------
   @@current_platform : Platform; @@current_platform = Map_Geometry::Platform.level_editor_initial_platform
   @@current_platform_template  : Platform; @@current_platform_template  = Map_Geometry::Platform.level_editor_initial_platform
  #----------------------------------------------------------------Ladder---------------------------------------------------------------------------------
   @@current_ladder : Ladder; @@current_ladder = Map_Geometry::Ladder.level_editor_initial_ladder
   @@current_ladder_template  : Ladder; @@current_ladder_template  = Map_Geometry::Ladder.level_editor_initial_ladder
   Ladder_Texture_Array = [0, 40, 80, 120, 160]
  #-----------------------------------------------------------------Wall----------------------------------------------------------------------------------
   @@current_wall : Wall; @@current_wall = Map_Geometry::Wall.level_editor_initial_wall
   @@current_wall_template : Wall; @@current_wall_template = Map_Geometry::Wall.level_editor_initial_wall
  #--------------------------------------------------------------Teleporter-------------------------------------------------------------------------------
   @@current_teleporter : Teleporter; @@current_teleporter = Map_Geometry::Teleporter.level_editor_initial_teleporter
   @@current_teleporter_template : Teleporter; @@current_teleporter_template = Map_Geometry::Teleporter.level_editor_initial_teleporter
   @@teleporter_area_iterator = 0; @@teleporter_map_iterator = 0
  #-----------------------------------------------------------Crafting Stations---------------------------------------------------------------------------
   @@current_crafting_station : Crafting_Station; @@current_crafting_station = Crafting_Station.level_editor_initial_crafting_station
   @@current_crafting_station_template : Crafting_Station; @@current_crafting_station_template = Crafting_Station.level_editor_initial_crafting_station
  #--------------------------------------------------------------Misc Decor-------------------------------------------------------------------------------
   @@current_misc_decor : Misc_Decor; @@current_misc_decor = Misc_Decor.level_editor_initial_misc_decor
   @@current_misc_decor_template : Misc_Decor; @@current_misc_decor_template = Misc_Decor.level_editor_initial_misc_decor
  #-----------------------------------------------------------------Misc----------------------------------------------------------------------------------
   @@id : Int32; @@id = 1; @@template_id : Int32; @@template_id = 1
   @@zoom = 1; @@texture = 0
  #_______________________________________________________________________________________________________________________________________________________
 #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
 #?                                                               Methods                                                                                ?
 #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   def Editor_Controls.choose_map_array
    current_teleporter = @@current_teleporter
    area = Teleporter.check_area(current_teleporter)
    case area
    when "test"
     return Test_Map_Area
    when "doll factory"
     return Doll_Factory_Map_Array
    end
    return Doll_Factory_Map_Array
   end
   def Editor_Controls.check_current_teleporter
    return @@current_teleporter
   end
   def Editor_Controls.check_current_category
    return @@current_category
   end
   def Editor_Controls.check_current_object
    case @@current_category 
     when "platform"
      return @@current_platform
     when "ladder"
       return @@current_ladder
     when "wall"
       return @@current_wall
     when "teleporter"
       return @@current_teleporter
     when "crafting_station"
       return @@current_crafting_station
     when "misc_decor"
      return @@current_misc_decor
     end
     return @@current_platform_template 
    end
   def Editor_Controls.check_current_template
    case @@current_category 
     when "platform"
      return @@current_platform_template 
     when "ladder"
      return @@current_ladder_template
     when "wall"
      return @@current_wall_template
     when "teleporter"
      return @@current_teleporter_template
     when "crafting_station"
      return @@current_crafting_station_template
     when "misc_decor"
      return @@current_misc_decor_template
     end
     return @@current_platform_template 
    end
   def Editor_Controls.level_editor_mouse_clicks(window, player, zoom)
     if SF::Mouse.button_pressed?(SF::Mouse::Right)
      mouse_position = SF::Mouse.get_position(window)
      b = player.position
      x = b[0]; y = b[1]
      view1 = SF::View.new(SF.float_rect(0, 0, 1900, 700))
      view1.center = SF.vector2(x, y)
      view1.viewport = SF.float_rect(0, 0, 1, 0.85)
      view1.zoom(zoom)
      window.view = view1
      final_mouse_position = window.map_pixel_to_coords(mouse_position, window.view)
         x = final_mouse_position.x
         y = final_mouse_position.y
         player_x = 0 #player.position.x
         player_y = 0 #player.position.y
         case @@current_category
           when "platform"
            current_platform = @@current_platform
            Map_Geometry::Platform.level_editor_place_platform(current_platform, x, y, player_x, player_y)
           when "ladder"
            current_ladder = @@current_ladder
            Ladder.level_editor_place_platform(current_ladder, x, y)
           when "wall"
            current_wall = @@current_wall
            Map_Geometry::Wall.level_editor_place_wall(current_wall, x, y, player_x, player_y)
           when "teleporter"
            current_teleporter = @@current_teleporter
            Map_Geometry::Teleporter.level_editor_place_teleporter(current_teleporter, x, y)
           when "crafting_station"
            current_crafting_station = @@current_crafting_station
            Map_Geometry::Crafting_Station.level_editor_place_crafting_station(current_crafting_station, x, y)
           when "misc_decor"
            current_misc_decor = @@current_misc_decor
            Misc_Decor.level_editor_place_crafting_station(current_misc_decor, x, y)
          end
     end
   end
   def Editor_Controls.change_zoom(zoom)
     @@zoom += zoom
   end
   def Editor_Controls.check_zoom
     return @@zoom
   end
 #$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
 #$                                                     Keypresses                                                        $
 #$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
   def Editor_Controls.level_editor_keypresses(window, player)
    current_file = @@current_file
     while (event = window.poll_event)
      case event
      when SF::Event::Closed
         window.close
       when SF::Event::KeyPressed
         case event.code
       when SF::Keyboard::Escape
           window.close
  #-----------------------------------------------------Rotate Objects----------------------------------------------------
       when SF::Keyboard::I
        current_misc_decor = @@current_misc_decor
        Misc_Decor.rotate(current_misc_decor)
  #----------------------------------------------------Position Objects--------------------------------------------------- 
       when SF::Keyboard::Left
        case @@current_category
         when "platform"
          current_platform = @@current_platform
          direction = "left"
          Map_Geometry::Platform.level_editor_precision_placement(current_platform, direction)
         when "ladder"
          current_ladder = @@current_ladder
          direction = "left"
          Map_Geometry::Ladder.level_editor_precision_placement(current_ladder, direction)
         when "wall"
          current_wall = @@current_wall
          direction = "left"
          Map_Geometry::Wall.level_editor_precision_placement(current_wall, direction)
         when "teleporter"
          current_teleporter = @@current_teleporter
          direction = "left"
          Map_Geometry::Teleporter.level_editor_precision_placement(current_teleporter, direction)
         when "crafting_station"
          current_crafting_station = @@current_crafting_station
          direction = "left"
          Map_Geometry::Crafting_Station.level_editor_precision_placement(current_crafting_station, direction)
         when "misc_decor"
          current_misc_decor = @@current_misc_decor
          direction = "left"
          Misc_Decor.level_editor_precision_placement(current_misc_decor, direction)
       end
       when SF::Keyboard::Right
        case @@current_category
         when "platform"
           current_platform = @@current_platform
           direction = "right"
           Map_Geometry::Platform.level_editor_precision_placement(current_platform, direction)
         when "ladder"
           current_ladder = @@current_ladder
           direction = "right"
           Map_Geometry::Ladder.level_editor_precision_placement(current_ladder, direction)
         when "wall"
           current_wall = @@current_wall
           direction = "right"
           Map_Geometry::Wall.level_editor_precision_placement(current_wall, direction)
         when "teleporter"
           current_teleporter = @@current_teleporter
           direction = "right"
           Map_Geometry::Teleporter.level_editor_precision_placement(current_teleporter, direction)
         when "crafting_station"
           current_crafting_station = @@current_crafting_station
           direction = "right"
           Map_Geometry::Crafting_Station.level_editor_precision_placement(current_crafting_station, direction)
         when "misc_decor"
           current_misc_decor = @@current_misc_decor
           direction = "right"
           Misc_Decor.level_editor_precision_placement(current_misc_decor, direction)
       end
       when SF::Keyboard::Up
        case @@current_category
         when "platform"
           current_platform = @@current_platform
           direction = "up"
           Map_Geometry::Platform.level_editor_precision_placement(current_platform, direction)
         when "ladder"
           current_ladder = @@current_ladder
           direction = "up"
           Map_Geometry::Ladder.level_editor_precision_placement(current_ladder, direction)
         when "wall"
           current_wall = @@current_wall
           direction = "up"
           Map_Geometry::Wall.level_editor_precision_placement(current_wall, direction)
         when "teleporter"
           current_teleporter = @@current_teleporter
           direction = "up"
           Map_Geometry::Teleporter.level_editor_precision_placement(current_teleporter, direction)
         when "crafting_station"
           current_crafting_station = @@current_crafting_station
           direction = "up"
           Map_Geometry::Crafting_Station.level_editor_precision_placement(current_crafting_station, direction)
         when "misc_decor"
           current_misc_decor = @@current_misc_decor
           direction = "up"
           Misc_Decor.level_editor_precision_placement(current_misc_decor, direction)
       end
       when SF::Keyboard::Down
        case @@current_category
         when "platform"
           current_platform = @@current_platform
           direction = "down"
           Map_Geometry::Platform.level_editor_precision_placement(current_platform, direction)
         when "ladder"
           current_ladder = @@current_ladder
           direction = "down"
           Map_Geometry::Ladder.level_editor_precision_placement(current_ladder, direction)
         when "wall"
           current_wall = @@current_wall
           direction = "down"
           Map_Geometry::Wall.level_editor_precision_placement(current_wall, direction)
         when "teleporter"
           current_teleporter = @@current_teleporter
           direction = "down"
           Map_Geometry::Teleporter.level_editor_precision_placement(current_teleporter, direction)
         when "crafting_station"
           current_crafting_station = @@current_crafting_station
           direction = "down"
           Map_Geometry::Crafting_Station.level_editor_precision_placement(current_crafting_station, direction)
         when "misc_decor"
           current_misc_decor = @@current_misc_decor
           direction = "down"
           Misc_Decor.level_editor_precision_placement(current_misc_decor, direction)
       end
  #----------------------------------------------------Change Texture/Y--------------------------------------------------- 
       when SF::Keyboard::T
        case @@current_category
        when "platform"
         s = Platform_Texture_Array.size
         @@texture += 1
         if s > @@texture
           texture = @@texture
           current_platform = @@current_platform
           Platform.change_texture(current_platform, texture)
         else
           @@texture = 0
         end
        when "ladder"
          s = Ladder_Texture_Array.size
          @@texture += 1
          if s > @@texture
           texture = Ladder_Texture_Array[@@texture]
           current_ladder = @@current_ladder
           Ladder.change_texture(current_ladder, texture)
          end
        when "wall"
          s = Wall_Texture_Array.size
          @@texture += 1
          if s > @@texture
           texture = @@texture
           current_wall = @@current_wall
           Wall.change_texture(current_wall, texture)
          end
        when "teleporter"
          position_y = 0.50
          current_teleporter = @@current_teleporter
          Teleporter.change_destination_position_y(current_teleporter, position_y)
        when "misc_decor"
          @@texture += 1
           texture = @@texture
           current_misc_decor = @@current_misc_decor
           Misc_Decor.change_texture(current_misc_decor, texture)
        end
       when SF::Keyboard::Y
        case @@current_category
        when "platform"
         s = Platform_Texture_Array.size
         if @@texture > 0
           @@texture -= 1
           texture = @@texture
           current_platform = @@current_platform
           Platform.change_texture(current_platform, texture)
         else
           @@texture = 0
         end
        when "ladder"
          s = Ladder_Texture_Array.size
          if @@texture > 0
           @@texture -= 1
           texture = Ladder_Texture_Array[@@texture]
           current_ladder = @@current_ladder
           Ladder.change_texture(current_ladder, texture)
          end
        when "wall"
          s = Wall_Texture_Array.size
          if @@texture > 0
           @@texture -= 1
           texture = @@texture
           current_wall = @@current_wall
           Wall.change_texture(current_wall, texture)
          end
        when "teleporter"
          position_y = -0.50
          current_teleporter = @@current_teleporter
          Teleporter.change_destination_position_y(current_teleporter, position_y)
        when "misc_decor"
          @@texture -= 1
           texture = @@texture
           current_misc_decor = @@current_misc_decor
           Misc_Decor.change_texture(current_misc_decor, texture)
        end
  #---------------------------------------------------Change Map/Area/Z--------------------------------------------------- 
        when SF::Keyboard::G
         case @@current_category
         when "teleporter"
          @@teleporter_area_iterator += 1
          if Area_Array.size <= @@teleporter_area_iterator
          @@teleporter_area_iterator = 0         
          end
          area = Area_Array[@@teleporter_area_iterator] 
          current_teleporter = @@current_teleporter
          Teleporter.change_area(current_teleporter, area)
         when "misc_decor"
           current_misc_decor = @@current_misc_decor
           z = "front"
          Misc_Decor.change_z_axis(z, current_misc_decor)
        end
        when SF::Keyboard::H
         case @@current_category
         when "teleporter"
         @@teleporter_area_iterator -= 1
         if @@teleporter_area_iterator < 0
          @@teleporter_area_iterator = 0
         end
          area = Area_Array[@@teleporter_area_iterator] 
          current_teleporter = @@current_teleporter
          Teleporter.change_area(current_teleporter, area)
          when "misc_decor"
          current_misc_decor = @@current_misc_decor
          z = "back"
         Misc_Decor.change_z_axis(z, current_misc_decor)
        end
        when SF::Keyboard::J
          case @@current_category
          when "teleporter"
           array = Editor_Controls.choose_map_array
           current_teleporter = @@current_teleporter
           @@teleporter_map_iterator += 1
           if array.size <= @@teleporter_map_iterator
            @@teleporter_map_iterator = 0         
           end
           map = array[@@teleporter_map_iterator]         
           Teleporter.change_map(current_teleporter, map)
          when "misc_decor"
            current_misc_decor = @@current_misc_decor
            x = 0.5
            y = 0.5
            Misc_Decor.scale(current_misc_decor, x, y)
          end
        when SF::Keyboard::M
          case @@current_category
          when "teleporter"
          array = Editor_Controls.choose_map_array
          @@teleporter_map_iterator -= 1
          if @@teleporter_map_iterator < 0
           @@teleporter_map_iterator = 0
          end
           map = array[@@teleporter_map_iterator] 
           current_teleporter = @@current_teleporter
           Teleporter.change_map(current_teleporter, map)
          when "misc_decor"
            current_misc_decor = @@current_misc_decor
            x = -0.5
            y = -0.5
            Misc_Decor.scale(current_misc_decor, x, y)
          end
  #-----------------------------------------------------Position View----------------------------------------------------- 
       when SF::Keyboard::W
           player.position -= SF.vector2(0, 50)
       when SF::Keyboard::S
           player.position += SF.vector2(0, 50)
       when SF::Keyboard::A
           player.position -= SF.vector2(50, 0)
       when SF::Keyboard::D
           player.position += SF.vector2(50, 0)
  #-------------------------------------------------Save, Load, Initialize------------------------------------------------ 
   #@note rectangles and sprites must be duped individually or they will disappear
       when SF::Keyboard::X
        case @@current_category
        when "platform"
         current_platform = @@current_platform
         Map_Geometry::Platform.initialize_current_platform(current_platform)
        when "ladder"
          current_ladder = @@current_ladder
          Map_Geometry::Ladder.initialize_current_ladder(current_ladder)
        when "wall"
         current_wall = @@current_wall
         Map_Geometry::Wall.initialize_current_wall(current_wall)
        when "teleporter"
         current_teleporter = @@current_teleporter
         Map_Geometry::Teleporter.initialize_current_teleporter(current_teleporter)
        when "crafting_station"
          current_crafting_station = @@current_crafting_station
          Map_Geometry::Crafting_Station.initialize_current_crafting_stations(current_crafting_station)
        when "misc_decor"
          current_misc_decor = @@current_misc_decor
          Misc_Decor.initialize_current_misc_decor(current_misc_decor)
        end
       when SF::Keyboard::V
        Map_Geometry.level_editor_save_map(current_file)
       when SF::Keyboard::B
         Map_Geometry::Platform.load_map_platform_settings(current_file)
         Map_Geometry::Ladder.load_map_ladder_settings(current_file)
         Map_Geometry::Wall.load_map_platform_settings(current_file)
         Map_Geometry::Teleporter.load_map_teleporter_settings(current_file)
         Map_Geometry::Crafting_Station.load_map_platform_settings(current_file)
         Map_Geometry::Misc_Decor.load_map_settings(current_file)
         Map_Geometry::Misc_Decor.load_map_overlay_settings(current_file)
  #-------------------------------------------------------Zoom View------------------------------------------------------- 
       when SF::Keyboard::Add
         zoom = -1
         Editor_Controls.change_zoom(zoom)
       when SF::Keyboard::Equal
         zoom = -1
         Editor_Controls.change_zoom(zoom)
       when SF::Keyboard::Subtract
         zoom = 1
         Editor_Controls.change_zoom(zoom)
       when SF::Keyboard::Hyphen
         zoom = 1
         Editor_Controls.change_zoom(zoom)
  #----------------------------------------------------Choose Template---------------------------------------------------- 
       when SF::Keyboard::K
        case @@current_category
        when "platform"
         s = Map_Geometry::Platform.get_template_array_size
         if @@template_id < s
          @@template_id += 1
         else 
          @@template_id = 0
         end
         template_id = @@template_id
         @@current_platform_template  = Map_Geometry::Platform.level_editor_change_template(template_id)
        when "ladder"
          s = Map_Geometry::Ladder.get_template_array_size
          if @@template_id < s
           @@template_id += 1
          else 
           @@template_id = -1
          end
          template_id = @@template_id
          @@current_ladder_template  = Map_Geometry::Ladder.level_editor_change_template(template_id)
        when "wall"
          s = Map_Geometry::Wall.get_template_array_size
          if @@template_id < s
           @@template_id += 1
          else 
           @@template_id = -1
          end
          template_id = @@template_id
          @@current_wall_template  = Map_Geometry::Wall.level_editor_change_template(template_id)
        when "teleporter"
          position_x = 0.50
          current_teleporter = @@current_teleporter
          Map_Geometry::Teleporter.change_destination_position_x(current_teleporter, position_x)
        when "crafting_station"
         s = Map_Geometry::Crafting_Station.get_created_crafting_station_template_array_size
         if @@template_id < s
          @@template_id += 1
         else 
          @@template_id = -1
         end
         id = @@template_id
         @@current_crafting_station_template  = Crafting_Station.level_editor_change_crafting_station_template(id)
        when "misc_decor"
          s = Map_Geometry::Misc_Decor.get_misc_decor_station_template_array_size
          if @@template_id < s
           @@template_id += 1
          else 
           @@template_id = -1
          end
          id = @@template_id
          @@current_misc_decor_template  = Misc_Decor.level_editor_change_misc_decor_template(id)
         end
       when SF::Keyboard::L
        case @@current_category
        when "platform"
         if @@template_id > 0
          @@template_id -= 1
         else 
          @@template_id = -1
         end
         template_id = @@template_id
         @@current_platform_template  = Map_Geometry::Platform.level_editor_change_template(template_id)
        when "ladder"
          if @@template_id > 0
           @@template_id -= 1
          else 
           @@template_id = -1
          end
          template_id = @@template_id
          @@current_ladder_template  = Map_Geometry::Ladder.level_editor_change_template(template_id)
        when "wall"
          if @@template_id > 0
           @@template_id -= 1
          else 
           @@template_id = -1
          end
          template_id = @@template_id
          @@current_wall_template  = Map_Geometry::Wall.level_editor_change_template(template_id)
        when "teleporter"
          position_x = -0.50
          current_teleporter = @@current_teleporter
          Map_Geometry::Teleporter.change_destination_position_x(current_teleporter, position_x)
        when "crafting_station"
          if @@template_id > 0
            @@template_id -= 1
           else 
            @@template_id = -1
           end
           id = @@template_id
           @@current_crafting_station_template  = Map_Geometry::Crafting_Station.level_editor_change_crafting_station_template(id)
        when "misc_decor"
          if @@template_id > 0
            @@template_id -= 1
           else 
            @@template_id = -1
           end
           id = @@template_id
           @@current_misc_decor_template  = Map_Geometry::Misc_Decor.level_editor_change_misc_decor_template(id)
        end
  #----------------------------------------------------Choose Objects----------------------------------------------------- 
       when SF::Keyboard::O
        case @@current_category
        when "platform"
         s = Map_Geometry::Platform.get_created_platform_array_size
         if s > 0
         if @@id < s
           @@id += 1
         else 
           @@id = 0
          end
          id = @@id
          @@current_platform = Map_Geometry::Platform.level_editor_change_platfrom(id)
         end
        when "ladder"
          s = Map_Geometry::Ladder.get_created_platform_array_size
          if s > 0
          if @@id < s
           @@id += 1
          else 
           @@id = 0
           end
           id = @@id
           @@current_ladder = Map_Geometry::Ladder.level_editor_change_ladder(id)
          end
        when "wall"
          s = Map_Geometry::Wall.get_created_wall_array_size
          if s > 0
          if @@id < s
          @@id += 1
          else 
          @@id = 0
         end
          id = @@id
          @@current_wall = Map_Geometry::Wall.level_editor_change_wall(id)
         end
        when "teleporter"
          s = Map_Geometry::Teleporter.get_created_teleporter_array_size
          if s > 0
          if @@id < s
          @@id += 1
          else 
          @@id = 0
         end
          id = @@id
          @@current_teleporter = Map_Geometry::Teleporter.level_editor_change_teleporter(id)
         end
        when "crafting_station"
          s = Map_Geometry::Crafting_Station.get_created_crafting_station_array_size
          if s > 0
          if @@id < s
          @@id += 1
          else 
          @@id = 0
         end
          id = @@id
          @@current_crafting_station = Map_Geometry::Crafting_Station.level_editor_change_crafting_station(id)
        end
        when "misc_decor"
          s = Map_Geometry::Misc_Decor.get_misc_decor_station_array_size
          if s > 0
          if @@id < s
          @@id += 1
          else 
          @@id = 0
         end
          id = @@id
          @@current_misc_decor = Misc_Decor.level_editor_change_misc_decor(id)
         end
      end
       when SF::Keyboard::P
        case @@current_category
        when "platform"
           if @@id < 0
           @@id -= 1
          else 
           @@id = 0
          end
           id = @@id
           @@current_platform = Map_Geometry::Platform.level_editor_change_platfrom(id)
        when "ladder"
          if @@id < 0
          @@id -= 1
         else 
          @@id = 0
         end
          id = @@id
          @@current_ladder = Map_Geometry::Ladder.level_editor_change_ladder(id)
        when "wall"
          if @@id < 0
          @@id -= 1
         else 
          @@id = 0
         end
          id = @@id
          @@current_wall = Map_Geometry::Wall.level_editor_change_wall(id)
        when "teleporter"
          if @@id < 0
          @@id -= 1
         else 
          @@id = 0
         end
          id = @@id
          @@current_teleporter = Map_Geometry::Teleporter.level_editor_change_teleporter(id)
        when "crafting_station"
          if @@id < 0
            @@id -= 1
          else 
            @@id = 0
           end
            id = @@id
            @@current_crafting_station = Map_Geometry::Crafting_Station.level_editor_change_crafting_station(id)
        when "misc_decor"
          if @@id < 0
            @@id -= 1
          else 
            @@id = 0
           end
            id = @@id
            @@current_misc_decor = Map_Geometry::Misc_Decor.level_editor_change_misc_decor(id)
        end
  #---------------------------------------------------Create New Objects--------------------------------------------------  
       when SF::Keyboard::N
        case @@current_category
        when "platform"
         platform = @@current_platform_template 
         current_platform = Map_Geometry::Platform.level_editor_create_platform(platform)
         @@current_platform = current_platform
        when "ladder"
          ladder = @@current_ladder_template 
          current_ladder = Map_Geometry::Ladder.level_editor_create_ladder(ladder)
          @@current_ladder = current_ladder
        when "wall"
          wall = @@current_wall_template 
          current_wall = Map_Geometry::Wall.level_editor_create_platform(wall)
          @@current_wall = current_wall
        when "teleporter"
          teleporter = @@current_teleporter_template
          current_teleporter = Map_Geometry::Teleporter.level_editor_create_platform(teleporter)
          @@current_teleporter = teleporter
        when "crafting_station"
          crafting_station = @@current_crafting_station_template
          current_crafting_station = Map_Geometry::Crafting_Station.level_editor_create_crafting_station(crafting_station)
          @@current_crafting_station = current_crafting_station
        when "misc_decor"
          misc_decor = @@current_misc_decor_template
          current_misc_decor = Misc_Decor.level_editor_create_crafting_station(misc_decor)
          @@current_misc_decor = current_misc_decor
        end
  #----------------------------------------------------Initialize Map----------------------------------------------------- 
       when SF::Keyboard::Backspace
         Platform.initialize_platform_positions
         Teleporter.initialize_teleporters
         Ladder.initialize_ladders
  #---------------------------------------------------Change Categories--------------------------------------------------- 
       when SF::Keyboard::Num1
         @@current_category = "platform"
       when SF::Keyboard::Num2
         @@current_category = "ladder"
       when SF::Keyboard::Num3
         @@current_category = "wall"
       when SF::Keyboard::Num4
         @@current_category = "teleporter"
       when SF::Keyboard::Num5
         @@current_category = "crafting_station"
       when SF::Keyboard::Num6
         @@current_category = "misc_decor"
       end; end; end; end
 end
 class Editor_UI < Editor_Controls
  def Editor_UI.display_current_object_text(window)
    @@current_category = Editor_Controls.check_current_category
    current_template = Level_Editor::Editor_Controls.check_current_template
    current_object = Level_Editor::Editor_Controls.check_current_object
    current_object_text = Level_Editor_Object_Text.dup
    Level_Editor_Object_Text.string = current_template.name
    if @@current_category == "teleporter"
     current_teleporter = Editor_Controls.check_current_teleporter
     Teleporter.check_area(current_teleporter)
     current_destination_area = Level_Editor_Object_Text.dup
     current_destination_map = Level_Editor_Object_Text.dup
     current_destination_area.string = Teleporter.check_area(current_teleporter)
     current_destination_map.string = Teleporter.check_map(current_teleporter)
     current_destination_area.position = SF.vector2(265, 965)
     current_destination_map.position = SF.vector2(265, 1025)
     Level_Editor_Object_Text.string = @@current_teleporter.destination_postion[0].to_s + 
     ", " + @@current_teleporter.destination_postion[1].to_s
     window.draw(current_destination_area); window.draw(current_destination_map)
    end
    if @@current_category == "misc_decor"
      z_text = Level_Editor_Object_Text.dup
      z_text.string = Misc_Decor.get_z_axis
      z_text.position = SF.vector2(265, 965)
      window.draw(z_text)
    end
    current_object_text.string = current_object.name
    current_object_text.position = SF.vector2(25, 1030)
    window.draw(Level_Editor_Object_Text); window.draw(current_object_text)
  end
 end
end