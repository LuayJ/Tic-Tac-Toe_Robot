function [e] = objFun(a)
e = [];
data = [1 6.2; -1 2.1; 0 3.4; 2 10.9; 3 18.2];
err = [];
for row = 1:5
    y_act = data(row,2);
    y_test = a(1)* (data(row, 1))^2 + a(2) * (data(row, 1)) + a(3);
    err = abs(y_act - y_test);
end
e = [e, err];
end