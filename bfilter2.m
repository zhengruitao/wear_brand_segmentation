%AΪ����ͼ�񣬹�һ����[0,1]�ľ���
%wΪ˫���˲������ˣ��ı߳�/2
%�����򷽲��d��ΪSIGMA(1),ֵ�򷽲��r��ΪSIGMA(2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function B = bfilter2(A,w,sigma)
% �������ͼ���Ƿ���ڲ�����Ч
if ~exist('A','var') || isempty(A)
   error('Input image A is undefined or invalid.');
end
if ~isfloat(A) || ~sum([1,3] == size(A,3)) || ...
      min(A(:)) < 0 || max(A(:)) > 1
   error(['Input image A must be a double precision ',...
          'matrix of size NxMx1 or NxMx3 on the closed ',...
          'interval [0,1].']);      
end

% ����˫���˲����İ���Ƿ����Ҫ��
if ~exist('w','var') || isempty(w) || ...
      numel(w) ~= 1 || w < 1
   w = 5;
end
w = ceil(w);

% ����sigma�����Ƿ����Ҫ��
if ~exist('sigma','var') || isempty(sigma) || ...
      numel(sigma) ~= 2 || sigma(1) <= 0 || sigma(2) <= 0
   sigma = [3 0.1];
end

%ѡ���ɫģʽ��Ҷ�ģʽ
if size(A,3) == 1
   B = bfltGray(A,w,sigma(1),sigma(2));
else
   B = bfltColor(A,w,sigma(1),sigma(2));
end