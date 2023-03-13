model model2
Real N = 18354;
Real I;
Real R;
Real S;
Real alpha = 0.01;
Real beta = 0.03;
initial equation
I = 102;
R = 100;
S = N - I - R;
equation
der(S) = -alpha*S;
der(I) = alpha*S - beta*I;
der(R) = beta*I;
annotation(experiment(StartTime=0, StopTime=100, Tolerance=1e-6, Interval=0.05));
end model2;
