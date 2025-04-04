load('Matlab_Sobol_Seq1_2^16.mat');

Total_iterations = 500;

Stream_Length_list = [8; 16; 32; 64; 128; 256; 512]; 
Parallel_deg_list = [1; 2; 4; 8];

Error_table = table();
Error_table.('parallelism degree') = Parallel_deg_list;

for i = 1:length(Stream_Length_list)
    Stream_Length = Stream_Length_list(i);
    for j = 1:length(Parallel_deg_list)
        Parallel_deg = Parallel_deg_list(j);
        for iteration = 1:Total_iterations
            In_1 = Rand256; In_2 = Rand256; In_3 = Rand256; In_4 = Rand256; 
            [Out_Expected, Out_Stochastic] = RobertCorrelated(In_1,In_2,In_3,In_4,Stream_Length,Parallel_deg,Data_Set);
            Error(iteration) = abs(Out_Expected-Out_Stochastic);
        end
        Error_rate = 100*mean(Error, 'all');
        Error_report(j,i) = Error_rate;
    end

    Error_table.(string(Stream_Length)) = Error_report(:,i);
end


Error_table
writetable(Error_table, 'Error_list.xls')


