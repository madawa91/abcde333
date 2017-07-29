%clc;
%clear all;
close all;
[fname, path]=uigetfile('.jpg''Provide a image for testing');
fname=strcat(path,fname); 
im=imread(fname);
im = rgb2gray(im);
imshow(im);
title('Test Image');

Ftest=FeatureStatistical(im);

load db.mat
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for(i=1:size(Ftrain,1))
dist(i,:)=sum(abs(Ftrain(i,:)-Ftest));
end
Min=min(dist);
if(Min<3)
m=find(dist==Min,1);
det_class= Ctrain(m); 
msgbox(strcat( 'Image is Matched // Detect Class is=',num2str(det_class)));
else
    msgbox('This Person is not registered in database');
end
