function segmentar = segment_by_clustering(rgb_image,feature_space,clustering_method,number_of_clusters)

           Im2=imread(rgb_image);
           Im2=double(Im2);
           %tamano filas y columnas
           x=size(Im2,1);
           y=size(Im2,2);   
%ESPACIO RGB       
    if strcmpi('rgb',feature_space)==1;
        b(:,1)=reshape(Im2(:,:,1),x*y,1);
        b(:,2)=reshape(Im2(:,:,2),x*y,1);
        b(:,3)=reshape(Im2(:,:,3),x*y,1);
        if strcmpi('k-means',clustering_method)==1;
            %returns the k cluster centroid locations in the k-by-p matrix C.
            [k c]=kmeans(b,number_of_clusters);
            im=reshape(k,x,y);
            %imagesc(b)
            %imagesc(c)
            %imagesc(im);
        elseif strcmpi('gmm',clustering_method)==1;
            options=statset('Display','final');
            gm=fitgmdist(b,number_of_clusters,'Options',options,'regularize',0.0001);
            idx=cluster(gm,b);
            im=reshape(idx,x,y);
            %imagesc(im);
       %elseif strcmpi('hierarchical',clustering_method)==1;
       %elseif strcmpi('watershed',clustering_method)==1;
        end
        
%ESPACIO LAB
    elseif strcmpi('lab',feature_space)==1;
        Im2=rgb2lab(Im2);
        Im2=double(Im2);
         b(:,1)=reshape(Im2(:,:,1),x*y,1);
         b(:,2)=reshape(Im2(:,:,2),x*y,1);
         b(:,3)=reshape(Im2(:,:,3),x*y,1);
        if strcmpi('k-means',clustering_method)==1;            
            %returns the k cluster centroid locations in the k-by-p matrix C.
            [k c]=kmeans(b,number_of_clusters);
            im=reshape(k,x,y);
            %imagesc(b)
            %imagesc(c)
            %imagesc(im)
        elseif strcmpi('gmm',clustering_method)==1;
            options=statset('Display','final');
            gm=fitgmdist(b,number_of_clusters,'Options',options,'regularize',0.0001);
            idx=cluster(gm,b);
            im=reshape(idx,x,y);
            %imagesc(im);
       %elseif strcmpi('hierarchical',clustering_method)==1;
       %elseif strcmpi('watershed',clustering_method)==1;
        end
        
%ESPACIO HSV
    elseif strcmpi('hsv',feature_space)==1;
        Im2=rgb2hsv(Im2);
        Im2=double(Im2);
        b(:,1)=reshape(Im2(:,:,1),x*y,1);
        b(:,2)=reshape(Im2(:,:,2),x*y,1);
        b(:,3)=reshape(Im2(:,:,3),x*y,1);
        if strcmpi('k-means',clustering_method)==1;
            [k c]=kmeans(b,5);
            im=reshape(k,x,y);
            %imagesc(im)
        elseif strcmpi('gmm',clustering_method)==1;
            options=statset('Display','final');
            gm=fitgmdist(b,number_of_clusters,'Options',options,'regularize',0.0001);
            idx=cluster(gm,b);
            im=reshape(idx,x,y);
            %imagesc(im)
       %elseif strcmpi('hierarchical',clustering_method)==1;
       %elseif strcmpi('watershed',clustering_method)==1;
        end    
        
%ESPACIO RGB+XY
    elseif strcmpi('rgb+xy',feature_space)==1;
        vectorColumna= 1:1:x;
        vectorColumnaTransp=vectorColumna';
        vectorFila=1:1:y;
        matrizConversion=repmat(vectorColumnaTransp,1,y);
        matrizConversionB=repmat(vectorFila,x,1);
        b(:,1)=reshape(Im2(:,:,1),x*y,1);
        b(:,2)=reshape(Im2(:,:,2),x*y,1);
        b(:,3)=reshape(Im2(:,:,3),x*y,1);
        b(:,4)=reshape(matrizConversion,x*y,1);
        b(:,5)=reshape(matrizConversionB,x*y,1);
        if strcmpi('k-means',clustering_method)==1;
            [k c]=kmeans(b,number_of_clusters);
            im=reshape(k,x,y);
            %imagesc(im);
        elseif strcmpi('gmm',clustering_method)==1;
            options=statset('Display','final');
            gm=fitgmdist(b,number_of_clusters,'Options',options,'regularize',0.0001);
            idx=cluster(gm,b);
            im=reshape(idx,x,y);
            %imagesc(im);
        %elseif strcmpi('hierarchical',clustering_method)==1;
        %elseif strcmpi('watershed',clustering_method)==1;
        end
        
%ESPACIO LAB+XY
    elseif strcmpi('lab+xy',feature_space)==1;
        Im2=rgb2lab(Im2);
        Im2=double(Im2);
        vectorColumna= 1:1:x;
        vectorColumnaTransp=vectorColumna';
        vectorFila=1:1:y;
        matrizConversion=repmat(vectorColumnaTransp,1,y);
        matrizConversionB=repmat(vectorFila,x,1);
        b(:,1)=reshape(Im2(:,:,1),x*y,1);
        b(:,2)=reshape(Im2(:,:,2),x*y,1);
        b(:,3)=reshape(Im2(:,:,3),x*y,1);
        b(:,4)=reshape(matrizConversion,x*y,1);
        b(:,5)=reshape(matrizConversionB,x*y,1);
        if strcmpi('k-means',clustering_method)==1;
            [k c]=kmeans(b,number_of_clusters);
            im=reshape(k,x,y);
            %imagesc(im);
        elseif strcmpi('gmm',clustering_method)==1;
            options=statset('Display','final');
            gm=fitgmdist(b,number_of_clusters,'Options',options,'regularize',0.0001);
            idx=cluster(gm,b);
            im=reshape(idx,x,y);
            %imagesc(im);
        %elseif strcmpi('hierarchical',clustering_method)==1;
        %elseif strcmpi('watershed',clustering_method)==1;
        end
        
%ESPACIO HSV+XY
    elseif strcmpi('hsv+xy',feature_space)==1;
        Im2=rgb2hsv(Im2);
        Im2=double(Im2);
        vectorColumna= 1:1:x;
        vectorColumnaTransp=vectorColumna';
        vectorFila=1:1:y;
        matrizConversion=repmat(vectorColumnaTransp,1,y);
        matrizConversionB=repmat(vectorFila,x,1);
        b(:,1)=reshape(Im2(:,:,1),x*y,1);
        b(:,2)=reshape(Im2(:,:,2),x*y,1);
        b(:,3)=reshape(Im2(:,:,3),x*y,1);
        b(:,4)=reshape(matrizConversion,x*y,1);
        b(:,5)=reshape(matrizConversionB,x*y,1);
        if strcmpi('k-means',clustering_method)==1;
            [k c]=kmeans(b,number_of_clusters);
            im=reshape(k,x,y);
            %imagesc(im);
        elseif strcmpi('gmm',clustering_method)==1;
            options=statset('Display','final');
            gm=fitgmdist(b,number_of_clusters,'Options',options,'regularize',0.0001);
            idx=cluster(gm,b);
            im=reshape(idx,x,y); 
            %imagesc(im);
        %elseif strcmpi('hierarchical',clustering_method)==1;
        %elseif strcmpi('watershed',clustering_method)==1;
        end
    end

segmentar=im;
        
        