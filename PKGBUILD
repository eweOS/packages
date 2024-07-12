# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libbpf
pkgver=1.4.5
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=(x86_64 aarch64 riscv64)
license=('LGPL2.1')
depends=('libelf' 'linux-headers')
makedepends=('rsync')
provides=('libbpf.so')
source=(https://github.com/libbpf/libbpf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('c5ed459e89a8897ef7c892723c61efb2f2fdb0e7bea63eaff1c9936d368d2cc9e63b8c093207eef0df3109c021156c52ddb570757f69c54e713909e866dbb2f5')

build() {
  cd ${pkgname}-${pkgver}
  make -C src
}

check() {
  echo "#include \"$pkgname-$pkgver/src/btf.h\"" | cc -xc -c -o /dev/null -
}

package() {
  cd ${pkgname}-${pkgver}
  make -C src DESTDIR="${pkgdir}" LIBSUBDIR=lib install install_headers
  install -Dm 644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
