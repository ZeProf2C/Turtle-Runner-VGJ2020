local camera = {}
 camera.shake     = false
 camera.time      = 0
 camera.intensite = 10
 camera.duration  = 0.3
 camera.canvas = love.graphics.newCanvas(screen.L , screen.H) 

function camera.onShake(dt)
   camera.time = camera.time + dt
   if camera.time > camera.duration then 
      camera.time = 0
      camera.shake = false
   end
end

function camera.drawScene(pScene)
    love.graphics.setCanvas(camera.canvas )
    pScene.draw()
    love.graphics.setCanvas()
    love.graphics.setColor(1,1,1)
    if camera.shake then
     love.graphics.draw(camera.canvas ,camera.intensite*(2*love.math.random()-1),camera.intensite*(2*love.math.random()-1))
    else
     love.graphics.draw(camera.canvas ,0,0)
    end
    camera.canvas :renderTo( function() love.graphics.clear() end) 
   end


return camera