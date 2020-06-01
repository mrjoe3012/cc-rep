std = {}

function std.out(...)
print(...)
end

list = {}

function list.find(list, target)

for _,v in pairs(list) do
    if v == target then return true end
end
return false
end

function list.findIndex(list, target)

local index = nil

for i=1,#list,1 do

if list[i] == target then
index = i
break
end


end

return index

end

function string.split(str, char)

arr = {}

buffer = ""

counter = 1

for i=1,#str,1 do
if str:sub(i,i) ~= char then
buffer = buffer .. str:sub(i,i)
else
arr[counter] = buffer
counter = counter + 1
buffer = ""
end

arr[counter] = buffer

end

return arr

end
