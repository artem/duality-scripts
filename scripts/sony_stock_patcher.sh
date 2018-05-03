#!/sbin/sh

# Bootimage partition
BOOTIMAGE=/dev/block/bootdevice/by-name/boot;

# Bootimage not found
if [ ! -e "${BOOTIMAGE}" ]; then
  return 1;
fi;

# Extract the bootimage
rm -rf /tmp/bootimage;
mkdir -p /tmp/bootimage;
cd /tmp/bootimage/;
chmod 777 /tmp/bbootimg;
/tmp/bbootimg -x ${BOOTIMAGE};
if [ $? -ne 0 ]; then
  return 1;
fi;

# Inject the kernel
/tmp/bbootimg -u ${BOOTIMAGE} -k /tmp/kernel;
if [ $? -ne 0 ]; then
  return 1;
fi;

# Inject the cleared DTB
printf '' > /tmp/dtb;
/tmp/bbootimg -u ${BOOTIMAGE} -d /tmp/dtb;
if [ $? -ne 0 ]; then
  return 1;
fi;
rm /tmp/dtb;

# Result
return 0;

