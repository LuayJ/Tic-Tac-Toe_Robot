function avg_error = Objective(param)
            L(1) = Link('revolute', 'd', param(1, 1), 'a', param(1, 2), 'alpha', param(1, 3), 'offset', param(1, 4));
            L(2) = Link('revolute', 'd', param(2, 1), 'a', param(2, 2), 'alpha', param(2, 3), 'offset', param(2, 4));
            jointAngles2 = [0 0];
            robot2 = SerialLink(L, 'name', 'robot2');
            robot2.base = [0 -9 0];
            robot2.plot(jointAngles2);
            
            
            m = readmatrix('EEPos3.txt');  % m is an ARRAY
            mat = [m(1:5); m(6:10); m(11:15)].';  % Matrix of the stuff in m
            diffarr = zeros(1, 5);

            for row = 1:5
                dist_Actual = mat(row, 3);
                jointAngles2(1) = deg2rad(mat(row, 1));
                jointAngles2(2) = deg2rad(mat(row, 2));
%                 robot2.plot(jointAngles2);
                pos = robot2.fkine(jointAngles2);
                dist_model = hypot(pos.t(1), pos.t(2));
                diff = abs(dist_Actual - dist_model);
                diffarr(row) = diff;
            end
            
            avg_error = sum(diffarr) / 5
        end