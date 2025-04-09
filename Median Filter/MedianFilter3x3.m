function [Out_Expected, Out_Stochastic] = MedianFilter3x3(In,Stream_Length,Parallel_deg)



Stream_In_1 =  design_approx(In(1),Stream_Length,Parallel_deg);
Stream_In_2 =  design_approx(In(2),Stream_Length,Parallel_deg);
Stream_In_3 =  design_approx(In(3),Stream_Length,Parallel_deg);
Stream_In_4 =  design_approx(In(4),Stream_Length,Parallel_deg);
Stream_In_5 =  design_approx(In(5),Stream_Length,Parallel_deg);
Stream_In_6 =  design_approx(In(6),Stream_Length,Parallel_deg);
Stream_In_7 =  design_approx(In(7),Stream_Length,Parallel_deg);
Stream_In_8 =  design_approx(In(8),Stream_Length,Parallel_deg);
Stream_In_9 =  design_approx(In(9),Stream_Length,Parallel_deg);

[Min_Sort1,Max_Sort1] = Sort(Stream_In_1,Stream_In_2);
[Min_Sort2,Max_Sort2] = Sort(Stream_In_3,Stream_In_4);
[Min_Sort3,Max_Sort3] = Sort(Stream_In_5,Stream_In_6);
[Min_Sort4,Max_Sort4] = Sort(Stream_In_7,Stream_In_8);
[Min_Sort5,Max_Sort5] = Sort(Min_Sort1,Min_Sort2);
[Min_Sort6,Max_Sort6] = Sort(Max_Sort1,Max_Sort2);
[Min_Sort7,Max_Sort7] = Sort(Min_Sort3,Min_Sort4);
[Min_Sort8,Max_Sort8] = Sort(Max_Sort3,Max_Sort4);

[Min_Sort9 ,Max_Sort9 ] = Sort(Min_Sort5,Min_Sort7);
[Min_Sort10,Max_Sort10] = Sort(Max_Sort6,Max_Sort8);
[Min_Sort11,Max_Sort11] = Sort(Min_Sort6,Max_Sort5);
[Min_Sort12,Max_Sort12] = Sort(Min_Sort8,Max_Sort7);

[Min_Sort13,Max_Sort13] = Sort(Min_Sort11,Min_Sort12);
[Min_Sort14,Max_Sort14] = Sort(Max_Sort11,Max_Sort12);
[Min_Sort15,Max_Sort15] = Sort(Min_Sort14,Max_Sort9);
[Min_Sort16,Max_Sort16] = Sort(Min_Sort10,Max_Sort13);

[Min_Sort17,Max_Sort17] = Sort(Min_Sort16,Max_Sort15);
[Min_Sort18,Max_Sort18] = Sort(Min_Sort17,Stream_In_9);
[Out_Stream,Max_Sort19] = Sort(Max_Sort17,Max_Sort18);
	                               
Out_Expected = median(In);

Out_Stochastic = sum(Out_Stream)/Stream_Length;

end

