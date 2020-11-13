Game = {}


require("turtle")
require("map")
require("enemy")

Game.init = function()
    Map.init()
    Turtle.init()
    enemy.init()
    --table.insert(enemy.array, enemy.new(300, -200, Turtle.scrollingSpeed, CRAB))
end


Game.startAnimation = function()
    Map.isBegin = true
    Turtle.isBegin = true
    enemy.isBegin = true

end


Game.load = function()
    Map.load()
 
end


Game.update = function(dt)
    if not(pannelEscape.on) then
        Map.update(dt,Turtle.scrollingSpeed)
        Turtle.update(dt)
        enemy.array.update(dt, Turtle.x, Turtle.y, Turtle.Height)

        if enemy.lose then
            love.mouse.setVisible(true)
            scene_man.next_scene = scene_man.list["game_over"]
        end

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
