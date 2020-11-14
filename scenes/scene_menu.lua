scene_menu = {}

scene_menu.hardMode = false 

local pannel

scene_menu.load = function()

   pannel = mGui.CreatePannel(0,0 ,650,800,blanc, blanc,10)

   pannel.addTexte("titre",0,pannel.H*0.1,"T u r T l e",titleFont,"center",pannel.L,bleu_kelo4)
   pannel.addTexte("titre2",0,pannel.H*0.25,"R u n N e R",titleFont,"center",pannel.L,bleu_kelo4)  
  
   pannel.addButton("play",pannel.L/3,pannel.H*0.33 ,pannel.L/3,pannel.H/10,"PlaY",buttonFont,noir,blanc,noir)
   pannel.addTexte("textmode",pannel.L/3,pannel.H*0.48,"HarD mOde",buttonFont,"left",pannel.L,bleu_kelo4) 
   pannel.addSwitch ("mode",pannel.L*2/3-58,pannel.H*0.45,58,60)
      
   pannel.addButton("rules",pannel.L/3,pannel.H*0.55 ,pannel.L/3,pannel.H/10,"RègLeS"   ,buttonFont,noir,blanc,noir)
   pannel.addButton("credits",pannel.L/3,pannel.H*0.7 ,pannel.L/3,pannel.H/10,"CréDitS"   ,buttonFont,noir,blanc,noir)
  
   pannel.addButton("exit"   ,pannel.L/3,pannel.H*0.85 ,pannel.L/3,pannel.H/10,"QuiTteR"   ,buttonFont,noir,blanc,noir)


   pannel.elt["play"].addSkin(bouton)
   pannel.elt["mode"].addSkin(switch)
   pannel.elt["rules"].addSkin(bouton)
   pannel.elt["credits"].addSkin(bouton)
   pannel.elt["exit"].addSkin(bouton)
   pannel.addSkin(endScreen)
   
   --music_man.play("menu",0)
  
end


scene_menu.update = function(dt)
   if scene_menu.hardMode then
      shader:send("rayon",250)
      shader:send("mouse",{mouse.x,mouse.y})
      shader:send("light",1)
   end
   pannel.update(dt,mouse.x,mouse.y)
end

scene_menu.draw = function()
  if scene_menu.hardMode then
      love.graphics.setShader(shader)
      pannel.draw()
      love.graphics.setShader()
   else
      pannel.draw()
   end
end

scene_menu.mousepressed = function(px,py,pbutton)
  
end

scene_menu.mousereleased = function(px,py,pbutton)
   if pannel.elt["play"].isIn(px,py) and pbutton==1 then
     scene_man.next_scene = scene_man.list["game"]
     Game.init()
     love.mouse.setVisible(false)
     snd_clic_menu_2:play()
     music_man.stop()
     snd_drag:play()
  end
    if pannel.elt["mode"].isIn(px,py) and pbutton==1 then
     pannel.elt["mode"].switch()
     scene_menu.hardMode = not scene_menu.hardMode
     snd_clic_menu_2:play()
  end
  if pannel.elt["credits"].isIn(px,py) and pbutton==1 then
     scene_man.next_scene = scene_man.list["credits"]
     snd_clic_menu_2:play()
  end
  if pannel.elt["rules"].isIn(px,py) and pbutton==1 then
     scene_man.next_scene = scene_man.list["rules"]
     snd_clic_menu_2:play()
  end
  if pannel.elt["exit"].isIn(px,py) and pbutton==1 then
    love.event.quit()
  end
end

function scene_menu.mousemoved(px,py,pdx,pdy)

end

function scene_menu.keypressed(key)
 
    
end
function scene_menu.focus(focus)
  
end
function scene_menu.textinput(txt)

end
function scene_menu.quit()
  
end
return scene_menu
