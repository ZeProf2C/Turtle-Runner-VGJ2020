scene_victory = {}

local pannel
local printError = false

scene_victory.load = function()
  pannel = mGui.CreatePannel(0,0 ,650,800,blanc, blanc)

  pannel.addTexte("titre",0,50,"VICTORY",overFont,"center",pannel.L,vert_pale)
  pannel.addButton("nextLevel" ,pannel.L/3  ,pannel.H*0.5,pannel.L/3,pannel.H/10,"NivEau SuIvAnT",buttonFont,noir,blanc,noir)
  pannel.addButton("menu"      ,pannel.L/3  ,pannel.H*0.7,pannel.L/3,pannel.H/10,"Menu",buttonFont,noir,blanc,noir)
  
  pannel.addSkin(victory)
  pannel.elt["nextLevel"].addSkin(bouton)
  pannel.elt["menu"].addSkin(bouton)
end


scene_victory.update = function(dt)
pannel.update(dt,mouse.x , mouse.y)
end

scene_victory.draw = function()
   pannel.draw()
   if printError then
        love.graphics.setFont(errorFont)
        love.graphics.setColor(noir)
        love.graphics.printf("NON IMPLEMENTE",0,350,650,"center")
   end
end

scene_victory.mousepressed = function(px,py,pbutton)
  
end

scene_victory.mousereleased = function(px,py,pbutton)
  if pannel.elt["nextLevel"].isIn(px,py) and pbutton==1 then
    printError = true
    snd_clic_menu_2:play()
  end
  if pannel.elt["menu"].isIn(px,py) and pbutton==1 then
    scene_man.next_scene = scene_man.list["menu"]
    printError = false
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