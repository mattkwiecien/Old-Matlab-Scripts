function u = generateMode(x, y, m, n)

Lx = max(max(x));
Ly = max(max(y));

u = sin(m*pi*x/Lx).*sin(n*pi*y/Ly);

end