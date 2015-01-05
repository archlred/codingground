local array = {1,0,2,3,4,5,6,7,8,9}

function parent(i)
    return math.floor(i/2)
end

function lt(i)
    return 2*i
end

function rt(i)
    return 2*i+1
end

function swap(A,i,j)
    local tmp = A[i]
    A[i] = A[j]
    A[j] = tmp
end

function mHeap(A, i)
    local l, r = lt(i), rt(i)
    local largest = 0
    
    if (l <= A.hs) and (A[l] > A[i]) then
        largest = l
    else
        largest = i
    end
    
    if (r<=A.hs) and (A[r]>A[largest]) then
        largest = r
    end
    
    if not (largest == i) then 
        swap(A,i,largest)
        mHeap(A, largest)
    end
end


function bmHeap(A)
    A.hs = #A
    for i=math.floor(#A/2), 1, -1 do
        mHeap(A,i)
    end
end

function heapSort(T)
    bmHeap(T)
    for i = #T, 2, -1 do
        swap(T,1,i)
        T.hs = T.hs - 1
        mHeap(T,1)
    end
end

heapSort(array)

local S = ""
local mr = 1
for i=1, #array do
    S = S..array[i].." "
end

print(S)