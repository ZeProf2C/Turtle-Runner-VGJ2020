require("particlesand")
Turtle = {}

Turtle.init = function()
    Turtle.currentFrame = 1
    Turtle.x = screen.L*0.5
    Turtle.y = screen.H*0.8
    Turtle.Width = 50
    Turtle.Height = 50
    Turtle.alpha  = 1
    Turtle.valpha = 0.6   
    Turtle.color  = {1,1,1,alpha}
    Turtle.win = false

     


    Turtle.isBegin = false

    Turtle.Assets = {}
        Turtle.Assets.Run = {}
        Turtle.Assets.Run.img = turtleRun
        Turtle.Assets.Run.nbFrame = 4
        Turtle.Assets.Run.Width = Turtle.Assets.Run.img:getWidth()/Turtle.Assets.Run.nbFrame
        Turtle.Assets.Run.Height = Turtle.Assets.Run.img:getHeight()
        Turtle.Assets.Run.scaleX =  Turtle.Width/Turtle.Assets.Run.Width
        Turtle.Assets.Run.scaleY = Turtle.Height/Turtle.Assets.Run.Height
        Turtle.Assets.Jump = {}
        Turtle.Assets.Jump.img = turtleJump
        Turtle.Assets.Jump.nbFrame = 1
        Turtle.Assets.Jump.Width = Turtle.Assets.Jump.img:getWidth()
        Turtle.Assets.Jump.Height = Turtle.Assets.Jump.img:getHeight()
        Turtle.Assets.Jump.scaleX =  Turtle.Width/Turtle.Assets.Jump.Width
        Turtle.Assets.Jump.scaleY = Turtle.Height/Turtle.Assets.Jump.Height
      Turtle.Assets.Intro = {}
        Turtle.Assets.Intro.img = turtleIntro
        Turtle.Assets.Intro.nbFrame = 5
        Turtle.Assets.Intro.Width = Turtle.Assets.Intro.img:getWidth()/Turtle.Assets.Intro.nbFrame-12 --  -12 permet de bien croper l'image
        Turtle.Assets.Intro.Height = Turtle.Assets.Intro.img:getHeight()
        Turtle.Assets.Intro.scaleX =  Turtle.Width/Turtle.Assets.Intro.Width
        Turtle.Assets.Intro.scaleY = Turtle.Height/Turtle.Assets.Intro.Height
      Turtle.Assets.Death = {}
        Turtle.Assets.Death.img = turtledead
        Turtle.Assets.Death.nbFrame = 4
        Turtle.Assets.Death.Width = Turtle.Assets.Death.img:getWidth()/Turtle.Assets.Death.nbFrame
        Turtle.Assets.Death.Height = Turtle.Assets.Death.img:getHeight()
        Turtle.Assets.Death.scaleX =  Turtle.Width/Turtle.Assets.Death.Width
        Turtle.Assets.Death.scaleY = Turtle.Height/Turtle.Assets.Death.Height


    Turtle.Vx = 300
    Turtle.scrollingAcceleration = 500
    Turtle.scrollingSpeed = 350
    Turtle.animSpeed = Turtle.scrollingSpeed/350
    Turtle.scrollingSpeedMax = 1500
    Turtle.scrollingSpeedMin = 100

    Turtle.state = "intro"
    Turtle.jumpTimer = 0
    Turtle.jumpTime  = 0.8
    Turtle.jumpScaleSpeed = 0.25

    Turtle.Ombre = {}
        Turtle.Ombre.y = Turtle.y + 3
        Turtle.Ombre.scaleX = Turtle.Assets.Run.scaleX
        Turtle.Ombre.scaleY = Turtle.Assets.Run.scaleY
        Turtle.Ombre.Slide = 250
        Turtle.Ombre.color = {0,0,0,0.5}

    Turtle.AnimationRun   = newAnimation(Turtle.Assets.Run.img,Turtle.Assets.Run.Width,Turtle.Assets.Run.Height,0.2,Turtle.Assets.Run.nbFrame, Turtle.animSpeed)
    Turtle.AnimationIntro = newAnimation(Turtle.Assets.Intro.img,Turtle.Assets.Intro.Width,Turtle.Assets.Intro.Height,0.3,Turtle.Assets.Intro.nbFrame)
    Turtle.AnimationDeath = newAnimation(Turtle.Assets.Death.img,Turtle.Assets.Death.Width,Turtle.Assets.Death.Height,0.3,Turtle.Assets.Death.nbFrame)
    Turtle.jet_de_sable   = create_emitter(Turtle.x,Turtle.y,15)
end




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
      Turtle.AnimationIntro:reset()
      Game.startAnimation()
      Turtle.state = "run"
      music_man.play("ambiance_game",0)
      Turtle.jet_de_sable.init()
   end
end

function Turtle.EndLevelAnim (dt)
    if Turtle.y > screen.H*0.3  then
        Turtle.y = Turtle.y - 100 * dt
        Turtle.Ombre.y = Turtle.y + 3
        Turtle.AnimationRun:update(dt, 0.5)
        if Turtle.y > screen.H*0.5  then
            Turtle.jet_de_sable.y=Turtle.y
        else
            Turtle.state = "swim"
            Turtle.alpha = Turtle.alpha - Turtle.valpha*dt
            Turtle.color = {Turtle.alpha,Turtle.alpha,1,Turtle.alpha}
            Turtle.Ombre.color = {0,0,0,Turtle.alpha*0.5}
        end
        
    elseif not(Turtle.win) then
        love.mouse.setVisible(true)
        Turtle.win = true
        scene_man.next_scene = scene_man.list["victory"]
        
    end
    
end 


function Turtle.update(dt)

   if Turtle.state == "run" then
      if  Turtle.AnimationRun:getCurrentFrame()~= Turtle.currentFrame and Turtle.AnimationRun:getCurrentFrame()%2==1 then
         snd_walk:play()
         Turtle.currentFrame = Turtle.AnimationRun:getCurrentFrame()
      end

      if love.keyboard.isDown("right")  then
        Turtle.x = math.min(Turtle.x + Turtle.Vx*dt , 650 - Turtle.Width*1.5)
      if Turtle.x + Turtle.Vx*dt < 650 - Turtle.Width*1.5  then
          Turtle.jet_de_sable.x=Turtle.x
        for _, particle in pairs(Turtle.jet_de_sable.list)  do
            particle.x = particle.x + Turtle.Vx*dt
        end
      end
        
    elseif love.keyboard.isDown("left")  then
        Turtle.x = math.max(Turtle.x - Turtle.Vx*dt , Turtle.Width*1.5)
        if Turtle.x - Turtle.Vx*dt >  Turtle.Width*1.5  then
            Turtle.jet_de_sable.x=Turtle.x
          for _, particle in pairs(Turtle.jet_de_sable.list)  do
              particle.x = particle.x - Turtle.Vx*dt
          end
        end

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
        Turtle.AnimationDeath:stop()
        
        Turtle.Hatch()
        
    end
    

    Turtle.jet_de_sable.update(dt)
    
    if Turtle.lose then
        if Turtle.AnimationDeath:getCurrentFrame() ==  Turtle.Assets.Death.nbFrame then            
            Turtle.AnimationDeath:stop()
            love.mouse.setVisible(true)
            scene_man.next_scene = scene_man.list["game_over"]
            music_man.play("game_over",0)
         end
         Game.stopAnimation()
         Turtle.AnimationDeath:play()
         Turtle.state = "dead"
         
        end
    Turtle.AnimationDeath:update(dt,Turtle.animSpeed)

    if Map.oy <= -Map.image.height*2 then
        Turtle.EndLevelAnim(dt)
    end
end

function Turtle.draw()
    
    if Turtle.state == "run" then
        Turtle.jet_de_sable.draw()

        love.graphics.setColor(Turtle.Ombre.color)
        Turtle.AnimationRun:draw(Turtle.x,Turtle.Ombre.y,0,Turtle.Ombre.scaleX,Turtle.Ombre.scaleY,Turtle.Assets.Run.Width*0.5,Turtle.Assets.Run.Height*0.5)
        
        love.graphics.setColor(Turtle.color)
        Turtle.AnimationRun:draw(Turtle.x,Turtle.y,0,Turtle.Assets.Run.scaleX,Turtle.Assets.Run.scaleY,Turtle.Assets.Run.Width*0.5,Turtle.Assets.Run.Height*0.5)


    elseif Turtle.state == "jump" or Turtle.state == "swim" then
        love.graphics.setColor(Turtle.Ombre.color)
        love.graphics.draw(Turtle.Assets.Jump.img,Turtle.x,Turtle.Ombre.y,0,Turtle.Ombre.scaleX,Turtle.Ombre.scaleY,Turtle.Assets.Jump.Width*0.5,Turtle.Assets.Jump.Height*0.5)
        
        love.graphics.setColor(Turtle.color)
        love.graphics.draw(Turtle.Assets.Jump.img,Turtle.x,Turtle.y,0,Turtle.Assets.Jump.scaleX,Turtle.Assets.Jump.scaleY,Turtle.Assets.Jump.Width*0.5,Turtle.Assets.Jump.Height*0.5)

    elseif Turtle.state == "intro" then
        
        love.graphics.setColor(Turtle.color)
        Turtle.AnimationIntro:draw(Turtle.x,Turtle.y,0,Turtle.Assets.Intro.scaleX,Turtle.Assets.Intro.scaleY,Turtle.Assets.Intro.Width*0.5,Turtle.Assets.Intro.Height*0.5)
        
    elseif Turtle.state == "dead" then
         love.graphics.setColor(Turtle.Ombre.color)
        Turtle.AnimationDeath:draw(Turtle.x,Turtle.Ombre.y,0,Turtle.Ombre.scaleX,Turtle.Ombre.scaleY,Turtle.Assets.Death.Width*0.5,Turtle.Assets.Death.Height*0.5)
        
        love.graphics.setColor(Turtle.color)
        Turtle.AnimationDeath:draw(Turtle.x,Turtle.y,0,Turtle.Assets.Death.scaleX,Turtle.Assets.Death.scaleY,Turtle.Assets.Death.Width*0.5,Turtle.Assets.Death.Height*0.5)
    end
      
   end



function Turtle.keypressed(key)
    if key == "space" and Turtle.state == "run" then
        Turtle.state = "jump"
        snd_jump:play()
    end
end


