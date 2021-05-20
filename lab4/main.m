load('energy_train.mat');
N=96;

%% R1a)

a = r1a(x_train,N);

%% R1b)

%Prediction

i=N+1;
aux=x_train(1:N);
while(i<=length(x_train))
   aux(i)=a*x_train(i-N);
   i=i+1;
end

%Plot da training data, da prediction e do residuo correspondente

%% R1c)
%Calculo do residuo
i=1;
while(i<length(x_train)-N)
   r(i)=x_train(i+N)-a*x_train(i);
   i=i+1; 
end

% Energia do residuo
energy_r = energy(r);

%% R1d)

%Definir P

P = 6;

%Calculo coeficientes

a_r = calc_coef(r,P);

%% R1e)
r_predicted = r(1:P);
r_predicted(P:length(r)) = 0; %Not sure

for n=1+P:length(r)
    for k=1:P
        r_predicted(n) = r_predicted(n) + a_r(k)*r_predicted(n-k);
    end
end

%Calculo do residuo
for i=1+P:length(r_predicted)
    for k=1:P
        e(i)=r_predicted(i)-a_r(k)*r_predicted(i-k);
    end
end

%% R1f)

%Calculo coeficientes



% Energia do residuo
energy_e = energy(e);