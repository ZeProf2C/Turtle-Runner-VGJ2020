music_manager = {}

music_manager.list = {}
music_manager.current = nil
music_manager.speed = 0.3

music_manager.add = function(p_key,p_music)
  music_manager.list[p_key] = p_music
  music_manager.list[p_key]:setLooping(true)
end

music_manager.play = function(p_key,p_vol)
  
  if p_key ~= nil and music_manager.current ~= p_key then  
      local ml = music_manager.list[p_key]
      ml:play()
      if p_vol > global_music_vol then
        ml:setVolume(global_music_vol)
      else
        ml:setVolume(p_vol)
      end
  end
  music_manager.current = p_key
end

 music_manager.stop = function()
    if music_manager.current ~= nil then
      local ml = music_manager.list[music_manager.current]
      
      ml:setVolume(0)
      ml:stop()
      music_manager.current = nil
    end
  end

music_manager.update = function(dt)
  if music_manager.current ~= nil then
    for i, v in pairs(music_manager.list) do
      if  music_manager.current == i then
        if v:getVolume() < global_music_vol then
          v:setVolume(v:getVolume() + music_manager.speed*dt)
          if v:getVolume() > global_music_vol then
            v:setVolume(global_music_vol)
          end
        elseif v:getVolume() > global_music_vol then
          v:setVolume(v:getVolume() - music_manager.speed * dt)
          if v:getVolume() < global_music_vol then
            v:setVolume(global_music_vol)
          end
        end
      else
        if v:getVolume() > 0 then
          v:setVolume(v:getVolume() - music_manager.speed *dt)
          if v:getVolume() < 0.001 then
            v:setVolume(0)
            v:stop()
          end
        elseif v:getVolume() == 0 and v:isPlaying() then
          v:stop()
        end
      end
    end
  end
end

return music_manager