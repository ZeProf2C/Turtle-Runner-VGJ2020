--[[
createur : Olivier Sicard alias KroxX
contact  : kroxx.prod@gmail.com

 ██████╗ ██████╗ ███╗   ██╗███████╗████████╗██████╗ ██╗   ██╗ ██████╗████████╗ ██████╗ ██████╗     
 ██╔════╝██╔═══██╗████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║   ██║██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗    
 ██║     ██║   ██║██╔██╗ ██║███████╗   ██║   ██████╔╝██║   ██║██║        ██║   ██║   ██║██████╔╝    
 ██║     ██║   ██║██║╚██╗██║╚════██║   ██║   ██╔══██╗██║   ██║██║        ██║   ██║   ██║██╔══██╗    
 ╚██████╗╚██████╔╝██║ ╚████║███████║   ██║   ██║  ██║╚██████╔╝╚██████╗   ██║   ╚██████╔╝██║  ██║    
  ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝  ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝    
                                                                                                    
 Copyright (c) 2020 Sicard

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

]]


function newParticle(p_x,p_y,p_L,p_W,p_H,p_color)
    local p = {}
    p.target     = {x = p_x , y= p_y} 
    p.L          = p_L
    p.colorLine  = p_color
    p.colorFill  = {p.colorLine[1]*1.5,p.colorLine[2]*1.5,p.colorLine[3]*1.5,p.colorLine[4]*0.5}
    p.W          = p_W
    p.H          = p_H
    p.pos        = {x = math.random(p.W) , y= math.random(p.H)} 
    p.speed      = {x = 0 , y= 0}
    p.coeffSpeed = 1 + math.random()*10

    function p.update(dt)
         p.speed.x = p.coeffSpeed * (p.target.x - p.pos.x)
         p.speed.y = p.coeffSpeed * (p.target.y - p.pos.y)
         p.pos.x   = p.pos.x + p.speed.x * dt
         p.pos.y   = p.pos.y + p.speed.y * dt
    end

    function p.draw()
        love.graphics.setColor(p.colorFill)
        love.graphics.rectangle("fill", p.pos.x, p.pos.y , p.L , p.L)
        love.graphics.setColor(p.colorLine)
        love.graphics.rectangle("line", p.pos.x, p.pos.y , p.L , p.L)
    end

    return p
end


--[[
    newAnimation est la fonction principale de ce module
        * p_x , p_y sont les coordonnées du coin haut-gauche de votre image
        * p_granularity est la taille en pixel d'un carré dans l'animation 
        (Pour de grande image un p_granularity trop faible risque de baisser le nombre de fps )
        * img_path est le chemin vers votre image en partant de la ou se trouve votre main.lua 
]]

function newPixelAnimation(p_x,p_y , p_granularity , img_path)
    local anim = {}
    anim.path         = img_path 
    anim.offset       = {x = p_x , y= p_y} 
    anim.img          = love.graphics.newImage(anim.path)
    anim.screenW      = love.graphics.getWidth()
    anim.screenH      = love.graphics.getHeight()
    anim.data         = love.image.newImageData(anim.path)
    anim.W            = anim.data:getWidth()
    anim.H            = anim.data:getHeight()
    anim.granular     = p_granularity
    anim.listParticle = {}
    for i = 0 , anim.W-1 , anim.granular do 
        for j = 0 , anim.H-1 , anim.granular do 
            local r,g,b,a = anim.data:getPixel(i, j)
            if a > 0 then 
                table.insert(anim.listParticle , newParticle(anim.offset.x + i  ,
                                                             anim.offset.y + j  ,
                                                             anim.granular,anim.screenW ,anim.screenH,
                                                            {r,g,b,a}))
            end
        end
    end

    -- Cette fonction permet de réinitialiser la position des carrés sur l'écran
    function anim.initialize()
        for _,p in pairs(anim.listParticle) do
            p.pos        = {x = math.random(p.W) , y= math.random(p.H)} 
            p.coeffSpeed = 1 + math.random()*3
        end
    end


    --les methodes update et draw sont à utiliser dans votre main
    function anim.update(dt)
        for _,p in pairs(anim.listParticle) do
            p.update(dt)
        end
    end

    function anim.draw()  
        for _,p in pairs(anim.listParticle) do
            p.draw()
        end
    end
    return anim
end
