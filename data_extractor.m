%clear all; %close all;
%container = xml2struct('123.xml'); % xml to structure array
%load container;%load the structure file from computer if it is already saved
%xml2struct;
clc;
format long;
[m,e] = size(container.events.value); 
for n=1:e
    positions(1,n)=str2double(container.events.value{1,n}.location_.x_.Text);
    positions(2,n)=str2double(container.events.value{1,n}.location_.y_.Text);
    positions(3,n)=str2double(container.events.value{1,n}.location_.z_.Text);
    
    [m,c] = size(container.events.value{1,n}.sensors_.value);
    if c==1;
        distances(1,n)=NaN;
        azimuth(1,n)=NaN;
        elevation(1,n)=NaN;
    else
        for i=1:c
            distances(i,n)=str2double(container.events.value{1,n}.sensors_.value{1,i}.distance_.Text);
            azimuth(i,n)=str2double(container.events.value{1,n}.sensors_.value{1,i}.radar_.azimuth_.Text);
            elevation(i,n)=str2double(container.events.value{1,n}.sensors_.value{1,i}.radar_.elevation_.Text);
        end
    end
end
