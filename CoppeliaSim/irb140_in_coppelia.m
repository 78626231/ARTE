% This small example illustrates how to use the remote API
% synchronous mode. The synchronous mode needs to be
% pre-enabled on the server side. You would do this by
% starting the server (e.g. in a child script) with:
%
% simRemoteApi.start(19999,1300,false,true)
%
% But in this example we try to connect on port
% 19997 where there should be a continuous remote API
% server service already running and pre-enabled for
% synchronous mode.
%
% IMPORTANT: for each successful call to simxStart, there
% should be a corresponding call to simxFinish at the end!

function irb140_in_coppelia()
    %global simulation
    n_joints = 6;
    n_col_objects = 0;
    simulation = coppelia_init(n_joints, n_col_objects);
    
    q = [0.1 0.2 0.3 0.4 0.5 0.6]';
    dq = 0.1*[1 1 1 1 1 1]';
    for i=1:40
       q = q + dq;
       drawrobotcoppelia(simulation, q)
    end
    
    coppelia_end(simulation);
end
