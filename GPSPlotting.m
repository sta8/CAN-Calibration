% This code is to convert the GPS data from the MDAS into
% a graph of Latitude Vs. Longitude, then calculate the
% average angle between vectors made up of data points
clear all
data = csvread('gps_fix_psr_arc1_altered.csv');
x = data(: ,1);
y = data(: ,2);

plot(x,y);
xlabel('Longitude');
ylabel('Latitude');
title('GPS Position');

for j = (4:1:length(x))
point1 = [x(j-2),y(j-2),0];
point2 = [x(j-3),y(j-3),0];
vector1 = [point2 - point1]; %Create first vector
point3 = [x(j-1),y(j-1),0];
point4 = [x(j),y(j),0];
vector2 = [point3 - point4]; %Create second vector
angle(j-3) = atan2d(norm(cross(vector1,vector2)),dot(vector1,vector2)); %Find angle between vectors
end
average = mean(angle); %Take the average of the angle measurements