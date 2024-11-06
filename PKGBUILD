# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libbpf
pkgver=1.5.0
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LGPL2.1')
depends=('libelf' 'linux-headers')
makedepends=('rsync')
provides=('libbpf.so')
source=(https://github.com/libbpf/libbpf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('0cc25addcf5fcee0537d598037feab4bc73a513e6025d8f559bed58fe8850a10fcfeefd1a9dafc5e0bac6202d445944b12811cb7254b9b3be4dd3d2cc1e9419b')

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
