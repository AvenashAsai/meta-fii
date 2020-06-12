inherit obmc-phosphor-systemd

FILESEXTRAPATHS_prepend_mpb := "${THISDIR}/${PN}:"

EEPROM_NAMES = "bmc "

EEPROMFMT = "system/{0}"
EEPROM_ESCAPEDFMT = "system-{0}"
EEPROMS = "${@compose_list(d, 'EEPROMFMT', 'EEPROM_NAMES')}"
EEPROMS_ESCAPED = "${@compose_list(d, 'EEPROM_ESCAPEDFMT', 'EEPROM_NAMES')}"

ENVFMT = "obmc/eeproms/{0}"
SYSTEMD_ENVIRONMENT_FILE_${PN}_append_mpb := " ${@compose_list(d, 'ENVFMT', 'EEPROMS')}"

TMPL = "obmc-read-eeprom@.service"
TGT = "multi-user.target"
INSTFMT = "obmc-read-eeprom@{0}.service"
FMT = "../${TMPL}:${TGT}.wants/${INSTFMT}"

SYSTEMD_LINK_${PN}_append_mpb := " ${@compose_list(d, 'FMT', 'EEPROMS_ESCAPED')}"

DEPENDS_append_mpb = "mpb-yaml-config"

EXTRA_OECONF_mpb = " \
    YAML_GEN=${STAGING_DIR_HOST}${datadir}/mpb-yaml-config/mpb-ipmi-fru.yaml \
    PROP_YAML=${STAGING_DIR_HOST}${datadir}/mpb-yaml-config/mpb-ipmi-fru-properties.yaml \
    "
