local function create_particule(px,py,pangle)
    local particule = {}
    particule.x = px
    particule.y = py
    particule.angle = pangle
    particule.speed = math.random(100,200)
    particule.vx = math.cos(particule.angle) * particule.speed
    particule.vy =  math.sin(particule.angle) * particule.speed
    particule.alpha = 1
    particule.valpha = math.random(50,60)/10    
    particule.color = sable

    local action = {
      [1] = function () particule.x = particule.x + 10 + math.random(-10,10) particule.y = particule.y - 10 end,
      [2] = function ()  particule.x = particule.x + 10 + math.random(-10,10)particule.y = particule.y + 10 end,
      [3] = function ()  particule.x = particule.x - 10 + math.random(-10,10) particule.y = particule.y + 10 end,
      [4] = function ()  particule.x = particule.x - 10 + math.random(-10,10) particule.y = particule.y - 1105 end,
  }
    action[math.random(4)]()
    
    function particule.update(dt)
      particule.x = particule.x + particule.vx * dt
      particule.y = particule.y + particule.vy * dt
      particule.alpha = particule.alpha - particule.valpha *dt
    end
    
    function particule.draw()
      love.graphics.setColor(particule.color,particule.alpha)
      love.graphics.circle("fill",particule.x,particule.y,2)
      
 
    end
    return particule
  end
  
  function create_emitter(px,py,pnbparticule)
    local emitter = {}
    emitter.x = px
    emitter.y = py
    emitter.N = pnbparticule
    emitter.list = {}
    
    function emitter.init()
      for i=1 , emitter.N do
        local newparticule= create_particule(emitter.x,emitter.y,math.pi*0.5 + math.random(-10,10)/15)
        table.insert(emitter.list,newparticule)
      end
    end
    
    function emitter.update(dt)
      for k = #emitter.list,1,-1 do
        local particule = emitter.list[k]
        particule.update(dt)
        if particule.alpha <= 0 then
          particule.alpha = math.random()
          local angle = math.random() * math.pi*2
          local action = {
            [1] = function () particule.x = emitter.x + 10 + math.random(-10,10) particule.y = emitter.y - 10 end,
            [2] = function ()  particule.x = emitter.x + 10 + math.random(-10,10)particule.y = emitter.y + 10 end,
            [3] = function ()  particule.x = emitter.x - 10 + math.random(-10,10) particule.y = emitter.y + 10 end,
            [4] = function ()  particule.x = emitter.x - 10 + math.random(-10,10) particule.y = emitter.y - 1105 end,
        }
          action[math.random(4)]()
        end
      end
    end
  
    function emitter.draw()
      for _,particule in pairs(emitter.list) do
        particule.draw()
      end
    end
  
    
    return emitter
    end
  
    