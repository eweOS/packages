# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nvtop
pkgver=3.2.0
pkgrel=1
pkgdesc="GPUs process monitoring for AMD, Intel and NVIDIA"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('ncurses' 'libudev')
makedepends=('cmake' 'libdrm' 'linux-headers')
source=("https://github.com/Syllo/nvtop/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('582b849c6d157321439344922c26ce8d74b9d44254f952e0c4737ea24893c16f1b61610426c4fcd2dfdcd03c81f857e2847c24d7b32f38562210f7ac3d50a7b0')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DNVIDIA_SUPPORT=ON -DAMDGPU_SUPPORT=ON .
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
