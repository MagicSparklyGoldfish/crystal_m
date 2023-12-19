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
require "../src/Player_Character.cr"
require "x11"
require "crystal/system/time"
require "chipmunk/chipmunk_crsfml"
require "file_utils"

 module Player_Info
 include Use
 #PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
 #P                                                                 Player                                                                              P
 #PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
  class Player
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
   #!                                                              Initialize                                                                              !
   #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    def initialize(name : String, current_hp : Float64, max_hp : Float64, current_mp : Float64,
      max_mp : Float64, str : Int32, dex : Int32, int : Int32, luk : Int32, atk : Int32, m_atk : Int32, 
      speed : Float64, jump_height : Float64, exp : Float64, lvl : Int32)
      @name = name
      @current_hp = current_hp
      @max_hp = max_hp
      @current_mp = current_mp
      @max_mp = max_mp
      @str = str
      @dex = dex
      @int = int
      @luk = luk
      @atk = atk
      @m_atk = m_atk
      @speed = speed
      @jump_height = jump_height
      @exp = exp
      @lvl = lvl
     end
    def name
        @name
     end
    def current_hp
        @current_hp
     end
    def max_hp
        @max_hp
     end
    def current_mp
        @current_mp
     end
    def max_mp
        @max_mp
     end
    def str 
        @str
     end
    def dex
        @dex
     end
    def int
        @int
     end
    def luk
        @luk
     end
    def atk
        @atk
     end
    def m_atk
        @m_atk
     end
    def speed    
        @speed
     end
    def jump_height
        @jump_height
     end
    def exp
        @exp
     end
    def lvl
        @lvl
     end

    def current_hp=(this)
        @current_hp = this
    end
   #________________________________________________________________________________________________________________________________________________________
   #********************************************************************************************************************************************************
   #*                                                              Variables                                                                               *
   #********************************************************************************************************************************************************
    #@@exp = 0; 
    @@exp_cap : Float64; @@exp_scale : Float64
    @@exp_cap = @@player.lvl * Math.sqrt(100) ; @@exp_scale = @@player.exp / @@exp_cap
   #________________________________________________________________________________________________________________________________________________________
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
   #?                                                               Methods                                                                                ?
   #????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
    def Player.get_atk(atk_type)
     case atk_type
      when "physical"
        return @@player.atk 
      when "magic"
        return @@player.m_atk 
      end
    end
    def Player.take_damage(damage)
      @@player.current_hp -= damage
     end
    def Player.adjust_stat_bars(window)
      HP_Bar_Color.scale = SF.vector2(@@player.current_hp * 0.005, 1); HP_Bar.scale = SF.vector2(@@player.max_hp * 0.005, 1)
      LVL_Bar_Color.scale = SF.vector2(@@exp_scale * 0.01, 1); 
      MP_Bar_Color.scale = SF.vector2(@@player.current_mp * 0.005, 1); MP_Bar.scale = SF.vector2(@@player.max_mp * 0.005, 1)
     end
    def Player.calculate_stat_strings
      exp = @@player.exp.to_s + "/" + @@exp_cap.to_s; lvl = "Lvl: " + @@player.lvl.to_s;
      Stats_Window_LVL_Text.string = exp; Stats_Window_LVL_Text_02.string = lvl; 
      str = "STR: " + @@player.str.to_s; Stats_Window_Str_Text.string = str
      dex = "DEX: " + @@player.dex.to_s; Stats_Window_Dex_Text.string = dex
      luk = "LUK: " + @@player.luk.to_s; Stats_Window_Luk_Text.string = luk
      int = "INT: " + @@player.int.to_s; Stats_Window_Int_Text.string = int
      hp = "HP: " + @@player.current_hp.to_s + "/" + @@player.max_hp.to_s; Stats_Window_HP_Text.string = hp
      mp = "MP: " + @@player.current_mp.to_s + "/" + @@player.max_mp.to_s; Stats_Window_MP_Text.string = mp
      LVL_Label.string = @@player.lvl.to_s;
      Stats_Window_Name_Text.string = @@player.name
     end
   #________________________________________________________________________________________________________________________________________________________
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   #/                                                               Entities                                                                               /
   #////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @@player = Player.new("Some Rando", 100, 100, 50, 50, 1, 1, 1, 1, 5, 5, 1, 1, 0, 1)
   #________________________________________________________________________________________________________________________________________________________
   end
  class Skill
   end
 end