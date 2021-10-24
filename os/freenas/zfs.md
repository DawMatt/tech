# ZFS

## Diagnosing a degraded zpool and drive

1. Determine which zpool and drive is degraded
```
zpool status
...
  pool: SomePool
 state: DEGRADED
...
   gptid/42844e2c-f7f5-11e5-bd68-............  DEGRADED
```
2. Determine the drive associated with the label
```
glabel status
...
                                      Name  Status  Components
gptid/42844e2c-f7f5-11e5-bd68-............     N/A  ada3p2
...
```
3. Find the serial number for the drive
```
# Use camcontrol to identify available devices and individual drive
sudo camcontrol devlist
sudo camcontrol identify ada0

# Use smartctl to extract serial number for individual drive
sudo smartctl -a /dev/ada3 | grep ^Serial
Serial Number:    WD-WCC4E3ZF....
```

## Replacing a failing disk (in place)

1. Offline the disk, if necessary, with the zpool offline command
```
zpool offline SomePool gptid/42844e2c-f7f5-11e5-bd68-............
zpool status SomePool # Confirm offline worked
```
2. Remove the disk to be replaced. Use the serial number (identified above) to confirm replacing the correct disk.
3. Insert the replacement disk, check its status, and confirm its identity.
```
zpool status

# Find which is the new device
sudo camcontrol devlist
sudo camcontrol identify ada0
```
4. Run the zpool replace command. If the disk was physically replaced can use:
```
zpool replace SomePool gptid/42844e2c-f7f5-11e5-bd68-............

# Alternative if not physically replacing the disk:
# zpool replace SomePool OLDDRIVE NEWDRIVE
```
5. Bring the disk online with the zpool online command.
```
zpool online SomePool gptid/42844e2c-f7f5-11e5-bd68-............
```
6. Determine revised status of zpool
```
zpool status
```

From: https://docs.oracle.com/cd/E18752_01/html/819-5461/gayrd.html

## Working with physical disks

```
# Find physical disks
camcontrol devlist

# Identify details for a specific disk
camcontrol identify ada3
```