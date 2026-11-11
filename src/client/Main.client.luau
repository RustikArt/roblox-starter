--!strict
-- Client entry point.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local Config = require(Shared:WaitForChild("Config")) :: typeof(require(ReplicatedStorage.Shared.Config))

print(`[{Config.GameName}] client started`)
