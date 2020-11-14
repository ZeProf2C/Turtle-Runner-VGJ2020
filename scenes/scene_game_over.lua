scene_game_over = {}

local pannel = mGui.CreatePannel(0,0 ,650,800,blanc, blanc)

  pannel.addTexte("titre",0,50,"GAME OVER",overFont,"center",pannel.L,orange)
  --pannel.addTexte("text",0,140,"Distance parcourue :",statFont,"center",pannel.L,bleu_kelo2)
  pannel.addTexte("distance",0,150,Game.percent.."%",statFont,"center",pannel.L,bleu_kelo2)
  pannel.addButton("newGame" ,pannel.L*2/3  ,pannel.H*0.37,pannel.L/4,pannel.H/12,"New gaMe",buttonFont,noir,blanc,noir)
  pannel.addButton("menu" ,pannel.L*2/3  ,pannel.H*0.5,pannel.L/4,pannel.H/12,"Menu",buttonFont,noir,blanc,noir)
  
  pannel.addSkin(gameOver)
  pannel.elt["newGame"].addSkin(bouton)
  pannel.elt["menu"].addSkin(bouton)

scene_game_over.load = function()
  
end


scene_game_over.update = function(dt)
pannel.update(dt,mouse.x , mouse.y)
pannel.elt["distance"].info = tostring(Game.percent).."%"
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
