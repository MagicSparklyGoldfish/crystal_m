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
require "../src/Player_Character.cr"
require "x11"
#require "crystal/system/te"
require "chipmunk/chipmunk_crsfml"
require "file_utils"

module Level_Editor
include Map_Geometry
 class Editor_Controls
  @@current_object_type : String; @@current_object_type = "platform"
  @@current_object : Platform; @@current_object = Map_Geometry::Platform.level_editor_initial_platform
  @@current_template : Platform; @@current_template = Map_Geometry::Platform.level_editor_initial_platform
  @@id : Int32; @@id = 1; @@template_id : Int32; @@template_id = 1
  @@zoom = 1
  def Editor_Controls.check_current_object
    return @@current_object
  end
  def Editor_Controls.check_current_template
    return @@current_template
  end
  def Editor_Controls.level_editor_mouse_clicks(window, player)
    if SF::Mouse.button_pressed?(SF::Mouse::Right)
        mouse_position = SF::Mouse.position
        x = mouse_position.x
        y = mouse_position.y
        player_x = player.position.x
        player_y = player.position.y
        if @@current_object_type == "platform"
            current_platform = @@current_object
            Map_Geometry::Platform.level_editor_place_platform(current_platform, x, y, player_x, player_y)
        end
    end
  end
  def Editor_Controls.change_zoom(zoom)
    @@zoom += zoom
  end
  def Editor_Controls.check_zoom
    return @@zoom
  end
  def Editor_Controls.level_editor_keypresses(window, player)
    while (event = window.poll_event)
     case event
     when SF::Event::Closed
        window.close
      when SF::Event::KeyPressed
        case event.code
      when SF::Keyboard::Escape
          window.close
 #----------------------------------------------------Position Objects--------------------------------------------------- 
      when SF::Keyboard::Left
        if @@current_object_type == "platform"
          current_platform = @@current_object
          direction = "left"
          Map_Geometry::Platform.level_editor_precision_placement(current_platform, direction)
      end
      when SF::Keyboard::Right
        if @@current_object_type == "platform"
          current_platform = @@current_object
          direction = "right"
          Map_Geometry::Platform.level_editor_precision_placement(current_platform, direction)
      end
      when SF::Keyboard::Up
        if @@current_object_type == "platform"
          current_platform = @@current_object
          direction = "up"
          Map_Geometry::Platform.level_editor_precision_placement(current_platform, direction)
      end
      when SF::Keyboard::Down
        if @@current_object_type == "platform"
          current_platform = @@current_object
          direction = "down"
          Map_Geometry::Platform.level_editor_precision_placement(current_platform, direction)
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
      when SF::Keyboard::X
        current_platform = @@current_object
        Map_Geometry::Platform.initialize_current_platform(current_platform)
      when SF::Keyboard::V
        Map_Geometry::Platform.level_editor_save_level
      when SF::Keyboard::B
        Map_Geometry::Platform.load_map_platform_settings
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
      when SF::Keyboard::K
        s = Map_Geometry::Platform.get_template_array_size
        if @@template_id < s
         @@template_id += 1
        else 
         @@template_id = 0
        end
        template_id = @@template_id
        @@current_template = Map_Geometry::Platform.level_editor_change_template(template_id)
      when SF::Keyboard::L
        if @@template_id < 0
         @@template_id -= 1
        else 
         @@template_id = 0
        end
        template_id = @@template_id
        @@current_template = Map_Geometry::Platform.level_editor_change_template(template_id)
      when SF::Keyboard::O
        s = Map_Geometry::Platform.get_created_platform_array_size
        if s > 0
        if @@id < s
        @@id += 1
        else 
        @@id = 0
       end
        id = @@id
        @@current_object = Map_Geometry::Platform.level_editor_change_platfrom(id)
       end
      when SF::Keyboard::P
        if @@id < 0
        @@id -= 1
      else 
        @@id = 0
       end
        id = @@id
        @@current_object = Map_Geometry::Platform.level_editor_change_platfrom(id)
      when SF::Keyboard::N
        platform = @@current_template
        current_platform = Map_Geometry::Platform.level_editor_create_platform(platform)
        @@current_object = current_platform
      when SF::Keyboard::Backspace
        Platform.initialize_platform_positions
      when SF::Keyboard::Num1
        @@current_object_type = "platform"
      end; end; end; end
 end
 class Editor_UI < Editor_Controls
  def Editor_UI.display_current_object_text(window)
    current_template = Level_Editor::Editor_Controls.check_current_template
    current_object = Level_Editor::Editor_Controls.check_current_object
    current_object_text = Level_Editor_Object_Text.dup
    Level_Editor_Object_Text.string = current_template.name
    current_object_text.string = current_object.name
    current_object_text.position = SF.vector2(25, 1030)
    window.draw(Level_Editor_Object_Text); window.draw(current_object_text)
  end
 end
end