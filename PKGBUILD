# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=shared-mime-info
pkgver=2.4
pkgrel=2
pkgdesc="Shared MIME Info"
arch=(x86_64 aarch64 riscv64)
license=('GPL2')
depends=('libxml2' 'glib')
makedepends=('gettext' 'meson')
url="https://www.freedesktop.org/wiki/Specifications/$pkgname-spec/"
source=(
  "https://gitlab.freedesktop.org/xdg/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  update-shared-mime-database.hook
  0-fix-clang-xml.patch
)
sha256sums=('531291d0387eb94e16e775d7e73788d06d2b2fdd8cd2ac6b6b15287593b6a2de'
            'f08efbcbac9d2bd18a805b8dcf3ed06d7763b97eca5935aa64d65593774b6501'
            'd746c22f286d6bb1afb706930db617a7c0f8714065267f5f9a5183363f0fc088')
options=(!makeflags)

prepare() {
  # 0: https://gitlab.freedesktop.org/xdg/shared-mime-info/-/issues/219
  _patch_ $pkgname-$pkgver
}

build() {
  ewe-meson $pkgname-$pkgver build
  meson configure build
  ninja -C build 
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 $srcdir/update-shared-mime-database.hook \
    $pkgdir/usr/share/libalpm/hooks/update-shared-mime-database.hook
}
