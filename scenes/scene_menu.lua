scene_menu = {}

local pannel = mGui.CreatePannel(100,100 ,450,600,gris, blanc,10)

   pannel.addTexte("titre",0,pannel.H*0.1,"T u r T l e",titleFont,"center",pannel.L,ambre)
   pannel.addTexte("titre2",0,pannel.H*0.25,"R u n N e R",titleFont,"center",pannel.L,ambre)  
  
   pannel.addButton("play",pannel.L/3,pannel.H*0.4 ,pannel.L/3,pannel.H/10,"PlaY",buttonFont,noir,bleu_elec,noir)
   pannel.addButton("rules",pannel.L/3,pannel.H*0.55 ,pannel.L/3,pannel.H/10,"RègLeS"   ,buttonFont,noir,noir,noir)
   pannel.addButton("credits",pannel.L/3,pannel.H*0.7 ,pannel.L/3,pannel.H/10,"CréDitS"   ,buttonFont,noir,noir,noir)
  
   pannel.addButton("exit"   ,pannel.L/3,pannel.H*0.85 ,pannel.L/3,pannel.H/10,"QuiTteR"   ,buttonFont,noir,noir,noir)


   pannel.elt["play"].addSkin(bouton)
   pannel.elt["rules"].addSkin(bouton)
   pannel.elt["credits"].addSkin(bouton)
   pannel.elt["exit"].addSkin(bouton)
      
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
     scene_man.next_scene = scene_man.list["game"]
     love.mouse.setVisible(false)
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
