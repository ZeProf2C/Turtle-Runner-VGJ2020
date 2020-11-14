Map = {}




Map.init = function()
    Map.image = {}
    Map.image.src = backgroungPlage
    Map.image.width = Map.image.src:getWidth()
    Map.image.height = Map.image.src:getHeight()
    Map.image.endScreen = endScreen

    Map.isEnd = false
    Map.isBegin = false
    Map.oy = 0
    Map.totalY = 0
end

function Map.load()
    
end

function Map.update(dt, scrollSpeed)
    scrollSpeed = scrollSpeed or 350
    scrollSpeed = scrollSpeed * dt
    
    if Map.isBegin then
        Map.oy = Map.oy-scrollSpeed
        Map.totalY = Map.totalY-scrollSpeed
    end
    
end


function Map.draw()
    
    if Map.isEnd then
        if Map.oy <= -Map.image.height*2  then
            Map.oy = -Map.image.height*2
            
        end
    elseif Map.oy <= -Map.image.height   then      
        Map.oy = 0
    end
 
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(Map.image.src, 0, 0, 0, 1, 1, 0, Map.oy)
    if Map.isEnd then
        love.graphics.draw(Map.image.src, 0, 0, 0, 1, 1, 0, Map.oy+Map.image.height)
        love.graphics.draw(Map.image.endScreen, 0, 0, 0, 1, 1, 0, Map.oy+Map.image.height*2)
    
        
    else
        love.graphics.draw(Map.image.src, 0, 0, 0, 1, 1, 0, Map.oy+Map.image.height)
        
    end
    if  Map.isEnd then

    end
    
end
