function Stream = SNG(FP_input, StreamLength)

%Create an array of numbers from 0 to StreamLength
Data_Set = linspace(0,StreamLength-1,StreamLength);


%Psudo randomly sample an array with the same size
%for different streams this will give uncorrelated streams.
Sample = datasample(Data_Set,StreamLength,'Replace',false);


Stream = Sample < FP_input * StreamLength; %Generate stream with corresponding maximum period LFSR


