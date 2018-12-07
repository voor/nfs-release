# Apply the addon in a way that ops man won't overwrite it:
bosh update-config --name=nfs-addon --type=runtime ./manifest.yml
