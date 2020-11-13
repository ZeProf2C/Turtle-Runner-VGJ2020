scene_rule = {}


local pannel = mGui.CreatePannel(0,50 ,600,800,transparent, transparent)
  pannel.addTexte("titre",0,0,"RèGLeS",titleFont,"center",pannel.L,ambre)
  
  pannel.addButton("back" ,pannel.L/3  ,pannel.H*0.8,pannel.L/3,pannel.H/10,"ReTouR",buttonFont,noir,noir,noir)
  
  pannel.elt["back"].addSkin(bouton)
  
scene_rule.load = function()
  
end


scene_rule.update = function(dt)
   pannel.update(dt,mouse.x , mouse.y)
end

scene_rule.draw = function()
   pannel.draw()
end

scene_rule.mousepressed = function(px,py,pbutton)
  
end

scene_rule.mousereleased = function(px,py,pbutton)
   if pannel.elt["back"].isIn(px,py) and pbutton==1 then
    scene_man.next_scene = scene_man.list["menu"]
    snd_clic_menu_2:play()
  end
end

scene_rule.mousemoved = function(px,py,pdx,pdy)

end

function scene_rule.keypressed(key)
 
    
end
function scene_rule.focus(focus)
  
end
function scene_rule.textinput(txt)

end
function scene_rule.quit()
  
end
return scene_rule
