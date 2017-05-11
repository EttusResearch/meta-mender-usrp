# meta-mender-usrp

This Yocto layer contains recipes which enable support of building the Mender client for NI USRP devices.

## Dependencies

This layer depends on:

    URI: https://github.com/EttusResearch/meta-ettus
    branch: master
    revision: HEAD

in addition to `meta-mender` dependencies.

## Build instructions

- Read [the Mender documentation on Building a Mender Yocto image](https://docs.mender.io/Artifacts/Building-Mender-Yocto-image) for Mender specific configuration.
- Set MACHINE to one of the following
    - sulfur

- Add following to your local.conf (including configuration required by meta-mender-core)


    INHERIT += "mender-full"
    MENDER_ARTIFACT_NAME = "release-5"
    MENDER_STORAGE_DEVICE = "/dev/mmcblk0"
    MENDER_STORAGE_TOTAL_SIZE_MB = "7168"
    IMAGE_ROOTFS_EXTRA_SPACE = "0"
    MENDER_SERVER_URL = "https://mender.ettus.com"

    FILESEXTRAPATHS_prepend_pn-mender := "${TOPDIR}/../:"
    SRC_URI_append_pn-mender = " file://server.crt"


- Run `bitbake <image name>`
