function [Min_Stream, Max_Stream] = Sort(Stream_1, Stream_2)

  Min_Stream = AND21(Stream_1,Stream_2);
  Max_Stream = OR21(Stream_1,Stream_2);



