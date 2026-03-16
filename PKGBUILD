# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nvtop
pkgver=3.3.2
pkgrel=1
pkgdesc="GPUs process monitoring for AMD, Intel and NVIDIA"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('ncurses' 'libudev')
makedepends=('cmake' 'libdrm' 'linux-headers')
source=("https://github.com/Syllo/nvtop/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a88f7d6a09712462f1448ec8e3b86285c423e20767b07ac2ead20bfbb219e78c04da6ac08781b213c41bde6997ad56a6dc08be45de465986633781464a5a1a58')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DNVIDIA_SUPPORT=ON -DAMDGPU_SUPPORT=ON .
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
