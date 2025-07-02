DriveFileNum=$(ls -l /content/drive/MyDrive/PhytoVir_Antibody_Designer/RF2_outputs | grep "^-" | wc -l)
while [ $DriveFileNum -lt 1000 ]
do
    WorkFileNum=$(ls -l /content/RF2_outputs | grep "^-" | wc -l)
    echo "Current file count in RF2_outputs: $WorkFileNum"
    cp -nr /content/RF2_outputs/* /content/drive/MyDrive/PhytoVir_Antibody_Designer/RF2_outputs/
    DriveFileNum=$(ls -l /content/drive/MyDrive/PhytoVir_Antibody_Designer/RF2_outputs | grep "^-" | wc -l)
    echo "Waiting for files to be copied to Google Drive. Current file count: $DriveFileNum"
    sleep 60
done
echo "All files have been copied to Google Drive."