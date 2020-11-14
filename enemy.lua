CRAB = "crabe"
BIRD = "oiseau"
CORAL = "corail"
HOLE = "trou"
JUMP = "JUMP"
DODGE = "DODGE"


enemy = {}

enemy.init = function()
    enemy.isBegin = false
    enemy.array={}

    enemy.array.update = function(dt, persoX, persoY, persoHeight, persoWidth, speed)
        for i, v in ipairs(enemy.array) do
            v.update(dt, speed)

            if v.collision(persoX, persoY, persoHeight, persoWidth) == true and not(Turtle.lose) then
                Turtle.lose = true
                snd_lose:play()
                music_man.stop()
            end
        end
        enemy.array.removeDead()
    end

    enemy.array.removeDead = function()
        for i = #enemy.array, 1, -1 do
            if not enemy.array[i].isAlive then
                table.remove(enemy.array, i)
            end
        end
    end

    enemy.array.draw = function()
        --love.graphics.setColor(1, 0, 0)
        --love.graphics.print(#enemy.array, 10, 10)
        for i, v in ipairs(enemy.array) do
            v.draw()
        end
    end
end


enemy.new = function(x, y, speed, type)
    local Enemy = {}
        Enemy.x = x
        Enemy.y = y 
        Enemy.speed = speed
        Enemy.speedx = love.math.random(80,160) * (love.math.random(0,1)*2-1)
        Enemy.type = type
        Enemy.image = nil
        Enemy.width = 180
        Enemy.height = 80
        Enemy.hitboxWidth = Enemy.width
        Enemy.hitboxHeight = Enemy.height
        Enemy.sx = nil
        Enemy.sy = nil
        Enemy.isAlive = true
        Enemy.canCollide = true
        Enemy.jumpCollision = nil
        Enemy.centerX = nil
        Enemy.centerY = nil
        Enemy.nbFrame = 1


        if Enemy.type == CRAB then
            Enemy.image = enemyImage.crab
            Enemy.jumpCollision = false
            Enemy.nbFrame = 5
            Enemy.width = 180
            Enemy.height = 83
            Enemy.hitboxWidth = Enemy.width-20
            Enemy.hitboxHeight = Enemy.height-20
            
    
        elseif Enemy.type == BIRD then
            Enemy.image = enemyImage.bird
            Enemy.jumpCollision = true
            Enemy.nbFrame = 2
            Enemy.width = 100
            Enemy.height = Enemy.width/1.5
            Enemy.hitboxWidth = Enemy.width
            Enemy.hitboxHeight = Enemy.height-20
            Enemy.vector = {x = 0, y = 0}
            
    
        elseif Enemy.type == CORAL then
            Enemy.image = enemyImage.coral
            Enemy.jumpCollision = true
            Enemy.nbFrame = 1
            Enemy.speedx = 0
            Enemy.width = 130
            Enemy.height = Enemy.width/1.20
            Enemy.hitboxWidth = Enemy.width - 27
            Enemy.hitboxHeight = Enemy.height - 20
        
        elseif Enemy.type == HOLE then
            Enemy.image = enemyImage.hole
            Enemy.jumpCollision = false
            Enemy.nbFrame = 1
            Enemy.speedx = 0
        
        elseif Enemy.type == JUMP then
            Enemy.image = enemyImage.jump
            Enemy.canCollide = false
            Enemy.jumpCollision = false
            Enemy.width = 510
            Enemy.height = 510/1.81
            Enemy.hitboxWidth = Enemy.width
            Enemy.hitboxHeight = Enemy.height
            Enemy.nbFrame = 1 
            Enemy.speedx = 0
        
        elseif Enemy.type == DODGE then
            Enemy.image = enemyImage.dodge
            Enemy.canCollide = false
            Enemy.jumpCollision = false
            Enemy.width = 510
            Enemy.height = 510/1.81
            Enemy.hitboxWidth = Enemy.width
            Enemy.hitboxHeight = Enemy.height
            Enemy.nbFrame = 1 
            Enemy.speedx = 0
    
     end
     
     Enemy.canCollide = false

      Enemy.sx = Enemy.width/(Enemy.image:getWidth()/Enemy.nbFrame)
      Enemy.sy =  Enemy.height/Enemy.image:getHeight()

    function Enemy.birdMove(dt)
        if distance(0,Turtle.y,0,Enemy.y) <= 500 and Enemy.vector.x == 0 then
            Enemy.vector = {x = Turtle.x-Enemy.x ,  y = Turtle.y-Enemy.y}
            normalize(Enemy.vector)
        end

        Enemy.x = Enemy.x + (Enemy.vector.x * 200)*dt
        Enemy.y = Enemy.y + (Enemy.vector.y * 200)*dt
    end
            

        Enemy.animation = newAnimation(Enemy.image, Enemy.image:getWidth()/Enemy.nbFrame, Enemy.image:getHeight(), 0.2, Enemy.nbFrame)
      
        if Enemy.speedx > 0 then Enemy.sx = - Enemy.sx end
        
        Enemy.animation:seek( love.math.random(1,Enemy.nbFrame))
      

        function Enemy.update(dt, speed)
            Enemy.speed = speed or Enemy.speed
            if Enemy.isAlive then
                if enemy.isBegin then
                    Enemy.x = Enemy.x + Enemy.speedx *dt
                    if Enemy.x < 100 and Enemy.speedx ~= 0 then 
                        Enemy.x = 100
                        Enemy.speedx = - Enemy.speedx 
                        Enemy.sx = -Enemy.sx 
                    end

                    if Enemy.x >550 - Enemy.width/2 and Enemy.speedx ~= 0 then
                        Enemy.x = 550 - Enemy.width/2
                        Enemy.speedx = - Enemy.speedx 
                        Enemy.sx = -Enemy.sx 
                    end
                    Enemy.y = Enemy.y + Enemy.speed*dt
                    
                    if Enemy.type == BIRD then
                        Enemy.birdMove(dt)
                    end
                    

                    Enemy.animation:play()
                else
                    Enemy.animation:stop()
                end
                Enemy.animation:update(dt)
            end

            if Enemy.y > screen.H+100 then
                Enemy.isAlive = false
            end
        end

        function Enemy.draw()
            if Enemy.isAlive and Enemy.y+Enemy.height > 0 then
                love.graphics.setColor(1, 1, 1)
                Enemy.animation:draw(Enemy.x,Enemy.y,0,Enemy.sx,Enemy.sy,(Enemy.image:getWidth()/Enemy.nbFrame)*0.5,Enemy.image:getHeight()*0.5)
                --love.graphics.setColor(1, 0, 0)
                --love.graphics.rectangle("line", Enemy.rectEnemy[1].x, Enemy.rectEnemy[1].y, Enemy.hitboxWidth, Enemy.hitboxHeight)
            end
            
        end

        function Enemy.collision(persoX, persoY, persoHeight, persoWidth)
            rectPerso = {
                {x = persoX - persoWidth/2, y = persoY - persoHeight/2},
                {x = persoX + persoWidth/2, y = persoY - persoHeight/2},
                {x = persoX - persoWidth/2, y = persoY + persoHeight/2},
                {x = persoX + persoWidth/2, y = persoY + persoHeight/2},
            }

            Enemy.rectEnemy = {
                {x = Enemy.x - Enemy.hitboxWidth/2, y = Enemy.y - Enemy.hitboxHeight/2},
                {x = Enemy.x + Enemy.hitboxWidth/2, y = Enemy.y - Enemy.hitboxHeight/2},
                {x = Enemy.x - Enemy.hitboxWidth/2, y = Enemy.y + Enemy.hitboxHeight/2},
                {x = Enemy.x + Enemy.hitboxWidth/2, y = Enemy.y + Enemy.hitboxHeight/2},
            }

            if Enemy.canCollide then
                if 
                collide(rectPerso, Enemy.rectEnemy[1]) or 
                collide(rectPerso, Enemy.rectEnemy[2]) or 
                collide(rectPerso, Enemy.rectEnemy[3]) or 
                collide(rectPerso, Enemy.rectEnemy[4]) or 
                collide(Enemy.rectEnemy, rectPerso[1]) or
                collide(Enemy.rectEnemy, rectPerso[2]) or
                collide(Enemy.rectEnemy, rectPerso[3]) or 
                collide(Enemy.rectEnemy, rectPerso[4]) then
                    if not Enemy.jumpCollision and Turtle.state=='jump' then
                        return false
                    else
                        return true
                    end
                end
                return false
            else
                return false
            end
        end
    return Enemy
end