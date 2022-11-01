%% Plot Code

subplot(3,1,1)
plot(throttle,'linewidth',1.5)
grid on
hold on
plot(throttle1,'linewidth',1.5)
title('Throttle Angle')
xlabel('Time (sec)')
ylabel('throttle (%)')
axis([0 60 0 105])
legend('Straight','Grade 5%')

subplot(3,1,2)
plot(u*3.6,'linewidth',1.5)
grid on
hold on
plot(u1*3.6,'linewidth',1.5)
title('Longitudinal Velocity')
xlabel('Time (sec)')
ylabel('V_x (km/h)')
axis([0 60 0 110])
legend('Straight','Grade 5%')

subplot(3,1,3)
plot(gear,'linewidth',1.5)
grid on
hold on
plot(gear1,'linewidth',1.5)
title('Gear')
xlabel('Time (sec)')
ylabel('Gear level')
axis([0 60 0 6])
legend('Straight','Grade 5%')

