
pkg load statistics
pkg load io

clc
clear
close all;

cluster=7;
ubicacionestado=14;

%datos=xlsread(strcat("idx",num2str(cluster),".xlsx"));
idx=csvread(strcat("idx",num2str(cluster),".csv"));
datosentrenamiento=xlsread('DatosEntr_Num_normalizados.xlsx');
tamidx=size(idx);
MatrizSexo=zeros(max(datosentrenamiento(:,12)+1),max(idx));
MatrizPrograma=zeros(max(datosentrenamiento(:,13)+1),max(idx));
%for  j=1:max(idx) 
   for i=1:tamidx(1)
      MatrizSexo(datosentrenamiento(i,12)+1,idx(i))=MatrizSexo(datosentrenamiento(i,12)+1,idx(i))+1; 
      MatrizPrograma(datosentrenamiento(i,13)+1,idx(i))=MatrizPrograma(datosentrenamiento(i,13)+1,idx(i))+1;  
   endfor 
  
%endfor
