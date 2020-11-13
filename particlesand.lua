local function create_particule(px,py,pangle)
    local particle = {}
    particle.x = px
    particle.y = py
    particle.angle = pangle
    particle.speed = math.random(100,300)
    particle.vx = math.cos(particle.angle) * particle.speed
    particle.vy =  math.sin(particle.angle) * particle.speed
    particle.alpha = 1
    particle.valpha = math.random(20,60)/10    
    particle.color = sable

    local action = {
      [1] = function () particle.x = particle.x + 15 particle.y = particle.y - 15 end,
      [2] = function ()  particle.x = particle.x + 15 particle.y = particle.y - 15 end,
      [3] = function ()  particle.x = particle.x - 15 particle.y = particle.y + 15 end,
      [4] = function ()  particle.x = particle.x - 15 particle.y = particle.y + 15 end,
  }
      
      action[math.random(4)]()
    
    function particle.update(dt)
      particle.x = particle.x + particle.vx * dt
      particle.y = particle.y + particle.vy * dt
      particle.alpha = particle.alpha - particle.valpha *dt
    end
    
    function particle.draw()
      love.graphics.setColor(particle.color,particle.alpha)
      love.graphics.circle("fill",particle.x,particle.y,2)
      
 
    end
    return particle
  end
  
  function create_emitter(px,py,pnbparticle)
    local emitter = {}
    emitter.x = px
    emitter.y = py
    emitter.N = pnbparticle
    emitter.list = {}
    
    function emitter.init()
      for i=1 , emitter.N do
        local newparticle= create_particule(emitter.x,emitter.y,math.pi*0.5 + math.random(-10,10)/15)
        table.insert(emitter.list,newparticle)
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
            [1] = function () particule.x = emitter.x + 15 particule.y = emitter.y - 15 end,
            [2] = function ()  particule.x = emitter.x + 15 particule.y = emitter.y + 15 end,
            [3] = function ()  particule.x = emitter.x - 15 particule.y = emitter.y + 15 end,
            [4] = function ()  particule.x = emitter.x - 15 particule.y = emitter.y - 15 end,
        }
          action[math.random(4)]()
        end
      end
    end
  
    function emitter.draw()
      for _,particle in pairs(emitter.list) do
        particle.draw()
      end
    end
  
    
    return emitter
    end
  
    