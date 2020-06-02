-- standard functions

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

--string functions

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

-- stopwatch functions

stopwatch = {}
local _stopwatch = {}

_stopwatch.ticks = 0
_stopwatch.stop = false

function stopwatch.start()
_stopwatch.ticks = 0
_stopwatch.stop = false

while not _stopwatch.stop do

os.sleep(1/20)
_stopwatch.ticks = _stopwatch.ticks + 1

end

end

function stopwatch.stop()

_stopwatch.stop = true

end

function stopwatch.get()

return _stopwatch.ticks

end


