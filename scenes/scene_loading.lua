scene_loading = {}

require("utils/pixel_animation")

play = true
timer = 0
duration = 2.5
animation = newPixelAnimation(0, 0, 2, "assets/images/turtle/loading.png")

scene_loading.load = function()
    
end


scene_loading.update = function(dt)
    timer = timer + dt
    if timer >= duration then
        play = false
    end

    if play then
        animation.update(dt)
    else
        love.mouse.setVisible(true)
        require("utils/assets")  -- CHARGE TOUTES LES ASSETS IMAGES SONS MUSIQUES (dans le music_manager) FONTS
        pannelEscape = newPannelEscape()
        scene_man.next_scene = scene_man.list["menu"]
    end
end

scene_loading.draw = function()
    animation.draw()
    --love.graphics.setColor(1, 0, 0)
    --love.graphics.print(timer, 10, 10)

end

scene_loading.mousepressed = function(px,py,pbutton)
  
end

scene_loading.mousereleased = function(px,py,pbutton)
  
end

scene_loading.mousemoved = function(px,py,pdx,pdy)

end

function scene_loading.keypressed(key)
 
    
end
function scene_loading.focus(focus)
  
end
function scene_loading.textinput(txt)

end
function scene_loading.quit()
  
end

--music_man.play("menu",0)
return scene_loading
