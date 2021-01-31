function backup
  cd /data/data/com.termux/files
  tar -zcvf /sdcard/termux-backup.tar.gz home usr
  echo "Done."
  cd ~
end
