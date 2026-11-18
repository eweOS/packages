# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal-lxqt
pkgver=1.5.0
pkgrel=2
pkgdesc='A backend implementation for xdg-desktop-portal using Qt/KDE Frameworks/libfm-qt'
arch=(x86_64 aarch64 riscv64 loongarch64)
groups=(lxqt)
url='https://github.com/lxqt/xdg-desktop-portal-lxqt'
# https://github.com/lxqt/xdg-desktop-portal-lxqt/blob/1.0.2/LICENSE
# All C/C++ files include "any later"
license=('LGPL-2.1-or-later')
depends=(qt6-base kwindowsystem xdg-desktop-portal libfm-qt)
makedepends=(cmake lxqt-build-tools qt6-base-devel)
provides=(xdg-desktop-portal-impl)
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
)
sha256sums=('ce8c222e0849ad581d86f22609f37ac0cd391443313807bf9a2e0b3b894e971f')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # user/xdg-desktop-portal-lxqt.service
  rm -r $pkgdir/usr/lib/systemd
}
