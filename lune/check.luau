-- Runs every quality gate, cross-platform: `lune run check`
-- Steps: format check, lint, type check, unit tests, build.
local process = require("@lune/process")
local fs = require("@lune/fs")

local DEFINITIONS = "globalTypes.d.luau"

local function run(label: string, program: string, args: { string }): boolean
	local result = process.exec(program, args)
	if result.ok then
		print(`PASS  {label}`)
		return true
	end
	print(`FAIL  {label}`)
	local output = result.stdout .. result.stderr
	if #output > 0 then
		print(output)
	end
	return false
end

local function download(url: string, path: string)
	local net = require("@lune/net")
	local response = net.request(url)
	if not response.ok then
		error(`could not download {url} ({response.statusCode})`)
	end
	fs.writeFile(path, response.body)
end

-- Roblox API definitions needed by luau-lsp and selene (cached, git-ignored).
if not fs.isFile(DEFINITIONS) then
	print("Downloading Roblox type definitions...")
	download(
		"https://raw.githubusercontent.com/JohnnyMorganz/luau-lsp/main/scripts/globalTypes.None.d.luau",
		DEFINITIONS
	)
end
if not fs.isFile("roblox.yml") then
	print("Generating selene Roblox standard library...")
	process.exec("selene", { "generate-roblox-std" })
end

local ok = true
ok = run("format (stylua)", "stylua", { "--check", "src", "tests", "lune" }) and ok
ok = run("sourcemap (rojo)", "rojo", { "sourcemap", "default.project.json", "--output", "sourcemap.json" }) and ok
ok = run("lint (selene)", "selene", { "src" }) and ok
ok = run("types (luau-lsp)", "luau-lsp", {
	"analyze",
	"--sourcemap=sourcemap.json",
	`--definitions={DEFINITIONS}`,
	"--base-luaurc=.luaurc",
	"src",
}) and ok
ok = run("unit tests (lune)", "lune", { "run", "tests/run" }) and ok
fs.writeDir("build")
ok = run("build (rojo)", "rojo", { "build", "default.project.json", "--output", "build/game.rbxl" }) and ok

if ok then
	print("\nAll checks passed.")
else
	print("\nSome checks failed.")
end
process.exit(if ok then 0 else 1)
