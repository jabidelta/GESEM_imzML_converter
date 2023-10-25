function lresult= create_imzml_from_mzml( cformat,npixelsize,pcExperimentFile, pcExperimentFolder, pcSaveFolder)
% if ~exist("x","var")
%     [pcExperimentFilex, pcExperimentFolderx]=uigetfile("xy.mat","CHOSE  xy.mat file");
%     cfilenameXY=strcat(pcExperimentFolderx,'\',pcExperimentFilex);
%     load(cfilenameXY,"x","y");
% end
if ~exist("pcExperimentFolder","var") || isempty(pcExperimentFolder)
    [pcExperimentFile, pcExperimentFolder]=uigetfile("*.mzml","CHOSE .MZML file");
end
if ~exist("pcSaveFolder","var")
    pcSaveFolder = uigetdir(pcExperimentFolder,"Chose save folder");
end
lnpixel=0;
if exist('npixelsize','var')
    lnpixel=1;
end
cfilenameI=strcat(pcExperimentFolder,'\',pcExperimentFile);
[fileIDi, cmensajei]=fopen(cfilenameI,'rt');
cfilenameO= replace(cfilenameI,".mzML", ".imzML");
cfilenameO= replace(cfilenameO,pcExperimentFolder,  pcSaveFolder);
[fileIDo, cmensajeo]=fopen(cfilenameO,'wt');

tag1='xml version="1.0" ';
attribute = "encoding=""";
encodind_type= verify_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute,"s","",0);
tag1='<mzML';
line="";
[current_line, preline]= delete_until_imzML_lines(fileIDi,fileIDo,tag1,line,0);

tag1="<cvList ";
attribute = "count=""";
nvalue =1;
current_line= change_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute, nvalue);

tag1="</cvList>";
line = '<cv id="IMS" fullName="Imaging MS Ontology" version="0.9.1" URI="http://www.maldi-msi.org/download/imzml/imagingMS.obo" />';
current_line= insert_imzML_lines(fileIDi,fileIDo,tag1,line,0);

tag1="</fileContent>";
num=1;
idsJ = javaArray('java.lang.String',num);
ids = strings(num,1);    
for i = 1 : num
    idsJ(i) = javaMethod('toString', java.util.UUID.randomUUID);
end    
ids = string(idsJ);
hexStr= replace(ids,"-","");
chexStr= char(hexStr);
nUUID = zeros(1,16,'uint8');
for i=0:15
    nUUID(i+1) = hex2dec(chexStr(2*i+1:2*i+2));
end
line = '<cvParam cvRef="IMS" accession="IMS:1000080" name="universally unique identifier" value="'+ ids + '" />';
[current_line, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1,line,1);
linemd5='<cvParam cvRef="IMS" accession="IMS:1000090" name="ibd MD5" value="00000000000000000000000000000000" />';
fwrite(fileIDo,preline,"char*1");
plinemd5= ftell(fileIDo);
fprintf(fileIDo,"%s\n",linemd5);
line='<cvParam cvRef="IMS" accession="IMS:1000030" name="continuous" value="" />';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
fwrite(fileIDo,current_line,"char*1");

tag1="<sourceFileList ";
attribute = "count=""";
nvalue =1;
current_line= change_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute, nvalue);
tag1="</sourceFileList>";
line = '';
[current_line, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1,line,1);
cSourceid = "SF-0-1";
line='<sourceFile id="SF-0-1" name="Shimadzu Corporation database entity" location="">';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<cvParam cvRef="MS" accession="MS:1000929" name="Shimadzu Corporation nativeID format" value="" />';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"\t%s\n",line);
line='<cvParam cvRef="MS" accession="MS:1000568" name="MD5" value="" />';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"\t%s\n",line);
line='<cvParam cvRef="MS" accession="MS:1000930" name="Shimadzu Corporation database entity" />';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"\t%s\n",line);
line='</sourceFile>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
fwrite(fileIDo,current_line,"char*1");

tag1="<referenceableParamGroupList ";
attribute = "count=""";
nvalue =2;
current_line= change_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute, nvalue);
switch cformat
    case "float64"
        x_MSformat="MS:1000523";
        xformat ="64-bit float";
        xformatm ="float64";
        y_MSformat="MS:1000523";
        yformat ="64-bit float";
        yformatm ="float64";
        cconvert= "double";
    otherwise
        x_MSformat="MS:1000521";
        xformat ="32-bit float";
        xformatm ="float32";
        y_MSformat="MS:1000521";
        yformat ="32-bit float";
        yformatm ="float32";
        cconvert= "single";
end
pixel_size = npixelsize;

tag1="</referenceableParamGroup>";
line = '</referenceableParamGroup>';
[current_line, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1,line,1);
line='<referenceableParamGroup id="mzArray">';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<cvParam cvRef="MS" accession="MS:1000576" name="no compression" value=""/>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<cvParam cvRef="MS" accession="MS:1000514" name="m/z array" value="" unitCvRef="MS" unitAccession="MS:1000040" unitName="m/z"/>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<cvParam cvRef="IMS" accession="IMS:1000101" name="external data" value="true"/>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<cvParam cvRef="MS" accession="'+x_MSformat+'" name="'+xformat+'" value=""/>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);

line='</referenceableParamGroup>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<referenceableParamGroup id="intensityArray">';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<cvParam cvRef="MS" accession="MS:1000576" name="no compression" value=""/>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<cvParam cvRef="MS" accession="MS:1000515" name="intensity array" value="" unitCvRef="MS" unitAccession="MS:1000131" unitName="number of detector counts"/>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<cvParam cvRef="IMS" accession="IMS:1000101" name="external data" value="true"/>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<cvParam cvRef="MS" accession="'+y_MSformat+'" name="'+yformat+'" value=""/>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
fwrite(fileIDo,current_line,"char*1");

%% Añadir GESEM Sotware
tag1="<softwareList ";
attribute = "count=""";
nvalue =1;
current_line= change_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute, nvalue);

tag1="</softwareList>";
%%
%line = '<software id="GESEM MALDI TOOLS" version="23.05.24">';
csw="sw-0-0";
line= '<software id="sw-0-0" version="">';
[current_line, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1,line,1);
%line='<cvParam cvRef="IMS" accession="MS:1000615" name="MALDI TOOLS software" value=""/>';
line = '<cvParam cvRef="MS" accession="MS:1001558" name="MALDI Solutions" value="" />';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='</software>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
fwrite(fileIDo,current_line,"char*1");
line="";
% tag1="</softwareList>";
% [current_line, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1,line,0);
line='<scanSettingsList count="1">';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);

line='<scanSettings id="scanSettings1">';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"\t%s\n",line);

%<cvParam cvRef="IMS" accession="IMS:1000481" name="vertical line scan" value="" />
%<cvParam cvRef="IMS" accession="IMS:1000492" name="line scan bottom up" value="" />
%<cvParam cvRef="IMS" accession="IMS:1000400" name="bottom up" value="" />
%<cvParam cvRef="IMS" accession="IMS:1000413" name="flyback" value="" />
linex='<cvParam cvRef="IMS" accession="IMS:1000042" name="max count of pixel x" value="'+sprintf("%8d",0)+'" />';
fwrite(fileIDo,preline,"char*1");
plinex= ftell(fileIDo);
fprintf(fileIDo,"\t%s\n",linex);

liney='<cvParam cvRef="IMS" accession="IMS:1000043" name="max count of pixel y" value="'+sprintf("%8d",0)+'" />';
fwrite(fileIDo,preline,"char*1");
pliney= ftell(fileIDo);
fprintf(fileIDo,"\t%s\n",liney);

linex1='<cvParam cvRef="IMS" accession="IMS:1000044" name="max dimension x" value="'+sprintf("%8d",0* pixel_size)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />';
fwrite(fileIDo,preline,"char*1");
plinex1= ftell(fileIDo);
fprintf(fileIDo,"\t%s\n",linex1);

liney1='<cvParam cvRef="IMS" accession="IMS:1000045" name="max dimension y" value="'+sprintf("%8d",0* pixel_size)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />';
fwrite(fileIDo,preline,"char*1");
pliney1= ftell(fileIDo);
fprintf(fileIDo,"\t%s\n",liney1);

linex2='<cvParam cvRef="IMS" accession="IMS:1000046" name="pixel size x" value="'+sprintf("%8d",pixel_size)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />';
fwrite(fileIDo,preline,"char*1");
plinex2= ftell(fileIDo);
fprintf(fileIDo,"\t%s\n",linex2);

liney2='<cvParam cvRef="IMS" accession="IMS:1000047" name="pixel size y" value="'+sprintf("%8d",pixel_size)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />';
fwrite(fileIDo,preline,"char*1");
pliney2= ftell(fileIDo);
fprintf(fileIDo,"\t%s\n",liney2);

line='</scanSettings>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);

line='</scanSettingsList>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);

tag1="<dataProcessingList ";
attribute = "count=""";
nvalue =1;
current_line= change_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute, nvalue);

tag1="</dataProcessingList>";
cDPid="GESEM";
line = '<dataProcessing id="GESEM">';
[current_line, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1,line,1);
line='<processingMethod order="0" softwareRef="GESEM MALDI TOOLS">';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='<cvParam cvRef="MS" accession="MS:1000544" name="Conversion to mzML" value=""/>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='</processingMethod>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
line='</dataProcessing>';
fwrite(fileIDo,preline,"char*1");
fprintf(fileIDo,"%s\n",line);
fwrite(fileIDo,current_line,"char*1");

tag1="<run ";
attribute = "defaultSourceFileRef=""";
cvalue = cSourceid;
current_line= change_attribute_imzML_in_line(fileIDi,fileIDo,tag1,attribute, cvalue);

tag1="<spectrumList ";
attribute = "count=""";
[current_counter,lineact]= verify_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute,"n","",1);
attribute="defaultDataProcessingRef=";
k1=strfind( lineact,attribute);
k2=strlength(attribute);
cadfin= lineact(k1+k2+1:end);
k1=strfind( cadfin,'"');
cadreplace=cadfin(1:k1(1)-1);
k1= strfind( lineact,cadreplace);
if length(k1)==1
    lineact=replace(lineact,cadreplace, cDPid);
end
fwrite(fileIDo,lineact,"char*1");
% if size(x,1)~=current_counter
%     lresult=-3;
%     return
% end
cfilenameOi= replace(cfilenameO,".imzML",".ibd");
%cMD5=GetMD5(cfilenameOi,'File');
[fileIDoi, cmensajeoi]=fopen(cfilenameOi,'wb');
if fileIDoi <=0
    lresult=-4;
    return
end
%% Espacio para UUID, identificador unico.
fwrite(fileIDoi,nUUID,"uint8");
offset = ftell(fileIDoi);
Ax= pixel_size;
Ay= pixel_size;
minx=0;
maxx=0;
miny=0;
maxy=0;
for i=1:current_counter
%for i=1:10
    tag1="<spectrum ";
    attribute = "spotID=""";
    current_counter= verify_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute,"s", "", 0);
    pos_dat=split(current_counter,",");
    %pos absolute microns
    pos_abs=cell2mat(pos_dat(3));
    xy= split(pos_abs,'x');
    xabs=eval(cell2mat(xy(1)));
    yabs=eval(cell2mat(xy(2)));
    if i==1
        xabs0=xabs;
        yabs0=yabs;
    end
    if i==2
        Ax= xabs-xabs0;
        Ay= yabs-yabs0;
        if lnpixel==0
            if Ay==0
                Ay=Ax;
            end
            if Ax==0
                Ax=Ay;
            end
        else
            Ax=npixelsize;
            Ay=npixelsize;
        end 
    end
    x= round((xabs)/Ax,0);
    y= round((yabs)/Ay,0);
    if i==1
        minx=0;
        maxx=0;
        miny=0;
        maxy=0;
    end
    if x<minx
        minx=x;
    end
    if y<miny
        miny=y;
    end
    if x>maxx
        maxx=x;
    end
    if y>maxy
        maxy=y;
    end
    tag1="</scan>";
    line= '<cvParam cvRef="IMS" accession="IMS:1000050" name="position x" value="'+string(x)+'" />';
    [current_line, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1,line,1);
    line= '<cvParam cvRef="IMS" accession="IMS:1000051" name="position y" value="'+string(y)+'" />';
    fwrite(fileIDo,preline,"char*1");
    fprintf(fileIDo,"%s\n",line);
    fwrite(fileIDo,current_line,"char*1");
    line="";
    tag1="<binaryDataArray ";
    attribute = "encodedLength=""";
    current_counter= verify_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute,"s","Z",0);
    tag1='<cvParam cvRef="MS';
    [current_line, preline]= delete_imzML_lines(fileIDi,fileIDo,tag1,line,1);
    
    tag1="<binary>";
    offset = ftell(fileIDoi);
    nsize=0;
    if contains( current_line,tag1)
        k=strfind(current_line,"<binary>");
        k1=strfind(current_line,"</binary>");
        encoded_value =current_line(k+8:k1-1);
        arr= matlab.net.base64decode(encoded_value);
        
        arr_convert = typecast(reshape(uint8(arr'), 1, []),  cconvert);
        nsize=fwrite(fileIDoi,arr_convert,xformatm);
    end
    tag1="</binaryDataArray>";
    line='<referenceableParamGroupRef ref="mzArray" />';
    [current_line, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1,line,1);
    line='<cvParam cvRef="IMS" accession="IMS:1000103" name="external array length" value="'+string(nsize)+'" />';
    fwrite(fileIDo,preline,"char*1");
    fprintf(fileIDo,"%s\n",line);
    line='<cvParam cvRef="IMS" accession="IMS:1000102" name="external offset" value="'+string(offset)+'" />';
    fwrite(fileIDo,preline,"char*1");
    fprintf(fileIDo,"%s\n",line);
    offset1 = ftell(fileIDoi);
    total = offset1-offset;
    line='<cvParam cvRef="IMS" accession="IMS:1000104" name="external encoded length" value="'+string(total)+'" />';
    fwrite(fileIDo,preline,"char*1");
    fprintf(fileIDo,"%s\n",line);
    line='<binary />';
    fwrite(fileIDo,preline,"char*1");
    fprintf(fileIDo,"%s\n",line);
    fwrite(fileIDo,current_line,"char*1");
    
    line="";
    tag1="<binaryDataArray ";
    attribute = "encodedLength=""";
    current_counter= verify_counter_imzML_in_line(fileIDi,fileIDo,tag1,attribute,"s","Z", 0);
    tag1='<cvParam cvRef="MS';
    [current_line, preline]= delete_imzML_lines(fileIDi,fileIDo,tag1,line,1);
    
    tag1="<binary>";
    offset = ftell(fileIDoi);
    nsize=0;
    if contains( current_line,tag1)
        k=strfind(current_line,"<binary>");
        k1=strfind(current_line,"</binary>");
        encoded_value =current_line(k+8:k1-1);
        arr= matlab.net.base64decode(encoded_value);
        arr_convert = typecast(reshape(uint8(arr'), 1, []),  cconvert);
        nsize=fwrite(fileIDoi,arr_convert,yformatm);
    end
    tag1="</binaryDataArray>";
    line='<referenceableParamGroupRef ref="intensityArray" />';
    [current_line, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1,line,1);
    line='<cvParam cvRef="IMS" accession="IMS:1000103" name="external array length" value="'+string(nsize)+'" />';
    fwrite(fileIDo,preline,"char*1");
    fprintf(fileIDo,"%s\n",line);
    line='<cvParam cvRef="IMS" accession="IMS:1000102" name="external offset" value="'+string(offset)+'" />';
    fwrite(fileIDo,preline,"char*1");
    fprintf(fileIDo,"%s\n",line);
    offset1 = ftell(fileIDoi);
    total = offset1-offset;
    line='<cvParam cvRef="IMS" accession="IMS:1000104" name="external encoded length" value="'+string(total)+'" />';
    fwrite(fileIDo,preline,"char*1");
    fprintf(fileIDo,"%s\n",line);
    line='<binary />';
    fwrite(fileIDo,preline,"char*1");
    fprintf(fileIDo,"%s\n",line);
    fwrite(fileIDo,current_line,"char*1");
   
    tag1="</spectrum>";
    line="";
    [current_line, preline]= insert_imzML_lines(fileIDi,fileIDo,tag1,line,0);
    
end
tag1='</spectrumList>';
[current_line, preline]= delete_until_imzML_lines(fileIDi,fileIDo,tag1,line,0);
tag1='</run>';
[current_line, preline]= delete_until_imzML_lines(fileIDi,fileIDo,tag1,line,0);
% fwrite(fileIDo,preline,"char*1");
% fprintf(fileIDo,"%s\n",current_line);
tag1="</mzML>";
[current_line, preline]= delete_until_imzML_lines(fileIDi,fileIDo,tag1,line,0);
%tag1='</indexedmzML>';
% if strcmp(current_line,tag1)==0
%    [current_line, preline]= delete_until_imzML_lines(fileIDi,fileIDo,tag1,line,0);
% else
%     fprintf(fileIDo,"%s",current_line);
% end
%insert_imzML_lines()
%% Correcciones de datos

fseek(fileIDo,plinex,-1);
linex='<cvParam cvRef="IMS" accession="IMS:1000042" name="max count of pixel x" value="'+sprintf("%8d",maxx-minx+1)+'" />';
fprintf(fileIDo,"\t%s\n",linex);

fseek(fileIDo,pliney,-1);
liney='<cvParam cvRef="IMS" accession="IMS:1000043" name="max count of pixel y" value="'+sprintf("%8d",maxy-miny+1)+'" />';
fprintf(fileIDo,"\t%s\n",liney);

fseek(fileIDo,plinex1,-1);
linex1='<cvParam cvRef="IMS" accession="IMS:1000044" name="max dimension x" value="'+sprintf("%8d",(maxx-minx+1)*pixel_size)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />';
fprintf(fileIDo,"\t%s\n",linex1);

fseek(fileIDo,pliney1,-1);
liney1='<cvParam cvRef="IMS" accession="IMS:1000045" name="max dimension y" value="'+sprintf("%8d",(maxy-miny+1)*pixel_size)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />';
fprintf(fileIDo,"\t%s\n",liney1);

fseek(fileIDo,plinex2,-1);
linex2='<cvParam cvRef="IMS" accession="IMS:1000046" name="pixel size x" value="'+sprintf("%8d",Ax)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />';
fprintf(fileIDo,"\t%s\n",linex2);

fseek(fileIDo,pliney2,-1);
liney2='<cvParam cvRef="IMS" accession="IMS:1000047" name="pixel size y" value="'+sprintf("%8d",Ay)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />';
fprintf(fileIDo,"\t%s\n",liney2);

fclose(fileIDoi);
%cMD5=GetMD5(cfilenameOi, 'file');
%fseek(fileIDo,plinemd5,-1);
%linemd5='<cvParam cvRef="IMS" accession="IMS:1000090" name="ibd MD5" value="'+cMD5+'" />';
%fprintf(fileIDo,"%s\n",linemd5);
fclose(fileIDo);
fclose(fileIDi);
% fprintf(fileID,'<targetRaster xmlns="http://www.apmaldi.com/target_raster-1.0.0" targetVersion="6.0 build 12" startTime="2023-10-02">');
% fprintf(fileID,'\n');
% fprintf(fileID,'<rasterConfig>');
% fprintf(fileID,'\n');
% fprintf(fileID,'\t');
% fprintf(fileID,'<width units="mm">4.5</width>');
% fprintf(fileID,'\n');
% fprintf(fileID,'\t');
% fprintf(fileID,'<height units="mm">3</height>');
% fprintf(fileID,'\n');
% fprintf(fileID,'\t');
% fprintf(fileID,'<spacing units="mm">0.1</spacing>');
% fprintf(fileID,'\n');
% fprintf(fileID,'\t');
% fprintf(fileID,'<velocity units="mm/sec">0.04961</velocity>');
% fprintf(fileID,'\n');
% fprintf(fileID,'\t');
% fprintf(fileID,'<transitionTime units="sec">9</transitionTime>');
% fprintf(fileID,'\n');
% fprintf(fileID,'\t');
% fprintf(fileID,'<scanType>flyback</scanType>');
% fprintf(fileID,'\n');
% fprintf(fileID,'\t');
% fprintf(fileID,'<scanDirection>horizontal</scanDirection>');
% fprintf(fileID,'\n');
% fprintf(fileID,'</rasterConfig>');
% fprintf(fileID,'<image width="'+string(max(X)+1)+'" height="'+ string(max(Y)+1)+' " pixelWidth="0.1" pixelHeight="0.1" timeShift="0">');
% fprintf(fileID,'\n');
% fprintf(fileID,'\t');
% offset = 0 ;%Aparams.external_base_offset;
% for i=1:size(X,1)
%     
%     fprintf(fileID,'<pixel x="'+string(X(i))+'" y="'+string(Y(i))+'" offset="'+string(offset)+'" duration="2015"/>');
%     fprintf(fileID,'\n');
%     fprintf(fileID,'\t');
%     offset = i* 99708/6 -1;
% end
% fprintf(fileID,'</image>');
% fprintf(fileID,'</targetRaster>');
% fclose(fileIDi);
% fclose(fileIDo);
lresult=1;