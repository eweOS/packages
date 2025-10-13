# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-user-dirs
pkgver=0.19
pkgrel=1
pkgdesc="Manage user directories like ~/Desktop and ~/Music"
url="https://www.freedesktop.org/wiki/Software/xdg-user-dirs"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl sh)
makedepends=(docbook-xsl git meson)
optdepends=('turnstile: for user service support')
backup=(etc/xdg/user-dirs.conf etc/xdg/user-dirs.defaults)
options=(!emptydirs)
source=("git+https://gitlab.freedesktop.org/xdg/xdg-user-dirs.git#tag=v$pkgver"
        xdg-user-dirs-update.user.service)
sha256sums=('725df2b34482f5d677a2804dd0dd9d0476de5ae4ef804da6ff3814d496304545'
            'b5182186f37cea2146741fb645ad81c3976468c827b19aa1bce2be17c4ce4ccd')

build() {
  ewe-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # We use dinit service
  rm "$pkgdir/etc/xdg/autostart/xdg-user-dirs.desktop"
  rm -r "$pkgdir/usr/lib/systemd/"

  _dinit_install_user_services_ $srcdir/xdg-user-dirs-update.user.service
  _dinit_enable_user_services_ xdg-user-dirs-update
}
