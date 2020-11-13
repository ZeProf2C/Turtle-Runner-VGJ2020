function newSfx(p_path, p_isLooped, p_vol)
  local sfx = {}
    sfx.src = love.audio.newSource(p_path, "static")
    if p_isLooped == nil then p_isLooped = false end
      sfx.src:setLooping(p_isLooped)
      sfx.src:setVolume(not p_vol and 0 or p_vol)
  
    function sfx.setLoop(p_isLooped)
      sfx.src:setLooping(p_isLooped)
    end
  
    function sfx.setVolume(p_vol)
      sfx.src:setVolume(p_vol)
    end
  
    function sfx.getVolume()
      return sfx.src:getVolume()
    end
  
    function sfx:play()
      sfx.src:stop()
      if sfx.getVolume() ~= global_sound_vol then
        sfx.setVolume(global_sound_vol )
      end
      sfx.src:play()
    end
  
    function sfx.pause()
      sfx.src:pause()
    end
  
    function sfx.stop()
      sfx.src:stop()
    end
  
    function sfx.isPlaying()
      return sfx.src:isPlaying()
    end
  
  return sfx
end