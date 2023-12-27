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
include Harvestables
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
  #"maps/doll_factory_home.yml"
   @@current_file : String; @@current_file = "maps/test.yml"
   def Editor_Controls.change_current_file(file)
    @@current_file = file
   end
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
  #-----------------------------------------------------------------Ore-----------------------------------------------------------------------------------
   @@current_ore : Ore; @@current_ore = Ore.level_editor_initial_ore
   @@current_ore_template : Ore; @@current_ore_template = Ore.level_editor_initial_ore
  #-----------------------------------------------------------------Herbs----------------------------------------------------------------------------------
   @@current_herb : Herbs; @@current_herb = Herbs.level_editor_initial_herb
   @@current_herb_template : Herbs; @@current_herb_template = Herbs.level_editor_initial_herb
  #---------------------------------------------------------------Enemies---------------------------------------------------------------------------------
   @@current_enemy : Regular_Enemies::Humanoids; @@current_enemy = Regular_Enemies.initial_enemy
   @@current_enemy_template : Regular_Enemies::Humanoids; @@current_enemy_template = Regular_Enemies.initial_enemy
  #-----------------------------------------------------------------NPCs----------------------------------------------------------------------------------
   @@current_hairdresser : Shopkeepers::Hairdresser; @@current_hairdresser = Shopkeepers::Hairdresser.get_initial_value
  #-----------------------------------------------------------------Misc----------------------------------------------------------------------------------
   @@id : Int32; @@id = 1; @@template_id : Int32; @@template_id = 1
   @@zoom = 1; @@texture = 0; @@parallax_iterator = 0
  #_______________________________________________________________________________________________________________________________________________________
 #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
 #?                                                               Methods                                                                                ?
 #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
  def Editor_Controls.load
    current_file = @@current_file 
    Map_Geometry::Wall.load_map_platform_settings(current_file)
    Map_Geometry::Ladder.load_map_ladder_settings(current_file)
    Map_Geometry::Platform.load_map_platform_settings(current_file)
    Map_Geometry::Teleporter.load_map_teleporter_settings(current_file)
    Map_Geometry::Crafting_Station.load_map_platform_settings(current_file)
    Map_Geometry::Misc_Decor.load_map_settings(current_file)
    Map_Geometry::Misc_Decor.load_map_overlay_settings(current_file)
    Map_Geometry::Parallax.load_map_settings(current_file)
    Ore.load_map_ore_settings(current_file)
    Herbs.load_map_ore_settings(current_file)
    Regular_Enemies.load_map_ladder_settings(current_file)
  end
  #save fields
  #------------------------------------------------------------------Ladders------------------------------------------------------------------------------
   @[YAML::Field(key: "ladder_lengths")]
   @[YAML::Field(key: "ladder_names")]
   @[YAML::Field(key: "ladder_textures")]
   @[YAML::Field(key: "ladder_x_positions")]
   @[YAML::Field(key: "ladder_y_positions")]
  #-----------------------------------------------------------------Platforms-----------------------------------------------------------------------------
   @[YAML::Field(key: "platform_ids")]
   @[YAML::Field(key: "platform_names")]
   @[YAML::Field(key: "platform_textures")]
   @[YAML::Field(key: "platform_x_positions")]
   @[YAML::Field(key: "platform_y_positions")]
  #-------------------------------------------------------------------Walls-------------------------------------------------------------------------------
   @[YAML::Field(key: "wall_ids")]
   @[YAML::Field(key: "wall_names")]
   @[YAML::Field(key: "wall_textures")]
   @[YAML::Field(key: "wall_x_positions")]
   @[YAML::Field(key: "wall_y_positions")]
  #----------------------------------------------------------------Teleporters----------------------------------------------------------------------------
   @[YAML::Field(key: "teleporter_names")]
   @[YAML::Field(key: "teleporter_ids")]
   @[YAML::Field(key: "teleporter_x_positions")]
   @[YAML::Field(key: "teleporter_y_positions")]
   @[YAML::Field(key: "teleporter_destination_map")]
   @[YAML::Field(key: "teleporter_destination_area")]
   @[YAML::Field(key: "teleporter_x_destination_positions")]
   @[YAML::Field(key: "teleporter_y_destination_positions")]
  #--------------------------------------------------------------Crafting Tables--------------------------------------------------------------------------
   @[YAML::Field(key: "crafting_table_ids")]
   @[YAML::Field(key: "crafting_table_names")]
   @[YAML::Field(key: "crafting_table_x_positions")]
   @[YAML::Field(key: "crafting_table_y_positions")]
  #----------------------------------------------------------------Misc Decor-----------------------------------------------------------------------------
   @[YAML::Field(key: "misc_decor_ids")]
   @[YAML::Field(key: "misc_decor_names")]
   @[YAML::Field(key: "misc_decor_x_positions")]
   @[YAML::Field(key: "misc_decor_y_positions")]
   @[YAML::Field(key: "misc_decor_texture_rect")]
   @[YAML::Field(key: "misc_decor_width")]
   @[YAML::Field(key: "misc_decor_scale_x")]
   @[YAML::Field(key: "misc_decor_scale_y")]
   @[YAML::Field(key: "misc_decor_rotation")]
  #------------------------------------------------------------Misc Decor Overlay-------------------------------------------------------------------------
   @[YAML::Field(key: "misc_decor_overlay_ids")]
   @[YAML::Field(key: "misc_decor_overlay_names")]
   @[YAML::Field(key: "misc_decor_overlay_x_positions")]
   @[YAML::Field(key: "misc_decor_overlay_y_positions")]
   @[YAML::Field(key: "misc_decor_overlay_texture_rect")]
   @[YAML::Field(key: "misc_decor_overlay_width")]
   @[YAML::Field(key: "misc_decor_overlay_scale_x")]
   @[YAML::Field(key: "misc_decor_overlay_scale_y")]
   @[YAML::Field(key: "misc_decor_overlay_rotation")]
  #-------------------------------------------------------------Current Parallax--------------------------------------------------------------------------
   @[YAML::Field(key: "current_parallax")]
  #-------------------------------------------------------------------Ores--------------------------------------------------------------------------------
   @[YAML::Field(key: "ore_ids")]
   @[YAML::Field(key: "ore_names")]
   @[YAML::Field(key: "ore_x_positions")]
   @[YAML::Field(key: "ore_y_positions")]
   @[YAML::Field(key: "ore_clocks")]
   @[YAML::Field(key: "ore_is_broken")]
  #-------------------------------------------------------------------Herbs-------------------------------------------------------------------------------
   @[YAML::Field(key: "herb_ids")]
   @[YAML::Field(key: "herb_names")]
   @[YAML::Field(key: "herb_x_positions")]
   @[YAML::Field(key: "herb_y_positions")]
   @[YAML::Field(key: "herb_clocks")]
   @[YAML::Field(key: "herb_is_broken")]
  #------------------------------------------------------------------Enemies------------------------------------------------------------------------------
   @[YAML::Field(key: "enemy_names")]
   @[YAML::Field(key: "enemy_x_positions")]
   @[YAML::Field(key: "enemy_y_positions")]
   @[YAML::Field(key: "enemy_clocks")]
   @[YAML::Field(key: "enemy_hp")]
   @[YAML::Field(key: "enemy_is_dead")]
 #save function
   def Editor_Controls.level_editor_save_map(current_file)
     current_ladder_array = Ladder.get_created_platform_array
     current_platform_array = Platform.get_created_platform_array
     current_wall_array = Wall.get_created_wall_array
     current_teleporter_array = Teleporter.get_created_teleporter_array
     current_crafting_table_array = Crafting_Station.get_created_crafting_station_array
     current_misc_object_array = Misc_Decor.get_misc_decor_station_array
     current_misc_object_overlay_array = Misc_Decor.get_misc_decor_overlay_array
     parallax = Parallax.get_current_parallax
     current_ore_array = Harvestables::Ore.get_created_ore_array
     current_herb_array = Harvestables::Herbs.get_created_array
     current_enemy_array = Regular_Enemies::Humanoids.get_current_array
     scale_x_01 = current_misc_object_array.map{ |i| i.sprite.scale[0]}
     scale_y_01 = current_misc_object_array.map{ |i| i.sprite.scale[1]}
     scale_x_02 = current_misc_object_overlay_array.map{ |i| i.sprite.scale[0]}
     scale_y_02 = current_misc_object_overlay_array.map{ |i| i.sprite.scale[1]}
    File.open(current_file, "w") { |f| YAML.dump({
   #-----------------------------------------------------------------Platforms--------------------------------------------------------------------------------
    "platform_names": current_platform_array.map{ |i| i.name},
    "platform_ids": current_platform_array.map{ |i| i.id}, "platform_textures": current_platform_array.map{ |i| i.texture},
    "platform_x_positions": current_platform_array.map{ |i| i.bounding_rectangle.position.x},
    "platform_y_positions": current_platform_array.map{ |i| i.bounding_rectangle.position.y},
   #------------------------------------------------------------------Ladders---------------------------------------------------------------------------------
    "ladder_names": current_ladder_array.map{ |i| i.name},
    "ladder_lengths": current_ladder_array.map{ |i| i.length}, "ladder_textures": current_ladder_array.map{ |i| i.texture},
    "ladder_x_positions": current_ladder_array.map{ |i| i.sprite.position.x},
    "ladder_y_positions": current_ladder_array.map{ |i| i.sprite.position.y},
   #-------------------------------------------------------------------Walls----------------------------------------------------------------------------------
    "wall_names": current_wall_array.map{ |i| i.name},
    "wall_ids": current_wall_array.map{ |i| i.id}, "wall_textures": current_wall_array.map{ |i| i.texture},
    "wall_x_positions": current_wall_array.map{ |i| i.bounding_rectangle.position.x},
    "wall_y_positions": current_wall_array.map{ |i| i.bounding_rectangle.position.y},
   #----------------------------------------------------------------Teleporters-------------------------------------------------------------------------------
    "teleporter_names": current_teleporter_array.map{ |i| i.name},
    "teleporter_ids": current_teleporter_array.map{ |i| i.length},
    "teleporter_x_positions": current_teleporter_array.map{ |i| i.sprite.position.x},
    "teleporter_y_positions": current_teleporter_array.map{ |i| i.sprite.position.y},
    "teleporter_destination_map": current_teleporter_array.map{ |i| i.destination_map},
    "teleporter_destination_area": current_teleporter_array.map{ |i| i.destination_area},
    "teleporter_x_destination_positions": current_teleporter_array.map{ |i| i.destination_postion[0]},
    "teleporter_y_destination_positions": current_teleporter_array.map{ |i| i.destination_postion[1]},
   #--------------------------------------------------------------Crafting Tables-----------------------------------------------------------------------------
    "crafting_table_ids": current_crafting_table_array.map{ |i| i.id},
    "crafting_table_names": current_crafting_table_array.map{ |i| i.name},
    "crafting_table_x_positions": current_crafting_table_array.map{ |i| i.rectangle.position.x},
    "crafting_table_y_positions": current_crafting_table_array.map{ |i| i.rectangle.position.y},
   #----------------------------------------------------------------Misc Decor--------------------------------------------------------------------------------
    "misc_decor_ids": current_misc_object_array.map{ |i| i.id},
    "misc_decor_names": current_misc_object_array.map{ |i| i.name},
    "misc_decor_x_positions": current_misc_object_array.map{ |i| i.sprite.position.x},
    "misc_decor_y_positions": current_misc_object_array.map{ |i| i.sprite.position.y},
    "misc_decor_texture_rect": current_misc_object_array.map{ |i| i.texture_rect},
    "misc_decor_width": current_misc_object_array.map{ |i| i.width},
    "misc_decor_scale_x": scale_x_01, "misc_decor_scale_y": scale_y_01,
    "misc_decor_rotation": current_misc_object_array.map{ |i| i.sprite.rotation},
   #------------------------------------------------------------Misc Decor Overlay----------------------------------------------------------------------------
    "misc_decor_overlay_ids": current_misc_object_overlay_array.map{ |i| i.id},
    "misc_decor_overlay_names": current_misc_object_overlay_array.map{ |i| i.name},
    "misc_decor_overlay_x_positions": current_misc_object_overlay_array.map{ |i| i.sprite.position.x},
    "misc_decor_overlay_y_positions": current_misc_object_overlay_array.map{ |i| i.sprite.position.y},
    "misc_decor_overlay_texture_rect": current_misc_object_overlay_array.map{ |i| i.texture_rect},
    "misc_decor_overlay_width": current_misc_object_overlay_array.map{ |i| i.width},
    "misc_decor_overlay_scale_x": scale_x_02, "misc_decor_overlay_scale_y": scale_y_02,
    "misc_decor_overlay_rotation": current_misc_object_overlay_array.map{ |i| i.sprite.rotation},
   #-------------------------------------------------------------Current Parallax-----------------------------------------------------------------------------
    "current_parallax": parallax.id,
   #-------------------------------------------------------------------Ores-----------------------------------------------------------------------------------
    "ore_ids": current_ore_array.map{ |i| i.id}, "ore_names": current_ore_array.map{ |i| i.name}, 
    "ore_x_positions": current_ore_array.map{ |i| i.sprite.position.x}, "ore_y_positions": current_ore_array.map{ |i| i.sprite.position.y},
    "ore_clocks": current_ore_array.map{ |i| i.clock.elapsed_time.as_seconds}, "ore_is_broken": current_ore_array.map{ |i| i.is_broke},
   #-------------------------------------------------------------------Herbs----------------------------------------------------------------------------------
    "herb_ids": current_herb_array.map{ |i| i.id}, "herb_names": current_herb_array.map{ |i| i.name}, 
    "herb_x_positions": current_herb_array.map{ |i| i.sprite.position.x}, "herb_y_positions": current_herb_array.map{ |i| i.sprite.position.y},
    "herb_clocks": current_herb_array.map{ |i| i.clock.elapsed_time.as_seconds}, "herb_is_broken": current_herb_array.map{ |i| i.is_broke},
   #------------------------------------------------------------------Enemies------------------------------------------------------------------------------
    "enemy_names": current_enemy_array.map{ |i| i.name}, "enemy_x_positions": current_enemy_array.map{ |i| i.sprite.position.x},
    "enemy_y_positions": current_enemy_array.map{ |i| i.sprite.position.y}, "enemy_clocks": current_enemy_array.map{ |i| i.clock.elapsed_time.as_seconds},
    "enemy_hp": current_enemy_array.map{ |i| i.hp}, "enemy_is_dead": current_enemy_array.map{ |i| i.is_dead}
    }, f) }
   end
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
     when "ore"
      return @@current_ore
     when "herb"
      return @@current_herb
     when "enemy"
      return @@current_enemy 
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
     when "ore"
      return @@current_ore_template 
     when "herb"
      return @@current_herb_template
     when "enemy"
      return @@current_enemy_template 
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
           when "ore"
            current_ore = @@current_ore
            Ore.level_editor_place(current_ore, x, y)
           when "herb"
            current_herb = @@current_herb
            Herbs.level_editor_place(current_herb, x, y)
           when "enemy"
            current_enemy = @@current_enemy
            Regular_Enemies.level_editor_place(current_enemy, x, y)
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
  #-----------------------------------------------------Change Parallax---------------------------------------------------
       when SF::Keyboard::LBracket
        @@parallax_iterator -= 1 
        parallax = @@parallax_iterator
        Parallax.change(parallax)
       when SF::Keyboard::RBracket
        @@parallax_iterator += 1 
        parallax = @@parallax_iterator
        Parallax.change(parallax)
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
         when "ore"
          current_ore = @@current_ore
          direction = "left"
          Ore.level_editor_precision_placement(current_ore, direction)
         when "herb"
          current_herb = @@current_herb
          direction = "left"
          Herbs.level_editor_precision_placement(current_herb, direction)
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
         when "ore"
           current_ore = @@current_ore
           direction = "right"
           Ore.level_editor_precision_placement(current_ore, direction)
         when "herb"
           current_herb = @@current_herb
           direction = "right"
           Herbs.level_editor_precision_placement(current_herb, direction)
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
         when "ore"
           current_ore = @@current_ore
           direction = "up"
           Ore.level_editor_precision_placement(current_ore, direction)
         when "herb"
           current_herb = @@current_herb
           direction = "up"
           Herbs.level_editor_precision_placement(current_herb, direction)
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
         when "ore"
           current_ore = @@current_ore
           direction = "down"
           Ore.level_editor_precision_placement(current_ore, direction)
         when "herb"
           current_herb = @@current_herb
           direction = "down"
           Herbs.level_editor_precision_placement(current_herb, direction)
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
   #@note all load methods must start by clearing their respective arrays. In hindsight this seems pretty fucking obvious
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
        when "ore"
          current_ore = @@current_ore 
          Ore.initialize_current(current_ore)
        when "herb"
          current_herb = @@current_herb 
          Herbs.initialize_current(current_herb)
        when "enemy"
          current_enemy = @@current_enemy 
          Regular_Enemies.initialize_current(current_enemy)
        end
       when SF::Keyboard::V
        Editor_Controls.level_editor_save_map(current_file)
       when SF::Keyboard::B
        Editor_Controls.load
        #  Map_Geometry::Platform.load_map_platform_settings(current_file)
        #  Map_Geometry::Ladder.load_map_ladder_settings(current_file)
        #  Map_Geometry::Wall.load_map_platform_settings(current_file)
        #  Map_Geometry::Teleporter.load_map_teleporter_settings(current_file)
        #  Map_Geometry::Crafting_Station.load_map_platform_settings(current_file)
        #  Map_Geometry::Misc_Decor.load_map_settings(current_file)
        #  Map_Geometry::Misc_Decor.load_map_overlay_settings(current_file)
        #  Map_Geometry::Parallax.load_map_settings(current_file)
        #  Ore.load_map_ore_settings(current_file)
        #  Herbs.load_map_ore_settings(current_file)
        #  Regular_Enemies.load_map_ladder_settings(current_file)
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
        when "ore"
          s = Map_Geometry::Ore.get_template_array_size
          if @@template_id < s
           @@template_id += 1
          else 
           @@template_id = -1
          end
          template_id = @@template_id
          @@current_ore_template = Ore.level_editor_change_template(template_id)
        when "herb"
          s = Herbs.get_template_array_size
          if @@template_id < s
           @@template_id += 1
          else 
           @@template_id = -1
          end
          template_id = @@template_id
          @@current_herb_template = Herbs.level_editor_change_template(template_id)
        when "enemy"
          s = Regular_Enemies.get_template_array_size
          if @@template_id < s
           @@template_id += 1
          else 
           @@template_id = -1
          end
          template_id = @@template_id
          @@current_enemy_template = Regular_Enemies.level_editor_change_template(template_id)
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
        when "ore"
          if @@template_id > 0
            @@template_id -= 1
           else 
            @@template_id = -1
           end
           template_id = @@template_id
           @@current_ore_template = Map_Geometry::Ore.level_editor_change_template(template_id)
        when "herb"
          if @@template_id > 0
            @@template_id -= 1
           else 
            @@template_id = -1
           end
           template_id = @@template_id
           @@current_herb_template = Herbs.level_editor_change_template(template_id)
        when "enemy"
          if @@template_id > 0
            @@template_id -= 1
           else 
            @@template_id = -1
           end
           template_id = @@template_id
           @@current_enemy_template = Regular_Enemies.level_editor_change_template(template_id)
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
        when "ore"
          s = Map_Geometry::Ore.get_created_platform_array_size
          if s > 0
          if @@id < s
          @@id += 1
          else 
          @@id = 0
         end
          id = @@id
          @@current_ore = Ore.level_editor_change_ore(id)
         end
        when "herb"
          s = Herbs.get_created_array_size
          if s > 0
          if @@id < s
          @@id += 1
          else 
          @@id = 0
         end
          id = @@id
          @@current_herb = Herbs.level_editor_change_herbs(id)
         end
        when "enemy"
          s = Regular_Enemies.get_created_array_size
          if s > 0
          if @@id < s
          @@id += 1
          else 
          @@id = 0
         end
          id = @@id
          @@current_enemy = Regular_Enemies.level_editor_change_enemy(id)
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
        when "ore"
          if @@id < 0
            @@id -= 1
          else 
            @@id = 0
           end
            id = @@id
            @@current_ore = Map_Geometry::Ore.level_editor_change_ore(id)
        when "herb"
          if @@id < 0
            @@id -= 1
          else 
            @@id = 0
           end
            id = @@id
            @@current_herb = Herbs.level_editor_change_herbs(id)
        when "enemy"
          if @@id < 0
            @@id -= 1
          else 
            @@id = 0
           end
            id = @@id
            @@current_enemy = Regular_Enemies.level_editor_change_enemy(id)
        end
  #--------------------------------------------------Create New Objects---------------------------------------------------  
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
        when "ore"
          ore = @@current_ore_template
          current_ore = Ore.level_editor_create_ore(ore)
          @@current_ore = current_ore
        when "herb"
          herb = @@current_herb_template
          current_herb = Herbs.level_editor_create_ore(herb)
          @@current_herb = current_herb
        when "enemy"
          enemy = @@current_enemy_template
          current_enemy = Regular_Enemies.level_editor_create(enemy)
          @@current_enemy = current_enemy
        end
  #----------------------------------------------------Initialize Map----------------------------------------------------- 
       when SF::Keyboard::Backspace
         Platform.initialize_platform_positions
         Teleporter.initialize_teleporters
         Ladder.initialize_ladders
         Ore.initialize_all
         Herbs.initialize
         Regular_Enemies.initialize_all
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
       when SF::Keyboard::Num7
         @@current_category = "ore"
       when SF::Keyboard::Num8
         @@current_category = "herb"
       when SF::Keyboard::Num9
         @@current_category = "enemy"
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