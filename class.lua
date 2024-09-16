Class = {}
Class._index = Class

-- Default implementation
function Class:new() print("new from base") end

-- Create a new Class type from our base class
function Class:derive(type)
    local cls = {}
    cls.type = type
    cls.__index = cls
    cls.super = self
    setmetatable(cls, self)
    return cls
end

function Class:__call(...)
    local inst = setmetatable({}, self)
    inst:new(...)
    return inst
end

function Class:get_type()
    return self.type
end

return Class