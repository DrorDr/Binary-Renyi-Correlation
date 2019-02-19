function Rho = LinCor_2x2(Pxy_2x2)

Px = sum(Pxy_2x2,2);
Py = sum(Pxy_2x2,1)';

Ex = [0 1]*Px;
Ey = [0 1]*Py;

Vx = ([0 1].^2)*Px;
Vy = ([0 1].^2)*Py;

Exy = [0 1]*Pxy_2x2*[0 1]';
 
Rho = (Exy - Ex*Ey) / (sqrt(Vx*Vy));

end

