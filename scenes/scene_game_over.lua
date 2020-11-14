scene_game_over = {}

local pannel = mGui.CreatePannel(0,0 ,650,800,blanc, blanc)

  pannel.addTexte("titre",0,50,"GAME OVER",overFont,"center",pannel.L,orange)
  pannel.addButton("newGame" ,pannel.L/3  ,pannel.H*0.30,pannel.L/3,pannel.H/10,"NouVeLLe ParTie",buttonFont,noir,bleu_kelo1,noir)
  pannel.addButton("menu" ,pannel.L/3  ,pannel.H*0.45,pannel.L/3,pannel.H/10,"Menu",buttonFont,noir,bleu_kelo1,noir)
  
  pannel.addSkin(gameOver)
  pannel.elt["newGame"].addSkin(bouton)
  pannel.elt["menu"].addSkin(bouton)

scene_game_over.load = function()
  
end


scene_game_over.update = function(dt)
pannel.update(dt,mouse.x , mouse.y)
end

scene_game_over.draw = function()
pannel.draw()
end

scene_game_over.mousepressed = function(px,py,pbutton)
  
end

scene_game_over.mousereleased = function(px,py,pbutton)
  if pannel.elt["newGame"].isIn(px,py) and pbutton==1 then
    scene_man.next_scene = scene_man.list["game"]
    Game.init()
    music_man.stop()
    snd_clic_menu_2:play()
    snd_drag:play()
  end
  if pannel.elt["menu"].isIn(px,py) and pbutton==1 then
    scene_man.next_scene = scene_man.list["menu"]
    snd_clic_menu_2:play()
    music_man.play("menu",0)
  end
end

scene_game_over.mousemoved = function(px,py,pdx,pdy)

end

function scene_game_over.keypressed(key)
 
    
end
function scene_game_over.focus(focus)
  
end
function scene_game_over.textinput(txt)

end
function scene_game_over.quit()
  
end
return scene_game_over
