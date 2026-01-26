# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nvtop
pkgver=3.3.1
pkgrel=1
pkgdesc="GPUs process monitoring for AMD, Intel and NVIDIA"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('ncurses' 'libudev')
makedepends=('cmake' 'libdrm' 'linux-headers')
source=("https://github.com/Syllo/nvtop/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2ab702cb7f191f3eb2d6e292e6b176a7abcbb21346f95c4aa0e3229c4a54baaf5695de3468419a5ffd9d4705e4cd50c253fed464ef715f5fa4762c2e901f06c1')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DNVIDIA_SUPPORT=ON -DAMDGPU_SUPPORT=ON .
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
