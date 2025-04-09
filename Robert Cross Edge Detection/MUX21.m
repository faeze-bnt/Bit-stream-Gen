function Out_Stream = MUX21(Stream_1, Stream_2, Stream_S)

for i=1:size(Stream_S,1)
    if Stream_S(i)==0
        Out_Stream(i)=Stream_1(i);
    else
        Out_Stream(i)=Stream_2(i);
    end
end


