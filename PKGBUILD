# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zita-convolver
pkgver=4.0.3
pkgrel=1
pkgdesc="A fast, partitioned convolution engine library."
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://kokkinizita.linuxaudio.org/linuxaudio/"
license=(GPL3)
depends=(fftw)
provides=(libzita-convolver.so)
source=(
  https://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2
  patch-Makefile.patch
  20-install-major-lib-version.patch
)
sha512sums=('62d7841757f10c094e43ed755e187f947c5743f302ed2a1ee6064a850c18921466f4505d8a2a7b3ad23619db7f1ad7307e1dfb2e8a1e7685e60ece2ffff4f6ca'
            '15e07b06813ca336200a064734f7d2ef54cb74dfd438708675bb85b9cfd30f02c7b8c9b4e4abea368286c07a6e4e1ed5ae62cd69e6dc528e26d15cee5ff98c12'
            '6a448b36c8cbcc7cb2793b81b9a7eb0dd53af236a6a7c9b0d8ed08d8fc445d83d6fa233a1d7a2494454b34f2c4150ae9f54e2b1adf7172015635e5732a5deb67')

prepare() {
  _patch_ "$pkgname-$pkgver/source"
}

build() {
  make -C $pkgname-$pkgver/source
}

package() {
  make SUFFIX="" PREFIX=/usr DESTDIR="$pkgdir/" install -C $pkgname-$pkgver/source
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,README} -t "$pkgdir/usr/share/doc/$pkgname/"
}
