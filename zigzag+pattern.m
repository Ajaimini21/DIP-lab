clc;close all;
% This code works for all square images. 
im = [1 2 6 7;3 5 8 13;4 9 12 14;10 11 15 16]';
%Creating empty output matrix
[Out_vec,index] = deal(zeros(size(im,1)*size(im,2),1),1);
%Traversing in zig-zag pattern and storing 
for i = 1:size(im,1)
    if mod(size(im,1),2) == 0
        if i < size(im,1)
            if mod(i,2) == 0
                k = i;
                for j = 1:i
                    Out_vec(index)=im(k,j);
                    [k,index] = deal(k-1,index+1);
                End
            elseif mod(i,2) ~= 0
                k = 1;
                for j = i:-1:1
                    Out_vec(index) = im(k,j);
                    [k,index] = deal(k+1,index+1);
                End
            End
        elseif i == size(im,1)
            k = i;
            for j = 1:i
                Out_vec(index)=im(k,j);
                [k,index] = deal(k-1,index+1);
            End
            for j = 2:size(im,1)
                if mod(j,2) == 0
                    k = j;
                    for l = size(im,1):-1:j
                        Out_vec(index) = im(k,l);
                        [k,index] = deal(k+1,index+1);
                    end
                elseif mod(j,2) ~= 0
                    for l = size(im,1):-1:j
                        Out_vec(index) = im(l,j);
                        [j,index] = deal(j+1,index+1);
                    end
                End
            end      
        End
    elseif mod(size(im,1),2) ~= 0
        if i < size(im,1)
            if mod(i,2) == 0
                k = i;
                for j = 1:i
                    Out_vec(index)=im(k,j);
                    [k,index] = deal(k-1,index+1);
                End
            elseif mod(i,2) ~= 0
                k = 1;
                for j = i:-1:1
                    Out_vec(index) = im(k,j);
                    [k,index] = deal(k+1,index+1);
                End
            End
        elseif i == size(im,1)
            k = 1;
            for j = i:-1:1
                Out_vec(index) = im(k,j);
                [k,index] = deal(k+1,index+1);
            End
            for j = 2:size(im,1)
                if mod(j,2) == 0
                    k = j;
                    for l = size(im,1):-1:j
                        Out_vec(index) = im(l,k);
                        [k,index] = deal(k+1,index+1);
                    end
                elseif mod(j,2) ~= 0
                    for l = size(im,1):-1:j
                        Out_vec(index) = im(j,l);
                        [j,index] = deal(j+1,index+1);
                    end
                End
            end      
        End
    End
End
%Input matrix
Im
%Output
Out_vec
