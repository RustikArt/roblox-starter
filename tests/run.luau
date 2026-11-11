-- Minimal test runner for pure-Luau logic (run with: lune run tests/run)
local process = require("@lune/process")

local specs: { [string]: { [string]: (any) -> () } } = {
	Economy = require("./Economy.spec"),
	RemoteGuard = require("./RemoteGuard.spec"),
	-- Add new spec files here.
}

local t = {}
function t.equal(actual: any, expected: any)
	if actual ~= expected then
		error(`expected {tostring(expected)}, got {tostring(actual)}`, 2)
	end
end
function t.truthy(value: any)
	if not value then
		error("expected a truthy value", 2)
	end
end

local passed, failed = 0, 0
for suiteName, suite in specs do
	for testName, fn in suite do
		local ok, err = pcall(fn, t)
		if ok then
			passed += 1
		else
			failed += 1
			print(`FAIL  {suiteName} > {testName}: {tostring(err)}`)
		end
	end
end

print(`{passed} passed, {failed} failed`)
process.exit(if failed == 0 then 0 else 1)
