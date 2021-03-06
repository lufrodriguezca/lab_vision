# Introduction to Images in Matlab

## Setup

1.  Start the virtual machine
2.  Clone the original lab vision repository

    ```bash
    git clone https://github.com/diego0020/lab_vision.git lab_vision_orig
    ```
3.  Clone your fork from the repository

    ```bash
    git clone https://github.com/<USER>/lab_vision.git lab_vision
    ```
4.  Copy the folder lab2_matlab to your repository

    ```bash
    cp -rf lab_vision_orig/lab2_matlab lab_vision
    ```
5.  Delete the original repository from your machine

    ```bash
    rm -rf lab_vision_orig
    ```
6.  Commit changes to your repository

    ```bash
    cd lab_vision
    git status
    git add *
    git commit -m "added matlab lab"
    ```
7.  Push changes

    ```bash
    git push
    ```    
8.  Download and uncompress the sipi_images misc folder in your home folder

    ```bash
    cd ~
    scp -r vision@guitaca.uniandes.edu.co:/home/vision/sipi_images/misc.tar.gz .
    # alternative
    # wget http://sipi.usc.edu/database/misc.tar.gz
    tar -xzf misc.tar.gz
    ```    
9.  Open matlab

    ```bash
    /usr/local/MATLAB/R2014b/bin/matlab
    ```

Note: On windows you can use [github for windows](https://windows.github.com/) or [git-scm](http://git-scm.com/)

**IMPORTANT**
This file contains questions, you should write your answers here and don't forget to **commit** and **push** to
your github account.

## Working directory

The following commands can be used inside matlab, just like in bash

    -   pwd
    -   ls
    -   cd

For more file system see http://www.mathworks.com/help/matlab/file-operations.html

Note the current directory is also shown at the top of the graphical interface

1.  Change to the *misc* directory, which contains the uncompressed sipi_images
2.  List the contents of the directory

## Reading Images

The [imread](http://www.mathworks.com/help/matlab/ref/imread.html) command is used in matlab to read images. 

1.  Look at the manual page for the command
2.  Read the ``5.1.12`` image
    
    What is the dimension of the output?

    >   Answer: Its dimension is 256x256 uint8

3.  Read the ``4.2.03`` image
    What is the dimension of the output?

    >   Answer: Its dimension is 512x512 uint8 

## Displaying Images

The following commands can be used for displaying images

-   [image](http://www.mathworks.com/help/matlab/ref/image.html)
-   [imshow](http://www.mathworks.com/help/images/ref/imshow.html)

1.  Look at their manual pages
2.  Try displaying the images read in the previous point using both commands
3.  What are the differences?

    >   Answer: 

	```imshow``` command is more complete than ```image```. The first one is a processing toolbox command that allows to manage the matrix as an image and assumes the elements as pixels intensities, it allows more control. The ```image``` command allows to manage and see the matrix just as a matrix of numbers.


## Writing Images

The [imwrite](http://www.mathworks.com/help/matlab/ref/imwrite.html) image is used for writing images to disk

1.  Look at the manual page
2.  Write one of the images from before as png and as jpg

    >   Answer: 

	```bash
	E=imread('4.2.04.tiff');
	imwrite(E,'mujer.png');
	imwrite(E,'mujer.jpg');
	```
3.  Write a matlab function that takes the path of an image and converts it to jpg

    >   Answer:

	```bash
	function salida = cambioFormatoImagen(x)
		y = imread(x);
		[pathstr,name,ext] = fileparts(x);
		concatena=strcat(name,'.jpg');
		imwrite(y,concatena);
	end
	```

## Matlab and the shell

### Shell from Matlab

It is possible to excecute bash commands from matlab by using the [system](http://www.mathworks.com/help/matlab/ref/system.html) command
or by using a [bang](http://www.mathworks.com/help/matlab/matlab_env/run-external-commands-scripts-and-programs.html)

1.  Look at the manual pages
2.  Try it (for example ``!ps``)

### Matlab from the shell

It is also possible to invoke matlab in a non interactive mode to run a script from the terminal. If the matlab
binary is on the system PATH you can do something like this

```bash
matlab -nodisplay -nosplash -r "write_jpg('boat.512.tiff'); exit"
# or
matlab -nodisplay -nosplash script.m"
```
If the command or script doesn't end in ``exit`` the matlab shell will stay open, and will block the bash script.

### Exercise

1.  Create a script for converting all tiff images to jpeg
    -   You may create a bash script that calls matlab
    -   Or a matlab script that calls bash 
    -   Or both
2.  Save this script in the matlab lab folder of your git repository

## Filters

### Adding noise

The [imnoise](http://www.mathworks.com/help/images/ref/imnoise.html) command can be used to add noise to images.
We can do this to simulate difficult capture conditions, and evaluate the algorithms over difficult situations.

1.  Read the manual page
2.  Try the diffente noise types, and save the noisy images to the repository (5 images)
    >   Answer:	
	
	Parameters introduced were: 

	Gaussian filter m=0.02, v=0.01

	```bash
	J=imnoise(E, 'gaussian',0.02);
	```
	Localvar filter v=0.05*rand(size(E))

	```bash
	J=imnoise(E, 'localvar',0.05*rand(size(E)));
	```
	Poisson filter

	```bash
	J=imnoise(E, 'poisson');
	```

	Salt & pepper filter d=0.02

	```bash
	J=imnoise(E, 'salt & pepper',0.02);
	```
	Speckle filter v=0.2

	```bash
	J=imnoise(E, 'speckle',0.2);
	```

3.  Try saving noisy images as jpg, what happens?

    >   Answer:

	I saved the images as .tif and .jpg. The main observation was that when image was saved as jpg it got a little bit less noisy. 

### Median filter

These filters can be applied to a an image in order to remove noise. 
-   To apply a mean filter create it with the function [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html)
    and apply it with [imfilter](http://www.mathworks.com/help/images/ref/imfilter.html) 
-   To apply a median filter use the function [medfilt2](http://www.mathworks.com/help/images/ref/medfilt2.html)

1.  Read the manuals for the functions described above
2.  Try applying both kinds of filters to noisy images. Be sure to zoom in to see the effects
3.  Try different sizes for the filters
4.  Which filter works best for salt & pepper noise?

    > Answer: The best filter was median filter 3x3. Code used:
```
	I = imread('4.2.07.tiff');
	P=imnoise(I, 'salt & pepper', 0.02);
	h=fspecial('average', [3 3])
	J=imfilter(P,h);
	imshow(J);

	% cargar imagen
	img = imread('4.2.07.tiff');

	% poner ruido
	img_noisy = imnoise(img, 'salt & pepper', 0.02);
	%figure; imshow(img_noisy);

	% aplicar medfilt2 en cada color
	img_filtered = img_noisy;
	for c = 1 : 3
    		img_filtered(:, :, c) = medfilt2(img_noisy(:, :, c), [3, 3]);
	end
	figure; imshow(img_filtered);
```


For more on noise removal read http://www.mathworks.com/help/images/noise-removal.html

### Blur

To blur or smooth an image we can use the mean filter described above. We can also use the gaussian filter
which can be otained from [fspecial](http://www.mathworks.com/help/images/ref/fspecial.html).

1.  Smooth an image using average and gaussian filters
2.  Try different sizes for the filters
3.  What differences do you notice?

    > Answer: The main difference is that with size 3 x 3 on both filters and sigma = 0.7 on gaussian filter I observe a more soft transformation using gaussian filter, when I increased sigma to 0.9 the image was more softer. Also I tried gaussian with size 5 x 5, sigma = 0,7 and mean filter with 5 x 5 and I observed that the gaussian filter under this conditions was more sharper than the mean filter. I added the images to this repository. 

### Sharpen

The [imsharpen](http://www.mathworks.com/help/images/ref/imsharpen.html) function lets us sharpen an image. 

1.  Sharp the ``5.1.12`` image. What do you notice?

    > Answer: I have installed MATLAB 2012b so I don't have the imsharper command. Instead of it I used the command unsharp. I observed that the image got sharper edges. I added the result to the repository. The code used is following:

	```
	im = imread('5.1.12.tiff');
	alpha = 0.2; % Controls shape of filter - Between [0,1]
	f = fspecial('unsharp', alpha); 
	out = imfilter(im, f);
	figure;
	subplot(2,1,1); imshow(im); title('Original');
	subplot(2,1,2); imshow(out); title('Sharpened');
	```

2.  Sharp a blurred image. What do you notice?

    > Answer: The image got more sharper despite the previous blur. copy on the repository

### Edge detection

The following filters from fspecil can be used to enhance edges in an image
-   laplacian
-   log
-   prewitt
-   sobel

Notice that the last two filters detect horizontal edges, in order to detect vertical edges you have to transpose them.

1.  Try applying this filters
2.  What is the difference between prewitt and sobel?

    > Answer: The sobel filter consists on two 3x3 convolution kernels, one trasposed with the other. The rernels are applied to the image separately and later are combined to find the magnitude of the gradient and orientation. The prewitt filter works similar than sobel the only difference is that the template does not use the same image.

The code used is the following (taken from: http://bababouncer.blogspot.com/2012/10/matlab-code-for-edge-detection-robert.html and http://angeljohnsy.blogspot.com/2011/12/sobel-edge-detection.html):

	```
	%PREWITT
	a=imread('5.3.01.tiff');
 	b=im2double(a);
	[m,n]=size(a);

 	N(1:m,1:n)=0
	for i=1:m-2;
    		for j=1:m-2;
        		N(i,j)=-1*b(i,j)-1*b(i,j+1)-1*b(i,j+2)+0+0+0+1*b(i+2,j)+1*b(i+2,j+1)+1*b(i+2,j+2);
    		end;
	end;
	O(1:m,1:n)=0
	for i=1:m-2;
    		for j=1:m-2;
        		O(i,j)=-1*b(i,j)+0+1*b(i,j+2)-1*b(i+2,j)+0+1*b(i+1,j+2)-1*b(i+2,j)+0+1*b(i+2,j+2);
    		end;
	end;
	figure;
	subplot(2,2,1)
	imshow(N)
	title('Prewit    Gx');
	subplot(2,2,2)
	imshow(O)
	title('Prewit    Gy');
	Z=N+O;
	subplot(2,2,3)
	imshow(Z)
	title('Prewit    Gx+Gy');
	subplot(2,2,4)
	imshow(b)
	title('Original Image');

	%SOBEL

	C=double(a);
	for i=1:size(C,1)-2
    		for j=1:size(C,2)-2
        		%Sobel mask for x-direction:
        		Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        		%Sobel mask for y-direction:
        		Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
      
 			%The gradient of the image
        		%a(i,j)=abs(Gx)+abs(Gy);
        		a(i,j)=sqrt(Gx.^2+Gy.^2);
    		end
	end
	figure,imshow(a); title('Sobel gradient');
	```


More sophisticated methods for finding edges can be found in the following pages
    -   http://www.mathworks.com/discovery/edge-detection.html
    -   http://www.mathworks.com/help/images/ref/edge.html

### More

For more filtering operations look at http://www.mathworks.com/help/images/linear-filtering.html

## Color Spaces

As seen on the section on reading image, color images are represented by matrices with 4 dimensios.
The [color](http://www.mathworks.com/help/images/color.html) matlab module contains functions for moving between
color spaces.

1.  Load the ``4.2.03.tiff`` image (Mandril).
2.  Split it into the three color channels
    
    ```matlab
    img=imread('4.2.03.tiff');
    r = img(:,:,1);
    g = img(:,:,2);
    b = img(:,:,3);
    ```
3.  Look at the three channels simultaneusly

    ```matlab
    figure;
    subplot(2,2,1), subimage(img);
    subplot(2,2,2), subimage(r);
    subplot(2,2,3), subimage(g);
    subplot(2,2,4), subimage(b);
    ```
    
4.  Save the mosaic as a png file
    
    ```matlab
    print ('-dpng','rgb_mosaic.png');
    ```
5.  Transform the image to the following color spaces and repeat the exercise
    -   ycbcr
    -   lab
    -   hsv (use [rgb2hsv](http://www.mathworks.com/help/matlab/ref/rgb2hsv.html))

	Code used:
	
	```
	%ycbcr
	rgbImage = imread('4.2.03.tiff');  %# 
	A = [65.481 -37.797 112; ...       %# A 3-by-3 matrix of scale factors
     	128.553 -74.203 -93.786; ...
     	24.966 112 -18.214];

	%# First convert the RGB image to double precision, scale its values to the
	%#   range 0 to 1, reshape it to an N-by-3 matrix, and multiply by A:
	ycbcrImage = reshape(double(rgbImage)./255,[],3)*A;

	%# Shift each color plane (stored in each column of the N-by-3 matrix):
	ycbcrImage(:,1) = ycbcrImage(:,1)+16;
	ycbcrImage(:,2) = ycbcrImage(:,2)+128;
	ycbcrImage(:,3) = ycbcrImage(:,3)+128;

	%# Convert back to type uint8 and reshape to its original size:
	ycbcrImage = reshape(uint8(ycbcrImage),size(rgbImage));

	figure;
	subplot(2,2,1), subimage(rgbImage);
	subplot(2,2,2), subimage(ycbcrImage);

	%lab
	```
6.  Save all the mosaics in your github repository

## Pyramids

The [impyramid](http://www.mathworks.com/help/images/ref/impyramid.html) function creates gaussian pyramids from an image.

1.  Read the manual page
2.  Create a four level pyramid from the ``5.1.12`` clock  image
	```
	I0 = imread('cameraman.tif');
	I1 = impyramid(I0, 'reduce');
	I2 = impyramid(I1, 'reduce');
	I3 = impyramid(I2, 'reduce');
  
	imshow(I0)
	figure, imshow(I1)
	figure, imshow(I2)
	figure, imshow(I3)	
	```
3.  At what level does the people in the picture dissappear?

    >   Answer: The people became diffuse at level 2 but dissappear at level 3
    
4.  At what level does the numbers in the clock disappear?

    >   Answer: At level 3 are impossible to see

## Template Matching

The [norm2corrx](http://www.mathworks.com/help/images/ref/normxcorr2.htm) can be used to look for patterns in an image.

1.  Download the ``sequences.tar.gz`` file (from guitaca or sipi) and decompress it
2.  Go to the sequences directory
3.  Read the ``motion04.512.tiff`` image
4.  Use the ``imcrop`` comand to crop the train at the right side of the figure
    
    ```matlab
    [train,square] = imcrop(image);
    ```
5.  Now use [normxcorr2](http://www.mathworks.com/help/images/ref/normxcorr2.htm) to locate the train back in the image

    ```matlab
    c=normxcorr2(train,image);
    % c is correlation from -1 to 1
    [sx,sy] = size(image);
    d=floor(size(train)/2);
    dx=d(1);
    dy=d(2);
    %Remove borders from c2 to make it the same size as image
    c2=c(dx+1:sx+dx,dy+1:sy+dy);
    %lets accentuate it more
    c3=c2.^3;
    %convert it into an image from 0 to 1
    cr=0.5+0.5*c3;
    %leave the original image as the luminance channel
    y=mat2gray(image);
    %empty cb channel
    cb=0.5*ones(size(image));
    %join the three channels
    ycbcr=cat(3,y,cb,cr);
    rgb=ycbcr2rgb(ycbcr);
    imshow(rgb);
    ```
6.  Explain what the above code does

    > Answer
    
7.  Now lets find the train in the next frame, read image ``motion05.512.tiff``.
8.  Apply the procedure written above to it (use the train template from the past frame)
9.  What are the limitations of this method?

    > Answer

See [here](http://www.mathworks.com/help/images/examples/registering-an-image-using-normalized-cross-correlation.html)
another example.

## End

Don't forget to commit and push your answers and images to github
