# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=efl
pkgname=efl
pkgver=1.29.0
pkgrel=1
pkgdesc="Enlightenment Foundation Libraries"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.enlightenment.org"
license=('BSD' 'LGPL2.1' 'GPL2' 'MIT' 'custom')
depends=('curl' 'dbus' 'fontconfig' 'freetype2' 'fribidi' 'giflib' 'glib2'
         'harfbuzz' 'hicolor-icon-theme' 'libglvnd' 'libinput' 'ffmpeg'
         'libjpeg-turbo' 'libpipewire' 'libpng' 'libpulse' 'libsndfile' 'libtiff' 'libwebp' 'libxkbcommon'
         'lua51' 'mailcap' 'mesa' 'openjpeg2' 'openssl' 'shared-mime-info'
         'util-linux-libs' 'wayland' 'zlib')
optdepends=('gst-plugins-base: Video and thumbnail codecs'
            'gst-plugins-good: Video and thumbnail codecs'
            'gst-plugins-bad: Video and thumbnail codecs'
            'gst-plugins-ugly: Video and thumbnail codecs'
            'gst-libav: Video and thumbnails with ffmpeg/libav'
            'libraw: RAW image loader'
            'libreoffice: Office document loader'
            'librsvg: SVG loader'
            'libspectre: PostScript loader'
            'poppler: PDF loader'
            'scim: IM module for SCIM')
makedepends=('libraw' 'librsvg' 'meson' 'ninja' 'python'
             'wayland-protocols' 'git')
options=('!emptydirs')
source=(https://download.enlightenment.org/rel/libs/${pkgname}/$pkgname-$pkgver.tar.xz)
sha256sums=('248bc76141f2b8b006ccba9e0bb2cb46cbcb1be4181a1cf2728187f778853654')

build() {
  export CFLAGS="$CFLAGS -fvisibility=hidden -D_LARGEFILE64_SOURCE -D__USE_MISC"

  ewe-meson ${srcdir}/${pkgname}-$pkgver build \
    -Dfb=true \
    -Ddrm=true \
    -Dwl=true \
    -Dnetwork-backend=connman \
    -Dlua-interpreter=lua \
    -Dbindings= \
    -Dbuild-examples=false \
    -Dbuild-tests=false \
    -Dx11=false \
    -Dgstreamer=false \
    -Devas-loaders-disabler=pdf,avif,heif,jxl,json,ps

  meson compile -C build
}

package(){
  meson install -C build --destdir "$pkgdir"

  # install non-standard license files
  install -Dm644 "${srcdir}/${pkgname}-$pkgver/licenses/COPYING.BSD" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.BSD"
  install -Dm644 "${srcdir}/${pkgname}-$pkgver/licenses/COPYING.SMALL" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.SMALL"
    
  # remove systemd service
  rm -r $pkgdir/usr/lib/systemd/user
}
