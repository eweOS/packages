# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nvtop
pkgver=3.1.0
pkgrel=1
pkgdesc="GPUs process monitoring for AMD, Intel and NVIDIA"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Syllo/nvtop"
license=('GPL3')
depends=('ncurses' 'libudev')
makedepends=('cmake' 'libdrm' 'linux-headers')
source=("https://github.com/Syllo/nvtop/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a22806920d85954930cf9a24450de2603418326b59bc7acedf8ff59ddb0f40e119de496a63f42706b4b6961c83ba664a8a33a3e4106a1c3ef6cd3da758aa5a55')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DNVIDIA_SUPPORT=ON -DAMDGPU_SUPPORT=ON .
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
