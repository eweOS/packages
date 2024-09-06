# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libldac
pkgver=2.0.2.3
pkgrel=1
pkgdesc="LDAC Bluetooth encoder library"
url="https://github.com/EHfive/ldacBT"
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
makedepends=(git cmake)
provides=(libldacBT_{abr,enc}.so)
source=("git+$url#tag=v$pkgver"
        "git+https://gitlab.com/eh5/libldac.git")
sha256sums=('d2a53c44c8c45c81276608e6dad66c781fa3f185c7c42d46088e8e4579f3526e'
            'SKIP')

prepare() {
  cd ldacBT

  git submodule init
  git submodule set-url libldac "$srcdir/libldac"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -S ldacBT -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DLDAC_SOFT_FLOAT=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
