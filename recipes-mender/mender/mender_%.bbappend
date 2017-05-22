FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://mender-device-identity \
    file://mender-inventory-serial \
    file://server.crt \
"

do_install_append() {
	install -m 0755 ${WORKDIR}/mender-device-identity ${D}/${datadir}/mender/identity/mender-device-identity
	install -m 0755 ${WORKDIR}/mender-device-identity ${D}/${datadir}/mender/inventory/mender-inventory-serial
}
