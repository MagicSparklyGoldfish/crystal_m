require "../src/crystal_meth.cr"
require "../src/Textures.cr"
require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/Textures.cr"
require "../src/Items.cr"
require "../src/enemies.cr"
require "../src/Custom_Body.cr"
require "../src/Audio.cr"
require "../src/Saves.cr"
require "../src/Fonts.cr"
require "../src/level_test.cr"
require "x11"
require "crystal/system/time"
require "file_utils"

#=========================================================================================================================================================
#=SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS=
#=SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS=
#=S                                                             Shopkeepers                                                                             S=
#=SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS=
#=SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS=
#=========================================================================================================================================================
 module Shopkeepers
  #HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
  #H                                                            Hairdresser                                                                              H
  #HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
   class Hairdresser
    #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    #!                                                          Initialize                                                                               !
    #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     def initialize(name : String, id : Int32, current_hp : Float64, max_hp : Float64, sprite : SF::Sprite, inventory : Array(Tuple(Hair, Int32, Int32)), is_dead : Bool,
        routine : String, bravery : Int32, dialogue : Array(String))
       @name = name
       @id = id
       @current_hp = current_hp
       @max_hp = max_hp
       @sprite = sprite
       @inventory = inventory
       @is_dead = is_dead
       @routine = routine
       @bravery = bravery
       @dialogue = dialogue
      end
     def name
        @name
      end
     def id
        @id
      end
     def current_hp
        @current_hp
      end
     def max_hp
        @max_hp
      end
     def sprite
        @sprite
      end
     def inventory
        @inventory
      end
     def is_dead
        @is_dead
      end
     def routine
        @routine
      end
     def bravery
        @bravery
      end
     def dialogue
        @dialogue
      end

     def name=(this)
       @name = this
      end
     def id=(this)
       @id = this
      end
     def current_hp=(this)
       @current_hp = this
      end
     def is_dead=(this)
       @is_dead = this
      end
    #_____________________________________________________________________________________________________________________________________________________
    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    #+                                                          Variables                                                                                +
    #+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     Hairdresser_Array = [] of Hairdresser
    #_____________________________________________________________________________________________________________________________________________________
    #?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    #?                                                           Methods                                                                                 ?
    #?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
      def Hairdresser.get_white_shounen_hair_tuple
        hair = "white shounen"
        return Hair.return_tuple(hair)
       end
      def Hairdresser.routine_meth_addict_01
      end
      def Hairdresser.get_initial_value
         return @@hairdresser_01
      end
     #--------------------------------------------------------Level Editor--------------------------------------------------------------------------------
      #........................................................Get Arrays.................................................................................
       def Hairdresser.get_array
         return Hairdresser_Array
        end
      
    #_____________________________________________________________________________________________________________________________________________________
    #/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    #/                                                          Entities                                                                                 /
    #/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     @@hairdresser_01 = Hairdresser.new("Pookie", 0, 200.0, 200.0, Hair_Dresser_01.dup, [Hairdresser.get_white_shounen_hair_tuple], false, 
     "routine_meth_addict_01", 2, ["I like meth"])
     Hairdresser_Array.push(@@hairdresser_01)
     @@hairdresser_02 = Hairdresser.new("Chalk", 1, 300.0, 300.0, Hair_Dresser_01, [Hairdresser.get_white_shounen_hair_tuple], false, 
     "routine_meth_addict_01", 3, ["I've seen some shit'"])
     Hairdresser_Array.push(@@hairdresser_02)
    #_____________________________________________________________________________________________________________________________________________________
   end
 end
 
 module Quest_givers
 end
