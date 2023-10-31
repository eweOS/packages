# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=shared-mime-info
pkgver=2.3
pkgrel=1
pkgdesc="Shared MIME Info"
arch=(x86_64 aarch64 riscv64)
license=('GPL2')
depends=('libxml2' 'glib')
makedepends=('gettext' 'meson')
url="https://www.freedesktop.org/wiki/Specifications/$pkgname-spec/"
source=(
  "https://gitlab.freedesktop.org/xdg/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  clang.patch
  update-shared-mime-database.hook
)
sha256sums=('78eb7d0d6874e2116649067100d72e0d363eb6a51227797140dad3bd5643e6a9'
            '6a81a58eea55fd385ff831c71affc565bdf6e77cedb09752eb245c8be3c5a56c'
            'f08efbcbac9d2bd18a805b8dcf3ed06d7763b97eca5935aa64d65593774b6501')
options=(!makeflags)

prepare() {
  cd $pkgname-$pkgver
  # https://gitlab.freedesktop.org/xdg/shared-mime-info/-/issues/211
  patch -p1 < ../clang.patch
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
