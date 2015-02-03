  #!/bin/bash
cd ~
$(find folderWithImagesToCheck/  -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 15 > dupes.txt)
wc -l dupes.txt
cat dupes.txt




