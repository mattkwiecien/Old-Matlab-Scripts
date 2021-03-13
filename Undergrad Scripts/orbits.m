function orbits(r_min,r_max)
% The orbits function will take as inputs the minimum and maximum radius of
% Jupiter's orbit, and plot it's orbital motion in the solar system, as
% well as calculate various parameters of the orbit and return the percent
% error from the known values.
%
% This code was written by Matthew Kwiecien for PHY311 on 1/24/14

% Global variable for pausing function - space will pause and start
% animation, any other key press will break animation.
lastKey = ' ';

% ========================================================================
% Known Parameters of Kepler Orbit (M_s = 1 Solar Mass)
R_jup = 4.6239e-4;                                      % AU
G = 3.9651185075649e-14;                                % AU^3 M_s^-1 s^-2
M_sun = 1 ;                                             % M_s
M_jup = 9.5458e-4;                                      % M_s
M = M_sun + M_jup;
u = (M_sun*M_jup)/(M_sun+M_jup);                        % M_s

eccen_real = .048775;
tau_real = 3.7407e8;                                    % Seconds
a_real = 5.204267;                                      % Semi-major axis
c_real = r_min*(1+eccen_real);
b_real = c_real / (sqrt(1-eccen_real^2));
d_real = a_real*eccen_real;
A_real = (pi*a_real*b_real);
l_real = 1.9e43*(1/1.9891e30)*(1/149597870700)^2;
dA_real = l_real/(2*(M_sun*M_jup)/(M_sun+M_jup));
% Parameters for unknown values
gamma = G*u*M;                                          % AU^3 M_s^1 s^-2
eccen = abs( (1 - (r_min/r_max))/(1 + (r_min/r_max)) );
% Parameters of elliptical orbit
c = r_min*(1+eccen);                                    % AU
a = c / (1-eccen^2);                                    % AU
b = c / sqrt(1-eccen^2);                                % AU
d = a*eccen;                                            % AU
A = pi*a*b;
% Details about orbit
l = sqrt(c*gamma*u);                                    % AU^2 M_s^1 s^-1
dA = l/(2*u);
tau = sqrt(((4*pi^2)/(G*M_jup))*R_jup^3);               % s^1
E = (gamma^2*u*(eccen^2-1)) / (2*l^2);                  % AU^2 M_s^1 s^-2
E = E*(149597870700)^2*(1.9891e30)*(1/10^33);                     % Conversion to SI units
% ========================================================================
% Creating a phi variable for 360 degrees
phi = 0:.1:360;            
% Calculating the radial distance of Jupiter at each angle of phi and U_eff
r = c./(1+eccen.*cos(phi));
U_eff = (-gamma./r) + ((l^2)/(2*u)).*(1./r.^2);
U_eff = U_eff*(149597870700)^2*(1.9891e30)*(1/10^33); % Conversion to amount of Joules in Kinetic Energy of 1 earth orbit (1e33 J)

U_eff2 = (1./r.^3) + ((l^2)/(2*u)).*(1./r.^2);
plot(r,U_eff2)
figure

plot(r,U_eff)
set(gca,'fontsize',18)
title('Effective Potential Energy of Jupiters Orbit')
xlabel('Radial Distance (AU)')
ylabel('Energy (Kinetic Energy of 1 Earth-Orbit = 1x10^{33} J)')
% ========================================================================
% Finding percent error between calculated and observed values

Err = zeros(1,6);
Err(1) = abs((tau_real - tau)/tau_real);
Err(2) = abs((eccen_real - eccen)/eccen_real);
Err(3) = abs((a_real - a)/a_real);
Err(4) = abs((b_real - b)/b_real);
Err(5) = abs((c_real - c)/c_real);
Err(6) = abs((d_real - d)/d_real);
Err(7) = abs((A_real - A)/A_real);
Err(8) = abs((dA_real - dA)/dA_real);

fprintf('The orbital period had an error of %.5f percent.\n', Err(1));
fprintf('The eccentricity of the orbit had an error of %.5f percent.\n', Err(2));
fprintf('The parameter a had an error of %.5f percent.\n', Err(3));
fprintf('The parameter b had an error of %.5f percent.\n', Err(4));
fprintf('The parameter c had an error of %.5f percent.\n', Err(5));
fprintf('The parameter d had an error of %.5f percent.\n', Err(6));
fprintf('The area, A had an error of %.5f percent.\n', Err(7));
fprintf('The parameter dA/dt had an error of %.5f percent.\n', Err(8));
fprintf('The calculated total energy of Jupiters Orbit is %.5f in units of earth-orbit energies (1x10^{33}J).\n', E);
% ========================================================================

% Creating a figure with the keyPressHandler function (setting up pausing)
figure('KeyPressFcn', @keyPressHandler)
% Plotting the orbit of Jupiter around the sun
polarplot = polar(phi,r);
title('Animated Orbit of Jupiter','FontSize', 18)
hold on
% Creating a marker for Jupiter
jup = polar(phi(1),r(1),'bo');
set(jup, 'MarkerSize', 20)
set(jup, 'MarkerSize', 20, 'MarkerFaceColor', 'b')

% Creating a marker for the sun in the center of the plot
sun = polar(0,0,'ro');
set(sun, 'MarkerSize', 20)
set(sun, 'MarkerSize', 20,'MarkerFaceColor', 'r')
% ========================================================================
i=1;

while true
    
    % If spacebar is pressed, the animation will start or stop respectively
    % and the animation will stop when a non-space button is pressed or
    % when the function runs out of values to plot.
    if strcmp(lastKey, ' ')
        pause
    elseif ~isempty(lastKey)
        break
    elseif i>length(phi)
        break
    end
    
    % Removes the previous marker for Jupiter
    delete(findobj(gca,'Type','line','Marker','o'))
    % Replots Jupiter's current position in the orbit
    h = polar(phi(i),r(i), 'o');
    set( h,'MarkerSize', 16, 'MarkerFaceColor', 'b')
    % Replots the sun
    sun = polar(0,0,'ro');
    set(sun, 'MarkerSize', 20,'MarkerFaceColor', 'r')
    
    i=i+1;
    pause(.05)
    
    % Ends animation if the figure is closed
    if ishghandle(polarplot)
        continue
    else
        break
    end
end
% ========================================================================    
% A function which will start or stop the animation if the variable lastKey
% is empty.  Given any other key will terminate. 
%
% (Credit to Dr. Geodde in last year's PHY361)
    function keyPressHandler(~, event)
    
        newKey = event.Character;
        
        if strcmp(lastKey, ' ') && strcmp(newKey, ' ')
            lastKey = [ ];
        else
            lastKey = newKey;
        end
    end

end