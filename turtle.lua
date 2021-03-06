turtle = {}
turtle.defaultTermSize = {10,10}
local turtleInj = {}

function turtle.init()
end

function turtle.new()
    local tab = {}
    tab.computerTerminal = computerTerminal.new()
    turtle.inject(tab)
    return tab

end

function turtle.inject(tab)
    setmetatable(tab,{__index=turtleInj})
end

function turtleInj:setWorld(w,x,y,z,dir)
    if world.worlds[w].isValidCoord(world.worlds[w],x,y,z) then
        local tW = world.worlds[w]
        self.world = tW
        self.x = x
        self.y = y
        self.z = z
        self.dir = dir
        tW:setBlock(x,y,z,{blockRegistry.TURTLE,self})
    end
end

