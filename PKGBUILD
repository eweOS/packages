# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cava
pkgver=0.10.4
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'ncurses' 'iniparser')
optdepends=('pulseaudio' 'pipewire')
makedepends=('libpulse' 'm4' 'automake' 'autoconf' 'libpipewire')
source=("$pkgname-$pkgver.tar.gz::https://github.com/karlstav/cava/archive/${pkgver}.tar.gz")
sha512sums=('c0f1d40e6d3c7b06e2ebc9e4c80bd8b6b88b6fdcd083c30648fca34128e4349a46352a7526613ccbf6421eac29eb5778f396e47f74a03691224cf2d969872113')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --disable-input-portaudio --disable-input-sndio
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 .libs/cava "$pkgdir/usr/bin/cava"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname}"/LICENSE
}
