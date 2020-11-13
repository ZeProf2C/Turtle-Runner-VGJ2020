Turtle = {}

--position de la Turtle

Turtle.x = screen.L*0.5
Turtle.y = screen.H*0.8
Turtle.Width = (turtle:getWidth()/3)*0.12
Turtle.Height = (turtle:getHeight())*0.12



--vecteur vitesse de la Turtle
Turtle.Vx = 300

Turtle.scrollingAcceleration = 1000
Turtle.scrollingSpeed = 350
Turtle.animSpeed = Turtle.scrollingSpeed/350
Turtle.scrollingSpeedMax = 2000
Turtle.scrollingSpeedMin = 500

Turtle.state = "run"

Turtle.Animation = newAnimation(turtle,turtle:getWidth()/3,turtle:getHeight(),0.2,3, Turtle.animSpeed)

function Turtle.update(dt)
    if love.keyboard.isDown("right") then
        Turtle.x = Turtle.x + Turtle.Vx*dt
    elseif love.keyboard.isDown("left") then
        Turtle.x = Turtle.x - Turtle.Vx*dt
    end

    if love.keyboard.isDown("up") and  Turtle.scrollingSpeed <= Turtle.scrollingSpeedMax then
        Turtle.scrollingSpeed = Turtle.scrollingSpeed + Turtle.scrollingAcceleration * dt
        Turtle.animSpeed = Turtle.animSpeed + Turtle.scrollingAcceleration/1000*dt
        
    elseif love.keyboard.isDown("down") and  Turtle.scrollingSpeed >= Turtle.scrollingSpeedMin then
        Turtle.scrollingSpeed = Turtle.scrollingSpeed - Turtle.scrollingAcceleration * dt
        Turtle.animSpeed = Turtle.animSpeed - Turtle.scrollingAcceleration/1000*dt
    end

    Turtle.Animation:update(dt, Turtle.animSpeed)


end


function Turtle.draw()
    if Turtle.state == "run" then
        love.graphics.setColor(0,0,0,0.5)
        Turtle.Animation:draw(Turtle.x-Turtle.Width*0.5,Turtle.y-Turtle.Height*0.5+3,0,Turtle.Width/(turtle:getWidth()/3),Turtle.Height/turtle:getHeight())

        love.graphics.setColor(1,1,1)
        Turtle.Animation:draw(Turtle.x-Turtle.Width*0.5,Turtle.y-Turtle.Height*0.5,0,Turtle.Width/(turtle:getWidth()/3),Turtle.Height/turtle:getHeight())
    elseif Turtle.state == "idle" then
    else 

    end
    
end


