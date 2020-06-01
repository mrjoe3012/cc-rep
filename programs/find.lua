local print = utils.std.out

local function PrintHelp()
print("usage: find <pattern> <text>")
end

local function CheckIndex(text, target, index)

local str = string.sub(text,index,index+#target-1)

if str == target then
return true
else 
return false
end
end

local function GetIndexes(text, target)

local indexes = {}

for i=1,#text-#target+1,1 do

if CheckIndex(text, target, i) == true then
indexes[#indexes+1] = i
end

end
return indexes
end

args = {...}

if args == nil or #args ~= 2 then
PrintHelp()
else

local pattern = args[1]
local text = args[2]

local indexes = GetIndexes(text, pattern)

local SEEK_SIZE = 15

for i=1,#indexes,1 do

local start = indexes[i]

if start-SEEK_SIZE < 1 then start = 1
else start = start-SEEK_SIZE end

local e = indexes[i]+#pattern

if e+SEEK_SIZE > #text then e = #text
else e = e+SEEK_SIZE end

str = string.sub(text,start,e)
print(str)

end

end
