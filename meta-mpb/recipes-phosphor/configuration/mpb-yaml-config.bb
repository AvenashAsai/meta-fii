SUMMARY = "YAML configuration for mpb"
PR = "r1"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"

inherit allarch

SRC_URI = " \
	file://mpb-ipmi-sensors.yaml \
	file://mpb-ipmi-fru.yaml \
	file://mpb-ipmi-fru-properties.yaml \
	"

S = "${WORKDIR}"

do_install() {
    install -m 0644 -D mpb-ipmi-sensors.yaml \
        ${D}${datadir}/${BPN}/ipmi-sensors.yaml
    install -m 0644 -D mpb-ipmi-fru.yaml \
        ${D}${datadir}/${BPN}/mpb-ipmi-fru.yaml
    install -m 0644 -D mpb-ipmi-fru-properties.yaml \
        ${D}${datadir}/${BPN}/mpb-ipmi-fru-properties.yaml
}

FILES_${PN}-dev = " \
    ${datadir}/${BPN}/ipmi-sensors.yaml \
    "

ALLOW_EMPTY_${PN} = "1"
