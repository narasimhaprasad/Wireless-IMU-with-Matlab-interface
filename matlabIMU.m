clear all
clc
s = serial('COM9','Baudrate',9600);
fopen(s);
disp('Com Port Open')
pause(10);
i = 1;
j=1;
tic
while toc < 15
    while(s.bytesavailable>0)
        chk = fgetl(s);
        if (chk(1) == '!'&& chk(numel(chk)-1)=='f')
            disp('data');            
            out = chk;
            xi = findstr(out, '!x');
            yi = findstr(out,'!y');
            zi = findstr(out,'!z');
            ti = findstr(out,'!t');
            fi = findstr(out,'!f');
            len1 = yi-xi;
            len2 = zi-yi;
            len3 = ti-zi;
            len4 = fi - ti;
            for i = 1:1:len1-2
                x(i) = out(xi+i+1);
            end
            xstr = str2num(x);
            xnum(j) = xstr;
            for i = 1:1:len2-2
                y(i) = out(yi+i+1);
            end
            ystr = str2num(y);
            ynum(j) = ystr;
            for i = 1:1:len3-2
                z(i) = out(zi+i+1);
            end
            zstr = str2num(z);
            znum(j) = zstr;
            for i = 1:1:len4-2
                t(i) = out(ti+i+1);
            end
            tstr = str2num(t);
            tnum(j) = tstr;
            j = j+1;
        else
            trash = fscanf(s);
        end
            
    end
    
end
fclose(s);
delete(s);
clear s;
plot3(xnum,ynum,znum);grid on;xlabel('roll');ylabel('pitch');zlabel('yaw');