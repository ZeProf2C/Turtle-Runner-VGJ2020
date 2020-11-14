Game = {}


require("turtle")
require("map")
require("enemy")

Game.init = function()
    love.mouse.setVisible(false)
    Map.init()
    Turtle.init()
    enemy.init()
--[[ 
    table.insert(enemy.array, enemy.new(260, -200, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(390, -500, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(130, -500, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(130, -800, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(260, -800, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(520, -800, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(325, -930, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(390, -1060, Turtle.scrollingSpeed, CORAL))

    table.insert(enemy.array, enemy.new(520, -1300, Turtle.scrollingSpeed, CORAL)) ]]

    table.insert(enemy.array, enemy.new(160, -1800, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -2100, Turtle.scrollingSpeed, CRAB))

    table.insert(enemy.array, enemy.new(160, -2400, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -2400, Turtle.scrollingSpeed, CRAB))

    table.insert(enemy.array, enemy.new(160, -2800, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(260, -2800, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(380, -2800, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -2800, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(210, -2800, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(410, -2800, Turtle.scrollingSpeed, CRAB))

    --[[ table.insert(enemy.array, enemy.new(310, -3787, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(310, -3506, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(192, -3506, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(196, -1840, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(367, -1887, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(527, -1837, Turtle.scrollingSpeed, CORAL))
    table.insert(enemy.array, enemy.new(405, -405, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(210, -555, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(470, -490, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(235, -970, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(225, -1300, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(488, -1297, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(492, -1609, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(223, -1967, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(496, -2452, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(233, -2648, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(490, -2804, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(476, -3011, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(336, -3088, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(174, -3171, Turtle.scrollingSpeed, BIRD))
    table.insert(enemy.array, enemy.new(472, -3171, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(162, -4088, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(206, -4088, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(406, -4088, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(407, -4088, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(182, -4246, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(295, -4246, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(485, -4246, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(171, -4370, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(372, -4370, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(484, -4370, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(151, -4500, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(263, -4500, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(378, -4500, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(498, -4500, Turtle.scrollingSpeed, CRAB))
    table.insert(enemy.array, enemy.new(254, -4676, Turtle.scrollingSpeed, CRAB)) ]]
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
