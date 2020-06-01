local print = utils.std.out

local function PrintHelp()

print("usage: echo <argument>")
print("echo #filename")

end

local function EchoFile(filename)

local output = ""

local file = fs.open(filename,"r")

if not file then print("file \""..filename.."\" does not exist") 
else
output = file.readAll()
file.close()
print(output) 
end
end

args = {...}

if #args < 1 or #args > 1 then
PrintHelp()
else
if string.sub(args[1],1,1) == "#" then
EchoFile(string.sub(args[1],2,#args[1]))
else

print(args[1])

end

end

