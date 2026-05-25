# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdl12-compat
pkgver=1.2.76
pkgrel=1
pkgdesc="SDL 1.2 runtime compatibility library using SDL 2.0"
url="https://github.com/libsdl-org/sdl12-compat"
depends=('musl' 'sdl2' 'glu')
makedepends=('cmake')
arch=(x86_64 aarch64 riscv64 loongarch64)
provides=('sdl1')
license=('MIT')
# 0001: Under review, fix missing X11 headers when building with sdl2-compat
#	and X11 disabled.
#	https://github.com/libsdl-org/sdl12-compat/pull/388
source=("https://github.com/libsdl-org/sdl12-compat/archive/refs/tags/release-${pkgver}.tar.gz"
	0001-cmake-Import-definitions-from-SDL2-SDL2.patch)
sha256sums=('e889ac9c7e8a6bdfc31972bf1f1254b84882cb52931608bada62e8febbf0270b'
            'a58b37c2be7209a38e31f290775bac140d04a9af0fbf6ed583aded94838adb3e')

prepare() {
  _patch_ sdl12-compat-release-${pkgver}
}

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../sdl12-compat-release-${pkgver}
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/sdl12-compat-release-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
