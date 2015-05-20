#!/system/bin/sh

enable=`getprop persist.service.crash.enable`
boot=`getprop sys.boot_completed`

PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

case $enable in
    "1")
        echo 1 > /sys/module/msm_poweroff/parameters/download_mode
        echo 55 > /sys/module/msm_rtb/parameters/filter
        echo 4096 > /sys/kernel/debug/tracing/buffer_size_kb
        #echo 1 > /sys/kernel/debug/tracing/events/sched/sched_switch/enable
        echo 1 > /sys/kernel/debug/tracing/events/irq/irq_handler_entry/enable
        echo 1 > /sys/kernel/debug/tracing/events/workqueue/workqueue_execute_start/enable
        echo 1 > /sys/kernel/debug/tracing/events/workqueue/workqueue_execute_end/enable
        ;;
    "0")
        echo 0 > /sys/module/msm_poweroff/parameters/download_mode
        echo 0 > /sys/module/msm_rtb/parameters/filter
        echo 0 > /sys/kernel/debug/tracing/buffer_size_kb
        #echo 0 > /sys/kernel/debug/tracing/events/sched/sched_switch/enable
        echo 0 > /sys/kernel/debug/tracing/events/irq/irq_handler_entry/enable
        echo 0 > /sys/kernel/debug/tracing/events/workqueue/workqueue_execute_start/enable
        echo 0 > /sys/kernel/debug/tracing/events/workqueue/workqueue_execute_end/enable
        ;;
esac
