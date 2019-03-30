# /var/lib/boot2docker/bootlocal.sh

# Create and open custom swapfile
SWAPFILE=/mnt/sda1/swapfile
if [ ! -f ${SWAPFILE} ]; then
  sudo fallocate -l 4G ${SWAPFILE}
  sudo chmod 600 ${SWAPFILE}
  sudo mkswap ${SWAPFILE}
fi
sudo swapon ${SWAPFILE}

