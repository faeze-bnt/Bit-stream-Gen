function [Out_Expected, Out_Stochastic] = RobertCorrelated(In_1,In_2,In_3,In_4,Stream_Length,Parallel_deg,Data_Set)

%In_1 = rand; In_2 = rand; In_3 = rand; In_4 = rand; 
%Stream_Length = 8;
%Parallel_deg = 2;


%%Processing unary bit-streams (fugen - exact)
Stream_In_1 = Fugen_exact(Stream_Length,Parallel_deg,In_1);
Stream_In_2 = Fugen_exact(Stream_Length,Parallel_deg,In_2);
Stream_In_3 = Fugen_exact(Stream_Length,Parallel_deg,In_3);
Stream_In_4 = Fugen_exact(Stream_Length,Parallel_deg,In_4);

Stream_S_1  = SNG2SobolFast(0.5,Data_Set,Stream_Length);

%%Processing unary bit-streams (fugen - approximate)
%Stream_In_1 = Fugen_approx(Stream_Length,Parallel_deg,In_1);
%Stream_In_2 = Fugen_approx(Stream_Length,Parallel_deg,In_2);
%Stream_In_3 = Fugen_approx(Stream_Length,Parallel_deg,In_3);
%Stream_In_4 = Fugen_approx(Stream_Length,Parallel_deg,In_4);

%Stream_S_1  = SNG(0.5,Stream_Length);

Out_Stream_1 = xor(Stream_In_1,Stream_In_2);
Out_Stream_2 = xor(Stream_In_3,Stream_In_4);

Bit_Width = Stream_Length/Parallel_deg;
for i=1:Bit_Width
    Out_Stream_Linear_1((i-1)*Parallel_deg+1:i*Parallel_deg) =  Out_Stream_1(:,i);
    Out_Stream_Linear_2((i-1)*Parallel_deg+1:i*Parallel_deg) =  Out_Stream_2(:,i);
end

Out_Stream_3 = MUX21(Out_Stream_Linear_1,Out_Stream_Linear_2,Stream_S_1);

Out_Expected_1 = (In_1 - In_2);
Out_Expected_2 = (In_3 - In_4);
Out_Expected = (abs(Out_Expected_1)+abs(Out_Expected_2))/2;

Out_Stochastic = sum(Out_Stream_3)/Stream_Length;


end