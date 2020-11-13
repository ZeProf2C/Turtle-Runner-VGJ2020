require("particlesand")
Turtle = {}

Turtle.currentFrame = 1
Turtle.x = screen.L*0.5
Turtle.y = screen.H*0.8
Turtle.Width = 75
Turtle.Height = 75

Turtle.isBegin = false

Turtle.Assets = {}
    Turtle.Assets.Run = {}
    Turtle.Assets.Run.img = turtleRun
    Turtle.Assets.Run.Width = Turtle.Assets.Run.img:getWidth()/4
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
    Turtle.Assets.Intro.img = turtleIntro
    Turtle.Assets.Intro.Width = Turtle.Assets.Intro.img:getWidth()/5-12 --  -12 permet de bien croper l'image
    Turtle.Assets.Intro.Height = Turtle.Assets.Intro.img:getHeight()
    Turtle.Assets.Intro.scaleX =  Turtle.Width/Turtle.Assets.Intro.Width
    Turtle.Assets.Intro.scaleY = Turtle.Height/Turtle.Assets.Intro.Height


Turtle.Vx = 300
Turtle.scrollingAcceleration = 500
Turtle.scrollingSpeed = 350
Turtle.animSpeed = Turtle.scrollingSpeed/350
Turtle.scrollingSpeedMax = 1500
Turtle.scrollingSpeedMin = 100

Turtle.state = "intro"
Turtle.jumpTimer = 0
Turtle.jumpTime  = 0.5
Turtle.jumpScaleSpeed = 0.25

Turtle.Ombre = {}
    Turtle.Ombre.y = Turtle.y + 3
    Turtle.Ombre.scaleX = Turtle.Assets.Run.scaleX
    Turtle.Ombre.scaleY = Turtle.Assets.Run.scaleY
    Turtle.Ombre.Slide = 250

Turtle.AnimationRun = newAnimation(Turtle.Assets.Run.img,Turtle.Assets.Run.Width,Turtle.Assets.Run.Height,0.2,4, Turtle.animSpeed)
Turtle.AnimationIntro = newAnimation(Turtle.Assets.Intro.img,Turtle.Assets.Intro.Width,Turtle.Assets.Intro.Height,0.3,5)

Turtle.jet_de_sable = create_emitter(Turtle.x,Turtle.y,15)


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
            Turtle.Ombre.scaleY = Turtle.Assets.Run.scaleY
            snd_atterissage:play()
        end
        
    end
        
end

function Turtle.Hatch()
    if Turtle.AnimationIntro:getCurrentFrame() ==  5 then
        Turtle.AnimationIntro:stop()
        Turtle.isBegin = true
        Map.isBegin = true
        Turtle.state = "run"
        Turtle.jet_de_sable.init()
    end
end

function Turtle.update(dt)

   if Turtle.state == "run" then
      if  Turtle.AnimationRun:getCurrentFrame()~= Turtle.currentFrame and Turtle.AnimationRun:getCurrentFrame()%2==1 then
         snd_walk:play()
         Turtle.currentFrame = Turtle.AnimationRun:getCurrentFrame()
      end
      
   end
   
    if love.keyboard.isDown("right") and Turtle.state == "run" then
        Turtle.x = Turtle.x + Turtle.Vx*dt

        Turtle.jet_de_sable.x=Turtle.x
        for _, particle in pairs(Turtle.jet_de_sable.list)  do
            particle.x = particle.x + Turtle.Vx*dt            
        end
    elseif love.keyboard.isDown("left") and Turtle.state == "run" then
        Turtle.x = Turtle.x - Turtle.Vx*dt

        Turtle.jet_de_sable.x=Turtle.x
        for _, particle in pairs(Turtle.jet_de_sable.list)  do
            particle.x = particle.x - Turtle.Vx*dt            
        end
    end

    if love.keyboard.isDown("up") and  Turtle.scrollingSpeed <= Turtle.scrollingSpeedMax then
        Turtle.scrollingSpeed = Turtle.scrollingSpeed + Turtle.scrollingAcceleration * dt
        Turtle.animSpeed = Turtle.animSpeed + Turtle.scrollingAcceleration/1000*dt
        
    elseif love.keyboard.isDown("down") and  Turtle.scrollingSpeed >= Turtle.scrollingSpeedMin then
        Turtle.scrollingSpeed = Turtle.scrollingSpeed - Turtle.scrollingAcceleration * dt
        Turtle.animSpeed = Turtle.animSpeed - Turtle.scrollingAcceleration/1000*dt
    end

    Turtle.jump(dt)
    
    Turtle.AnimationRun:update(dt, Turtle.animSpeed)
    Turtle.AnimationIntro:update(dt, Turtle.animSpeed)



    if Turtle.isBegin then
        Turtle.AnimationRun:play()
    else
        Turtle.AnimationRun:stop()
        Turtle.Hatch()
    end
    

    Turtle.jet_de_sable.update(dt)

end

function Turtle.draw()

    if Turtle.state == "run" then

        Turtle.jet_de_sable.draw()

        love.graphics.setColor(0,0,0,0.5)
        Turtle.AnimationRun:draw(Turtle.x,Turtle.Ombre.y,0,Turtle.Ombre.scaleX,Turtle.Ombre.scaleY,Turtle.Assets.Run.Width*0.5,Turtle.Assets.Run.Height*0.5)
        
        love.graphics.setColor(1,1,1)
        Turtle.AnimationRun:draw(Turtle.x,Turtle.y,0,Turtle.Assets.Run.scaleX,Turtle.Assets.Run.scaleY,Turtle.Assets.Run.Width*0.5,Turtle.Assets.Run.Height*0.5)


    elseif Turtle.state == "jump" then
        love.graphics.setColor(0,0,0,0.5)
        love.graphics.draw(Turtle.Assets.Jump.img,Turtle.x,Turtle.Ombre.y,0,Turtle.Ombre.scaleX,Turtle.Ombre.scaleY,Turtle.Assets.Jump.Width*0.5,Turtle.Assets.Jump.Height*0.5)
        
        love.graphics.setColor(1,1,1)
        love.graphics.draw(Turtle.Assets.Jump.img,Turtle.x,Turtle.y,0,Turtle.Assets.Jump.scaleX,Turtle.Assets.Jump.scaleY,Turtle.Assets.Jump.Width*0.5,Turtle.Assets.Jump.Height*0.5)

    elseif Turtle.state == "intro" then
        love.graphics.setColor(1,1,1)
        Turtle.AnimationIntro:draw(Turtle.x,Turtle.y,0,Turtle.Assets.Intro.scaleX,Turtle.Assets.Intro.scaleY,Turtle.Assets.Intro.Width*0.5,Turtle.Assets.Intro.Height*0.5)
    end

end

function Turtle.keypressed(key)
    if key == "space" and Turtle.state == "run" then
        Turtle.state = "jump"
        snd_jump:play()
    end
end


