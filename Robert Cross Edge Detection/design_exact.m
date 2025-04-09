function Stream = design_exact(Stream_Length, Parallel_deg, Input_number)

Inp_value = int16(Input_number*Stream_Length);
Bit_Width = Stream_Length/Parallel_deg;

outp = zeros(Parallel_deg,Bit_Width);  %defalut data type is double


for i=1:size(outp,2)
    if Inp_value>=Parallel_deg
        outp(:,i) = ones(Parallel_deg, 1, 'int8');
        Inp_value = Inp_value - Parallel_deg;
    else
        for ii=1:Parallel_deg
            if Inp_value > 0
                outp(ii, i) = 1;
                Inp_value = Inp_value - 1;
            end
        end
        break
    end
end

Stream = outp;



