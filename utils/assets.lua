 --*************************************************************************************************
 --                                     IMAGES
 --**************************************************************************************************
--GUI
 bouton          = love.graphics.newImage("assets/images/button.png")
 switch          = love.graphics.newImage("assets/images/switch.png")
 cadre           = love.graphics.newImage("assets/images/cadre.png")
 backgroungPlage = love.graphics.newImage("assets/images/background.jpg")
 endScreen = love.graphics.newImage("assets/images/endScreen.png")

 enemyImage = {}
    enemyImage.crab  = love.graphics.newImage("assets/images/enemy/crabe_5.png")
    enemyImage.bird  = love.graphics.newImage("assets/images/enemy/bird.png")
    enemyImage.coral = love.graphics.newImage("assets/images/enemy/coral.png")
    enemyImage.hole  = love.graphics.newImage("assets/images/enemy/hole.png")

 turtleRun        = love.graphics.newImage("assets/images/turtle/turtle_4.png")
 turtleJump       = love.graphics.newImage("assets/images/turtle/jumpturtle.png")
 turtleIntro      = love.graphics.newImage("assets/images/turtle/hatch.PNG")
 turtledead       = love.graphics.newImage("assets/images/turtle/animDead.PNG")

 endScreen       = love.graphics.newImage("assets/images/endScreen.png")
 gameOver        = love.graphics.newImage("assets/images/gameOver.png")
 victory         = love.graphics.newImage("assets/images/victory.png")
 fondNoir        = love.graphics.newImage("assets/images/fondNoir.jpg")


 --*************************************************************************************************
 --                                     FONTS
 --**************************************************************************************************
 textFont   = love.graphics.newFont(15)
 nameFont   = love.graphics.newFont(25)
 --overFont = love.graphics.newFont("assets/eraslght.ttf",50) 
 overFont = love.graphics.newFont("assets/light_pixel-7.ttf",80) 
 buttonFont = love.graphics.newFont("assets/light_pixel-7.ttf",20) 
 titleFont  = love.graphics.newFont("assets/light_pixel-7.ttf",43) 

 
 --*************************************************************************************************
 --                                     SONS
 --**************************************************************************************************
  --MENU
  snd_clic_menu_1 = newSfx("assets/sounds/clic_menu_1.mp3",false,global_sound_vol)  -- isLopped = false
  snd_clic_menu_2 = newSfx("assets/sounds/clic_menu_2.mp3",false,global_sound_vol)
  snd_atterissage = newSfx("assets/sounds/atterissage.ogg",false,global_sound_vol)
  snd_jump        = newSfx("assets/sounds/jump2.wav",false,global_sound_vol)
  snd_walk        = newSfx("assets/sounds/walk_gravier.mp3",false,global_sound_vol)
  snd_drag        = newSfx("assets/sounds/drag2.mp3",false,global_sound_vol)
 --*************************************************************************************************
 --                                     MUSIQUES
 --**************************************************************************************************

 --music_menu      = love.audio.newSource("assets/musics/menu.mp3","stream") 
 music_menu     = love.audio.newSource("assets/musics/menu_naissance_looping.mp3","stream") 
 music_ambiance = love.audio.newSource("assets/musics/ambiance_flippante.mp3","stream")
 music_win      = love.audio.newSource("assets/musics/music_win.ogg","stream")
-- on charge les musiques dans le music_manager
 music_man.add("menu",music_menu)
 music_man.add("ambiance_game",music_ambiance)
 music_man.add("win",music_win)
  

  