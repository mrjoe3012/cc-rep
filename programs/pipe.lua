local print = utils.std.out

_out = utils.std.out 

local output = ""

function PrintRedirect(...)

if #output == 0 then
output = tostring(...)
else
output = output.."\n"..tostring(...)
end
end

local function PrintHelp()

print("usage: pipe <program1> <args> | <program2> <args>")
print("program1 output is placed after program2 arguments.")

end

args = {...}

if #args < 2 or utils.list.find(args, "|") == false then
PrintHelp()
else

local splitIndex = utils.list.findIndex(args,"|") 
local command1 = ""
local command2 = ""

for i=1,#args,1 do

local str = ""

if i==1 or i==splitIndex+1 then
str = args[i]
else
str = " \""..args[i].."\""
end

if i < splitIndex then command1 = command1..str end
if i > splitIndex then command2 = command2..str end

end
utils.std.out = PrintRedirect
shell.run(command1)

utils.std.out = _out
command2Args = "\""..output.."\""

shell.run(command2 .. " " .. command2Args)

end
