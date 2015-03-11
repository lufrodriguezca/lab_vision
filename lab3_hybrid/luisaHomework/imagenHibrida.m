function imagenHibrida(imagen1, imagen2, ImagenSalida)
    radio = 13;     
    I1 = imread(imagen1);
    I2 = imread(imagen2);
    I1_ = fftshift(fft2(double(I1)));
    I2_ = fftshift(fft2(double(I2)));
    [m n z] = size(I1);
    h = fspecial('gaussian', [m n], radio);
    h = h./max(max(h));
    for colorI = 1:3
        J_(:,:,colorI) = I1_(:,:,colorI).*(1-h) + I2_(:,:,colorI).*h;
    end
    J = uint8(real(ifft2(ifftshift(J_))));
    imwrite(J, ImagenSalida);
end