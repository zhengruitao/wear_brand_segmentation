function B = bfltGray(A,w,sigma_d,sigma_r)
% �����������Ȩ��
[X,Y] = meshgrid(-w:w,-w:w);
%�����˾������
%e.g.
%[x,y]=meshgrid(-1:1,-1:1)
% 
% x =
% 
%     -1     0     1
%     -1     0     1
%     -1     0     1
% 
% 
% y =
% 
%     -1    -1    -1
%      0     0     0
%      1     1     1

%���㶨�����
G = exp(-(X.^2+Y.^2)/(2*sigma_d^2));

%����������
h = waitbar(0,'Applying bilateral filter...');
set(h,'Name','Bilateral Filter Progress');

% Ӧ��˫���˲�
%����ֵ���H ���붨�����G �˻��õ�˫��Ȩ�غ���F
dim = size(A);
B = zeros(dim);
for i = 1:dim(1)
   for j = 1:dim(2)
         %�߽�����
         iMin = max(i-w,1);
         iMax = min(i+w,dim(1));
         jMin = max(j-w,1);
         jMax = min(j+w,dim(2));
         
         %���嵱ǰ�������õ�����Ϊ(iMin:iMax,jMin:jMax)
         I = A(iMin:iMax,jMin:jMax);%��ȡ�������Դͼ��ֵ����I
      
         % ������������Ȩ��
         H = exp(-(I-A(i,j)).^2/(2*sigma_r^2));
      
         % ����˫���˲����
         F = H.*G((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
         B(i,j) = sum(F(:).*I(:))/sum(F(:));
               
   end
   waitbar(i/dim(1));
end
% ����������
close(h);