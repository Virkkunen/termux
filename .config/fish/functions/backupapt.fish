function backupapt
  dpkg --get-selections > ~/termux-backup/package.list
  cp -R /data/data/com.termux/files/usr/etc/apt/* ~/termux-backup/apt/
  echo "Done."
end
