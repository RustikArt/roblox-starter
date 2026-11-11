local RemoteGuard = require("../src/shared/RemoteGuard")

local spec = {}

spec["accepts integers in range"] = function(t)
	t.equal(RemoteGuard.isIntegerInRange(5, 1, 10), true)
end

spec["rejects NaN"] = function(t)
	t.equal(RemoteGuard.isIntegerInRange(0 / 0, 1, 10), false)
end

spec["rejects infinity"] = function(t)
	t.equal(RemoteGuard.isFiniteNumber(math.huge), false)
end

spec["rejects non-integers"] = function(t)
	t.equal(RemoteGuard.isIntegerInRange(2.5, 1, 10), false)
end

spec["rejects out of range"] = function(t)
	t.equal(RemoteGuard.isIntegerInRange(11, 1, 10), false)
end

spec["rejects wrong types"] = function(t)
	t.equal(RemoteGuard.isStringOfLength(42, 1, 5), false)
end

spec["string length bounds"] = function(t)
	t.equal(RemoteGuard.isStringOfLength("abc", 1, 5), true)
	t.equal(RemoteGuard.isStringOfLength("abcdefgh", 1, 5), false)
end

spec["isOneOf matches allowed values"] = function(t)
	t.equal(RemoteGuard.isOneOf("sword", { "sword", "bow" }), true)
	t.equal(RemoteGuard.isOneOf("axe", { "sword", "bow" }), false)
end

return spec
