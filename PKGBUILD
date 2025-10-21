# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=supertuxkart
pkgver=1.5
pkgrel=1
pkgdesc='Kart racing game featuring Tux and his friends'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://supertuxkart.net'
license=('GPL-3.0-or-later')
depends=('openal' 'libvorbis' 'freetype2' 'harfbuzz' 'curl'
         'sqlite' 'libjpeg' 'libpng' 'hicolor-icon-theme' 'sdl2' 'shaderc')
makedepends=('cmake' 'setconf' 'ninja')
source=("https://github.com/supertuxkart/stk-code/releases/download/${pkgver}/SuperTuxKart-${pkgver}-src.tar.gz")
sha256sums=('33cf8841e4ff4082d80b9248014295bbbea61d14683e86dff100e3ab8f7b27cb')

prepare() {
  _patch_ SuperTuxKart-${pkgver}-src
}

build() {
  cd "$srcdir"/SuperTuxKart-${pkgver}-src

  _fn="data/${pkgname}.desktop"
  setconf "$_fn" Exec "$pkgname"
  setconf "$_fn" TryExec "$pkgname"
  setconf "$_fn" Icon "$pkgname"

  cmake . \
    -Bbuild \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_RECORDER=0 \
    -DUSE_GLES2=ON \
    -DUSE_WIIUSE=OFF

  ninja -C build
}

package() {
  cd "$srcdir"/SuperTuxKart-${pkgver}-src

  DESTDIR="$pkgdir" ninja -C build install

  # Why is this even in here?
  rm -r "$pkgdir"/usr/lib
  rm -r "$pkgdir"/usr/include
}
