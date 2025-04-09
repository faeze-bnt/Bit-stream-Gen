function [Out_Expected, Out_Stochastic] = Gamma(X,Stream_Length,Parallel_deg) 
 
%X = rand;
%Stream_Length = 8;
%Parallel_deg = 2;

X0= SNG(X,Stream_Length);
X1= SNG(X,Stream_Length);
X2= SNG(X,Stream_Length);
X3= SNG(X,Stream_Length);
X4= SNG(X,Stream_Length);
X5= SNG(X,Stream_Length);



b(1,:)= design_approx(Stream_Length,Parallel_deg,0.0955);
b(2,:)= design_approx(Stream_Length,Parallel_deg,0.7207); 
b(3,:)= design_approx(Stream_Length,Parallel_deg,0.3476); 
b(4,:)= design_approx(Stream_Length,Parallel_deg,0.9988); 
b(5,:)= design_approx(Stream_Length,Parallel_deg,0.7017); 
b(6,:)= design_approx(Stream_Length,Parallel_deg,0.9695); 
b(7,:)= design_approx(Stream_Length,Parallel_deg,0.9939); 



for k=1:Stream_Length
    select_line=X0(k)+X1(k)+X2(k)+X3(k)+X4(k)+X5(k)+1; %For n=6
    Out(k)=b(select_line,k);
end
 
Out_Expected = X.^0.45;
Out_Stochastic = sum(Out)/Stream_Length;
 
 
 
end


