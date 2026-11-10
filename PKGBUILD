# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nvtop
pkgver=3.4.0
pkgrel=1
pkgdesc="GPUs process monitoring for AMD, Intel and NVIDIA"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('ncurses' 'libudev')
makedepends=('cmake' 'libdrm' 'linux-headers')
source=("https://github.com/Syllo/nvtop/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('170da46785c7a9b93e067a39f21298617b4be6a367baa2162e114d027cdbed58e2da8a8adcfe432b0115771bd6314a5fbe409fe8dd1ec1cde5d22e5b57687ac2')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DNVIDIA_SUPPORT=ON -DAMDGPU_SUPPORT=ON .
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
