require "crsfml"
require "../src/crystal_meth.cr"
require "../src/Audio.cr"
#require "../src/Saves.yml"
require "crsfml/system"
require "yaml"
require "crystal/system/time"
require "chipmunk"
require "json"
require "file_utils"


    
#I have no idea how I managed to make a save function that causes a stack overflow, but I did. May computer Jeezus help us all 
#UPDATE! this doesn't ALWAYS cause a stack overflow, but it does always close the window. Progress? 
#UPDATE! finally made the window stop fucking closing. "window.close" was in the goddamn method for some fucking reason goddammit
struct SaveData
    include YAML::Serializable
property name : String
property level : Int64
property location : String
property playtime : Int64
property appearance : Array(String)
property exp : Int64
property hp : Int64
property mp : Int64
property strength : Int64
property dexterity : Int64
property intelligence : Int64
property luck : Int64
property questdata : Array(String)

def SaveData.initialize_save_data
 @@name = "some rando"
 @@level = 1
 @@location = "start"
 @@playtime = 0
 @@appearance = ["default", "default", "default", "default"]
 @@exp = 0
 @@hp = 100
 @@mp = 100
 @@strength = 5
 @@dexterity = 5
 @@intelligence = 5
 @@luck = 5
 @@questdata = ["incomplete", "incomplete", "incomplete"]
end
end
def SaveData.savegame
    
end
def SaveData.create_new_savegame
    SaveData.initialize_save_data
yaml = YAML.dump({@@name, @@level, @@location, @@playtime, @@appearance, @@exp, @@hp, @@mp, @@strength, @@dexterity, @@intelligence, @@luck, @@questdata}) 
File.open("Saves/Slot1/save01.yml", "w") { |f| YAML.dump({@@name, @@level, @@location, @@playtime, @@appearance, @@exp, @@hp, @@mp, @@strength, @@dexterity, @@intelligence, @@luck, @@questdata}, f) }

end

