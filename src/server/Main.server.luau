--!strict
-- Server entry point: starts services in a fixed order.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(ReplicatedStorage.Shared.Config)
local PlayerService = require(script.Parent.Services.PlayerService)

PlayerService.start()

print(`[{Config.GameName}] server started (v{Config.Version})`)
