# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libmusicbrainz
pkgver=5.1.0
pkgrel=1
pkgdesc="Library That Provides Access to the MusicBrainz Server"
url='https://musicbrainz.org/doc/libmusicbrainz'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(neon libxml2)
makedepends=(cmake ninja)
provides=(libmusicbrainz5 libmusicbrainz5.so)
source=("https://github.com/metabrainz/libmusicbrainz/releases/download/release-${pkgver}/libmusicbrainz-$pkgver.tar.gz"
        libmusicbrainz5-5.patch::https://github.com/metabrainz/libmusicbrainz/pull/5.patch
        libmusicbrainz5-16.patch::https://github.com/metabrainz/libmusicbrainz/pull/16.patch
        libmusicbrainz5-19.patch::https://github.com/metabrainz/libmusicbrainz/pull/19.patch
        no-doxygen.patch)
sha256sums=('6749259e89bbb273f3f5ad7acdffb7c47a2cf8fcaeab4c4695484cef5f4c6b46'
            '1e412f8e89183f1a70be530809b34ce3f3cb880ce731d8c7253f6bfe9cc8b7b6'
            '5ad7e45b191cceca3bb71c92adb6c767ae8079bf2814354341fae829d4328ae9'
            'c8defc41681b1ba7c93af93f73207bf1666c78e98d22a1a5f16c9e20b947f787'
            '5d5a1acd7378e571cf5fb8a173426ad287bdf51a1bf54402138c2e9dc856f33e')

prepare() {
  _patch_ libmusicbrainz-$pkgver
}

build() {
  cmake -S libmusicbrainz-$pkgver -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
