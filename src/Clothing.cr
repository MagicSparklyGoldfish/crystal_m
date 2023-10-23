require "crsfml"
require "../src/crystal_meth.cr"
require "../src/Audio.cr"
require "../src/Clothing.yml"
require "crsfml/system"
require "yaml"
require "crystal/system/time"

# Load the YAML data from the file
yaml_data = YAML.parse_file("Clothing.yml")

# Access the data in the YAML structure
shirts = yaml_data["shirts"]
white_tee_shirt = shirts["White_Tee_Shirt"]

TEE_SHIRT_TEXTURE_01 = SF::Texture.from_file("graphics/Cursor.png")

module Body
    class Skins
    include YAML::Clothing
        def pale
            @@pale_skin_name = "Pale Skin"
            @@pale_skin.texture_rect = SF.int_rect(0, 0, 64, 32)
            @@pale_skin.position = SF.vector2(750, 610)
            @@pale_skin = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
        end
    end
    class Shirts
        def white_tee_shirt
            @@white_tee_shirt_name = white_tee_shirt["name"]
            texture = white_tee_shirt["texture"]
            @@white_tee_shirt_sleeves = white_tee_shirt["sleeves"]
            @@white_tee_shirt.texture_rect = SF.int_rect(0, 0, 64, 32)
            @@white_tee_shirt.position = SF.vector2(750, 610)
            @@white_tee_shirt = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
        end
    end
    class Pants
        def blue_jeans
            @@blue_jeans_name = "Blue Jeans"
            @@blue_jeans.texture_rect = SF.int_rect(0, 0, 64, 32)
            @@blue_jeans.position = SF.vector2(750, 610)
            @@blue_jeans = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
        end
    end
    class Shoes
        def white_sneakers
            @@white_sneakers_name = "Blue Jeans"
            @@white_sneakers.texture_rect = SF.int_rect(0, 0, 64, 32)
            @@white_sneakers.position = SF.vector2(750, 610)
            @@white_sneakers = SF::Sprite.new(PLAYER_CHAR_TEXTURE_01)
        end
    end
end