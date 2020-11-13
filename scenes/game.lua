Game = {}

require("turtle")
require("map")

Game.load = function()
    Map.load()
  
end


Game.update = function(dt)
    Map.update(dt)
    Turtle.update(dt)
end

Game.draw = function()
    Map.draw()
    Turtle.draw()

end

Game.mousepressed = function(px,py,pbutton)
  
end

Game.mousereleased = function(px,py,pbutton)
  
end

Game.mousemoved = function(px,py,pdx,pdy)

end

function Game.keypressed(key)
 
    
end
function Game.focus(focus)
  
end
function Game.textinput(txt)

end
function Game.quit()
  
end
return Game
