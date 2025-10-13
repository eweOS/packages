# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Eric Long <i@hack3r.moe>

pkgname=linux-uapi-headers
_basename=linux
pkgver=6.17.2
pkgrel=1
pkgdesc='Linux syscall API headers for userspace usage'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.kernel.org'
license=('GPL-2.0-only with Linux-syscall-note')
makedepends=(rsync)
options=(!strip)
provides=(linux-headers)
replaces=(linux-headers)
conflicts=(linux-headers)
source=("https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.xz")
sha256sums=('fdebcb065065f5c1b8dc68a6fb59cda50cdddbf9103d207c2196d55ea764f57f')

case $CARCH in
x86_64)
  _build_arch=x86_64
  _dev_arch=x86
  ;;
aarch64)
  _build_arch=arm64
  _dev_arch=arm64
  ;;
riscv64)
  _build_arch=riscv
  _dev_arch=riscv
  ;;
loongarch64)
  _build_arch=loongarch
  _dev_arch=loongarch
  ;;
esac

package() {
  pkgdesc="Kernel headers sanitized for use in userspace"

  cd "$_basename-$pkgver"
  make LLVM=1 LLVM_IAS=1 ARCH=$_build_arch INSTALL_HDR_PATH="$pkgdir/usr" headers_install
}
