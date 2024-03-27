# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=eweos-keyring
pkgver=20240326
pkgrel=1
pkgdesc='eweOS PGP keyring'
arch=('any')
url='https://os.ewe.moe'
license=('GPL-3.0-or-later')
install=$pkgname.install
source=(eweos.gpg)
sha256sums=('4b7da60d03b1b02c5cac27abe95aaa3f4c94f830e183a3bb48d78c45c7636bee')
depends=('pacman' 'gnupg')

build() {
  local key_shortid=`LANG=C cat eweos.gpg | gpg --with-colons --show-key | grep pub | cut -f 5 -d ':'`
  local key_id=`LANG=C cat eweos.gpg | gpg --with-colons --show-key | grep fpr | grep $key_shortid | cut -f 10 -d ':'`
  echo "$key_id:4:" > eweos-trusted
}

package() {
  install -Dm0644 $srcdir/eweos.gpg $pkgdir/usr/share/pacman/keyrings/eweos.gpg
  install -Dm0644 $srcdir/eweos-trusted $pkgdir/usr/share/pacman/keyrings/eweos-trusted
}
