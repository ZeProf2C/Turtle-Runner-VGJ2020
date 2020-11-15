Game = {}

require("turtle")
require("map")
require("enemy")

Game.percent = 0

Game.init = function()
    love.mouse.setVisible(false)
    Map.init()
    Turtle.init()
    enemy.init()
    
    table.insert(enemy.array, enemy.new(260, -200, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(390, -500, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(130, -500, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(130, -800, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(260, -800, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(520, -800, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(325, -930, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(390, -1060, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(520, -1350, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(160, -1800, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -2100, Turtle.scrollingSpeed, CRAB))

    table.insert(enemy.array, enemy.new(160, -2400, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -2400, Turtle.scrollingSpeed, CRAB))

    table.insert(enemy.array, enemy.new(160, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(260, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(380, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(210, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(410, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(325, -2600, Turtle.scrollingSpeed, JUMP))

    table.insert(enemy.array, enemy.new(325, -3420, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(325, -3300, Turtle.scrollingSpeed, DODGE)) 

    table.insert(enemy.array, enemy.new(145, -3720, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(505, -3720, Turtle.scrollingSpeed, CRAB))

    table.insert(enemy.array, enemy.new(130, -4200, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(325, -4200, Turtle.scrollingSpeed, CORAL))
    
    table.insert(enemy.array, enemy.new(520, -4600, Turtle.scrollingSpeed, CORAL))   

    table.insert(enemy.array, enemy.new(130, -4710, Turtle.scrollingSpeed, CRAB)) 
    table.insert(enemy.array, enemy.new(325, -4710, Turtle.scrollingSpeed, CORAL)) 
    table.insert(enemy.array, enemy.new(520, -4710, Turtle.scrollingSpeed, BIRD)) 

    table.insert(enemy.array, enemy.new(130, -5100, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(330, -5100, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(510, -5100, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(130, -5670, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(390, -5670, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(260, - 6340, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(390, - 6340, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(520, -6400, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(130, -7070, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(260, -7070, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(390, -7160, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(130, -7830, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(390, -7830, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(520, -7890, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(160, -8320, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(260, -8330, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(380, -8320, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -8325, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(210, -8320, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(410, -8318, Turtle.scrollingSpeed, CRAB))

    table.insert(enemy.array, enemy.new(160, -8870, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(260, -8900, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(380, -8870, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -8875, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(210, -8870, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(410, -8868, Turtle.scrollingSpeed, CRAB))

    table.insert(enemy.array, enemy.new(160, -8870, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(260, -8900, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(380, -8870, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -8875, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(210, -8870, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(410, -8868, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(260, -8950, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(520, -8950, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(520, -10000, Turtle.scrollingSpeed, BIRD))

    table.insert(enemy.array, enemy.new(258, -10800, Turtle.scrollingSpeed, BIRD))

    table.insert(enemy.array, enemy.new(258, -11600, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(369, -11600, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(147, -11600, Turtle.scrollingSpeed, BIRD))

   
   enemy.array.setEasy()
    

    Game.maxY = enemy.array[#enemy.array].y
end


Game.startAnimation = function()
    Map.isBegin = true
    Turtle.isBegin = true
    enemy.isBegin = true
end

Game.stopAnimation = function()
    Map.isBegin = false
    Turtle.isBegin = false
    enemy.isBegin = false

end

Game.setPercent = function(persoY)
    Game.percent = (Map.totalY/Game.maxY) * 100
    Game.percent = math.floor(Game.percent)
    if Game.percent >= 100 then
        Game.percent = 99
    end
end

Game.load = function()
    Map.load()
 
end


Game.update = function(dt)
   if not(pannelEscape.on) then
      if scene_menu.hardMode then
        shader:send("rayon",lampe.r)
        shader:send("mouse",{Turtle.x,Turtle.y})
        shader:send("light",lampe.eclairage)
      end
      Map.update(dt,Turtle.scrollingSpeed)
      Turtle.update(dt)
      enemy.array.update(dt, Turtle.x, Turtle.y, Turtle.Height, Turtle.Width, Turtle.scrollingSpeed)
   else
      pannelEscape.update(dt, mouse.x, mouse.y)
   end

    if #enemy.array == 0  then
        Map.isEnd = true
        Turtle.scrollingSpeedMax = 800
        Turtle.scrollingAcceleration = 35
    end
end

Game.draw = function()
   if scene_menu.hardMode then
      love.graphics.setShader(shader)
      Map.draw()
      enemy.array.draw()
      Turtle.draw()
      love.graphics.setShader()
   else
      Map.draw()
      enemy.array.draw()
      Turtle.draw()
   end
   
    --love.graphics.setColor(1,0,0)
    --love.graphics.print(#enemy.array, 10, 10)

    if pannelEscape.on then
        pannelEscape.draw()
    end

end

Game.mousepressed = function(px,py,pbutton)
  
end

Game.mousereleased = function(px,py,pbutton)
  if pannelEscape.on then  
   -- PANNEL ESCAPE OUVERT
      if pannelEscape.elt["game"].isIn(px,py) and pbutton==1 then
         snd_clic_menu_2:play()
         pannelEscape.on = false
         
      end
      if pannelEscape.elt["restart"].isIn(px,py) and pbutton==1 then
         snd_clic_menu_2:play()
         Game.init()
         snd_drag:play()
         pannelEscape.on = false
      end
      if pannelEscape.elt["menu"].isIn(px,py) and pbutton==1 then
         scene_man.next_scene = scene_man.list["menu"]
         snd_clic_menu_2:play()
         love.mouse.setVisible(true)
         pannelEscape.on = false
         music_man.play("menu",0)
         --global_music_vol= global_music_vol * 2
      end
      if pannelEscape.elt["exit"].isIn(px,py) and pbutton==1 then
        love.event.quit()
      end
    end
end

Game.mousemoved = function(px,py,pdx,pdy)

end

function Game.keypressed(key)
    if key == 'escape' then
        pannelEscape.on = not(pannelEscape.on)
        love.mouse.setVisible(pannelEscape.on)
    end
    Turtle.keypressed(key)
    
end
function Game.focus(focus)
  
end
function Game.textinput(txt)

end
function Game.quit()
  
end
return Game
