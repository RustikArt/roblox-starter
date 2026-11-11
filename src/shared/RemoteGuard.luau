--!strict
-- Server-side validators for data received from clients. Never trust the client:
-- every RemoteEvent/RemoteFunction argument must go through one of these.

local RemoteGuard = {}

function RemoteGuard.isFiniteNumber(value: unknown): boolean
	return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
end

function RemoteGuard.isIntegerInRange(value: unknown, min: number, max: number): boolean
	if not RemoteGuard.isFiniteNumber(value) then
		return false
	end
	local n = value :: number
	return n % 1 == 0 and n >= min and n <= max
end

function RemoteGuard.isStringOfLength(value: unknown, minLength: number, maxLength: number): boolean
	if type(value) ~= "string" then
		return false
	end
	local length = #(value :: string)
	return length >= minLength and length <= maxLength
end

function RemoteGuard.isOneOf(value: unknown, allowed: { unknown }): boolean
	for _, candidate in allowed do
		if candidate == value then
			return true
		end
	end
	return false
end

return RemoteGuard
