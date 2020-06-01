local _out = utils.std.out

local function PrintHelp()

print("usage: redirect <command> <arguments> <filename>")

end

output = {}
function PrintRedirect(...)

output[#output+1] = tostring(...)

end
args = {...}

if #args < 2 then
PrintHelp()
else
utils.std.out = PrintRedirect
command = ""
commandName = args[1]
fileName = args[#args]
commandArgs = {}

if #args > 2 then
local counter = 1
for i=2,#args-1,1 do
commandArgs[counter] = args[i]
counter = counter + 1 
end
end

command = commandName

for i=1,#commandArgs,1 do
command = command .. " \"" .. commandArgs[i] .. "\""
end

shell.run(command)

utils.std.out = _out

mode = "w"

if fs.exists(fileName) == true then mode = "a" end

file = fs.open(fileName, mode)
for i=1,#output,1 do
file.writeLine(output[i])
end
file.close()

end
