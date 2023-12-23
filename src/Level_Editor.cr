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
  @@id : Int32; @@id = 1
  def Editor_Controls.check_current_object
    return @@current_object
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
  def Editor_Controls.level_editor_keypresses(window, player)
    while (event = window.poll_event)
     case event
     when SF::Event::Closed
        window.close
      when SF::Event::KeyPressed
        case event.code
      when SF::Keyboard::Escape
          window.close
      when SF::Keyboard::W
          player.position -= SF.vector2(0, 50)
      when SF::Keyboard::S
          player.position += SF.vector2(0, 50)
      when SF::Keyboard::A
          player.position -= SF.vector2(50, 0)
      when SF::Keyboard::D
          player.position += SF.vector2(50, 0)
      when SF::Keyboard::X
        current_platform = @@current_object
        Map_Geometry::Platform.initialize_current_platform(current_platform)
      when SF::Keyboard::V
        Map_Geometry::Platform.level_editor_save_positions
      when SF::Keyboard::O
        @@id += 1
        id = @@id
        @@current_object = Map_Geometry::Platform.level_editor_change_platfrom(id)
      when SF::Keyboard::P
        @@id -= 1
        id = @@id
        @@current_object = Map_Geometry::Platform.level_editor_change_platfrom(id)
      when SF::Keyboard::N
        platform = @@current_object
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
    current_object = Level_Editor::Editor_Controls.check_current_object
    Level_Editor_Object_Text.string = current_object.name
  end
 end
end