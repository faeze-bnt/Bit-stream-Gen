function [Out_Expected, Out_Stochastic] = Gamma(X,Stream_Length)

%X = rand;
%Stream_Length = 8;


X0= SNG(X,Stream_Length);
X1= SNG(X,Stream_Length);
X2= SNG(X,Stream_Length);
X3= SNG(X,Stream_Length);
X4= SNG(X,Stream_Length);
X5= SNG(X,Stream_Length);

b(1,:)= SNGFirstOnes(0.0955,Stream_Length);
b(2,:)= SNGFirstOnes(0.7207,Stream_Length);
b(3,:)= SNGFirstOnes(0.3476,Stream_Length);
b(4,:)= SNGFirstOnes(0.9988,Stream_Length);
b(5,:)= SNGFirstOnes(0.7017,Stream_Length);
b(6,:)= SNGFirstOnes(0.9695,Stream_Length);
b(7,:)= SNGFirstOnes(0.9939,Stream_Length);


for k=1:Stream_Length
    select_line=X0(k)+X1(k)+X2(k)+X3(k)+X4(k)+X5(k)+1; %For n=6
    Out(k)=b(select_line,k);
end

Out_Expected = X.^0.45;
Out_Stochastic= sum(Out)/Stream_Length;



end