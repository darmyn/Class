--!strict

local privateMemory = {} 
local Class = {public = {}, private = {}}
Class.public.interface = {}
Class.public.behavior = {}
Class.public.meta = {__index = Class.public.behavior}
Class.private.behavior = {}
Class.private.memory = privateMemory

function Class.public.interface.new()
	local public = setmetatable({}, Class.public.meta)
	local private = table.clone(Class.private.behavior)

	public.x = 5
	private.y = 3
	private.z = 8

	privateMemory[public] = setmetatable(private, {__index = public})
	return public
end

function Class.public.behavior.getY(self: Class)
	local private = privateMemory[self]
	return private.y
end

function Class.public.behavior.addXY(self: Class)
	local private = privateMemory[self]
	return private.x + private.y
end

function Class.private.behavior.addXYZ(self: ClassPrivate)
	local public = getmetatable(self).__index
	return public.x + self.y + self.z
end

function Class.public.behavior.destroy(self: Class)
	privateMemory[self] = nil
end

type Class = typeof(Class.public.interface.new(...))
type ClassPrivate = typeof(Class.private.memory[...])
export type Type = Class

return Class.public.interface