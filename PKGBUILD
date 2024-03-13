# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-user-dirs
pkgver=0.18
pkgrel=1
pkgdesc="Manage user directories like ~/Desktop and ~/Music"
url="https://www.freedesktop.org/wiki/Software/xdg-user-dirs"
arch=(x86_64 aarch64 riscv64)
license=(GPL)
makedepends=(docbook-xsl git)
backup=(etc/xdg/user-dirs.conf etc/xdg/user-dirs.defaults)
options=(!emptydirs)
source=("git+https://gitlab.freedesktop.org/xdg/xdg-user-dirs.git#tag=$pkgver"
        xdg-user-dirs-update.user.service)
sha256sums=('SKIP'
            '0aa9dae5e954364d1b88b889dd0c087e8af8f7f8031b429cda95f43ce87746a3')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  depends+=(dinit-userservd)
  cd $pkgname
  make DESTDIR="$pkgdir" install 

  # We use a service
  rm "$pkgdir/etc/xdg/autostart/xdg-user-dirs.desktop"

  _dinit_install_user_services_ $srcdir/xdg-user-dirs-update.user.service
  _dinit_enable_user_services_ xdg-user-dirs-update
}
