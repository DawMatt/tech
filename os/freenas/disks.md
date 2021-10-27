# Disk Maintenance

## Creating Boot USB Drive or SSD

TODO

## Copying Boot USB Drive or SSD

**WARNING**: This is approach is discouraged. The recommended approach is to create a fresh install then add the configuration file.

> Trying this because the server itself failed and so we will be using an old USB drive on new hardware, and at the time of the failure my main pool was degraded and needed to have a disk replace. This is a backup in case anything goes wrong when starting up with the new hardware.

**WARNING**: Follow these instructions at your own risk. No responsibility taken if you damage something or lose data.

### Windows

1. Install [Rufus](https://rufus.ie/en/)
2. Run Rufus
3. Connect the source USB drive
4. Click Show advanced drive properties in Rufus
5. Click the "Save" icon that now appears next to the selected drive
6. Eject the source USB drive, and connect the target USB drive
7. Make sure the corect device (the target USB drive) is now selected in Rufus
8. Use the select button to choose the image created in step 5
9. Start the install. If prompted select the dd method for copying

### Mac

**WARNING**: These instructions should work but never quite completed on my system despite running for over 8 hours.

```
# Find the USB identity. In my case the USB drive was connected to /dev/disk2. Example of output included below
diskutil list
...
# /dev/disk2 (external, physical):
#    #:                       TYPE NAME                    SIZE       IDENTIFIER
#    0:      GUID_partition_scheme                        *4.0 GB     disk2
#    1:        Bios Boot Partition ⁨⁩                        524.3 KB   disk2s1
#    2: 516E7CBA-6ECF-11D6-8FF8-00022D09712B ⁨⁩              4.0 GB     disk2s2

# Copy the USB device to an image
sudo dd if=/dev/disk2 of=usb.img bs=4096
   
# Unplug the flash drive when it's finished. Plug in the blank one and execute
# WARNING: make sure of refers to the correct disk as it will be wiped!
sudo dd if=usb.img of=/dev/disk2 bs=4096

# if you get the error Resource busy when writing the image file
# to usb device, then you'll have to unmount the disk by using the following
# command. You will also need to retry the command above after doing so.
diskutil unmount /dev/disk2
```
