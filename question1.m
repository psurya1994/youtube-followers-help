%% Question by Joseph, Code by Surya Penmetsa
% Find the flight path of a model rocket with mass 0.1 kg. During the first
% T(inital) 0.015 seconds, the rocket is propelled forward by the rocket
% engine with a force of 16N. The rocket then flies up while slowing down
% under teh force of gravity once the engine is switched off at T(inital)
% seconds. After the rocket reaches its apex, it starts to fall back down.
% When its forward velocity reaches 20 m/s the parachute opens (assumed to
% be opend instantly) and the rocket continues to drop at a constant
% velocity of 20m/s until it hits the ground.
% 
% Create a MATLAB script that determines and plots the (height against
% time) abd (velocity against time) of the model rocket as a function of
% time of flight.
%
% Repeat the experiment for T(initial) = 0.1, 0.3

mass = 0.1;

accelerationArray = [];
velocityArray = [];
heightArray = [];
presentVelocity = 0;
previousVelocity = 0;
presentHeight = 0;
previousHeight = 0;
dt = 0.001;
timeInitial = 0.3;

for time = 0:dt:100;
    if(time < timeInitial)
        force = 16;
        presentAcceleration = force/mass;
    else
        presentAcceleration = -9.8;
    end
    if(presentVelocity <= -20)
        presentVelocity = -20;
        presentAcceleration = 0;
    end
    presentVelocity = previousVelocity + presentAcceleration*dt;
    
    presentHeight = previousHeight + presentVelocity*dt;
    accelerationArray = [accelerationArray presentAcceleration];
    velocityArray = [velocityArray presentVelocity];
    heightArray = [heightArray presentHeight];
    
    if(presentHeight <= 0)
        break;
    end
    
    previousVelocity = presentVelocity;
    previousHeight = presentHeight;
end
endTime = (size(accelerationArray)-1)*dt;


subplot(1,3,1), plot(0:dt:endTime(2), accelerationArray);
xlabel('Time (s)'); ylabel('Acceleration (m/s^2)');
subplot(1,3,2), plot(0:dt:endTime(2), velocityArray);
xlabel('Time (s)'); ylabel('Velocity (m/s)');
subplot(1,3,3), plot(0:dt:endTime(2), heightArray);
xlabel('Time (s)'); ylabel('Height (m)');

