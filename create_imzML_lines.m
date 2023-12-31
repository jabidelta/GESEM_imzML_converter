function lresult= create_imzML_lines(pcmzml_file,pcSaveFolder,tag1,tag2, line)
%% convert_double = typecast(reshape(uint8(arr'), 1, []), 'double')
cfilename=strcat(pcSaveFolder,'\',replace(pcmzml_file,".mzml",".imzML"));

fileID0= fopen(pcmzml_file,'r');
if fileID0 >0
    filename=strcat(pcSaveFolder,'\',cfilename);
    lineact =fgets(fileID0);
    while isempty(strfind(tag1)) && ~feof(fileID0)
        lineact =fgets(fileID0);
    end
    fileID=fopen(filename,'a');
    lineact =fgets(fileID0);
    while isempty(strfind(tag2)) && ~feof(fileID0)
        fwrite(fileID,lineact);
        lineact =fgets(fileID0);
    end
    fwrite(fileID,lineact);
    fileID=fopen(filename,'a');
    if fileID >0
        fprintf(fileID,line);
end
fprintf(fileID,'\n');
fprintf(fileID,'<mzML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://psi.hupo.org/ms/mzml http://psidev.info/files/ms/mzML/xsd/mzML1.1.0.xsd" version="1.1" xmlns="http://psi.hupo.org/ms/mzml">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'<cvList count="3">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cv id="MS" fullName="Proteomics Standards Initiative Mass Spectrometry Ontology" version="1.18.1" URI="http://psidev.cvs.sourceforge.net/*checkout*/psidev/psi/psi-ms/mzML/controlledVocabulary/psi-ms.obo" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cv id="UO" fullName="Unit Ontology" version="1.20" URI="http://obo.cvs.sourceforge.net/*checkout*/obo/obo/ontology/phenotype/unit.obo" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cv id="IMS" fullName="Imaging MS Ontology" version="0.9.1" URI="http://www.maldi-msi.org/download/imzml/imagingMS.obo" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'</cvList>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'<fileDescription>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<fileContent>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000579" name="MS1 spectrum" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000128" name="profile spectrum" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000080" name="universally unique identifier" value="{'+string(Aparams.UUID)+'}" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000090" name="ibd MD5" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000030" name="continuous" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</fileContent>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<sourceFileList count="1">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<sourceFile id="SF-0-1" name="UPV-EHU GEsSEM-UPV Group" location="">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000929" name="Orbitrap raw convert format" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000568" name="MD5" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000930" name="UPV-EHU GEsSEM-UPV Group" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</sourceFile>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</sourceFileList>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'</fileDescription>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'<referenceableParamGroupList count="4">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<referenceableParamGroup id="mzArray">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000576" name="no compression" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000514" name="m/z array" value="" unitCvRef="MS" unitAccession="MS:1000040" unitName="m/z" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000101" name="external data" value="true" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000521" name="'+string(Aparams.imzML_datformat)+'" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</referenceableParamGroup>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<referenceableParamGroup id="intensityArray">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000576" name="no compression" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000515" name="intensity array" value="" unitCvRef="MS" unitAccession="MS:1000131" unitName="number of counts" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000101" name="external data" value="true" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000521" name="'+string(Aparams.imzML_datformat)+'" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</referenceableParamGroup>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<referenceableParamGroup id="scan1">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000093" name="increasing m/z scan" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000095" name="linear" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</referenceableParamGroup>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<referenceableParamGroup id="spectrum1">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000579" name="MS1" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000511" name="ms level" value="0" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000128" name="profile spectrum" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000130" name="positive scan" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</referenceableParamGroup>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'</referenceableParamGroupList>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'<softwareList count="1">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<software id="sw-0-0" version="1.0">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1001558" name="GEsSEM-UPV Group Solutions" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</software>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'</softwareList>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'<scanSettingsList count="1">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<scanSettings id="scanSettings1">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000481" name="vertical line scan" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000492" name="line scan bottom up" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000400" name="bottom up" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000413" name="flyback" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000042" name="max count of pixel x" value="'+string(Aparams.max_count_of_pixel_x)+'" />');
fprintf(fileID,'\n');      
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');                  
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000043" name="max count of pixel y" value="'+string(Aparams.max_count_of_pixel_y)+'" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000044" name="max dimension x" value="'+string(Aparams.max_dimension_x)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000045" name="max dimension y" value="'+string(Aparams.max_dimension_y)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000046" name="pixel size x" value="'+string(Aparams.pixel_size_x)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000047" name="pixel size y" value="'+string(Aparams.pixel_size_y)+'" unitCvRef="UO" unitAccession="UO:0000017" unitName="micrometer" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</scanSettings>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'</scanSettingsList>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'<instrumentConfigurationList count="1">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<instrumentConfiguration id="ic-0-0">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1002382" name="'+string(Aparams.Instrument_ID.n1)+'" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000529" name="instrument serial number" value="'+string(Aparams.Instrument_ID.n3)+'" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000246" name="delayed extraction" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<softwareRef ref="sw-0-0" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</instrumentConfiguration>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'</instrumentConfigurationList>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'<dataProcessingList count="1">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<dataProcessing id="DP1">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<processingMethod order="0" softwareRef="sw-0-0">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000544" name="Conversion to mzML" value="" />');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</processingMethod>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</dataProcessing>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'</dataProcessingList>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'<run id="RID0" defaultInstrumentConfigurationRef="ic-0-0">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'<spectrumList defaultDataProcessingRef="DP1" count="'+string(Aparams.count)+'">');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
offset = Aparams.external_base_offset;
for i=0:Aparams.count-1
    fprintf(fileID,'<spectrum index="'+string(i)+'" id="source='+pcExperimentFolder+'-sp-'+string(i+1)+'.dat" defaultArrayLength="0">');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000285" name="total ion current" value="'+string(table2array(Aparams.Parametros_scan.table(i+1,'Total Current')))+'" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000528" name="lowest observed m/z" value="'+string(table2array(Aparams.Parametros_scan.table(i+1,'Low MZ')))+'" unitCvRef="MS" unitAccession="MS:1000040" unitName="m/z" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000527" name="highest observed m/z" value="'+string(table2array(Aparams.Parametros_scan.table(i+1,'High MZ')))+'" unitCvRef="MS" unitAccession="MS:1000040" unitName="m/z" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<referenceableParamGroupRef ref="spectrum1" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<scanList count="1">');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="MS" accession="MS:1000795" name="no combination" value="" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<scan instrumentConfigurationRef="ic-0-0">');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<referenceableParamGroupRef ref="scan1" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000050" name="position x" value="'+string(table2array(Aparams.Parametros_scan.table(i+1,'position x')))+'" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000051" name="position y" value="'+string(table2array(Aparams.Parametros_scan.table(i+1,'position y')))+'" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'</scan>');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'</scanList>');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<binaryDataArrayList count="2">');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<binaryDataArray encodedLength="0">');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<referenceableParamGroupRef ref="mzArray" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000103" name="external array length" value="'+string(Aparams.external_array_length)+'" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    if Aparams.multi_mass_base
        fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000102" name="external offset" value="'+string(offset)+'" />');
        offset= offset + Aparams.external_encoded_length;
    else
        fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000102" name="external offset" value="'+string(Aparams.external_base_offset)+'" />');
        if i==0
            offset= offset + Aparams.external_encoded_length;
        end
    end
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000104" name="external encoded length" value="'+string(Aparams.external_encoded_length)+'" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<binary />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'</binaryDataArray>');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<binaryDataArray encodedLength="0">');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<referenceableParamGroupRef ref="intensityArray" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000103" name="external array length" value="'+string(Aparams.external_array_length)+'" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000102" name="external offset" value="'+string(offset)+'" />');
    offset= offset + Aparams.external_encoded_length;
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<cvParam cvRef="IMS" accession="IMS:1000104" name="external encoded length" value="'+string(Aparams.external_encoded_length)+'" />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'<binary />');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'</binaryDataArray>');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'</binaryDataArrayList>');
    fprintf(fileID,'\n');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'\t');
    fprintf(fileID,'</spectrum>');
end
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'\t');
fprintf(fileID,'</spectrumList>');
fprintf(fileID,'\n');
fprintf(fileID,'\t');
fprintf(fileID,'</run>');
fprintf(fileID,'\n');
fprintf(fileID,'</mzML>');


fclose(fileID);
lresult=1;