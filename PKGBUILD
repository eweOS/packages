# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libbpf
pkgver=1.6.3
pkgrel=1
pkgdesc='Library for loading eBPF programs and reading and manipulating eBPF objects from user-space'
url='https://github.com/libbpf/libbpf'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LGPL2.1')
depends=('libelf' 'linux-headers')
makedepends=('rsync')
provides=('libbpf.so')
source=(https://github.com/libbpf/libbpf/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('e7b1e42c21de0fc17e768e076314951bc305391985b64388bebf4c7049868cc430fb0f17dde7bb64aacd84762f6bf4d6da3bcc7ce98581e033791ace90676cc1')

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
