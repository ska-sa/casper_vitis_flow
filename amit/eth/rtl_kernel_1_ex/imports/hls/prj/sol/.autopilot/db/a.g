#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /.aux_mnt/fpgdeva/casperlibs/workspace/rtl_2/vivado_rtl_kernel/rtl_kernel_1_ex/imports/hls/prj/sol/.autopilot/db/a.g.bc ${1+"$@"}
