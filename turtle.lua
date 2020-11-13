Turtle = {}


Turtle.x = screen.L*0.5
Turtle.y = screen.H*0.8
Turtle.Width = (turtle:getWidth()/3)*0.125
Turtle.Height = (turtle:getHeight())*0.125

Turtle.Vx = 300
Turtle.scrollingAcceleration = 500
Turtle.scrollingSpeed = 350
Turtle.animSpeed = Turtle.scrollingSpeed/350
Turtle.scrollingSpeedMax = 1500
Turtle.scrollingSpeedMin = 100

Turtle.state = "run"
Turtle.jumpTimer = 0
Turtle.jumpTime  = 0.5
Turtle.jumpSpeed = 500
Turtle.jumpScaleSpeed = 0.25

Turtle.scaleX = Turtle.Width/(turtle:getWidth()/3)
Turtle.scaleY = Turtle.Height/turtle:getHeight()

Turtle.Ombre = {}
Turtle.Ombre.ecart = 3
Turtle.Ombre.scaleX = Turtle.Width/(turtle:getWidth()/3)
Turtle.Ombre.scaleY = Turtle.Height/turtle:getHeight()

Turtle.Animation = newAnimation(turtle,turtle:getWidth()/3,turtle:getHeight(),0.2,3, Turtle.animSpeed)

function Turtle.jump(dt)
    if Turtle.state == "jump" then
        Turtle.jumpTimer = Turtle.jumpTimer + dt
        if Turtle.jumpTimer <= Turtle.jumpTime/2 then
            Turtle.y =  Turtle.y - Turtle.jumpSpeed * dt
            Turtle.Ombre.ecart = Turtle.Ombre.ecart + Turtle.jumpSpeed * dt
            Turtle.scaleX = Turtle.scaleX  + Turtle.jumpScaleSpeed * dt
            Turtle.scaleY = Turtle.scaleY  + Turtle.jumpScaleSpeed * dt
            Turtle.Ombre.scaleX = Turtle.Ombre.scaleX - Turtle.jumpScaleSpeed * dt
            Turtle.Ombre.scaleY = Turtle.Ombre.scaleY - Turtle.jumpScaleSpeed * dt
        elseif Turtle.jumpTimer <= Turtle.jumpTime then
            Turtle.y =  Turtle.y + Turtle.jumpSpeed * dt
            Turtle.Ombre.ecart = Turtle.Ombre.ecart - Turtle.jumpSpeed * dt
            Turtle.scaleX = Turtle.scaleX  - Turtle.jumpScaleSpeed * dt
            Turtle.scaleY = Turtle.scaleY  - Turtle.jumpScaleSpeed * dt
            Turtle.Ombre.scaleX = Turtle.Ombre.scaleX + Turtle.jumpScaleSpeed * dt
            Turtle.Ombre.scaleY = Turtle.Ombre.scaleY + Turtle.jumpScaleSpeed * dt
        end
        if Turtle.jumpTimer >= Turtle.jumpTime then
            Turtle.state = "run"
            Turtle.jumpTimer = 0
            Turtle.scaleX = Turtle.Width/(turtle:getWidth()/3)
            Turtle.scaleY = Turtle.Height/turtle:getHeight()
            Turtle.Ombre.ecart = 3
            Turtle.Ombre.scaleX = Turtle.Height/turtle:getHeight()
            Turtle.Ombre.scaleY = Turtle.Width/(turtle:getWidth()/3)
            
        end
    end
        
end

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

    Turtle.jump(dt)

    Turtle.Animation:update(dt, Turtle.animSpeed)


end


function Turtle.draw()
    
    love.graphics.setColor(0,0,0,0.5)
    Turtle.Animation:draw(Turtle.x-Turtle.Width*0.5,Turtle.y-Turtle.Height*0.5+Turtle.Ombre.ecart,0,Turtle.Ombre.scaleX,Turtle.Ombre.scaleY)
        
    love.graphics.setColor(1,1,1)
    Turtle.Animation:draw(Turtle.x-Turtle.Width*0.5,Turtle.y-Turtle.Height*0.5,0,Turtle.scaleX,Turtle.scaleY)

end

function Turtle.keypressed(key)
    if key == "space" and Turtle.state == "run" then
        Turtle.state = "jump"
    end
end


