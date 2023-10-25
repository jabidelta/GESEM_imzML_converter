function lineact= change_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute, nvalue)
%% Inserta las lineas entre tag1 y tag2 en un fichero escribiendo la linea line antes de tag2
%% Si tag1 esta vacio considera el inicio
%% convert_double = typecast(reshape(uint8(arr'), 1, []), 'double')
% cfilename=strcat(pcSaveFolder,'\',replace(pcmzml_file,".mzml",".imzML"));
% 
% fileID0= fopen(pcmzml_file,'r');
% if fileID0 >0
%     filename=strcat(pcSaveFolder,'\',cfilename);
%     if tag1~=""
%         lineact =fgets(fileID0);
%         while isempty(strfind(tag1)) && ~feof(fileID0)
%             lineact =fgets(fileID0);
%         end
%     end
%     fileID=fopen(filename,'a');
%     if fileID <0
%         nresult= -1;
%         return ;
%     end
%     lineact =fgets(fileID0);
%     while isempty(strfind(tag2)) && ~feof(fileID0)
%         fputs(fileID,lineact);
%         lineact =fgets(fileID0);
%     end
%     fputs(fileID,lineact);
%     if fileID <0
%         nresult= -2;
%         return ;
%     else
%         fputs(fileID,line);
%     end
% end
if nvalue~=0
    lineact =fgets(fileIDi);
    while ~contains( lineact,tag1) && ~feof(fileIDi)
        fwrite(fileIDo,lineact,"char*1");
        lineact =fgets(fileIDi);
    end
    k=strfind( lineact,tag1);
    if length(k)==1
         k=strfind( lineact,attribute);
         k0=strlength(attribute);
         cad= lineact(k+k0:end);
         k1=strfind( cad,'"');
         cadf= cad(1:k1);
         if length(k1)==1
             nvalue=eval(cadf(1: k1-1))+nvalue;
         end
         line= strcat(lineact(1:k+k0-1),string(nvalue),lineact(k+k0+k1-1:end));
         fwrite(fileIDo,line,"char*1");
         fprintf(fileIDo,"\n");
    end
%         end
end
