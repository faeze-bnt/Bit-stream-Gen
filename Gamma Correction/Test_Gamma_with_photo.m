
image_input = imread('33.jpg');
[x,y,z] = size(image_input)


Stream_Length_list = [256];
Parallel_deg_list = [4; 8];

Error_table = table();
Error_table.('parallelism degree') = Parallel_deg_list;

tic
for i = 1:length(Stream_Length_list)
    Stream_Length = Stream_Length_list(i);
    for j = 1:length(Parallel_deg_list)
        Parallel_deg = Parallel_deg_list(j);
        Error_sum = 0;
        for ii = 1:x
            for jj = 1:y
                X = double(image_input(ii, jj))/256;
                [Out_Expected, Out_Stochastic] = Gamma(X,Stream_Length,Parallel_deg);
                Edge_expected(ii,jj) = Out_Expected;
                Edge_stochastic(ii,jj) = Out_Stochastic;
                Error_sum = Error_sum + abs(Out_Expected-Out_Stochastic);
            end
        end
        Error_report(j,i) = 100*Error_sum/(x*y);
    end
    Error_table.(string(Stream_Length)) = Error_report(:,i);
end


imwrite(Edge_stochastic, 'Gamma_stochastic.jpg');
imwrite(Edge_expected, 'Gamma_expected.jpg');

toc
Error_table
writetable(Error_table, 'Error_list.xls')