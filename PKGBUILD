# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal-lxqt
pkgver=1.3.0
pkgrel=2
pkgdesc='A backend implementation for xdg-desktop-portal using Qt/KDE Frameworks/libfm-qt'
arch=(x86_64 aarch64 riscv64 loongarch64)
groups=(lxqt)
url='https://github.com/lxqt/xdg-desktop-portal-lxqt'
# https://github.com/lxqt/xdg-desktop-portal-lxqt/blob/1.0.2/LICENSE
# All C/C++ files include "any later"
license=('LGPL-2.1-or-later')
depends=(qt6-base kwindowsystem xdg-desktop-portal libfm-qt)
makedepends=(cmake qt6-base-devel)
provides=(xdg-desktop-portal-impl)
# patches: see pr #52 and #53
source=(
  "https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
  xdg-desktop-portal-lxqt-modal-dialog.patch
  xdg-desktop-portal-lxqt-wayland-parent.patch
)
sha256sums=('daa49490600ef3a3dbd9d1ccd94e72870f6c099ae425a1c2982e014555509775'
            'e27455c673c546688bc1f902eefcfaf7502553635504f38be94966e11782a94b'
            '787317905987b22d6e9001a0bddc66008c8b352de6104b329b62529520623b7e')

prepare() {
  _patch_ $pkgname-$pkgver
}

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
