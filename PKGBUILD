# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=winetricks
pkgver=20240105
pkgrel=1
pkgdesc='Script to install various redistributable runtime libraries in Wine.'
url='https://wiki.winehq.org/winetricks'
license=('LGPL')
arch=('x86_64')
depends=('cabextract' 'perl')
optdepends=('zenity: GUI for GNOME desktop'
            'kdialog: GUI for KDE desktop')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Winetricks/winetricks/archive/$pkgver.tar.gz")
sha512sums=('254b505e1175477df3a27b361f227a02a2346a1b7ace255b6170e8bd463883dda8fef9fcbf2cd54606d69742fd6236f9aa58f589e2a34eb66bd04dfaa7bd6799')

package() {
  depends+=('wine')

  cd winetricks-$pkgver
  make DESTDIR="$pkgdir" install
}
