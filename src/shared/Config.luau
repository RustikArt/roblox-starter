--!strict
-- Central game configuration. Keep tunables here (data, not code) so they can be rebalanced quickly.

local Config = {
	GameName = "MyGame",
	Version = "0.1.0",
	StartingCoins = 100,
	Economy = {
		UpgradeBaseCost = 50,
		UpgradeGrowth = 1.35,
		MaxUpgradeLevel = 50,
	},
}

return Config
