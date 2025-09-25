function[header, data] = lab2mat(filename)
%This function takes my labview data, dumps the header. it then works out
%the time interval between samples to use in the creation of a time vector.
%the raw data ends up in a matrix called data.

fid = fopen(filename);
filename2 = strcat(filename(1:length(filename)-3),'tom');
header = fgetl(fid); % dump the header into something
dummy = fgetl(fid); % hop skip and jump over blank lin
% Now work out the difference between two time stamps
time1 = fgetl(fid);
time2 = fgetl(fid);
interval = str2num(time2(19:27)) - str2num(time1(19:27));
% Now rewind!
frewind(fid)
%now hop skip jump over two lines
dummy = fgetl(fid);
dummy = fgetl(fid);
% Now get the data
line = 1;
count = 1;

while 1==1
    tempvar = fgetl(fid);
    if tempvar == -1 % end the while loop if we have reached the end of the file
        break
    end
    data(line,:) = str2num(tempvar(29:length(tempvar)));
    line=line+1;
end
fclose(fid)

% now create a time vector
for cnt = 1:line-1
    timevec(cnt,1) = (cnt-1)*interval;
end
data = [timevec data];
dlmwrite(filename2,data,'\t');
end