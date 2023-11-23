_install_license_() {
  FPATH=$1
  FTGT=$2
  if [ -z $FTGT ]; then
    install -Dm0644 $FPATH "$pkgdir/usr/share/licenses/$pkgname"
  else
    install -Dm0644 $FPATH "$pkgdir/usr/share/licenses/$pkgname/$FTGT"
  fi
}
