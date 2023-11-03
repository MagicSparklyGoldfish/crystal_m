# require "../src/crystal_meth.cr"
# require "crsfml"
# require "../src/Audio.cr"
# #require "../src/Clothing.yml"
# require "crsfml/system"
# require "yaml"
# require "crystal/system/time"



# #================================================================================================================================================
# #                                                           Player Inventory                                                                    #
# #================================================================================================================================================




# #=================================================================================================================================================
# #                                                              Clothing                                                                          #
# #=================================================================================================================================================
 
#  module Skin
#   #properties
#    property is_owned : Bool
#    property char_sprite : SF::Sprite
#    property display_sprite : SF::Sprite
#    property id : String
#    property name : String
#   class Human
#      Light = new.Human(false, PLAYER_CHAR, PLAYER_CHAR_DISPLAY, "SH001", "Light") 
#      Tan = new.Human(false, PLAYER_CHAR_2, PLAYER_CHAR_DISPLAY_2, "SH002", "Tan")
#      Dark = new.Human(false, PLAYER_CHAR_3, PLAYER_CHAR_DISPLAY_3, "SH003", "Dark")
#      Jaundiced = new.Human(false, PLAYER_CHAR_7, PLAYER_CHAR_DISPLAY_7, "SH004", "Jaundiced")
#    end
#   class Spooky
#     Ghostly = new.Spooky(false, PLAYER_CHAR_4, PLAYER_CHAR_DISPLAY_4, "SS001", "Ghostly")
#     Blue = new.Spooky(false, PLAYER_CHAR_5, PLAYER_CHAR_DISPLAY_5, "SS002", "Blue")
#     Purple = new.Spooky(false, PLAYER_CHAR_6, PLAYER_CHAR_DISPLAY_6, "SS003", "Purple")
#    end
#    end
 
#  module Hair
#   #extend self
#   def initialize(@is_owned : Bool, char_sprite : SF::Sprite, display_sprite : SF::Sprite, id : String, name : String, color : String, length : String)
#     is_owned = false
#     char_sprite = SHOUNEN_HAIR_01
#     display_sprite = SHOUNEN_HAIR_01
#     id = String
#     name = String
#     color = String
#     length = String
#   end
#   #properties
#     property? is_owned : Bool
#     property char_sprite : SF::Sprite = SHOUNEN_HAIR_01
#     property display_sprite : SF::Sprite = SHOUNEN_HAIR_01
#     property id : String = ""
#     property name : String = ""
#     property color : String = ""
#     property length : String = ""

#   class Shounen_Hair
#     include Hair
#    def self.shounen_hair_black
#      new(false, SHOUNEN_HAIR_01, SHOUNEN_DISPLAY_HAIR_01, "HSH001", "Black Shounen Hair", "black", "medium")
#    end
#    Shounen_Hair_Green = new.Shounen_Hair(false, SHOUNEN_HAIR_02, SHOUNEN_DISPLAY_HAIR_02, "HSH002", "Green Shounen Hair", "green", "medium")
#    Shounen_Hair_Blue = new.Shounen_Hair(false, SHOUNEN_HAIR_03, SHOUNEN_DISPLAY_HAIR_03, "HSH003", "Blue Shounen Hair", "blue", "medium")
#    Shounen_Hair_Red = new.Shounen_Hair(false, SHOUNEN_HAIR_04, SHOUNEN_DISPLAY_HAIR_04, "HSH004", "Red Shounen Hair", "red", "medium")
#    Shounen_Hair_Yellow = new.Shounen_Hair(false, SHOUNEN_HAIR_05, SHOUNEN_DISPLAY_HAIR_05, "HSH005", "Yellow Shounen Hair", "yellow", "medium")
#    Shounen_Hair_Purple = new.Shounen_Hair(false, SHOUNEN_HAIR_06, SHOUNEN_DISPLAY_HAIR_06, "HSH006", "Purple Shounen Hair", "purple", "medium")

#    end
#   class Ponytail
#    Grey_Ponytail = new.Ponytail(false, PONYTAIL_01, DISPLAY_PONYTAIL_HAIR_01, "HPT001", "Grey Ponytail", "grey", "long")
#    Blonde_Ponytail = new.Ponytail(false, PONYTAIL_02, DISPLAY_PONYTAIL_HAIR_02, "HPT002", "Blonde Ponytail", "yellow", "long")
#    Red_Ponytail = new.Ponytail(false, PONYTAIL_03, DISPLAY_PONYTAIL_HAIR_03, "HPT003", "Red Ponytail", "red", "long")
#    Brown_Ponytail = new.Ponytail(false, PONYTAIL_04, DISPLAY_PONYTAIL_HAIR_04, "HPT004", "Brown Ponytail", "brown", "long")
#    Pink_Ponytail = new.Ponytail(false, PONYTAIL_05, DISPLAY_PONYTAIL_HAIR_05, "HPT005", "Pink Ponytail", "pink", "long")
#    Blue_Ponytail = new.Ponytail(false, PONYTAIL_06, DISPLAY_PONYTAIL_HAIR_06, "HPT006", "Blue Ponytail", "blue", "long")
#    end
#   end
  
#  module Face
#    #properties
#     property is_owned : Bool
#     property char_sprite : SF::Sprite
#     property display_sprite : SF::Sprite
#     property id : String
#     property name : String
#     property eye_color : String
#     property does_blink : Bool
#    class Button_Face
#     Blue_Button_Eyes = new.Button_Face(false, BUTTON_FACE_01, BUTTON_DISPLAY_FACE_01, "FFBE001", "Blue Button Eyes", "blue", false)
#     Red_Button_Eyes = new.Button_Face(false, BUTTON_FACE_02, BUTTON_DISPLAY_FACE_02, "FFBE002", "Red Button Eyes", "red", false)
#     Purple_Button_Eyes = new.Button_Face(false, BUTTON_FACE_03, BUTTON_DISPLAY_FACE_03, "FFBE003", "Purple Button Eyes", "purple", false)
#     Green_Button_Eyes = new.Button_Face(false, BUTTON_FACE_04, BUTTON_DISPLAY_FACE_04, "FFBE004", "Green Button Eyes", "green", false)
#     Yellow_Button_Eyes = new.Button_Face(false, BUTTON_FACE_05, BUTTON_DISPLAY_FACE_05, "FFBE005", "Yellow Button Eyes", "yellow", false)
#     Brown_Button_Eyes = new.Button_Face(false, BUTTON_FACE_06, BUTTON_DISPLAY_FACE_06, "FFBE006", "Brown Button Eyes", "brown", false)
#     end
#    class Shounen_Face
#     Grey_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_01, SHOUNEN_DISPLAY_FACE_01, "FSF001", "Grey Shounen Face", "grey", true)
#     Blue_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_02, SHOUNEN_DISPLAY_FACE_02, "FSF002", "Blue Shounen Face", "blue", true)
#     Green_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_03, SHOUNEN_DISPLAY_FACE_03, "FSF003", "Green Shounen Face", "green", true)
#     Brown_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_04, SHOUNEN_DISPLAY_FACE_04, "FSF004", "Brown Shounen Face", "brown", true)
#     Purple_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_05, SHOUNEN_DISPLAY_FACE_05, "FSF005", "Purple Shounen Face", "purple", true)
#     Yellow_Shounen_Face = new.Shounen_Face(false, SHOUNEN_FACE_06, SHOUNEN_DISPLAY_FACE_06, "FSF006", "Yellow Shounen Face", "yellow", true)
#     end
#    class Tired_Face
#     Grey_Tired_Face = new.Tired_Face(false, TIRED_FACE_01, TIRED_DISPLAY_FACE_01, "FTF001", "Grey Tired Face", "grey", true)
#     Blue_Tired_Face = new.Tired_Face(false, TIRED_FACE_02, TIRED_DISPLAY_FACE_02, "FTF002", "Blue Tired Face", "blue", true)
#     Brown_Tired_Face = new.Tired_Face(false, TIRED_FACE_03, TIRED_DISPLAY_FACE_03, "FTF003", "Brown Tired Face", "brown", true)
#     Green_Tired_Face = new.Tired_Face(false, TIRED_FACE_04, TIRED_DISPLAY_FACE_04, "FTF004", "Green Tired Face", "green", true)
#     Red_Tired_Face = new.Tired_Face(false, TIRED_FACE_05, TIRED_DISPLAY_FACE_05, "FTF005", "Red Tired Face", "red", true)
#     Yellow_Tired_Face = new.Tired_Face(false, TIRED_FACE_06, TIRED_DISPLAY_FACE_06, "FTF006", "Yellow Tired Face", "yellow", true)
#     end
#    class Smiley_Face
#      Smiley_Face = new.Smiley_Face(false, SMILEY_FACE_01, SMILEY_DISPLAY_FACE_01, "FSFL001", "Smiley Face", "black", false)
#    end
#   end
  
#  module Gloves
#   #properties
#    property is_owned : Bool
#    property char_sprite : SF::Sprite
#    property display_sprite : SF::Sprite
#    property id : String
#    property name : String
#    property color : String
#   class Fingerless_Gloves
#    Black_Fingerless_Gloves = new.Fingerless_Gloves(false, FINGERLESS_GLOVE_01, DISPLAY_FINGERLESS_GLOVE_01, "GFG001", "Black Fingerless Gloves", "black")
#    Red_Fingerless_Gloves = new.Fingerless_Gloves(false, FINGERLESS_GLOVE_02, DISPLAY_FINGERLESS_GLOVE_02, "GFG002", "Red Fingerless Gloves", "red")
#    Blue_Fingerless_Gloves = new.Fingerless_Gloves(false, FINGERLESS_GLOVE_03, DISPLAY_FINGERLESS_GLOVE_03, "GFG003", "Blue Fingerless Gloves", "blue")  
#    end
#   end
#  module Shirts
#   #properties
#    property is_owned : Bool
#    property char_sprite : SF::Sprite
#    property display_sprite : SF::Sprite
#    property id : String
#    property name : String
#    property color : String
#    property sleeve_length : String
#    property midriff_exposed : Bool
#   class T_Shirts
#    White_T_Shirt = new.T_Shirts(false, T_SHIRT_01, DISPLAY_T_SHIRT_01, "STS001", "White T-Shirt", "white", "short", false)  
#    Blue_T_Shirt = new.T_Shirts(false, T_SHIRT_02, DISPLAY_T_SHIRT_02, "STS002", "Blue T-Shirt", "blue", "short", false)
#    Red_T_Shirt = new.T_Shirts(false, T_SHIRT_03, DISPLAY_T_SHIRT_03, "STS003", "Red T-Shirt", "red", "short", false)
#    Green_T_Shirt = new.T_Shirts(false, T_SHIRT_04, DISPLAY_T_SHIRT_04, "STS004", "Green T-Shirt", "green", "short", false)
#    Purple_T_Shirt = new.T_Shirts(false, T_SHIRT_05, DISPLAY_T_SHIRT_05, "STS005", "Purple T-Shirt", "purple", "short", false) 
#    Black_T_Shirt = new.T_Shirts(false, T_SHIRT_06, DISPLAY_T_SHIRT_06, "STS006", "Black T-Shirt", "black", "short", false) 
#    end 
#   end
#  module Pants
#   #properties
#    property is_owned : Bool
#    property char_sprite : SF::Sprite
#    property display_sprite : SF::Sprite
#    property id : String
#    property name : String
#    property color : String
#    property length : String
#   class Shorts
#    Blue_Shorts = new.Shorts(false, SHORTS_01, DISPLAY_SHORTS_01, "PS001", "Blue_Shorts", "blue", "short")
#    Brown_Shorts = new.Shorts(false, SHORTS_02, DISPLAY_SHORTS_02, "PS002", "Brown_Shorts", "brown", "short")
#    Black_Shorts = new.Shorts(false, SHORTS_03, DISPLAY_SHORTS_03, "PS003", "Black_Shorts", "black", "short")
#    end
#   end
#  module Shoes
#   #properties  
#    property is_owned : Bool
#    property char_sprite : SF::Sprite
#    property display_sprite : SF::Sprite
#    property id : String
#    property name : String
#    property color : String
#    property is_waterproof : Bool
#   class Boots
#    Black_Rain_Boots = new.Boots(false, RAIN_BOOTS_01, DISPLAY_RAIN_BOOTS_01, "SRB001", "Black Rain Boots", "black", true)
#    Red_Rain_Boots = new.Boots(false, RAIN_BOOTS_02, DISPLAY_RAIN_BOOTS_02, "SRB002", "Red Rain Boots", "red", true)
#    Blue_Rain_Boots = new.Boots(false, RAIN_BOOTS_03, DISPLAY_RAIN_BOOTS_03, "SRB003", "Blue Rain Boots", "blue", true)
#    end
#   end
  

  

 
