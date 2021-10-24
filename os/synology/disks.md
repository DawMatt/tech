# Disk Maintenance

## Burn in disks via USB

General burn in recommendations from FreeNAS system documentation follow:

> Start a long HDD self test (smartctl -t long /dev/)
After the test is done (could take 12+ hours), check the results (smartctl -a /dev/)
Pending sector reallocations (smartctl -a /dev/ | grep Current_Pending_Sector)
Reallocated sector count (smartctl -a /dev/ | grep Reallocated_Sector_Ct)
UDMA CRC errors (smartctl -a /dev/ | grep UDMA_CRC_Error_Count)
HDD and SSD write latency consistency (diskinfo -wS ) Unformatted drives only!
HDD and SSD hours (smartctl -a /dev/ | grep Power_On_Hours)
NVMe percentage used (nvmecontrol logpage -p 2 nvme0 | grep “Percentage used”)

These commands adapted to the Synology environment and disks connected via HDD dock/USB:

1. Determine which device represents the USB device we will check. Look for a non-SCSI (likely SAT or ATA) device. In this example: /dev/sdq. All future commands will need to be updated to refer to this device.
```
smartctl --scan # list disks
/dev/hda -d ata # /dev/hda, ATA device
/dev/sda -d scsi # /dev/sda, SCSI device
/dev/sdb -d scsi # /dev/sdb, SCSI device
/dev/sdc -d scsi # /dev/sdc, SCSI device
/dev/sdd -d scsi # /dev/sdd, SCSI device
/dev/sdq -d sat # /dev/sdq [SAT], ATA device
```
2. Verify the details for the chosen device to make sure it is correct
```
sudo smartctl --info /dev/sdq
...
=== START OF INFORMATION SECTION ===
Device Model:     WDC WD40EFZX-68AWUN0
Serial Number:    WD-WX52D31XXXXX
...
SMART support is: Available - device has SMART capability.
SMART support is: Enabled
```
3. Check the initial state of specific SMART metrics indicating general disk health
```
sudo smartctl -a /dev/sdq | grep Current_Pending_Sector  # Pending sector reallocations
sudo smartctl -a /dev/sdq | grep Reallocated_Sector_Ct   # Reallocated sector count
sudo smartctl -a /dev/sdq | grep UDMA_CRC_Error_Count    # UDMA CRC errors
sudo smartctl -a /dev/sdq | grep Power_On_Hours          # HDD and SSD hours
...
197 Current_Pending_Sector                                           0x0032   200   200   000    Old_age   Always       -       0
  5 Reallocated_Sector_Ct                                            0x0033   200   200   140    Pre-fail  Always       -       0
199 UDMA_CRC_Error_Count                                             0x0032   200   200   000    Old_age   Always       -       0
  9 Power_On_Hours                                                   0x0032   100   100   000    Old_age   Always       -       2
```
4. Perform a short test to make sure the device/test is correctly setup. Note that the `-d` option needs to be set to the disk type identified in step 1, as device is connected via USB interface.
```
sudo smartctl -d sat --test=short  /dev/sdq
...
=== START OF OFFLINE IMMEDIATE AND SELF-TEST SECTION ===
Sending command: "Execute SMART Short self-test routine immediately in off-line mode".
Drive command "Execute SMART Short self-test routine immediately in off-line mode" successful.
Testing has begun.
Please wait 2 minutes for test to complete.
Test will complete after Sun Oct 24 12:42:21 2021
```
5. Check results of the test
```
sudo smartctl --all  /dev/sdq
...
SMART Self-test log structure revision number 1
Num  Test_Description    Status                  Remaining  LifeTime(hours)  LBA_of_first_error
# 1  Short offline       Completed without error       00%         0         -
```
6. Perform a long test to check the device fully.
```
sudo smartctl -d sat --test=long  /dev/sdq
...
=== START OF OFFLINE IMMEDIATE AND SELF-TEST SECTION ===
Sending command: "Execute SMART Extended self-test routine immediately in off-line mode".
Drive command "Execute SMART Extended self-test routine immediately in off-line mode" successful.
Testing has begun.
Please wait 447 minutes for test to complete.
Test will complete after Sun Oct 24 20:16:04 2021
```
7. Check results of the test
```
sudo smartctl --all  /dev/sdq
```
8. Check the results of specific SMART metrics indicating general disk health. Last value on the line is the metric.
```
sudo smartctl -a /dev/sdq | grep Current_Pending_Sector  # Pending sector reallocations
sudo smartctl -a /dev/sdq | grep Reallocated_Sector_Ct   # Reallocated sector count
sudo smartctl -a /dev/sdq | grep UDMA_CRC_Error_Count    # UDMA CRC errors
sudo smartctl -a /dev/sdq | grep Power_On_Hours          # HDD and SSD hours
```
9. If desired, repeat steps 6 to 8 to burn in the device for longer.
