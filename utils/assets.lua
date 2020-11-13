 --*************************************************************************************************
 --                                     IMAGES
 --**************************************************************************************************
--GUI
 bouton          = love.graphics.newImage("assets/images/button.png")
 switch          = love.graphics.newImage("assets/images/switch.png")
 cadre           = love.graphics.newImage("assets/images/cadre.png")
 backgroungPlage = love.graphics.newImage("assets/images/background.jpg")

 turtleRun        = love.graphics.newImage("assets/images/turtle.png")
 turtleJump       = love.graphics.newImage("assets/images/jumpturtle.png")

endScreen = love.graphics.newImage("assets/images/endScreen.png")

 turtle          = love.graphics.newImage("assets/images/turtle.png")
 endScreen       = love.graphics.newImage("assets/images/endScreen.png")
 fondNoir        = love.graphics.newImage("assets/images/fondNoir.jpg")


 --*************************************************************************************************
 --                                     FONTS
 --**************************************************************************************************
 textFont   = love.graphics.newFont(15)
 nameFont   = love.graphics.newFont(25)
 --buttonFont = love.graphics.newFont("assets/eraslght.ttf",25) 
 buttonFont = love.graphics.newFont("assets/light_pixel-7.ttf",20) 
 titleFont  = love.graphics.newFont("assets/light_pixel-7.ttf",43) 

 
 --*************************************************************************************************
 --                                     SONS
 --**************************************************************************************************
  --MENU
  snd_clic_menu_1 = newSfx("assets/sounds/clic_menu_1.mp3",false,global_sound_vol)  -- isLopped = false
  snd_clic_menu_2 = newSfx("assets/sounds/clic_menu_2.mp3",false,global_sound_vol)
  
 --*************************************************************************************************
 --                                     MUSIQUES
 --**************************************************************************************************

 music_menu      = love.audio.newSource("assets/musics/menu.mp3","stream") 
 music_ambiance1 = love.audio.newSource("assets/musics/ambiance_1.mp3","stream")
-- on charge les musiques dans le music_manager
 music_man.add("menu",music_menu)
 music_man.add("ambiance_1",music_ambiance1)

  

  