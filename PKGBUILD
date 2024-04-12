# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-utils
pkgver=1.2.1
pkgrel=1
pkgdesc="Command line tools that assist applications with a variety of desktop integration tasks"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/xdg-utils/"
license=('MIT')
depends=('sh' 'file')
makedepends=('docbook-xsl' 'xmlto' 'git' 'w3m')
source=(
  git+https://gitlab.freedesktop.org/xdg/xdg-utils.git#tag=v$pkgver
)
sha256sums=('SKIP')

build() {
  cd $pkgname
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

#
# testsuite is not suitable for running in a text chroot
#
#check() {
#  cd $pkgname
#  # requires a running X environment and browser to run tests
#  # and has interactive programs
#  make -k test
#}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install

  # remove x11 utils
  rm $pkgdir/usr/bin/xdg-screensaver

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # install empty directory to prevent xdg-desktop-menu install *.desktop to fail, see FS#33316
  install -dm755 "$pkgdir"/usr/share/desktop-directories
}
