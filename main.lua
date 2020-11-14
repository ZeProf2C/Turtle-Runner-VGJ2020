io.stdout:setvbuf('no')

function love.load()
  screen = {L = love.graphics.getWidth(), H = love.graphics.getHeight()}
  mouse  = {x=0 , y = 0}
  require('utils/vecteur2')
  require("utils/constantes")
  require("utils/animation")
  require("utils/geometry")
  require("pannelescape")
  
  camera = require("utils/camera")
  mGui   = require("utils/gui")
 --******************************************************************************************************
 -- SONS - MUSIQUES - IMAGES
  require("utils/sfx")
  music_man = require("utils/music_manager")
  
 --*******************************************************************************************************
 --ON CHARGE LE CURSEUR DU JEU ET SES IMAGES
  require("utils/cursor")
  myCursor = createClassicCursor()
  myCursor.addCursor("open","assets/images/curseur/cursor_up.png" )
  myCursor.addCursor("close","assets/images/curseur/cursor_down.png" )
 --*******************************************************************************************************
 pannelEscape = newPannelEscape()
 -- ON CHARGE LE SCENES_MANAGER
  scene_man = require("scenes/scene_manager")
  -- LA VARIABLE CURRENT SCENE  CONTIENT LA SCENE ACTIVE
  love.mouse.setVisible(false)
  scene_man.current_scene = scene_man.list["loading"] 
  scene_manager.current_scene.load() 

end


function love.update(dt)
    dt = math.min(dt , 0.017)
    mouse.x,mouse.y = love.mouse.getX(), love.mouse.getY() 
    myCursor.setCursor("open")
    music_man.update(dt)
    scene_man.current_scene.update(dt)
    --*****************************************************************************************
    --                      CHANGEMENT DE SCENE : FADE OUT
    if scene_man.next_scene ~= nil then
      scene_man.fade_out_in(scene_man.next_scene,dt)
    end
    --******************************************************************************************
    if camera.shake then
      camera.onShake(dt)
    end
    if love.mouse.isDown(1) then
       myCursor.setCursor("close")
    end
    
    
end



function love.draw()
   -- la camera dessine la scene courante
   camera.drawScene(scene_man.current_scene)
 --*****************************************************************************************
 --                      CHANGEMENT DE SCENE : FADE OUT
 if scene_man.next_scene ~=nil then
  love.graphics.setColor(0,0,0,scene_man.alpha)
  love.graphics.draw(fondNoir,0,0)
 end
--******************************************************************************************
end



function love.keypressed(key)
  scene_man.current_scene.keypressed(key)
end

function love.mousepressed(x,y, button)
  scene_man.current_scene.mousepressed(x,y,button)
end

function love.mousereleased(x,y,button)
 scene_man.current_scene.mousereleased(x,y,button)
end
function love.focus(focus)
  
end
function love.textinput(txt)
  scene_man.current_scene.textinput(txt)
end
function love.quit()
  scene_man.current_scene.quit()
end

