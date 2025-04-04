load('Matlab_Sobol_Seq1_2^16.mat');

image_input = imread('33.jpg');
[x,y,z] = size(image_input)


Stream_Length_list = [8; 16; 32; 64; 128; 256];
Parallel_deg_list = [1; 2; 4; 8];

Error_table = table();
Error_table.('parallelism degree') = Parallel_deg_list;

tic
for i = 1:length(Stream_Length_list)
    Stream_Length = Stream_Length_list(i);
    for j = 1:length(Parallel_deg_list)
        Parallel_deg = Parallel_deg_list(j);
        Error_sum = 0;
        for ii = 1:x-1
            for jj = 1:y-1
                In_1 = double(image_input(ii, jj))/256;
                In_2 = double(image_input(ii+1, jj+1))/256;
                In_3 = double(image_input(ii, jj+1))/256;
                In_4 = double(image_input(ii+1, jj))/256;

                [Out_Expected, Out_Stochastic] = RobertCorrelated(In_1,In_2,In_3,In_4,Stream_Length,Parallel_deg,Data_Set);
                Edge_expected(ii,jj) = Out_Expected;
                Edge_stochastic(ii,jj) = Out_Stochastic;
                Error_sum = Error_sum + abs(Out_Expected-Out_Stochastic);
            end
        end
        Error_report(j,i) = Error_sum/(x*y);
    end
    Error_table.(string(Stream_Length)) = Error_report(:,i);
end


imwrite(Edge_stochastic, 'Edge_stochastic.jpg');
imwrite(Edge_expected, 'Edge_expected.jpg');

toc
Error_table
writetable(Error_table, 'Error_list.xls')