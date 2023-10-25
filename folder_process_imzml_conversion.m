function folder_process_imzml_conversion(pcExperimentFolder,pcBaseSaveFolder, paOptions)
clear all;
w = warning ('off','all');
addpath(pwd);
ldefault=0;
if nargin<3 
   ldefault=1;
end
if ~exist('paOptions','var') 
    ldefault=1;
else
    if ~ isfield(paOptions,"pixel_size")
         ldefault=1;
    end
end
if  ldefault==1
   paOptions.pixel_size=25;
   paOptions.data_format='float64';
end

    
if nargin<1 || strcmp(pcExperimentFolder,"")
    pcExperimentFolder="";
    while strcmp(pcExperimentFolder,"")
        pcExperimentFolder = uigetdir("","Choose Experiment Folder");
    end
end
if nargin<2 || strcmp(pcBaseSaveFolder,"")
    pcBaseSaveFolder="";
    while strcmp(pcBaseSaveFolder,"")
        pcBaseSaveFolder = uigetdir("","Choose Base Save Folder");
    end
end
lsSaveFolderInfo = dir(pcBaseSaveFolder);
nFolders =size(lsSaveFolderInfo,1);
if nFolders<= 2 
    paOptions.lcreatesavefolders = 1;
end    
lsFolderInfo = dir(pcExperimentFolder);
nFolders =size(lsFolderInfo,1);
for i=1:nFolders
    if lsFolderInfo(i).isdir==0

        %clear 'config'

        if ~contains( lsFolderInfo(i).name,".mzML")
            continue
        end
        filenamei = replace( lsFolderInfo(i).name,".mzML",".imzML");
        fullfilei = strcat(pcBaseSaveFolder,"\",filenamei);
        if exist(fullfilei,'file')
            disp(strcat('Procesado anteriormente: ',filenamei,' Fin:', datestr(datetime())));
            continue
        end
        disp(strcat('Procesando: ',filenamei,' Ini:', datestr(datetime())));
        lresult= create_imzml_from_mzml(paOptions.data_format,paOptions.pixel_size,lsFolderInfo(i).name,lsFolderInfo(i).folder, pcBaseSaveFolder);
        if lresult==1
            disp(strcat('Procesado: ',filenamei,' Fin:', datestr(datetime())));
        end
    end
end
w = warning ('on','all');

    

