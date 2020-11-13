scene_menu = {}

local pannel = mGui.CreatePannel(100,100 ,450,600,gris, blanc,10)

   pannel.addTexte("titre",0,pannel.H*0.1,"T u r T l e",titleFont,"center",pannel.L,ambre)
   pannel.addTexte("titre2",0,pannel.H*0.25,"R u n N e R",titleFont,"center",pannel.L,ambre)  
  
   pannel.addButton("play",pannel.L/3,pannel.H*0.4 ,pannel.L/3,pannel.H/10,"PlaY",buttonFont,noir,ambre,ambre)
   pannel.addButton("credits",pannel.L/3,pannel.H*0.6 ,pannel.L/3,pannel.H/10,"CréDitS"   ,buttonFont,noir,ambre,ambre)
   pannel.addButton("exit"   ,pannel.L/3,pannel.H*0.8 ,pannel.L/3,pannel.H/10,"QuiTteR"   ,buttonFont,noir,ambre,ambre)

scene_menu.load = function()
  
end


scene_menu.update = function(dt)
pannel.update(dt,mouse.x,mouse.y)
end

scene_menu.draw = function()
pannel.draw()
end

scene_menu.mousepressed = function(px,py,pbutton)
  
end

scene_menu.mousereleased = function(px,py,pbutton)
   if pannel.elt["play"].isIn(px,py) and pbutton==1 then
    --scene_man.next_scene = scene_man.list["game"]
     snd_clic_menu_2:play()
  end
  if pannel.elt["credits"].isIn(px,py) and pbutton==1 then
     scene_man.next_scene = scene_man.list["credits"]
     snd_clic_menu_2:play()
  end
  if pannel.elt["exit"].isIn(px,py) and pbutton==1 then
    love.event.quit()
  end
end

scene_menu.mousemoved = function(px,py,pdx,pdy)

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
