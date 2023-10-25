function lineact= change_attribute_imzML_in_line(fileIDi,fileIDo,tag1,attribute, cvalue)
%% Inserta las lineas entre tag1 y tag2 en un fichero escribiendo la linea line antes de tag2
%% Si tag1 esta vacio considera el inicio

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
         cadf= cad(1:k1(1));
         k0=strlength(attribute);
         line= strcat(lineact(1:k+k0-1),cvalue,lineact(k+k0+k1(1)-1:end));
         fwrite(fileIDo,line,"char*1");
         fprintf(fileIDo,"\n");
    end
%         end
end
