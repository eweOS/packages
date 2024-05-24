# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libbpf
pkgver=1.3.0
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=(x86_64 aarch64 riscv64)
license=('LGPL2.1')
depends=('libelf' 'linux-headers')
makedepends=('rsync')
provides=('libbpf.so')
source=(https://github.com/libbpf/libbpf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('59990189538e47765542e9ed6e88bc78c9d29bc077b5666bb1303cf15579c90b3d35a0d631b9bbd4bff2708243dc91d901bd68c119fb74dfd10a3e1066aa9acc')

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
