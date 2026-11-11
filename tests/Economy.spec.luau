local Economy = require("../src/shared/Economy")

local spec = {}

spec["level 1 costs the base price"] = function(t)
	t.equal(Economy.upgradeCost(50, 1.35, 1), 50)
end

spec["cost grows with level"] = function(t)
	t.truthy(Economy.upgradeCost(50, 1.35, 5) > Economy.upgradeCost(50, 1.35, 4))
end

spec["purchase deducts the cost"] = function(t)
	t.equal(Economy.purchase(100, 40), 60)
end

spec["purchase fails when balance is too low"] = function(t)
	t.equal(Economy.purchase(10, 40), nil)
end

spec["negative costs are rejected"] = function(t)
	t.equal(Economy.canAfford(100, -5), false)
end

return spec
