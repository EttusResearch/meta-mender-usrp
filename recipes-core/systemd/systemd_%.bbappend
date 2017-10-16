PACKAGECONFIG_append = " networkd resolved"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

inherit deploy

SRC_URI += " file://eth0.network \
   file://eth1.network \
   file://eth2.network \
"


FILES_${PN} += " \
    ${sysconfdir}/systemd/network/eth0.network \
    ${sysconfdir}/systemd/network/eth1.network \
    ${sysconfdir}/systemd/network/eth2.network \
"

FILES_${PN} += " \
    /data/* \
"


do_install_append() {
  if ${@bb.utils.contains('PACKAGECONFIG','networkd','true','false',d)}; then
        install -d ${D}${sysconfdir}/systemd/network
        install -d ${D}/data/network

        ln -sf /data/network/eth0.network ${D}${sysconfdir}/systemd/network/eth0.network
        ln -sf /data/network/eth1.network ${D}${sysconfdir}/systemd/network/eth1.network
        ln -sf /data/network/eth2.network ${D}${sysconfdir}/systemd/network/eth2.network

        if [ -e ${D}${sysconfdir}/systemd/network/eth.network ]; then
            rm ${D}${sysconfdir}/systemd/network/eth.network
        fi
  fi
}

do_deploy() {
        install -d ${DEPLOYDIR}/persist/network
        install -m 0755 ${WORKDIR}/eth0.network ${DEPLOYDIR}/persist/network
        install -m 0755 ${WORKDIR}/eth1.network ${DEPLOYDIR}/persist/network
        install -m 0755 ${WORKDIR}/eth2.network ${DEPLOYDIR}/persist/network
}
addtask do_deploy after do_compile before do_build

