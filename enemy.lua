CRAB = "crabe"
BIRD = "oiseau"
CORAL = "corail"
HOLE = "trou"


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
    end

    enemy.array.draw = function()
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
        Enemy.speedx = love.math.random(80,160) * love.math.random(-1,1)
        Enemy.type = type
        Enemy.image = nil
        Enemy.width = 180
        Enemy.height = 80
        Enemy.sx = nil
        Enemy.sy = nil
        Enemy.isAlive = true
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
            
    
        elseif Enemy.type == BIRD then
            Enemy.image = enemyImage.bird
            Enemy.jumpCollision = true
            Enemy.nbFrame = 2
            
    
        elseif Enemy.type == CORAL then
            Enemy.image = enemyImage.coral
            Enemy.jumpCollision = true
            Enemy.nbFrame = 1
            Enemy.speedx = 0
        
        elseif Enemy.type == HOLE then
            Enemy.image = enemyImage.hole
            Enemy.jumpCollision = false
            Enemy.nbFrame = 1
            Enemy.speedx = 0
    
     end
     
      Enemy.sx = Enemy.width/(Enemy.image:getWidth()/Enemy.nbFrame)
      Enemy.sy =  Enemy.height/Enemy.image:getHeight()
            

        Enemy.animation = newAnimation(Enemy.image, Enemy.image:getWidth()/Enemy.nbFrame, Enemy.image:getHeight(), 0.2, Enemy.nbFrame)
      
        if Enemy.speedx > 0 then Enemy.sx = - Enemy.sx end
        
        Enemy.animation:seek( love.math.random(1,Enemy.nbFrame))
      

        function Enemy.update(dt, speed)
            Enemy.speed = speed or Enemy.speed
            if Enemy.isAlive then
                if enemy.isBegin then
                    Enemy.x = Enemy.x + Enemy.speedx *dt
                    if (Enemy.x <100 or Enemy.x >700 - Enemy.width) and Enemy.speedx ~= 0 then
                       Enemy.speedx = - Enemy.speedx 
                       Enemy.sx = -Enemy.sx 
                     end
                    Enemy.y = Enemy.y + Enemy.speed*dt
                    Enemy.animation:play()
                else
                    Enemy.animation:stop()
                end
                Enemy.animation:update(dt)
            end

            if Enemy.y > screen.H then
                Enemy.isAlive = false
            end
        end

        function Enemy.draw()
            if Enemy.isAlive and Enemy.y+Enemy.height > 0 then
                love.graphics.setColor(1, 1, 1)
                Enemy.animation:draw(Enemy.x,Enemy.y,0,Enemy.sx,Enemy.sy,(Enemy.image:getWidth()/Enemy.nbFrame)*0.5,Enemy.image:getHeight()*0.5)
                love.graphics.setColor(1, 0, 0)
                --love.graphics.rectangle("line", Enemy.rectEnemy[1].x, Enemy.rectEnemy[1].y, Enemy.width, Enemy.height)
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
                {x = Enemy.x - Enemy.width/2, y = Enemy.y - Enemy.height/2},
                {x = Enemy.x + Enemy.width/2, y = Enemy.y - Enemy.height/2},
                {x = Enemy.x - Enemy.width/2, y = Enemy.y + Enemy.height/2},
                {x = Enemy.x + Enemy.width/2, y = Enemy.y + Enemy.height/2},
            }

            if 
            collide(rectPerso, Enemy.rectEnemy[1]) or 
            collide(rectPerso, Enemy.rectEnemy[2]) or 
            collide(rectPerso, Enemy.rectEnemy[3]) or 
            collide(rectPerso, Enemy.rectEnemy[4]) or 
            collide(rectEnemy, Enemy.rectPerso[1]) or
            collide(rectEnemy, Enemy.rectPerso[2]) or
            collide(rectEnemy, Enemy.rectPerso[3]) or 
            collide(rectEnemy, Enemy.rectPerso[4]) then
                return true
            end
            return false
        end
    return Enemy
end