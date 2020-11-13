Turtle = {}


Turtle.x = screen.L*0.5
Turtle.y = screen.H*0.8
Turtle.Width = 75
Turtle.Height = 75

Turtle.isBegin = false

Turtle.Assets = {}
    Turtle.Assets.Run = {}
    Turtle.Assets.Run.img = turtleRun
    Turtle.Assets.Run.Width = Turtle.Assets.Run.img:getWidth()/3
    Turtle.Assets.Run.Height = Turtle.Assets.Run.img:getHeight()
    Turtle.Assets.Run.scaleX =  Turtle.Width/Turtle.Assets.Run.Width
    Turtle.Assets.Run.scaleY = Turtle.Height/Turtle.Assets.Run.Height
    Turtle.Assets.Jump = {}
    Turtle.Assets.Jump.img = turtleJump
    Turtle.Assets.Jump.Width = Turtle.Assets.Jump.img:getWidth()
    Turtle.Assets.Jump.Height = Turtle.Assets.Jump.img:getHeight()
    Turtle.Assets.Jump.scaleX =  Turtle.Width/Turtle.Assets.Jump.Width
    Turtle.Assets.Jump.scaleY = Turtle.Height/Turtle.Assets.Jump.Height
    Turtle.Assets.Intro = {}
    Turtle.Assets.Intro.img = TurtleHatch
    Turtle.Assets.Intro.Width = Turtle.Assets.Intro.img:getWidth()/3
    Turtle.Assets.Intro.Height = Turtle.Assets.RIntroun.img:getHeight()
    Turtle.Assets.Intro.scaleX =  Turtle.Width/Turtle.Assets.Intro.Width
    Turtle.Assets.Intro.scaleY = Turtle.Height/Turtle.Assets.Intro.Height



Turtle.Width = 75
Turtle.Height = 75

Turtle.Vx = 300
Turtle.scrollingAcceleration = 500
Turtle.scrollingSpeed = 350
Turtle.animSpeed = Turtle.scrollingSpeed/350
Turtle.scrollingSpeedMax = 1500
Turtle.scrollingSpeedMin = 100

Turtle.state = "Intro"
Turtle.jumpTimer = 0
Turtle.jumpTime  = 0.5
Turtle.jumpScaleSpeed = 0.25

Turtle.Ombre = {}
    Turtle.Ombre.y = Turtle.y + 3
    Turtle.Ombre.scaleX = Turtle.Assets.Run.scaleX
    Turtle.Ombre.scaleY = Turtle.Assets.Run.scaleY
    Turtle.Ombre.Slide = 250

Turtle.AnimationRun = newAnimation(Turtle.Assets.Run.img,Turtle.Assets.Run.Width,Turtle.Assets.Run.Height,0.2,3, Turtle.animSpeed)
Turtle.AnimationIntro = newAnimation(Turtle.Assets.Intro.img,Turtle.Assets.Intro.Width,Turtle.Assets.Intro.Height,0.3,5)

function Turtle.jump(dt)
    if Turtle.state == "jump" then
        Turtle.jumpTimer = Turtle.jumpTimer + dt
        Turtle.Ombre.Slide = ((math.sin(Turtle.jumpTimer+math.pi/4))/(4*math.pi) + 1)*250
        if Turtle.jumpTimer <= Turtle.jumpTime/2 then
            Turtle.Ombre.y = Turtle.Ombre.y + Turtle.Ombre.Slide * dt
            Turtle.Assets.Jump.scaleX = Turtle.Assets.Jump.scaleX  + Turtle.jumpScaleSpeed * dt
           Turtle.Assets.Jump.scaleY =Turtle.Assets.Jump.scaleY  + Turtle.jumpScaleSpeed * dt
            Turtle.Ombre.scaleX = Turtle.Ombre.scaleX - Turtle.jumpScaleSpeed * dt
            Turtle.Ombre.scaleY = Turtle.Ombre.scaleY - Turtle.jumpScaleSpeed * dt
        elseif Turtle.jumpTimer <= Turtle.jumpTime then
            Turtle.Ombre.y = Turtle.Ombre.y - Turtle.Ombre.Slide * dt
           Turtle.Assets.Jump.scaleX =Turtle.Assets.Jump.scaleX  - Turtle.jumpScaleSpeed * dt
           Turtle.Assets.Jump.scaleY =Turtle.Assets.Jump.scaleY  - Turtle.jumpScaleSpeed * dt
            Turtle.Ombre.scaleX = Turtle.Ombre.scaleX + Turtle.jumpScaleSpeed * dt
            Turtle.Ombre.scaleY = Turtle.Ombre.scaleY + Turtle.jumpScaleSpeed * dt
        end
        if Turtle.jumpTimer >= Turtle.jumpTime then
            Turtle.state = "run"
            Turtle.jumpTimer = 0
           Turtle.Assets.Jump.scaleX = Turtle.Width/Turtle.Assets.Jump.Width
           Turtle.Assets.Jump.scaleY = Turtle.Height/Turtle.Assets.Jump.Height
            Turtle.Ombre.y = Turtle.y + 3
            Turtle.Ombre.scaleX = Turtle.Assets.Run.scaleX
            Turtle.Ombre.scaleY =Turtle.Assets.Run.scaleY
            
        end
    end
        
end

function Turtle.update(dt)
    if love.keyboard.isDown("right") and Turtle.state == "run" then
        Turtle.x = Turtle.x + Turtle.Vx*dt
    elseif love.keyboard.isDown("left") and Turtle.state == "run" then
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

    if Turtle.isBegin then
        Turtle.AnimationIntro:play()
    else
        Turtle.AnimationRun:stop()
    end
    Turtle.Animation:update(dt, Turtle.animSpeed)


end


function Turtle.draw()
    if Turtle.state == "run" then
        love.graphics.setColor(0,0,0,0.5)
        Turtle.AnimationRun:draw(Turtle.x,Turtle.Ombre.y,0,Turtle.Ombre.scaleX,Turtle.Ombre.scaleY,Turtle.Width*0.5,Turtle.Height*0.5)
        
        love.graphics.setColor(1,1,1)
        Turtle.AnimationRun:draw(Turtle.x,Turtle.y,0,Turtle.Assets.Run.scaleX,Turtle.Assets.Run.scaleY,Turtle.Width*0.5,Turtle.Height*0.5)

    elseif Turtle.state == "jump" then
        love.graphics.setColor(0,0,0,0.5)
        love.graphics.draw(Turtle.Assets.Jump.img,Turtle.x,Turtle.Ombre.y,0,Turtle.Ombre.scaleX,Turtle.Ombre.scaleY,Turtle.Width*0.5,Turtle.Height*0.5)
        
        love.graphics.setColor(1,1,1)
        love.graphics.draw(Turtle.Assets.Jump.img,Turtle.x,Turtle.y,0,Turtle.Assets.Jump.scaleX,Turtle.Assets.Jump.scaleY,Turtle.Width*0.5,Turtle.Height*0.5)

    elseif Turtle.state == "Intro" then

    end

end

function Turtle.keypressed(key)
    if key == "space" and Turtle.state == "run" then
        Turtle.state = "jump"
    end
end


