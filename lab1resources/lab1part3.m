clc;clear;

img_raw = (imread('picture/highway.jpg'));
img_new = rgb2gray(img_raw);
[H,W]=size(img_new);

img_new = imgaussfilt(img_new,2);
edge_ver = edge(img_new,'approxcanny',0.9);

edge_ver = 255*int16(edge_ver);
edge1=conv2(edge_ver,[0,1;1,0],'same');
edge2=conv2(edge_ver,[1,0;0,1],'same');
%Threshold the edge image.
edge1(edge1 < 510) = 0; 
edge2(edge2 < 510) = 0;
figure(1); clf; imagesc([edge_ver, edge1, edge2]); colormap gray;

%Find all the detected edge coordinates.
[y1,x1] = find(edge1>0);
[y2,x2] = find(edge2>0);

%%%%%%%%%%%% data normaliaztion %%%%%%%%%%%%%%%
x1 = (x1)/300;
y1 = (600-y1(:,1))/300;
x2 = x2/300;
y2 = (600-y2(:,1))/300;

%%%%%%%%%%%%% your answer %%%%%%%%%%%


%p1 = your answer.
%p2 = your answer

%%%%%%%%%%%%%%plot result%%%%%%%%%%%%%%%%%%%%
figure; clf;imagesc(flipud(img_raw));
set(gca,'ydir','normal'); hold on;
idx1 = linspace(0,1.2,5);
plot(idx1*300, (p1(2)+p1(1)*idx1)*300,'r-','linewidth',3.0);
hold on;
idx2= linspace(1.63,3,5);
plot(idx2*300, (p2(2)+p2(1)*idx2)*300,'r-','linewidth',3.0);

