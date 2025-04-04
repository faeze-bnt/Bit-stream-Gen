
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
            X = Rand256;
            [Out_Expected, Out_Stochastic] = Gamma(X,Stream_Length,Parallel_deg);
            Error(iteration) = abs(Out_Expected-Out_Stochastic);
        end
        Error_rate = 100*mean(Error);
        Error_report(j,i) = Error_rate;
    end

    Error_table.(string(Stream_Length)) = Error_report(:,i);
end


Error_table
writetable(Error_table, 'Error_list.xls')


