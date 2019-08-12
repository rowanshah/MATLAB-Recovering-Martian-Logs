% MATLAB II: Recovering Martian Logs
 
% Rowan M. Shah
% SN: 17082517

file = fopen("chunk"); % open and read the binary file
chunk = fread(file, 'int32'); %fread returns the character array, chunk 
 
load('key_80.mat'); % load all variables from the file 
key = randomKey; 
 

for Q = 0 :length(key) %shift the keys for each element in the array 
      
    newKey = circshift(key,Q); % shift the keys
    
    text = chunk - newKey; % subtract the keys from the 'chunk' array
    
    % if readable text is found ('^' not in the array)
    if ~ismember(94, text(:))
        
    %save and open the file Decrypted_Logs.txt for binary read access
    fid = fopen('Decrypted_Logs.txt','wt'); 
    
    fprintf(fid,char(text.')); %Write data to the text file
    
    fclose(fid); %closes the open file.
    
    disp('Text saved successfully.'); 
    
         break
    end
end