Map = {}

Map.isEnd = false
Map.isBegin = false

Map.image = {}
    Map.image.src = backgroungPlage
    Map.image.width = Map.image.src:getWidth()
    Map.image.height = Map.image.src:getHeight()
    Map.image.endScreen = endScreen

Map.oy = 0


function Map.load()
    
end

function Map.update(dt, scrollSpeed)
    scrollSpeed = scrollSpeed or 350
    scrollSpeed = scrollSpeed * dt
    
    if Map.isBegin then
        Map.oy = Map.oy-scrollSpeed
    end
    
end

function Map.draw()
    if Map.oy <= -Map.image.height then
        if Map.isEnd then
            Map.oy = -1600
        else
            Map.oy = 0
        end
    end 
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(Map.image.src, 0, 0, 0, 1, 1, 0, Map.oy)
    if Map.isEnd then
        love.graphics.draw(Map.image.endScreen, 0, 0, 0, 1, 1, 0, Map.oy+Map.image.height)
    else
        love.graphics.draw(Map.image.src, 0, 0, 0, 1, 1, 0, Map.oy+Map.image.height)
    end
end