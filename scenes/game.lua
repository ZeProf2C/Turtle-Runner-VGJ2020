Game = {}


require("turtle")
require("map")

Game.load = function()
    Map.load()
end



Game.update = function(dt)
    if not(pannelEscape.on) then
        Map.update(dt,Turtle.scrollingSpeed)
        Turtle.update(dt)
    else
        pannelEscape.update(dt, mouse.x, mouse.y)
    end
end

Game.draw = function()

    Map.draw()
    Turtle.draw()
    
    if pannelEscape.on then
        pannelEscape.draw()
    end

end

Game.mousepressed = function(px,py,pbutton)
  
end

Game.mousereleased = function(px,py,pbutton)
  
end

Game.mousemoved = function(px,py,pdx,pdy)

end

function Game.keypressed(key)
    if key == 'escape' then
        pannelEscape.on = not(pannelEscape.on)
        love.mouse.setVisible(pannelEscape.on)
    end
    Turtle.keypressed(key)
    
end
function Game.focus(focus)
  
end
function Game.textinput(txt)

end
function Game.quit()
  
end
return Game
