# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=winetricks
pkgver=20250102
pkgrel=1
pkgdesc='Script to install various redistributable runtime libraries in Wine.'
url='https://wiki.winehq.org/winetricks'
license=('LGPL')
arch=('x86_64')
depends=('cabextract' 'perl')
optdepends=('zenity: GUI for GNOME desktop'
            'kdialog: GUI for KDE desktop')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Winetricks/winetricks/archive/$pkgver.tar.gz")
sha512sums=('f9dc94eb7bb35c180a403bf58337a82166314e8d55123ce720ed4664b8d6fa9415576b8d02697f973a74b8d1dc578047bd3b1ed62a3c455a4ae6575f3ab7fccd')

package() {
  depends+=('wine')

  cd winetricks-$pkgver
  make DESTDIR="$pkgdir" install
}
