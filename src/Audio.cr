require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "crystal/system/time"
require "../src/crystal_meth.cr"

# =======================================================================================================================================================
#+                                                                      SFX                                                                              +
# =======================================================================================================================================================

 CURSOR_1 = SF::SoundBuffer.from_file("audio/Cursor1.wav")
 SYSSOUND_1 = SF::Sound.new
 SYSSOUND_1.buffer = CURSOR_1
 
 CURSOR_2 = SF::SoundBuffer.from_file("audio/Select1.wav")
 SYSSOUND_2 = SF::Sound.new
 SYSSOUND_2.buffer = CURSOR_2
 
 CHAR_CREATE_CURSOR_UP = SF::SoundBuffer.from_file("audio/Char_Create_Up.wav")
 SYSSOUND_3 = SF::Sound.new
 SYSSOUND_3.buffer = CHAR_CREATE_CURSOR_UP
 
 CHAR_CREATE_CURSOR_DOWN = SF::SoundBuffer.from_file("audio/Char_Create_Down.wav")
 SYSSOUND_4 = SF::Sound.new
 SYSSOUND_4.buffer = CHAR_CREATE_CURSOR_DOWN
 
 CHAR_CREATE_CURSOR_SIDEWAYS = SF::SoundBuffer.from_file("audio/Char_Create_Sideways.wav")
 SYSSOUND_5 = SF::Sound.new
 SYSSOUND_5.buffer = CHAR_CREATE_CURSOR_SIDEWAYS
 
 LIGHT_BONK = SF::SoundBuffer.from_file("audio/Light_Bonk.wav")
 SYSSOUND_6 = SF::Sound.new
 SYSSOUND_6.buffer = LIGHT_BONK
#_________________________________________________________________________________________________________________________________________________________

# =======================================================================================================================================================
#+                                                                     Music                                                                             +
# =======================================================================================================================================================
 TEST_SONG = SF::Music.new
 if !TEST_SONG.open_from_file("audio/Test_Song.wav")
    puts "error! File Test_Song.wav not found!"
  end
 TEST_SONG.loop = true
#_________________________________________________________________________________________________________________________________________________________

module All_Audio
    class SFX
        def SFX.cursor1
            SYSSOUND_1.play
        end
    
        def SFX.select1
            SYSSOUND_2.play
        end

        def SFX.char_create_up
            SYSSOUND_3.play
        end

        def SFX.char_create_down
            SYSSOUND_4.play
        end

        def SFX.char_create_sideways
            SYSSOUND_5.play
        end
        def SFX.light_bonk
            SYSSOUND_6.play
        end
    end #sfx class end
  class MUSIC
   def MUSIC.test_song
     TEST_SONG.play
    end
  end #music class end
end #all audio module end