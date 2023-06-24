FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

PACKAGECONFIG ??= ""
PACKAGECONFIG[hawkbit] = ",,,,,"

SRC_URI += "\
    file://systemd.cfg \
    file://hash.cfg \
    file://disable_http_server.cfg \
    file://part-format.cfg \
    file://archive.cfg \
    file://signed-images.cfg \
"

DEPENDS += "e2fsprogs"

do_install:append() {
    rm -rf ${D}${libdir}/swupdate
}

RDEPENDS:${PN} += "swupdate-machine-config"
