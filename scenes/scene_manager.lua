scene_manager = {}
--******************************************************************************************************
--                             LISTE DES SCENES
--******************************************************************************************************
scene_manager.list = {}
  scene_manager.list["menu"]    = require("scenes/scene_menu")
  scene_manager.list["credits"] = require("scenes/scene_credits")
  scene_manager.list["game"]   = require("scenes/game")
  scene_manager.list["rules"]   = require("scenes/scene_rule")

  
scene_manager.current_scene = nil 
scene_manager.next_scene = nil
scene_manager.alpha      = 0
scene_manager.fade_speed = 1 --0.3

scene_manager.fade_out_in = function(p_next, dt)
   scene_manager.alpha = scene_manager.alpha + scene_manager.fade_speed*math.sqrt(dt)
   if scene_manager.alpha >= 1 then
     scene_manager.alpha         = 1
     scene_manager.fade_speed    =  -scene_manager.fade_speed
     scene_manager.current_scene = p_next
   
   end
   if scene_manager.alpha < 0 then
     scene_manager.alpha        = 0
     scene_manager.fade_speed   =  -scene_manager.fade_speed
       scene_manager.next_scene = nil
   end
end

return scene_manager