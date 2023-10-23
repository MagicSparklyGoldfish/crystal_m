require "crsfml"
require "../src/crystal_meth.cr"
require "../src/Audio.cr"
require "../src/Menus.cr"
require "crsfml/system"
require "yaml"
require "crystal/system/time"
require "chipmunk"

#TODO add way to save character appearance, current value is a placeholder

module Save_System
    class Save_Slots
        property slot_number : Int32

        property time_played : Int32

        property char_name : String

        property location : String

        property level : Int32

        property exp : Int32

        property char_appearance : String
    def initialize
        @slot_number = 0
        @time_played = 0
        @char_name = "name"
        @location = "location"
        @level = 0
        @exp = 0
        @char_appearance = "appearance"
    end
    slot_1 = Save_Slots.new
    slot_1.slot_number = 1
    slot_1.time_played = 0
    slot_1.location = "none"
    slot_1.level = 0
    def determine_file_slot
        
    end
    
    def save (slotnumber, time_played, location, level, exp, char_appearance)
        @@save_number = 0 
        @@save_number = @@save_number + 1
        @@save_number_file = "File" + @@save_number
        @@save_number_file = File.new("crystal_meth/Saves/Slot1")
        end
        end
    end
