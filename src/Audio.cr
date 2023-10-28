require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "crystal/system/time"
require "../src/crystal_meth.cr"

CURSOR_1 = SF::SoundBuffer.from_file("audio/Cursor1.wav")
SYSSOUND_1 = SF::Sound.new
SYSSOUND_1.buffer = CURSOR_1

CURSOR_2 = SF::SoundBuffer.from_file("audio/Select1.wav")
SYSSOUND_2 = SF::Sound.new
SYSSOUND_2.buffer = CURSOR_2

module All_Audio
    class SFX
        def SFX.cursor1
            SYSSOUND_1.play
        end
    
        def SFX.select1
            SYSSOUND_2.play
        end
    end
end