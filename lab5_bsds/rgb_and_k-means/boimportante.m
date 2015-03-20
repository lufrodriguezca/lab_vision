nombreImagenes=dir('train/*.jpg');
cantidadImagenes=size(nombreImagenes,1);
%metodos={'k-means'};
%features={'rgb'};


%segs={1,5}
%for nom=1:cantidadImagenes
%    nn=nombreImagenes(nom).name; 
%    cont=0;
%    for k=2:3:14
%        segmentar = segment_by_clustering(nn,'rgb','k-means',k);
%        cont=cont+1;
%segs{1,cont}=segmentar;
%figure,imagesc(segmentar)

%folder=fullfile('/Users/lufrodriguezca/Documents/MATLAB/k-means',[nombreImagenes(nom).name(1:end - 5) '.mat'])
save(folder, 'segs' )
    end
end

%%
