# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=shared-mime-info
pkgver=2.2
pkgrel=2
pkgdesc="Shared MIME Info"
arch=('x86_64' 'aarch64')
license=('GPL2')
depends=('libxml2' 'glib')
makedepends=('gettext' 'meson')
url="https://www.freedesktop.org/wiki/Specifications/$pkgname-spec/"
source=(
  "https://gitlab.freedesktop.org/xdg/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
  update-shared-mime-database.hook
)
sha256sums=('bcf5d552318136cf7b3ae259975f414fbcdc9ebce000c87cf1f0901ff14e619f'
            'f08efbcbac9d2bd18a805b8dcf3ed06d7763b97eca5935aa64d65593774b6501')
options=(!makeflags)

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
  
  install -Dm644 $srcdir/update-shared-mime-database.hook $pkgdir/usr/share/libalpm/hooks/update-shared-mime-database.hook
}
