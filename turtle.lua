Turtle = {}

--position de la Turtle
Turtle.x = screen.L/2
Turtle.y = 3*screen.H/4

--vecteur vitesse de la Turtle
Turtle.Vx = 300

Turtle.scrollingAcceleration = 1000
Turtle.scrollingSpeed = 350
Turtle.scrollingSpeedMax = 2000
Turtle.scrollingSpeedMin = 500

function Turtle.update(dt)
    if love.keyboard.isDown("right") then
        Turtle.x = Turtle.x + Turtle.Vx*dt
    elseif love.keyboard.isDown("left") then
        Turtle.x = Turtle.x - Turtle.Vx*dt
    end

    if love.keyboard.isDown("up") and  Turtle.scrollingSpeed <= Turtle.scrollingSpeedMax then
        Turtle.scrollingSpeed = Turtle.scrollingSpeed + Turtle.scrollingAcceleration * dt
        
    elseif love.keyboard.isDown("down") and  Turtle.scrollingSpeed >= Turtle.scrollingSpeedMin then
        Turtle.scrollingSpeed = Turtle.scrollingSpeed - Turtle.scrollingAcceleration * dt
    end
   


end


function Turtle.draw()
    love.graphics.setColor(0,1,0)
    love.graphics.rectangle('fill',Turtle.x,Turtle.y,50,100)
end


