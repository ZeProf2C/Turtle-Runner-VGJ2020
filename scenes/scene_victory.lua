scene_victory = {}

local pannel = mGui.CreatePannel(0,0 ,650,800,blanc, blanc)

  pannel.addTexte("titre",0,50,"VICTORY",overFont,"center",pannel.L,orange)
  pannel.addButton("newGame" ,pannel.L/3  ,pannel.H*0.30,pannel.L/3,pannel.H/100,"NouVeLLe ParTie",buttonFont,noir,bleu_kelo1,noir)
  pannel.addButton("menu" ,pannel.L/3  ,pannel.H*0.45,pannel.L/3,pannel.H/10,"Menu",buttonFont,noir,bleu_kelo1,noir)
  
  pannel.addSkin(victory)
  pannel.elt["newGame"].addSkin(bouton)
  pannel.elt["menu"].addSkin(bouton)

scene_victory.load = function()
  
end


scene_victory.update = function(dt)
pannel.update(dt,mouse.x , mouse.y)
end

scene_victory.draw = function()
pannel.draw()
end

scene_victory.mousepressed = function(px,py,pbutton)
  
end

scene_victory.mousereleased = function(px,py,pbutton)
  if pannel.elt["newGame"].isIn(px,py) and pbutton==1 then
    scene_man.next_scene = scene_man.list["game"]
    Game.init()
    snd_clic_menu_2:play()
  end
  if pannel.elt["menu"].isIn(px,py) and pbutton==1 then
    scene_man.next_scene = scene_man.list["menu"]
    snd_clic_menu_2:play()
  end
end

scene_victory.mousemoved = function(px,py,pdx,pdy)
end

function scene_victory.keypressed(key)
 
    
end
function scene_victory.focus(focus)
  
end
function scene_victory.textinput(txt)

end
function scene_victory.quit()
  
end

return scene_victory