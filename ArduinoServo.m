try
    a = arduino('COM3', 'Uno', 'Libraries', 'Servo');
%     s1 = servo(a, 'D9', 'MaxPulseDuration', 2.1e-3, 'MinPulseDuration', 0.9e-3);
%     s2 = servo(a, 'D11', 'MaxPulseDuration', 2.1e-3, 'MinPulseDuration', 0.9e-3);
    s1 = servo(a, 'D9');
    s2 = servo(a, 'D10');
    s3 = servo(a, 'D11');
    connected = true;
catch connected
    disp('Already connected');
end

% These equations take a joint angle as input and return the servo value
y1 = @(x1) (-0.00488 * x1) + 0.59;
y2 = @(x2) (-0.00488 * x2) + 0.23;

y3 = @(x3) (-204.5454 * x3) + 120.6818;
y4 = @(x4) (-204.5454 * x4) + 47.0454;

% s3 UP = 0.5200
% s3 DOWN = 0.1000
UP = 0.6;
DOWN = 0.2;

writePosition(s3, UP);
% Code to draw an O
% w = y1(radius * cos(deg2rad(0)) + 90);
% z = y2(radius * sin(deg2rad(0)) + -90);
% writePosition(s1, w);
% writePosition(s2, z);
% pause(0.5)
% 
% radius = 5;
% writePosition(s3, DOWN);
% for i = 0:360
%     w = y1(radius * cos(deg2rad(i)) + 90);
%     z = y2(radius * sin(deg2rad(i)) + -90);
%     hold on
%     scatter(w, z)
%     % MOVE END EFFECTOR TO THAT POSITION???
%     writePosition(s1, w);
%     writePosition(s2, z);
% end
% writePosition(s3, UP);
% close all

% Code for drawing an X
% q = 3;
% a = y1(2 * 0 + 45);
% b = y2(2 * 0 + -90);
% writePosition(s1, a);
% writePosition(s2, b);
% writePosition(s3, DOWN);
% for i = 0:q
%     a = y1(2 * i + 45);
%     b = y2(2 * i + -90);
%     hold on
%     scatter(a, b)
%     writePosition(s1, a);
%     writePosition(s2, b);
% end
% writePosition(s3, UP);
% 
% a = y1(2 * 0 + 45);
% b = y2(2 * 0 + -90);
% writePosition(s1, a);
% writePosition(s2, b);
% writePosition(s3, DOWN);
% for i = 0:q
%     a = y1(-2 * i + 45);
%     b = y2(-2 * i + -90);
%     scatter(a, b)
%     writePosition(s1, a);
%     writePosition(s2, b);
% end
% writePosition(s3, UP);
% 
% a = y1(2 * 0 + 45);
% b = y2(2 * 0 + -90);
% writePosition(s1, a);
% writePosition(s2, b);
% writePosition(s3, DOWN);
% for i = 0:q
%     a2 = y1(-2 * i + 45);
%     b2 = y2(2 * i + -90);
%     scatter(a2, b2)
%     writePosition(s1, a2);
%     writePosition(s2, b2);
% end
% writePosition(s3, UP);
% 
% a = y1(2 * 0 + 45);
% b = y2(2 * 0 + -90);
% writePosition(s1, a);
% writePosition(s2, b);
% writePosition(s3, DOWN);
% for i = 0:q
%     a2 = y1(2 * i + 45);
%     b2 = y2(-2 * i + -90);
%     scatter(a2, b2)
%     writePosition(s1, a2);
%     writePosition(s2, b2);
% end
% writePosition(s3, UP);

% Draw Grid
% writePosition(s1, y1(30));
% writePosition(s2, y2(-45));
% pause(0.5);
% writePosition(s3, DOWN);
% 
% for i = 0:20
%     t = y1(i + 30);
%     j = y2(3* i + -45);
% %     t = (i - 30) * cos(deg2rad(theta));
% %     j = (i + -90) * sin(deg2rad(theta));
%     hold on;
%     scatter(t, j);
%     writePosition(s1, t);
%     writePosition(s2, j);
% end
% writePosition(s3, UP);

% writePosition(s3, DOWN);
% for i = 0:5
%     t = y1(75);
%     j = y2(i + 0);
%     scatter(t, j);
%     writePosition(s1, t);
%     writePosition(s2, j);
% end
% 
% writePosition(s3, DOWN);
% for i = 0:15
%     t = y1(i + 70);
%     j = y2(1.5);
%     scatter(t, j);
%     writePosition(s1, t);
%     writePosition(s2, j);
% end
% writePosition(s3, UP);
% 
% writePosition(s3, DOWN);
% for i = 0:15
%     t = y1(i + 70);
%     j = y2(3.5);
%     scatter(t, j);
%     writePosition(s1, t);
%     writePosition(s2, j);
% end
% writePosition(s3, UP);

% NOTE: the numbers being added (e.g. 45 and -90) indicate the center of the
% shape being drawn, they obviously must be within that joints limits
