Map = {}

Map.isEnd = false

Map.image = {}
    Map.image.src = backgroungPlage
    Map.image.width = Map.image.src:getWidth()
    Map.image.height = Map.image.src:getHeight()
    Map.image.endScreen = endScreen

Map.oy = {}
    Map.oy.first = 0
    Map.oy.second = Map.image.height

function Map.load()
    
end

function Map.update(dt, scrollSpeed)
    scrollSpeed = scrollSpeed or 350
    scrollSpeed = scrollSpeed * dt

    if Map.oy.second <= 0 then
        if not(Map.isEnd) then
            Map.oy.first = 0
            Map.oy.second = Map.image.height
        else
            Map.oy.first = Map.image.height
            Map.oy.second = 0
            scrollSpeed = 0
        end
    end 

    Map.oy.first = Map.oy.first-scrollSpeed
    Map.oy.second = Map.oy.second-scrollSpeed
    
end

function Map.draw()
    love.graphics.setColor(1, 1, 1)
    if not(Map.isEnd) then
        love.graphics.draw(Map.image.src, 0, 0, 0, 1, 1, 0, Map.oy.first)
        love.graphics.draw(Map.image.src, 0, 0, 0, 1, 1, 0, Map.oy.second)
    else
        love.graphics.draw(Map.image.src, 0, 0, 0, 1, 1, 0, Map.oy.first)
        love.graphics.draw(Map.image.endScreen, 0, 0, 0, 1, 1, 0, Map.oy.second)
    end
end