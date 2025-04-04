function Stream = SNG2SobolFast(In_FP, Data_Set, Trunc_length)

Stream_first = Data_Set < In_FP;
Stream = Stream_first(1:Trunc_length);


