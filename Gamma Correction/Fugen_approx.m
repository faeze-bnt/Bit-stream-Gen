function Stream = Fugen_approx(Stream_Length, Parallel_deg,Input_number)

Inp_value = int16(Input_number*Stream_Length);
Bit_Width = Stream_Length/Parallel_deg;

%defalut data type is double
outp = zeros(Parallel_deg, Bit_Width); 

for i=1:size(outp,2)
    if Inp_value >= Parallel_deg
        outp(:,i) = ones(Parallel_deg, 1, 'int8');
        Inp_value = Inp_value - Parallel_deg;
    else
        break
    end
end

for i=1:Bit_Width
    Outp_1((i-1)*Parallel_deg+1:i*Parallel_deg) =  outp(:,i);
end

Stream = Outp_1;



