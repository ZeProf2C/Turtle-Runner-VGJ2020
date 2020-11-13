local gui = {}

 
 --************************************************************************************************
 --                           LES PANNELS
 --************************************************************************************************
 gui.CreatePannel = function(px,py,pL,pH,pBGColor,pBorderColor,pCorner)
  local pannel = {}
  pannel.type = "pannel"
  pannel.x = px
  pannel.y = py
  pannel.L = pL
  pannel.H = pH
  pannel.BGColor = pBGColor
  pannel.BorderColor = pBorderColor
  pannel.flat = true
  pannel.corner = pCorner
  pannel.elt = {}
  
  pannel.addPannel = function(pName,px,py,pL,pH,pBGColor,pBorderColor)
    local pan = gui.CreatePannel(pannel.x + px,pannel.y + py,pL,pH,pBGColor,pBorderColor)
    pannel.elt[pName]=pan
  end
  
  pannel.addSwitch = function(pName,px,py,pL,pH)
    local sw = gui.CreateSwitch(pannel.x + px,pannel.y + py,pL,pH)
    pannel.elt[pName]=sw
  end
  pannel.addButton = function(pName,px,py,pL,pH,pText,pFont,pBGColor,pTxtColor, pBorderCol,pCorner)
    local bt = gui.CreateButton(pannel.x + px,pannel.y + py,pL,pH,pText,pFont,pBGColor,pTxtColor, pBorderCol,pCorner)
    pannel.elt[pName]=bt
  end
  pannel.addSlider = function(pName,px,py,pL,pFont,pmin,pmax, pThickness,pColor)
    local slide = gui.CreateSlider(pName,pFont,pannel.x + px ,pannel.y + py,pL,pmin,pmax, pThickness,pColor)
    pannel.elt[pName]=slide
  end
  
  
   pannel.addTexte = function(pName,px,py,pText,pFont,pAlign,pLimit,pColor)
    local txt = gui.CreateTexte(pText,pFont,pColor,pAlign,pannel.x +px,pannel.y +py,pLimit)
    pannel.elt[pName]=txt
  end

  pannel.addMenu = function(pName,px,py,pL,pH,pText,pFont,pBGColor,pTxtColor,pBorderColor)
    local menu = gui.CreateMenu(pannel.x +px,pannel.y + py,pL,pH,pText,pFont,pBGColor,pTxtColor,pBorderColor)
    pannel.elt[pName]=menu
  end
  pannel.addInput = function(pName,px,py,pL,pH,pFont,pBorderCol)
    local input = gui.CreateInput(pannel.x +px,pannel.y + py,pL,pH,pFont,pBorderCol)
    pannel.elt[pName]=input
  end
  pannel.addJauge = function(pName,px,py,pL,pH,pmax,pFullColor,pEmptyColor)
    local jauge = gui.CreateJauge(pannel.x + px,pannel.y + py,pL,pH,pmax,pFullColor,pEmptyColor)
    pannel.elt[pName]=jauge
  end
  
  pannel.update = function(dt,mouseX,mouseY)
      for k,elt in pairs(pannel.elt) do
          elt.update(dt,mouseX,mouseY)
      end
  end
  
  pannel.addSkin = function(pImg)
    pannel.img = pImg
    pannel.quad = love.graphics.newQuad(0,0,pannel.L,pannel.H,pannel.L,pannel.H)
    pannel.flat = false
  end
  
  pannel.draw = function()
    if pannel.flat then
      pannel.flatDraw()
    else
      pannel.skinDraw()
    end
    for k,elt in pairs(pannel.elt) do
      elt.draw()
    end
 end
  pannel.flatDraw = function()
    love.graphics.setColor(pannel.BGColor)
    love.graphics.rectangle("fill",pannel.x,pannel.y,pannel.L,pannel.H,pannel.corner)
    love.graphics.setColor(pannel.BorderColor)
    love.graphics.rectangle("line",pannel.x,pannel.y,pannel.L,pannel.H,pannel.corner)
  end
  
  pannel.skinDraw = function()
    love.graphics.setColor(pannel.BGColor)
    love.graphics.draw(pannel.img,pannel.quad,pannel.x,pannel.y)
  end
  
  return pannel
 end
 
 --************************************************************************************************
 --                           LES JAUGES
 --************************************************************************************************
 
 gui.CreateJauge=function(px,py,pL,pH,pmax,pFullColor,pEmptyColor)
  local jauge = {}
  jauge.type = "jauge"
  jauge.x = px
  jauge.y = py
  jauge.L = pL
  jauge.H = pH
  jauge.bord = 2
  jauge.max = pmax
  jauge.valeur = 0
  jauge.fullColor = pFullColor
  jauge.emptyColor = pEmptyColor
  jauge.img = nil
  jauge.quad = nil
  jauge.flat = true
 
  if jauge.L < jauge.H then
    jauge.sens ="vertical"
    jauge.posX = jauge.x
    jauge.posY = jauge.y + jauge.H
  else
    jauge.sens = "horizontal"
    jauge.posX = jauge.x 
    jauge.posY = jauge.y 
  end
   
  jauge.addSkin = function(pImg)
    jauge.img = pImg
    jauge.quad = love.graphics.newQuad(0,0,jauge.L,jauge.H,jauge.L,jauge.H)
    jauge.flat = false
  end
  
  jauge.draw = function()
    if jauge.flat then
      jauge.flatDraw()
    else
      jauge.skinDraw()
    end
 end
  
  jauge.skinDraw = function()
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",jauge.x,jauge.y,jauge.L,jauge.H)
    --love.graphics.setColor(1,1,1)
       local col ={}
    for i = 1, 3 do
      col[i] = jauge.valeur/jauge.max *jauge.fullColor[i] +(1-jauge.valeur/jauge.max) *jauge.emptyColor[i]
    end
    love.graphics.setColor(col)
    love.graphics.draw(jauge.img,jauge.quad,jauge.x+jauge.bord,jauge.y+jauge.bord)
   end

  jauge.flatDraw = function()
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",jauge.x,jauge.y,jauge.L,jauge.H)
    
    local col ={}
    for i = 1, 3 do
      col[i] = jauge.valeur/jauge.max *jauge.fullColor[i] +(1-jauge.valeur/jauge.max) *jauge.emptyColor[i]
    end
    love.graphics.setColor(col)
     if jauge.sens == "vertical" then
      love.graphics.rectangle("fill", jauge.x+ jauge.bord , jauge.posY+jauge.bord  ,  jauge.L-2*jauge.bord  ,  jauge.H-jauge.posY+ jauge.y-2*jauge.bord)
      end
     if jauge.sens == "horizontal" then
      love.graphics.rectangle("fill",jauge.x+ jauge.bord,jauge.y +jauge.bord,jauge.posX- jauge.x-2*jauge.bord,jauge.H-2*jauge.bord)
     
     end
    
  end
  
  jauge.update = function(dt,mouseX,mouseY)
    if jauge.sens == "vertical" then
      jauge.posY = jauge.y + jauge.H*(1 - jauge.valeur/jauge.max) 
      if not(jauge.flat) then
        jauge.quad = love.graphics.newQuad(0,0,jauge.img:getHeight(),jauge.posY,jauge.img:getWidth(),jauge.img:getHeight())
      end
    end
    if jauge.sens =="horizontal" then
      jauge.posX = jauge.x + jauge.L*jauge.valeur/jauge.max
      if not(jauge.flat) then
        jauge.quad = love.graphics.newQuad(0,0,jauge.posX,jauge.img:getHeight(),jauge.img:getWidth(),jauge.img:getHeight())
      end
    
    end
  end
  return jauge
end
 
 
 
 --************************************************************************************************
 --                           LES TEXTES
 --************************************************************************************************
 --gui.CreateTexte = function(pTexte,pFont,pColor,pAlign,px,py,pMaxString)
 gui.CreateTexte = function(pTexte,pFont,pColor,pAlign,px,py,pLimit)
   local txt={}
   txt.type  = "txt"
   txt.font  = pFont
   txt.color = pColor
   txt.align = pAlign
   txt.x     = px
   txt.y     = py
   txt.info  = pTexte
   txt.maxStr= #pTexte --pMaxString
   txt.limit = pLimit
   txt.offset= {}
   
   txt.update = function(dt,mouseX,mouseY)
   end
   
   txt.isIn = function(mouseX,mouseY)
      local L = txt.font:getWidth("A")
      if  mouseX > txt.x and mouseX < txt.x + txt.maxStr*L and mouseY < txt.y + txt.font:getHeight("A") and mouseY > txt.y then
      return true
    else
      return false
    end
   end
   
   txt.draw = function()
      love.graphics.setFont(txt.font)
      love.graphics.setColor(txt.color)
      love.graphics.printf(txt.info,txt.x,txt.y,txt.limit,txt.align)
   end

  return txt
 end
 
 
 --************************************************************************************************
 --                           LES SLIDERS
 --************************************************************************************************
gui.CreateSlider = function(pName,pFont,px,py,pL,pmin,pmax, pThickness,pColor)
  local slider = {}
  slider.type = "slider"
  slider.name = pName
  slider.font = pFont
  slider.x = px
  slider.y = py
  slider.L = pL
  slider.H = 40
  slider.R = pThickness
  slider.position = slider.x+slider.L /2
  slider.min = pmin
  slider.max = pmax
  slider.valeur = (slider.min + slider.max)/2
  slider.color = pColor
  slider.txtColor = pColor
  slider.img = nil
  slider.flat = true
  
  slider.listY = {}
  for k = 1, 31 do 
    table.insert(slider.listY,slider.y+slider.H*3/4 +math.random(-3,3))
  end
  
  

  slider.addSkin = function(pImg)
    slider.img = pImg
    slider.flat = false
  end
  
  slider.draw = function()
   love.graphics.setColor(slider.txtColor)
   local texte = slider.name.." = "..slider.valeur
   love.graphics.setFont(slider.font)
   love.graphics.print(texte,slider.x +slider.L/2,slider.y,0,1,1,slider.font:getWidth(texte)/2,0) 
   love.graphics.setColor(0,0,0)
   love.graphics.setLineWidth(slider.R)
   --love.graphics.line(slider.x,slider.y+slider.H*3/4,slider.x+slider.L,slider.y+slider.H*3/4)
   for k = 1 , #slider.listY -1 do 
     love.graphics.line(slider.x+k*slider.L/#slider.listY,slider.listY[k],slider.x+(k+1)*slider.L/#slider.listY,slider.listY[k+1])
     
   end
   
 
   love.graphics.setColor(slider.color)
   love.graphics.setLineWidth(slider.R+2)
   --love.graphics.line(slider.x,slider.y+slider.H*3/4,slider.position,slider.y+slider.H*3/4)
  local k = 1
  while slider.x+k*slider.L/#slider.listY < slider.position do 
     love.graphics.line(slider.x+k*slider.L/#slider.listY,slider.listY[k],slider.x+(k+1)*slider.L/#slider.listY,slider.listY[k+1])
     k=k+1
   
  end
   love.graphics.setLineWidth(1)
   if slider.flat then
      love.graphics.setColor(slider.color)
      love.graphics.setLineWidth(1)
      love.graphics.circle("fill",slider.position,slider.y+slider.H*3/4,slider.R*2)
      love.graphics.setColor(0,0,0)
      love.graphics.setLineWidth(1)
      love.graphics.circle("line",slider.position,slider.y+slider.H*3/4,slider.R*2)
    else
      love.graphics.setColor(1,1,1)
      love.graphics.draw(slider.img,slider.position,slider.y+slider.H*3/4,0,1,1,
                          slider.img:getWidth()/2,
                          slider.img:getHeight()/2)
    end
    

  end
  
  
  
  slider.isIn = function(mouseX,mouseY)
    if  mouseX > slider.x and mouseX < slider.x + slider.L and mouseY < slider.y +slider.H and mouseY > slider.y then
      return true
    else
      return false
    end
  end
  
  slider.update = function(dt,mouseX,mouseY)
    if slider.isIn(mouseX,mouseY) then
      slider.txtColor = slider.color
      if love.mouse.isDown(1) then
        slider.position = mouseX
        if slider.position > slider.x + slider.L then
          slider.position = slider.x + slider.L
        elseif slider.position < slider.x then
          slider.position = slider.x
        end
      end
    
    else
      slider.txtColor =  {0,0,0}
      
    end
      slider.valeur = slider.min + math.floor( (slider.position - slider.x)/slider.L * (slider.max - slider.min))
  end

  
  return slider
end

 --************************************************************************************************
 --                           LES BOUTONS
 --************************************************************************************************
gui.CreateButton = function(px,py,pL,pH,pText,pFont,pBGColor,pTxtColor, pBorderCol,pCorner)
  local button = {}
  button.type = "button"
  button.x = px
  button.xStart = px
  button.y = py
  button.L = pL
  button.H = pH
  button.corner =  pCorner
  button.Texte = pText
  button.font = pFont
  button.BGColor = pBGColor 
  button.TxtColor = pTxtColor 
  button.BorderColor = pBorderCol
  button.FirstTimeIn = true
  button.speed = 1
  button.quad= nil
  button.img = nil
  button.flat = true
  
  button.addSkin = function(pImg)
    button.img = pImg
    button.quad = love.graphics.newQuad(0,0,button.L,button.H,button.L,button.H*3)
    button.flat = false
  end
  
  
  button.draw = function()
    if button.flat then
      button.flatDraw()
    else
      button.skinDraw()
      end
 end

  button.skinDraw = function()
    love.graphics.setColor(1,1,1)
    love.graphics.draw(button.img,button.quad,button.x,button.y)
    love.graphics.setFont(button.font)
    love.graphics.setColor(button.TxtColor)
    love.graphics.print(button.Texte,button.x +button.L/2,button.y +button.H/2,0,1,1,button.font:getWidth(button.Texte)/2,button.font:getHeight(button.Texte)/2)
  end

  button.flatDraw = function()
    love.graphics.setFont(button.font)
    love.graphics.setColor(button.BGColor)
    love.graphics.rectangle("fill",button.x,button.y,button.L,button.H,button.corner)
    love.graphics.setColor(button.BorderColor)
    love.graphics.rectangle("line",button.x,button.y,button.L,button.H,button.corner)
    love.graphics.setColor(button.TxtColor)
    love.graphics.print(button.Texte,button.x +button.L/2,button.y +button.H/2,0,1,1,button.font:getWidth(button.Texte)/2,button.font:getHeight(button.Texte)/2)
  end

  button.isIn = function(mouseX,mouseY)
    if mouseX > button.xStart and mouseX < button.xStart + button.L and  mouseY > button.y and mouseY < button.y +   button.H then
     return true
    else
      return false
    end
  end


  button.update = function(dt,mouseX,mouseY)
    if button.flat then
      button.flatUpdate(mouseX,mouseY)
    else
      button.skinUpdate(mouseX,mouseY)
    end
  end
  button.skinUpdate = function(mouseX,mouseY)
    if button.isIn(mouseX,mouseY)  then
        
        if button.FirstTimeIn then
          button.FirstTimeIn = false
           snd_clic_menu_1:play()
        end
        
        if love.mouse.isDown(1) then
          button.quad = love.graphics.newQuad(0,2*button.H,button.L,button.H,button.L,button.H*3)
        else
          button.quad = love.graphics.newQuad(0,button.H,button.L,button.H,button.L,button.H*3)
          if button.x < button.xStart+10 then
              button.x = button.x + 1
          end
        end
    else
      button.quad = love.graphics.newQuad(0,0,button.L,button.H,button.L,button.H*3)
      button.FirstTimeIn = true
      if button.x > button.xStart then
        button.x = button.x - 1
      end
    end
  end

  button.flatUpdate = function(mouseX,mouseY)
    if button.isIn(mouseX,mouseY)  then
       
        if button.FirstTimeIn then
          button.FirstTimeIn = false
         snd_clic_menu_1:play()
        end
        
        if love.mouse.isDown(1) then
          button.BGColor =  pTxtColor 
          button.TxtColor = {1,1,1}
          button.BorderColor = {0,0,0}
        else
          button.BGColor = pTxtColor 
          button.TxtColor =  pBGColor 
          button.BorderColor = pBGColor
          if button.x < button.xStart+button.L/10 then
              button.x = button.x + button.speed
          end
        end
    else
      button.FirstTimeIn = true
      button.BGColor =  pBGColor 
      button.TxtColor = pTxtColor 
      button.BorderColor = pBorderCol
      if button.x > button.xStart then
        button.x = button.x - button.speed
      end
    end
  end

  return button
end
 --************************************************************************************************
 --                           LES INPUTS
 --************************************************************************************************
 gui.CreateInput = function(px,py,pL,pH,pFont,pBorderCol)
   local input = {}
    input.type = "input"
    input.isActive = false
    input.offset = 3
    input.waitTime = 0.5
    input.x = px
    input.y = py
    input.L = pL
    input.H = pH
    input.valeur = ""
    input.font = pFont
    input.BGColor =  {0,0,0}
    input.TxtColor =   {1,1,1}
    input.BorderColor = pBorderCol
    
    input.gizmo = {}
    input.gizmo.x     = px
    input.gizmo.y     = py + input.H/2 - input.font:getHeight()/2
    input.gizmo.exist = false
    input.gizmo.time  = 0.6
    input.gizmo.tmax  = 0.5
    input.gizmo.h     = input.font:getHeight()
    input.gizmo.clignotte = function(dt)
      input.gizmo.time = input.gizmo.time + dt
      if input.gizmo.time > input.gizmo.tmax then
          input.gizmo.time = 0
          input.gizmo.exist = not(input.gizmo.exist)
      end
    end
    input.gizmo.draw = function()
      if input.gizmo.exist then
        love.graphics.setLineWidth(2)
        love.graphics.setColor(1,1,1)
        love.graphics.line(input.gizmo.x,input.gizmo.y,input.gizmo.x,input.gizmo.y + input.gizmo.h  ) -- input.H-5)
        love.graphics.setLineWidth(1)
      end
    end
  
    input.isIn = function(mouseX,mouseY)
    if mouseX > input.x and mouseX < input.x + input.L and  mouseY > input.y and mouseY < input.y +   input.H then
     return true
    else
      return false
    end
  end
    
    
    input.update = function(dt,mouseX,mouseY)
      if input.isActive then
        input.gizmo.clignotte(dt)
        input.gizmo.x = input.x + input.offset +input.font:getWidth(input.valeur)+ 1
        if not(love.keyboard.isDown("backspace")) then
           input.waitTime = 0.5
        elseif  #input.valeur>0 then
           input.waitTime = math.max(0 ,input.waitTime - dt)
        end
        if input.waitTime == 0 then
         input.valeur = string.sub(input.valeur,1,#input.valeur-1)
        end
      end
    end
    
    input.updateKey = function(key)
      if input.isActive then
        if key == "return" then
          input.isActive = false
        elseif key =="backspace" and #input.valeur>0 then
        input.valeur = string.sub(input.valeur,1,#input.valeur-1)  
        end
      end
    end
    --a placer dans le main
    --[[function love.textinput(lettre)
        if pannel.elt["pName"].isActive then
    if pannel.elt["pName"].font:getWidth(pannel.elt["pName"].valeur ) < pannel.elt["pName"].L then
     pannel.elt["pName"].valeur = pannel.elt["pName"].valeur..lettre
    end
  end
    end]]--
    
    input.draw = function()
      love.graphics.setLineWidth(1)
      love.graphics.setFont(input.font)
      love.graphics.setColor(input.BGColor)
      love.graphics.rectangle("fill",input.x,input.y,input.L,input.H)
      love.graphics.setColor(input.BorderColor)
      love.graphics.rectangle("line",input.x,input.y,input.L-1,input.H-1)
      love.graphics.setColor(input.TxtColor)
      --love.graphics.print(input.valeur,input.x + input.offset ,input.y +input.H/2,0,1,1,0,input.font:getHeight(input.valeur)/2)
      love.graphics.printf(input.valeur,input.x + input.offset , input.y + input.H/2,input.L,"left",0,1,1,0,input.font:getHeight(input.valeur)/2)
      if input.isActive then
        input.gizmo.draw()
      end
    end
    
   return input
   end
 --************************************************************************************************
 --                           LES SWITCHS
 --************************************************************************************************
gui.CreateSwitch = function(px,py,pL,pH)
  local switch = {}
  switch.type = "switch"
  switch.light = 1
  switch.x = px
  switch.y = py
  switch.L = pL
  switch.H = pH
  switch.cx = switch.x + switch.L/2
  switch.cy = switch.y + switch.H/2
   
  switch.position = "OFF"
  switch.img = nil
  switch.quad = nil
  switch.flat = true
  
   switch.addSkin = function(pImg)
    switch.img = pImg
    switch.quad = love.graphics.newQuad(0,0,switch.L,switch.H,switch.L,switch.H*2)
    switch.flat = false
  end
  
  switch.isIn = function(mouseX,mouseY)
    if mouseX > switch.x and mouseX < switch.x + switch.L and  mouseY > switch.y and mouseY < switch.y +   switch.H then
     return true
    else
      return false
    end
  end
  
  switch.update = function(dt,mouseX,mouseY)
    if switch.isIn(mouseX,mouseY) then
      switch.light = 1
    else
      switch.light = 0.7
    end
  end
  
  switch.switch = function()
    if switch.position =="OFF" then
      switch.position = "ON"
    else
      switch.position = "OFF"
    end
  end
  
  switch.draw = function()
    if switch.flat then
      switch.flatDraw()
    else
      switch.skinDraw()
    end
 end
  switch.skinDraw = function()
    love.graphics.setColor(switch.light,switch.light,switch.light)
    if switch.position =="OFF" then
      switch.quad = love.graphics.newQuad(0,0,switch.L,switch.H,switch.L,switch.H*2)
    else
      switch.quad = love.graphics.newQuad(0,switch.H,switch.L,switch.H,switch.L,switch.H*2)
    end
    love.graphics.draw(switch.img,switch.quad,switch.x,switch.y)
  end
   switch.flatDraw = function()
    
    love.graphics.setColor(0.2,0.2,0.2, switch.light)
    love.graphics.rectangle("fill",switch.x,switch.y,switch.L,switch.H)
    
    if switch.position =="OFF" then
      love.graphics.setColor(0,1,0,0.5,switch.light)
    else
      love.graphics.setColor(1,0,0,0.5,switch.light)
    end
    love.graphics.ellipse("fill",switch.cx,switch.cy,switch.L*0.4,switch.H*0.4)
    love.graphics.setColor(0,0,0)
    love.graphics.ellipse("line",switch.cx,switch.cy,switch.L*0.4,switch.H*0.4)
  end
  return switch
  end
 --************************************************************************************************
 --                           LES MENUS
 --************************************************************************************************
gui.CreateMenu = function(px,py,pL,pH,pText,pFont,pBGColor,pTxtColor,pBorderColor)
  local menu  = {}
  menu.type = "menu"
  menu.head   = gui.CreateButton(px,py,pL,pH,pText,pFont,pBGColor,pTxtColor,pBorderColor)
  menu.nbItem = 0
  menu.H_item = pH*0.8
  menu.pannel =  gui.CreatePannel(px,py + pH+2,pL,0,{0,0,0,0},{0,0,0,0})
  menu.pannelExist = false
  
  menu.addItem = function(pName,pFont)
    menu.pannel.addButton(pName,0, menu.nbItem*menu.H_item,menu.head.L,menu.H_item,pName,pFont,menu.head.BGColor,menu.head.TxtColor, menu.head.BGColor)
    menu.nbItem = menu.nbItem + 1
    if menu.pannel.L < pFont:getWidth(pName) then
      menu.pannel.L = pFont:getWidth(pName)
    end
    menu.pannel.H = menu.pannel.H + menu.H_item
  end
  
  menu.update = function(dt,mouseX,mouseY)
    menu.head.update(dt,mouseX,mouseY)
    if menu.pannelExist then
      menu.pannel.update(dt,mouseX,mouseY)
    end
    
  end

  menu.draw = function ()
    menu.head.draw()
   if menu.pannelExist then
      menu.pannel.draw()
   end
   
    
  end

  return menu
end
return gui