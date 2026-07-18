# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cava
pkgver=1.0.0
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'ncurses' 'iniparser')
optdepends=('pulseaudio' 'pipewire')
makedepends=('libpulse' 'm4' 'automake' 'autoconf' 'libpipewire')
source=("$pkgname-$pkgver.tar.gz::https://github.com/karlstav/cava/archive/${pkgver}.tar.gz")
sha512sums=('a1a135001987ba3b7e581091d638f8ad17e5aebae9872916421abb1e97bc090fa63dd1ff942630e6b216016c9a0bc6c0be7d46bbaec86cede29480ecfa86b36f')

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
