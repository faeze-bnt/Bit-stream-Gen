function Stream = SNGFirstOnes(FP_input, StreamLength)

%Create an array of numbers from 0 to StreamLength
Data_Set = linspace(0,StreamLength-1,StreamLength);


if FP_input<=1 %for FP inputs
    Stream = Data_Set < FP_input * StreamLength; % Generate stream with first all 1s then all 0s.
else           %for the case we are working with integer input
    Stream = Data_Set < FP_input; % Generate stream with first all 1s then all 0s.
end
