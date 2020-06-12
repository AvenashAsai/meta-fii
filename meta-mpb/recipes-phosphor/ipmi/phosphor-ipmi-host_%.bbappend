DEPENDS_append_mpb = " mpb-yaml-config"

EXTRA_OECONF_mpb = " \
    SENSOR_YAML_GEN=${STAGING_DIR_HOST}${datadir}/mpb-yaml-config/ipmi-sensors.yaml \
    "
