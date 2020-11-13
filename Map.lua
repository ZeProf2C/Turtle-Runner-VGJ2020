Map = {}

function Map.load()
    Map.backgroudImage = love.graphics.newImage("assets/images/background.png")
end

function Map.update(dt)
    
end

function Map.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(backgroundImage, 0, 0, 0)
end