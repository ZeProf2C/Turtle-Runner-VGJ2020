scene_basique = {}

require("Map")
require("turtle")
scene_basique.load = function()
    Map.load()
  
end


scene_basique.update = function(dt)
 Turtle.update(dt)
end

scene_basique.draw = function()
    Turtle.draw()

end

scene_basique.mousepressed = function(px,py,pbutton)
  
end

scene_basique.mousereleased = function(px,py,pbutton)
  
end

scene_basique.mousemoved = function(px,py,pdx,pdy)

end

function scene_basique.keypressed(key)
 
    
end
function scene_basique.focus(focus)
  
end
function scene_basique.textinput(txt)

end
function scene_basique.quit()
  
end
return scene_basique
