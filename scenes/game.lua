Game = {}

Game.percent = 0

require("turtle")
require("map")
require("enemy")

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

    table.insert(enemy.array, enemy.new(325, -2600, Turtle.scrollingSpeed, JUMP))
    table.insert(enemy.array, enemy.new(160, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(260, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(380, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(210, -2720, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(410, -2720, Turtle.scrollingSpeed, CRAB))

    table.insert(enemy.array, enemy.new(410, -3100, Turtle.scrollingSpeed, BIRD))

    table.insert(enemy.array, enemy.new(145, -3400, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(505, -3400, Turtle.scrollingSpeed, BIRD))

    table.insert(enemy.array, enemy.new(130, -4000, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(325, -4000, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(520, -4000, Turtle.scrollingSpeed, CORAL))  
    
    table.insert(enemy.array, enemy.new(225, -4100, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(520, -4200, Turtle.scrollingSpeed, CORAL))  
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

Game.load = function()
    Map.load()
 
end


Game.update = function(dt)
    if not(pannelEscape.on) then
        Map.update(dt,Turtle.scrollingSpeed)
        Turtle.update(dt)
        enemy.array.update(dt, Turtle.x, Turtle.y, Turtle.Height, Turtle.Width, Turtle.scrollingSpeed)
    else
        pannelEscape.update(dt, mouse.x, mouse.y)
    end

    if #enemy.array == 0  then
        Map.isEnd = true
    end
end

Game.draw = function()

    Map.draw()
    enemy.array.draw()
    Turtle.draw()

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
         --game.init(game.level)
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
