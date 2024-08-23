# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=supertuxkart
pkgver=1.4
pkgrel=2
pkgdesc='Kart racing game featuring Tux and his friends'
arch=(x86_64 aarch64 riscv64)
url='https://supertuxkart.net'
license=('GPL3')
depends=('openal' 'libvorbis' 'freetype2' 'harfbuzz' 'curl'
         'sqlite' 'libjpeg' 'libpng' 'hicolor-icon-theme' 'sdl2' 'shaderc')
makedepends=('cmake' 'setconf' 'ninja')
source=("https://github.com/supertuxkart/stk-code/releases/download/${pkgver}/SuperTuxKart-${pkgver}-src.tar.xz"
        "fix-missing-rotation.patch::https://github.com/supertuxkart/stk-code/commit/0c2b81ac1f9ff29f5012a98f530880b87f416337.patch"
        "$pkgname-$pkgver-fix-crash.patch::https://github.com/Benau/stk-code/commit/8544f19b59208ae93fc3db0cf41bd386c6aefbcb.patch")
sha256sums=('9890392419baf4715313f14d5ad60746f276eed36eb580636caf44e2532c0f03'
            '56a97314b89617eb8659a4164ec8ccc5a961c8a743bc99ba4af9a272f0e42202'
            'f27b4156d6052a0e23ae958788531458a713bb566fd2d563854f03034b8fbbe9')

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
