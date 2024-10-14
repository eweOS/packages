# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=woff2
pkgver=1.0.2
pkgrel=1
pkgdesc="Web Open Font Format 2 reference implementation"
url="https://github.com/google/woff2"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(brotli)
makedepends=(git cmake ninja)
provides=(libwoff2{common,dec,enc}.so)
source=("git+$url#tag=v$pkgver")
sha512sums=('759e2345f304ea2fa463daeb8988668f0c09ef57865e178ea1dc3c7ade79bfd2b95b7dcd83a87343aa33d662f667ff71130043d786f2f390df99507e117847bc')

prepare() {
  cd woff2

  # Install binaries
  sed -i 's/NOT BUILD_SHARED_LIBS/TRUE/' CMakeLists.txt
}

build() {
  cmake -S woff2 -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 woff2/LICENSE
}
