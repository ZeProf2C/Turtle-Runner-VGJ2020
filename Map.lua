Map = {}

function Map.load()
    Map.backgroudImage = backgroundPlage
end

function Map.update(dt)
    
end

function Map.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(backgroundImage, 0, 0, 0)
end