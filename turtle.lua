Turtle = {}

--position de la Turtle
Turtle.x = screen.L*0.5
Turtle.y = screen.H*0.8
Turtle.Width = (turtle:getWidth()/2)/8
Turtle.Height = (turtle:getHeight())/8

--vecteur vitesse de la Turtle
Turtle.Vx = 300

Turtle.scrollingAcceleration = 1000
Turtle.scrollingSpeed = 700
Turtle.scrollingSpeedMax = 2000
Turtle.scrollingSpeedMin = 500

Turtle.Animation = newAnimation(turtle,turtle:getWidth()/2,turtle:getHeight(),0.2,2)

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
   
    Turtle.Animation:update(dt)

end


function Turtle.draw()
    love.graphics.setColor(1,1,1)
    Turtle.Animation:draw(Turtle.x-Turtle.Width*0.5,Turtle.y-Turtle.Height*0.5,0,Turtle.Width/(turtle:getWidth()*0.5),Turtle.Height/turtle:getHeight())

end


