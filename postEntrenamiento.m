
pkg load statistics
pkg load io

clc
clear
close all;


for cluster=1:40
%cluster=8;


%datos=xlsread(strcat("idx",num2str(cluster),".xlsx"));
datos=csvread(strcat("idx",num2str(cluster),".csv"));
DatosEtiquetados(:,1)=datos;
DatosporClase=43;
Vectorclase=zeros(4,max(datos));
%Separamos los vectores
%Numericos

for  (i=1:DatosporClase)
   Vectorclase(1,datos(i))=Vectorclase(1,datos(i))+1;  
   DatosEtiquetados(i,2)=1;
      
 endfor
 
 for  (i=(DatosporClase+1):(DatosporClase*2))
   Vectorclase(2,datos(i))=Vectorclase(2,datos(i))+1; 
   DatosEtiquetados(i,2)=2;
 endfor
 
 for  (i=((DatosporClase*2)+1):(DatosporClase*3))
 Vectorclase(3,datos(i))=Vectorclase(3,datos(i))+1;
DatosEtiquetados(i,2)=3; 
endfor
 for  (i=((DatosporClase*3)+1):(DatosporClase*4))
   Vectorclase(4,datos(i))=Vectorclase(4,datos(i))+1; 
   DatosEtiquetados(i,2)=4;
  endfor
% sum(Vectorclase(1,:))
figure
bar(Vectorclase.', 'stacked');
title(strcat("Cluster ",num2str(cluster), "NormalizadoImdbHigherNumNoDisNoRegion"));
print(strcat("Cluster ",num2str(cluster), "Imdb-NoRegion.png"));

%saveas(fig,'ensayo.png');

%error de entrenamiento. 

%Definir Etiquetas: 
for i=1:max(datos)
   [VectorMaximos(i) VectorEtiquetas(i)]= max(Vectorclase(:,i));
endfor

%Calculo de error de entrenamiento: 
DatosbienUbicados=0;
DatosmalUbicados=0;

for i=1:size(DatosEtiquetados)(1)
  if (DatosEtiquetados(i,2)==VectorEtiquetas(datos(i)))
     DatosbienUbicados=DatosbienUbicados+1; 
   % EtiquetaDatosEtiquetado=DatosEtiquetados(i,2)
   %EtiquetaVectorEtiquetas=  VectorEtiquetas(datos(i))
   else
     DatosmalUbicados=DatosmalUbicados+1;
  endif
endfor

ErrorEntrenamiento(cluster)= DatosmalUbicados*100/(size(DatosEtiquetados)(1));
%csvwrite(strcat('ErrorEntrenamiento.csv'),ErrorEntrenamiento,cluster-1,1);
%xlswrite(strcat("ErrorEntrenamiento",num2str(cluster),".csv"), ErrorEntrenamiento);
endfor
csvwrite(strcat('ErrorEntrenamiento.csv'),ErrorEntrenamiento',1,1);