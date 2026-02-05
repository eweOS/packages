# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cava
pkgver=0.10.7
pkgrel=1
pkgdesc='Console-based Audio Visualizer for Alsa'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://github.com/karlstav/cava'
license=('MIT')
depends=('fftw' 'alsa-lib' 'ncurses' 'iniparser')
optdepends=('pulseaudio' 'pipewire')
makedepends=('libpulse' 'm4' 'automake' 'autoconf' 'libpipewire')
source=("$pkgname-$pkgver.tar.gz::https://github.com/karlstav/cava/archive/${pkgver}.tar.gz")
sha512sums=('6db21291cf06049b6349ac2ffbc6d2803481e514374dcb21d57d9d23cfe886a8bdfc8a247c51db1fb5feb57a855953f2d468db7762ac119dbddd7f37d1f4b597')

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
