function NonIntertialLaunch
% Byrne Hall is ~24.384 meters tall
% The distance to the east is 250.43318489 meters
% The distance to the north is 55.0584 meters
g=9.81;
omega = 7.3e-5;
r_earth = 6.4e6;

theta=80; % Angle between the xy and yz plane
v_tot=86.599573; % Velocity in the y-z plane
vz = v_tot*sind(theta); % Velocity in the z direction
vxy = v_tot*cosd(theta); % Velocity in the x-y plane (north-east)
theta_xy = atand(55.0584/250.43318489); %Angle in the xy plane
vx = vxy*cosd(theta_xy); % Velocity in the x direction
vy = vxy*sind(theta_xy); % Velocity in the y direction

% Creating vectors for intertial projectile motion
y = linspace(0,55.0584,50);
x = linspace(0,250.43318489,50);
z = zeros(1,50);
% Projectile Motion assuming non-rotating earth.  Parametrized in terms of
% y.
for i = 1:50
    z(i) = -(g*( (y(i) / vy)^2 ))/2 +  vz * ( y(i) / vy );
end
%-----------------------------------------------------------------------
% Using Ode45 to numerically solve non-intertial projectile motion
% according to the modified Newton's Second Law
%-----------------------------------------------------------------------
% Initial conditions for ode45
xinit = [0; 0; 0; vx; vy; vz];
tspan = linspace(0,1000,1000);
[T,xfinal] = ode45(@ddt,tspan,xinit);
% Extracting the RHS of the ODEs
x_non = xfinal(:,1);
y_non = xfinal(:,2);
z_non = xfinal(:,3);
ind = find(z_non>=0);
ind = ind(end);
% Calculating the error
err_x = (abs(x(end) - x_non(ind))/x_non(ind))*100;
err_y = (abs(y(end) - y_non(ind))/y_non(ind))*100;
err_r = sqrt(err_x^2 + err_y^2);
sprintf('The rotation of the Earth caused an error of %.2f percent in the east direction, %.2f percent in the north direction,\n and a total error of %.2f percent in the East-North plane', err_x,err_y,err_r)

% Plotting the solutions
byrne_n = [55.0584 55.0584];
byrne_e = [250.455 250.455];
byrne_h = [0 24.384];

f=figure;
set(f, 'Position', [250, 250, 1500, 1500])
set(gca,'fontsize',18)
subplot(2,2,1)
set(gca,'fontsize',18)
hold on
grid on
view(3)
zlim([0,max(z)])
plot3(250.455,55.0584,24.384, 'ko','MarkerSize',8)
plot3(x,y,z,'--+b')
line(byrne_e,byrne_n,byrne_h,'color','k','linewidth',4)
title('Intertial Projectile Motion')
zlabel('Upwards (m)')
xlabel('East (m)')
ylabel('North (m)')

subplot(2,2,2)
set(gca,'fontsize',18)
hold on
grid on
view(3)
zlim([0,max(z)])
plot3(250.455,55.0584,24.384, 'ko','MarkerSize',8)
plot3(x_non(1:ind),y_non(1:ind),z_non(1:ind),'--xr')
line(byrne_e,byrne_n,byrne_h,'color','k','linewidth',4)
title('Non-intertial Projectile Motion')
zlabel('Upwards (m)')
xlabel('East (m)')
ylabel('North (m)')

subplot(2,1,2)
set(gca,'fontsize',18)
hold on
grid on
view(3)
zlim([0,max(z)])
plot3(x_non(1:ind),y_non(1:ind),z_non(1:ind),'--xr')
plot3(250.455,55.0584,24.384, 'ko','MarkerSize',8)
plot3(x,y,z,'--+b')
line(byrne_e,byrne_n,byrne_h,'color','k','linewidth',4)
title('Comparison of Intertial and Non-intertial Projectile Motion')
zlabel('Upwards (m)')
xlabel('East (m)')
ylabel('North (m)')


    function dt = ddt(t,xinit)
       k = omega^2 * r_earth;
       g_eff_xy = k * sind(40) * cosd(40);
       g_eff_z = g - (k*sind(40)^2);
       
       dt(1) = xinit(4);
       dt(2) = xinit(5);
       dt(3) = xinit(6);
       dt(4) = 2*omega*(xinit(5)*cosd(40) - xinit(6)*sind(40));
       dt(5) = -2*omega*xinit(4)*cosd(40);
       dt(6) = -g_eff_z + (2*omega*xinit(4)*sind(40));
       
       dt = dt';
    end

end

