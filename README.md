# NFS Bosh Release Addon

Current development builds of PKS 1.3 do not include NFS packages.  This presented a great opportunity for me to get some more experience with building a bosh release addon that incorporated debian packages.

## Installation

Go to the release section of this repository and download `nfs-1.0.0.tgz`.  `scp` that onto your Ops Manager, or use bosh directly to run:

```
bosh upload-release nfs-1.0.0.tgz
```

Afterwards, you can go into the `manifest` folder and run:

```
./applying.sh
```

Either apply-changes with `om` or go to the UI and apply changes.

## Building

Create a `private.yml` in the config folder, it shoud look something like this:

```
---
blobstore:
  options:
    credentials_source: static
    json_key: |
      # Pasted from the download JSON file.
```

Then run:

```
bosh create-release --version=1.0.0 --final  --tarball=releases/nfs-1.0.0.tgz
```

Note that since there's already a v1.0.0, you'll probably want to do something higher.

## Thanks

This was created through a combination of following the tutorial here: [Creating a Release](https://bosh.io/docs/create-release/), using [iscsi-release](https://github.com/svrc-pivotal/iscsi-release), and then since the later versions of kubo include the necessary packages, copying them from [kubo-release](https://github.com/cloudfoundry-incubator/kubo-release).

## LICENSE

MIT