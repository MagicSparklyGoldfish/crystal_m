require "crsfml"
require "crsfml/audio"
require "crsfml/system"
require "../src/crystal_meth.cr"
require "../src/Menus.cr"

CURSOR_1 = SF::SoundBuffer.from_file("audio/Cursor1.wav")
SYSSOUND_1 = SF::Sound.new
SYSSOUND_1.buffer = CURSOR_1

module All_Audio
    class SFX
        def SFX.cursor1
            SYSSOUND_1.play
        end
    end
end