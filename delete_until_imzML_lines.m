function [lineact, preline]= delete_until_imzML_lines(fileIDi,fileIDo,tag1, line, continua)

preline="";
if tag1~=""
    lineact =fgets(fileIDi);
    if ~isnumeric(lineact)
        while ~contains( lineact,tag1) && ~feof(fileIDi)
            %fwrite(fileIDo,lineact,"char*1");
            k1=strfind( lineact,'<');
            preline= lineact(1:k1(1)-1);
            lineact =fgets(fileIDi);
        end
        if strlength(line)>0 && ~isnumeric(lineact)
            if contains( lineact,tag1) && ~feof(fileIDi)
                k1=strfind( lineact,tag1);
                preline= lineact(1:k1(1)-1);
                lineact =fgets(fileIDi);
            end
        end
        if ~continua && ~isnumeric(lineact)
            fwrite(fileIDo,lineact,"char*1");
        end
    end
end
