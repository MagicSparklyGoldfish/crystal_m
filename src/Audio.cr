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

 SELECT_1 = SF::SoundBuffer.from_file("audio/Select2.wav")
 SYSSOUND_7 = SF::Sound.new
 SYSSOUND_7.buffer = SELECT_1

 CURSOR_3 = SF::SoundBuffer.from_file("audio/Cursor2.wav") 
 SYSSOUND_8 = SF::Sound.new
 SYSSOUND_8.buffer = CURSOR_3

 SWING_1 = SF::SoundBuffer.from_file("audio/Stick_Swing01.wav") 
 WEAPSOUND_01 = SF::Sound.new
 WEAPSOUND_01.buffer = SWING_1

 Hit_1 = SF::SoundBuffer.from_file("audio/Stick_Hit.wav")
 WEAPSOUND_02 = SF::Sound.new
 WEAPSOUND_02.buffer = Hit_1

 Swing_2 = SF::SoundBuffer.from_file("audio/Chainsaw_Swing.wav")
 WEAPSOUND_03 = SF::Sound.new
 WEAPSOUND_03.buffer = Swing_2

 Hit_2 = SF::SoundBuffer.from_file("audio/Chainsaw_Hit_01.wav")
 WEAPSOUND_04 = SF::Sound.new
 WEAPSOUND_04.buffer = Hit_2

 Swing_3 = SF::SoundBuffer.from_file("audio/Laser_Club_Swing_01.wav")
 WEAPSOUND_05 = SF::Sound.new
 WEAPSOUND_05.buffer = Swing_3

 Hit_3 = SF::SoundBuffer.from_file("audio/Laser_Clab_Hit_01.wav")
 WEAPSOUND_06 = SF::Sound.new
 WEAPSOUND_06.buffer = Hit_3

 Dig_1 = SF::SoundBuffer.from_file("audio/Dig_01.wav")
 ENVIROSOUND_01 = SF::Sound.new
 ENVIROSOUND_01.buffer = Dig_1

 Dig_2 = SF::SoundBuffer.from_file("audio/Dig_2.wav")
 ENVIROSOUND_02 = SF::Sound.new
 ENVIROSOUND_02.buffer = Dig_2

 Smelter_1 = SF::SoundBuffer.from_file("audio/Smelter.wav")
 ENVIROSOUND_03 = SF::Sound.new
 ENVIROSOUND_03.buffer = Smelter_1

 Forge_1 = SF::SoundBuffer.from_file("audio/Forge.wav")
 ENVIROSOUND_04 = SF::Sound.new
 ENVIROSOUND_04.buffer = Forge_1

 Metal_Hit_1 = SF::SoundBuffer.from_file("audio/Metal_Hit_01.wav")
 ENVIROSOUND_05 = SF::Sound.new
 ENVIROSOUND_05.buffer = Metal_Hit_1
#_________________________________________________________________________________________________________________________________________________________

# =======================================================================================================================================================
#+                                                                     Music                                                                            +
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
        def SFX.select_2
            SYSSOUND_7.play
         end
        def SFX.cursor2
            SYSSOUND_8.play
         end
        def SFX.stick_swing_01
            WEAPSOUND_01.play
         end
        def SFX.stick_hit_01
            WEAPSOUND_02.play
         end
        def SFX.chaintana_swing_01
            WEAPSOUND_03.play
         end
        def SFX.chaintana_hit_01
            WEAPSOUND_04.play
         end
        def SFX.laser_club_swing_01
            WEAPSOUND_05.play
         end
        def SFX.laser_club_hit_01
            WEAPSOUND_06.play
         end
        def SFX.dig_01
            ENVIROSOUND_01.play
        end
        def SFX.dig_02
            ENVIROSOUND_02.play
        end
        def SFX.smelter_01
            ENVIROSOUND_03.play
        end
        def SFX.forge_01
            ENVIROSOUND_04.play
        end
        def SFX.metal_hit_01
            ENVIROSOUND_05.play
        end
        
    end #sfx class end
  class MUSIC
   def MUSIC.test_song
     TEST_SONG.play
    end
  end #music class end
end #all audio module end 