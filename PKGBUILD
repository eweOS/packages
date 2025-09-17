# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cava
pkgver=0.10.6
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'ncurses' 'iniparser')
optdepends=('pulseaudio' 'pipewire')
makedepends=('libpulse' 'm4' 'automake' 'autoconf' 'libpipewire')
source=("$pkgname-$pkgver.tar.gz::https://github.com/karlstav/cava/archive/${pkgver}.tar.gz")
sha512sums=('597bf2d7f5a18d1643ca989c2f0b08bad922d7fe84e33513c6842ac820afa8811c8293f5e796e0b40a59c7e34a0e8b653f15d2253fc424db005c166975c5c50a')

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
