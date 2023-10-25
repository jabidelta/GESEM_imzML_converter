function [lineact, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1, line, continua)
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
preline="";
if tag1~=""
    lineact =fgets(fileIDi);
    if ~isnumeric(lineact)
        k1=strfind( lineact,'<');
        preline= lineact(1:k1(1)-1);
        while ~contains( lineact,tag1) && ~feof(fileIDi)
            fwrite(fileIDo,lineact,"char*1");
            k1=strfind( lineact,'<');
            preline= lineact(1:k1(1)-1);
            lineact =fgets(fileIDi);
        end
        if ~isempty(line)
            fwrite(fileIDo,preline,"char*1");
            %fprintf(fileIDo,"\t");
            fwrite(fileIDo,line,"char*1");
            fprintf(fileIDo,"\n");
        end
        if ~continua
            fwrite(fileIDo,lineact,"char*1");
        end
    end
%         end
end
