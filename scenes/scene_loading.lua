scene_loading = {}

require("utils/pixel_animation")

play = true
timer = 0
duration = 2.5
animation = newPixelAnimation(0, 0, 2, "assets/images/turtle/loading.png")
degrade   = love.graphics.newImage("assets/images/degrade.jpg")

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
        
        require("utils/assets")  -- CHARGE TOUTES LES ASSETS IMAGES SONS MUSIQUES (dans le music_manager) FONTS
        pannelEscape = newPannelEscape()
        music_man.play("menu",0)
        love.mouse.setVisible(true)
        scene_man.next_scene = scene_man.list["menu"]
    end
end

scene_loading.draw = function()
   love.graphics.draw(degrade)
   animation.draw()
end

scene_loading.mousepressed = function(px,py,pbutton)
  
end

scene_loading.mousereleased = function(px,py,pbutton)
  
end

scene_loading.mousemoved = function(px,py,pdx,pdy)

end

function scene_loading.keypressed(key)
 
    if key =="space" then
         play = false
    end
    
end
function scene_loading.focus(focus)
  
end
function scene_loading.textinput(txt)

end
function scene_loading.quit()
  
end


return scene_loading
