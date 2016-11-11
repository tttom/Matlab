function u2 = propIR(u1,L,lambda,z)
% propagation - impulse response approach
% assume the same x and y side lengths and
% uniform sampling
% u1 - source plaine field
% L - source and observation plane side length
% lambda - wavelength
% z - porpagation distance
% u2 - observation plane field

[M,~] = size(u1);           % get input field array size
dx = L/M;                   % sample interval
k = 2*pi/lambda;            % wavenumber

x = -L/2:dx:L/2-dx; % spatial coords
[X,Y] = meshgrid(x,x);

h = 1/(1i*lambda*z)*exp(1i*k/(2*z)*(X.^2+Y.^2));    % impulse
H = fft2(fftshift(h))*dx^2;  % create transfer function
U1 = fft2(fftshift(u1));    % shfit, fft src field
U2 = H.*U1;                 % convolve
u2 = ifftshift(ifft2(U2));  % inv fft, center obs field
end


