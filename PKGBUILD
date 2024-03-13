# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-user-dirs
pkgver=0.18
pkgrel=2
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
            'b79e3622ee535c270c2a1d429b328822544db713967e216c8e62087c6bcbe0f9')

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
