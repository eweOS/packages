# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libbpf
pkgver=1.7.0
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LGPL2.1')
depends=('libelf' 'linux-headers')
makedepends=('rsync')
provides=('libbpf.so')
source=(https://github.com/libbpf/libbpf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('29996f76d45222070b7554c1a098d67cf0933876a0fb3965800a304239a7e8dcc4d2ecc3ffe049dfbebe62e29e12cca793c6b22d5845955dd17faff5786691dd')

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
