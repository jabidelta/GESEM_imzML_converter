function [counter, lineact]= verify_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute, type, operation, lcontinua)
counter=0;
scounter = "";
lineact =fgets(fileIDi);
if ~isnumeric(lineact)
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
         if length(k1)>1
             k1=k1(1);
         end
         if length(k1)==1
             if exist("type","var") && type =="s"
                 if exist("operation","var") && operation =="Z" 
                    scounter = "0";
                    %replace(lineact,strcat(cadf(1: k1-1)),counter);
                    k=strfind(lineact,cadf(1: k1-1));
                    k0=length(cadf(1: k1-1));
                    lineact=strcat(lineact(1:k-1),scounter,lineact(k+k0:end),newline);
                    counter=eval(cadf(1: k1-1));
                 else
                    counter = cadf(1: k1-1);
                 end
             else
                 counter=eval(cadf(1: k1-1));
             end
         end
         if lcontinua == 0
             if scounter=="0"
                 fprintf(fileIDo,"%s\n",lineact);
             else
                 fwrite(fileIDo,lineact,"char*1");
             end
         else
              if scounter=="0"
                  lineact = sprintf("%s\n",lineact);
              end
         end

    end
end
end
