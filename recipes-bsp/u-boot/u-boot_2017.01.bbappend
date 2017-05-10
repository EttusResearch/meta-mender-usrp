FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot-${PV}:"

SRC_URI_append_sulfur = " \
    file://sulfur/0001-ni-zynq-Mender.io-support-for-NI-Ettus-Research-Sulf.patch \
"
