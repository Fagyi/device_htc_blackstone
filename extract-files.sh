#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/htc/common/generate-blob-scripts.sh - DO NOT EDIT

DEVICE=blackstone

mkdir -p ../../../vendor/htc/$DEVICE/proprietary
adb pull /system/etc/firmware/brf6300.bin ../../../vendor/htc/$DEVICE/proprietary/brf6300.bin
adb pull /system/etc/firmware/brf6350.bin ../../../vendor/htc/$DEVICE/proprietary/brf6350.bin
adb pull /system/lib/egl/libGLES_qcom.so ../../../vendor/htc/$DEVICE/proprietary/libGLES_qcom.so
adb pull /system/lib/libaudioeq.so ../../../vendor/htc/$DEVICE/proprietary/libaudioeq.so
adb pull /system/lib/libmm-adspsvc.so ../../../vendor/htc/$DEVICE/proprietary/libmm-adspsvc.so
adb pull /system/lib/liboemcamera.so ../../../vendor/htc/$DEVICE/proprietary/liboemcamera.so
adb pull /system/lib/libcamera.so ../../../vendor/htc/$DEVICE/proprietary/libcamera.so
adb pull /system/lib/libOmxH264Dec.so ../../../vendor/htc/$DEVICE/proprietary/libOmxH264Dec.so
adb pull /system/lib/libOmxMpeg4Dec.so ../../../vendor/htc/$DEVICE/proprietary/libOmxMpeg4Dec.so
adb pull /system/lib/libOmxVidEnc.so ../../../vendor/htc/$DEVICE/proprietary/libOmxVidEnc.so

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/htc/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/htc/__DEVICE__/extract-files.sh - DO NOT EDIT

# All the blobs necessary for kovsky
PRODUCT_COPY_FILES := \\
    vendor/htc/__DEVICE__/proprietary/brf6300.bin:system/etc/firmware/brf6300.bin \\
    vendor/htc/__DEVICE__/proprietary/brf6350.bin:system/etc/firmware/brf6350.bin \\
    vendor/htc/__DEVICE__/proprietary/libGLES_qcom.so:system/lib/egl/libGLES_qcom.so \\
    vendor/htc/__DEVICE__/proprietary/libaudioeq.so:system/lib/libaudioeq.so \\
    vendor/htc/__DEVICE__/proprietary/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \\
    vendor/htc/__DEVICE__/proprietary/liboemcamera.so:system/lib/liboemcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libcamera.so:system/lib/libcamera.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \\
    vendor/htc/__DEVICE__/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \\
EOF

./setup-makefiles.sh
