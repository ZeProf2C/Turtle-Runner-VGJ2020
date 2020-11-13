Map = {}


Map.image = {}
    Map.image.src = backgroungPlage
    Map.image.width = Map.image.src:getWidth()
    Map.image.height = Map.image.src:getHeight()

Map.oy = {}
    Map.oy.first = 0
    Map.oy.second = Map.image.height


function Map.load()
    
end

function Map.update(dt, scrollSpeed)
    scrollSpeed = scrollSpeed or 350
    scrollSpeed = scrollSpeed * dt
    Map.oy.first = Map.oy.first-scrollSpeed
    Map.oy.second = Map.oy.second-scrollSpeed

    if Map.oy.second <= 0 then
        Map.oy.first = 0
        Map.oy.second = Map.image.height
    end 
    
end

function Map.draw()
    love.graphics.setColor(1, 1, 1)

    love.graphics.draw(Map.image.src, 0, 0, 0, 1, 1, 0, Map.oy.first)
    love.graphics.draw(Map.image.src, 0, 0, 0, 1, 1, 0, Map.oy.second)

end