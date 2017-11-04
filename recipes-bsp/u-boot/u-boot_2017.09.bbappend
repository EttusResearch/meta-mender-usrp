FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot-${PV}:"

SRC_URI_append_ni-sulfur = " \
    file://sulfur/0006-ni-zynq-Mender.io-support-for-NI-Ettus-Research-Sulf.patch \
    file://sulfur/0007-ni-zynq-Mender.io-support-for-NI-Ettus-Research-Sulf.patch \
"
