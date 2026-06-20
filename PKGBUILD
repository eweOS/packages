# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gimp
pkgver=3.2.4
pkgrel=1
pkgdesc='GNU Image Manipulation Program'
url='https://www.gimp.org/'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL-3.0-or-later')
depends=(
  appstream-glib
  babl
  cairo
  desktop-file-utils
  gegl
  graphviz
  gtk3
  icu
  lcms2
  libexif
  libgexiv2
  librsvg
  libwmf
  mypaint-brushes
  openexr
  openjpeg2
  openmp
  poppler-data
  poppler-glib
  python-gobject
  python-cairo
)
makedepends=(
  alsa-lib
  appstream
  bash-completion
  curl
  ffmpeg
  ghostscript
  gi-docgen
  gjs
  glib2
  glib-networking
  gobject-introspection
  intltool
  iso-codes
  libheif
  libjxl
  libmng
  libwebp
  libxslt
  linux-headers
  meson
  meson
  python-mako
  sdl2
  font-base
  vala
  yelp-tools
  zlib
)
# gegl: build requires ffmpeg and sdl2
checkdepends=('weston')
#'gutenprint: for sophisticated printing only as gimp has built-in cups print support'
optdepends=('alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support'
            'libxpm: XPM support'
            'libheif: HEIF support'
            'libilbm: ILBM support'
            'libjxl: JPEG XL support'
            'libwebp: WebP support'
            'libmng: MNG support'
            'qoi-headers: QOI image support'
            'iso-codes: Language support'
            'aalib: ASCII art support'
            'zlib: Compression routines'
            'gjs: JavaScript scripting support'
            'luajit: LUA scripting support'
            'lua51-lgi: LUA scripting support'
            'cfitsio: FITS support')
source=("https://download.gimp.org/pub/gimp/v${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"
        'docs_dont_fail_on_warn.patch'
	'fix-crash-max-samples.patch'
        'linux.gpl')
sha256sums=('7312bc53e9c6d2d0056ca7b93f1c6b98707946dd934f714c21b8746ecb601588'
            'c39d1551bb3be45f661c80892a0d6abc49e18dca6cf3fcdfcd0b8ba13f680382'
            '31eaca307583fed9763996ebf41a0aa953a8315d183037c7438d27c34496583c'
            '1003bbf5fc292d0d63be44562f46506f7b2ca5729770da9d38d3bb2e8a2f36b3')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -uNp2 -r- -i ../docs_dont_fail_on_warn.patch
  # prevent crash
  patch -uNp1 -r- -i ../fix-crash-max-samples.patch
}

build() {
  local meson_options=(
    -Daa=disabled
    -Dxpm=disabled
    -Dilbm=disabled
    -Dgudev=disabled
    -Dxcursor=disabled
    -Dfits=disabled
    -Dheadless-tests=disabled
    -Dlibunwind=false
    -Dlibbacktrace=false
  )

  ewe-meson "${pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm 644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/3.0/palettes/Linux.gpl"
}
