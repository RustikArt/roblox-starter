--!strict
-- Pure economy helpers (no Roblox APIs): easy to unit test with Lune.

local Economy = {}

-- Cost of reaching `level` (level 1 costs `base`).
function Economy.upgradeCost(base: number, growth: number, level: number): number
	assert(level >= 1, "level must be >= 1")
	return math.floor(base * growth ^ (level - 1) + 0.5)
end

function Economy.canAfford(balance: number, cost: number): boolean
	return balance >= cost and cost >= 0
end

-- Returns the new balance, or nil when the purchase is not possible.
function Economy.purchase(balance: number, cost: number): number?
	if not Economy.canAfford(balance, cost) then
		return nil
	end
	return balance - cost
end

return Economy
