#
# Copyright (C) 2017-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

TARGET_USES_XIAOMI_MITHORIUM_COMMON_TREE := true

# Userspace Reboot
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Add common definitions for Qualcomm
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true

# DebugFS
ifeq ($(TARGET_KERNEL_VERSION),4.19)
PRODUCT_SET_DEBUGFS_RESTRICTIONS ?= true
endif

# Kernel
TARGET_KERNEL_VERSION ?= 4.9

# Platform
TARGET_BOARD_PLATFORM ?= msm8937

ifeq ($(TARGET_BOARD_PLATFORM),msm8937)
PRODUCT_VENDOR_PROPERTIES += \
    vendor.usb.controller=msm_hsusb
else ifeq ($(TARGET_BOARD_PLATFORM),msm8953)
MITHORIUM_PRODUCT_PACKAGES += \
    vendor_lib_hw_sound_trigger.primary.msm8953.so_symlink

PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.activity_recognition=msm8937 \
    ro.hardware.sound_trigger=msm8937 \
    vendor.opengles.version=196610 \
    vendor.usb.controller=7000000.dwc3
endif

# UFFD GC
OVERRIDE_ENABLE_UFFD_GC := false

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnel_migration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnel_migration.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml

ifneq ($(TARGET_USES_Q_DISPLAY_STACK),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml
endif

ifneq ($(TARGET_HAS_NO_CONSUMERIR),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml
endif

ifeq ($(TARGET_HAS_NO_RADIO),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml
else
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml
endif

ifeq ($(TARGET_IS_TABLET),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/android.software.picture_in_picture.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.picture_in_picture.xml
endif

# ANT
MITHORIUM_PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant@1.0.vendor

# Audio
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl \
    android.hardware.soundtrigger@2.1-impl

MITHORIUM_PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    audio.r_submix.default \
    audio.usb.default

ifneq ($(TARGET_DISABLE_AUDIO),true)
MITHORIUM_PRODUCT_PACKAGES += \
    audio.primary.$(TARGET_BOARD_PLATFORM)

MITHORIUM_PRODUCT_PACKAGES += \
    libaudiopreprocessing \
    libaudioroute \
    libaacwrapper \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle \
    libvolumelistener \
    libtinycompress

MITHORIUM_PRODUCT_PACKAGES += \
    liba2dpoffload \
    libbatterylistener \
    libcirrusspkrprot \
    libcomprcapture \
    libexthwplugin \
    libhdmiedid \
    libhfp \
    libsndmonitor \
    libspkrprot
endif

# Audio configuration
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc) \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Bluetooth
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor \
    vendor.qti.hardware.btconfigstore@1.0.vendor \
    vendor.qti.hardware.btconfigstore@2.0.vendor

MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.bluetooth_audio@2.1.vendor

ifeq ($(TARGET_IS_TABLET),true)
# Set the Bluetooth Class of Device
# Service Field: 0x5A -> 90
#    Bit 17: Networking
#    Bit 19: Capturing
#    Bit 20: Object Transfer
#    Bit 22: Telephony
# MAJOR_CLASS: 0x01 -> 1 (Computer)
# MINOR_CLASS: 0x10 -> 16 (Handheld PC/PDA clamshell)
PRODUCT_VENDOR_PROPERTIES += \
    bluetooth.device.class_of_device=90,1,16
else
# Set the Bluetooth Class of Device
# Service Field: 0x5A -> 90
#    Bit 17: Networking
#    Bit 19: Capturing
#    Bit 20: Object Transfer
#    Bit 22: Telephony
# MAJOR_CLASS: 0x02 -> 2 (Phone)
# MINOR_CLASS: 0x0C -> 12 (Smart Phone)
PRODUCT_VENDOR_PROPERTIES += \
    bluetooth.device.class_of_device=90,2,12
endif

# Camera
ifneq ($(TARGET_USES_DEVICE_SPECIFIC_CAMERA_PROVIDER),true)
MITHORIUM_PRODUCT_PACKAGES += \
    android.frameworks.sensorservice@1.0.vendor \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service
endif

MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.camera.device@1.0.vendor

MITHORIUM_PRODUCT_PACKAGES += \
    libstdc++_vendor

# Charger
MITHORIUM_PRODUCT_PACKAGES += \
    charger_led \
    charger_led_recovery

# Configstore
ifeq ($(TARGET_KERNEL_VERSION),4.19)
MITHORIUM_PRODUCT_PACKAGES += \
    disable_configstore
endif

# Consumer IR
ifneq ($(TARGET_HAS_NO_CONSUMERIR),true)
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.ir@1.0-impl \
    android.hardware.ir@1.0-service
endif

# Device-specific Settings
MITHORIUM_PRODUCT_PACKAGES += \
    XiaomiParts

# Display
ifeq ($(TARGET_USES_Q_DISPLAY_STACK),true)
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl-2.1
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.vulkan=$(TARGET_BOARD_PLATFORM)
else
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.allocator-service \
    vendor.qti.hardware.display.mapper@2.0.vendor \
    vendor.qti.hardware.display.mapper@3.0.vendor \
    vendor.qti.hardware.display.mapper@4.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.1.vendor \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    libgralloc.qti
PRODUCT_VENDOR_PROPERTIES += \
    ro.hardware.vulkan=adreno
endif

MITHORIUM_PRODUCT_PACKAGES += \
    gralloc.$(TARGET_BOARD_PLATFORM)

MITHORIUM_PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor

MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-service \
    hwcomposer.$(TARGET_BOARD_PLATFORM)

MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.$(TARGET_BOARD_PLATFORM)

MITHORIUM_PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libtinyxml \
    vendor.display.config@1.11.vendor \
    vendor.display.config@2.0.vendor

MITHORIUM_PRODUCT_PACKAGES += \
    libEGL_adreno_libEGL_adreno_symlink32 \
    libGLESv2_adreno_libGLESv2_adreno_symlink32 \
    libq3dtools_adreno_libq3dtools_adreno_symlink32 \
    libEGL_adreno_libEGL_adreno_symlink64 \
    libGLESv2_adreno_libGLESv2_adreno_symlink64 \
    libq3dtools_adreno_libq3dtools_adreno_symlink64

# DRM
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey \
    android.hardware.drm@1.4.vendor

# Dumpstate
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.dumpstate-service.mithorium

# Fastbootd
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.fastboot-service.xiaomi_mithorium_recovery \
    fastbootd

# FM
MITHORIUM_PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# Gatekeeper HAL
ifneq ($(TARGET_USES_DEVICE_SPECIFIC_GATEKEEPER),true)
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service \
    android.hardware.gatekeeper@1.0.vendor
endif

# GPS / Location
include $(LOCAL_PATH)/gps/gps_vendor_product.mk

MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.gnss@2.1.vendor

# Health
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.health-service.qti \
    android.hardware.health-service.qti_recovery

MITHORIUM_PRODUCT_PACKAGES += \
    vendor.lineage.health-service.default

# HIDL
MITHORIUM_PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0

MITHORIUM_PRODUCT_PACKAGES += \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# IMS
ifneq ($(TARGET_HAS_NO_RADIO),true)
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.camera.device@3.3 \
    android.hardware.camera.device@3.4 \
    android.hardware.camera.device@3.5 \
    android.hardware.camera.provider@2.4 \
    android.hardware.camera.provider@2.5 \
    android.hardware.camera.provider@2.6 \
    libshim_imscamera \
    vendor.qti.hardware.camera.device@1.0
endif

# Input
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/)

# IPACM
ifneq ($(TARGET_HAS_NO_RADIO),true)
MITHORIUM_PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml
endif

# Keymaster HAL
ifneq ($(TARGET_USES_DEVICE_SPECIFIC_KEYMASTER),true)
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \
    android.hardware.keymaster@3.0.vendor
endif

# Lights
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.lights-service.xiaomi_mithorium

# LiveDisplay
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm

# Media
ifeq ($(TARGET_BOARD_PLATFORM),msm8953)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/msm8953/media_profiles_8953.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/msm8953/media_profiles_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_8953.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_performance_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_performance_8953.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_8953.xml \
    $(LOCAL_PATH)/media/msm8953/media_profiles_8953_v1.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_8953_v1.xml \
    $(LOCAL_PATH)/media/msm8953/media_profiles_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_8953_v1.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_v1.xml \
    $(LOCAL_PATH)/media/msm8953/media_codecs_performance_8953_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_v1.xml
else
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/msm8937/media_profiles_8937.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/msm8937/media_profiles_8937.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/media/msm8937/media_profiles_8956.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_profiles_8956.xml \
    $(LOCAL_PATH)/media/msm8937/media_profiles_8956.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_8956.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs_8937_v1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_8937_v1.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs_8956.xml::$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_8956.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs_performance_8937.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/msm8937/media_codecs_performance_8937.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance_vendor.xml
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_video.xml

MITHORIUM_PRODUCT_PACKAGES += libavservices_minijail.vendor

# MSM IRQ Balancer
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf \
    $(LOCAL_PATH)/configs/msm_irqbalance_little_big.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance_little_big.conf

# OMX
MITHORIUM_PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Network
ifneq ($(TARGET_HAS_NO_RADIO),true)
MITHORIUM_PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor
endif

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage
ifeq ($(TARGET_HAS_NO_RADIO),true)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-noradio
else
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-radio
endif
ifeq ($(TARGET_IS_TABLET),true)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-tablet
endif

PRODUCT_ENFORCE_RRO_TARGETS := *
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(LOCAL_PATH)/overlay-radio/packages/apps/CarrierConfig

# Perf
MITHORIUM_PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.2 \
    vendor.qti.hardware.perf@2.2.vendor

# Power
MITHORIUM_PRODUCT_PACKAGES += \
    android.hardware.power@1.2.vendor \
    android.hardware.power-service-qti

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint/system/powerhint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/powerhint.xml \
    $(LOCAL_PATH)/configs/powerhint/vendor/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml \
    system/core/libprocessgroup/profiles/cgroups_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

# QMI
MITHORIUM_PRODUCT_PACKAGES += \
    libjson \
    libnetutils.vendor:64 \
    libsqlite.vendor:64 \
    libqti_vndfwk_detect \
    libqti_vndfwk_detect.vendor \
    libvndfwk_detect_jni.qti \
    libvndfwk_detect_jni.qti.vendor

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Ramdisk
MITHORIUM_PRODUCT_PACKAGES += \
    init
