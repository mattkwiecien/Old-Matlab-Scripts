function panim
% x and y coordiantes made from unit circle
ppi = 0:.1:2*pi;
a = .5.*(cos(ppi));
b = .5.*sin(ppi);

fig = figure;
set(fig, 'Position', [250, 250, 1500, 500])
hold on

a_parabola = linspace(-3,1,40);
b_parabola = (a_parabola-1).^2 ./4 + a_parabola;

for i = 1:length(ppi)
    
    %Uses pando's code to grab the phase plane as well as a single solution
    %to the system of odes
    [x,y,px,py,xsol,ysol] = phplane(a(i),b(i));
    
    %plots the unit circle - most of this is just plotting formatting
    subplot(1,2,2)
    hold on
    grid on
    %plots the current values
    plot(a(i),b(i),'ro','markersize',8)
    %plots circle
    plot(a,b,'-r')
    plot(a_parabola,b_parabola,'--b')
    %creates a line to current values in green
    line([-1 a(i)], [b(i) b(i)], 'color', 'g', 'linewidth', 2)
    line([a(i) a(i)], [0 b(i)], 'color', 'g', 'linewidth', 2)
    line([-10 10], [-10 10], 'color', 'k')
    
    ylim([-1.1 1.1])
    xlim([-2.1 1.1])
    xL = xlim;
    yL = ylim;
    %x and y axis
    line(xL, [0 0], 'color', 'k', 'linewidth', 1)
    line([-1 -1],yL, 'color', 'k', 'linewidth', 1)
    
    %Creates a text box and puts it on the plot window based on what our
    %conditions are
    %
    % THIS IS WHERE WE HAVE TO FIGURE OUT THE CORRECT VALUES
    if b(i) > (a(i) + 1)^2 / 4
        annotation('textbox', [.82,.8,.1,.1],'String', '2 Complex Eigenvalues')
        if a<-1
            annotation('textbox', [.82,.8,.1,.1],'String', '2 Complex Eigenvalues | Spiral Sink')
        elseif a>-1 %notice this is on the ppt but doesnt agree with the plot
            annotation('textbox', [.82,.8,.1,.1],'String', '2 Complex Eigenvalues | Spiral Source')
        elseif a==-1
            annotation('textbox', [.82,.8,.1,.1],'String', '2 Complex Eigenvalues | Center')
        end
    elseif b(i) < (a(i)+1)^2 / 4
        annotation('textbox', [.82,.8,.1,.1],'String', '2 Real Eigenvalues')
        
    else 
        annotation('textbox', [.82,.8,.1,.1],'String', 'Repeated Eigenvalues')
        if a<-1
            annotation('textbox', [.82,.8,.1,.1],'String', 'Repeated Eigenvalues | Sink')
        else
            annotation('textbox', [.82,.8,.1,.1],'String', 'Repeated Eigenvalues | Source')
        end
    end
    
    title('The Unit Circle for values of a and b.')
    xlabel('a')
    ylabel('b')
    
    %plots the phase plane and the paarticular solution 
    subplot(1,2,1)
    hold on
    title('Phase Plane and Single Solution for system of ODEs at a,b.')
    plot(xsol,ysol,'m','linewidth',3)
    quiver(x,y,px,py)
    axis([-10 10 -10 10]);
    pause(.05)
    
    % ignore this - just for making Gifs
    % ---------------------------------------------------------------
%     set(gcf,'color','w');
%     drawnow;
%     frame = getframe(1);
%     im=frame2im(frame);
%     [imind,cm] = rgb2ind(im,256);
%     outfile = 'test.gif';
%     
%     if i==1
%         imwrite(imind,cm,outfile,'gif','DelayTime',0,'loopcount',inf);
%     else
%         imwrite(imind,cm,outfile,'gif','WriteMode','append');
%     end
     % ---------------------------------------------------------------

    clf
    
end


end