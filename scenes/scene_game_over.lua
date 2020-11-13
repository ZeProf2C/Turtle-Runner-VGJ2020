scene_game_over = {}

scene_game_over.load = function()
  
end


scene_game_over.update = function(dt)

end

scene_game_over.draw = function()
love.graphics.setColor(blanc)
love.graphics.printf("GAMEOVER",325,400,650,"center")
end

scene_game_over.mousepressed = function(px,py,pbutton)
  
end

scene_game_over.mousereleased = function(px,py,pbutton)
  
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
