clear all;
clc;
close all;

fid = fopen('hub1.gcode')
% gcode_file={ }; gcode_file=zeros(length(j),4)
j=1;
line =0;
%  while ischar(tline) %Check if row is character array or not bu durumda
 while ischar('G') % while the line includes G0 do following
       
       tline=fgetl(fid); % Read fid file line by line.
       line =line+1;
       if contains(tline,'F') && size(str2double(regexp(tline,'[\d.]+','match')),2)==5
                
                if contains(tline,'Z')
                    coord=str2double(regexp(tline,'[\d.]+','match'));
                    coordinates1(j,:)=coord(1,3:5);
                    coordz=coord(1,5);
                    j=j+1;
                else 
                    coord1=str2double(regexp(tline,'[\d.]+','match'));
                    coordinates1(j,:)=coord1(1,3:5);
                    coordinates1(j,3)=coordz;
                    j=j+1;
                end
       end
       
       
                
      if contains(tline,'X') && size(str2double(regexp(tline,'[\d.]+','match')),2)==4 && contains(tline,';')~=1 %&& contains(tline,'F')~=1
                   coord2=str2double(regexp(tline,'[\d.]+','match'));
                   coordinates1(j,:)=coord2(1,2:4); 
                   coordinates1(j,3)=coordz ;  % [coord3(1,2);coord3(1,3),coord(1,5)] z'yi çekebilmek için 
                   j=j+1;
      end
     if contains(tline,';End of Gcode')
         break
     end
              
 end
 
 figure (1);
 axis ([150 175 110 130])
hold on
 for i=1:size(coordinates1,1) 
    
   
     plot(coordinates1(i,1),coordinates1(i,2),'*')
     x=coordinates1(i,1)
     y=coordinates1(i,2)
     z=coordinates1(i,3)
     plot3(x,y,z)
     rotate3d on

    hold on
    axis equal % or axis square 
    xlabel('x'),ylabel('y'),zlabel('z')
 end
 
 
 
%   Plotting 
%    plot(coordinates1(i,1),coordinates1(i,2),'*');
%      set(p,'LineStyle',
%     plot3(coordinates1(i,1),coordinates1(i,2),coordinates1(i,3),'*');     
      
      
% %  while  ischar('G1')
% %         j=j+1;
% %         tline=fgetl(fid);
%                 if  strfind(tline,'F') & size(str2double(regexp(tline,'[\d.]+','match')),2)==3
%                 tline=fgetl(fid);
%                 j=j+1;
%                 end
%                 if  strfind(tline,'F') & size(str2double(regexp(tline,'[\d.]+','match')),2)==5
%                     coord2=str2double(regexp(tline,'[\d.]+','match'))
%                     coordinates(j,:)=coord2(1,3:4)
%                    
%                 end
% 
%                
%          
%                
%                    tline=fgetline(fid);
%                    j=j+1;
%                  if strfind(tline,'X') & size(str2double(regexp(tline,'[\d.]+','match')),2)==4
%                    coord3=str2double(regexp(tline,'[\d.]+','match'))
%                    coord4(j,:)=coord3(1,2:4)                  % [coord3(1,2);coord3(1,3),coord(1,5)] z'yi çekebilmek için 
%                
% 
% 
%    



