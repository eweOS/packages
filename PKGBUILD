# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wine
pkgver=9.20
pkgrel=1
_pkgbasever=${pkgver/rc/-rc}
source=(
  https://dl.winehq.org/wine/source/9.x/$pkgname-$_pkgbasever.tar.xz
  llvm-unwind.patch
  rpath.patch
  use-wayland-for-explorer.patch
)
sha512sums=('65d229cfa1c4daffd0b1cec4480bdc4f8a2bbdeb08a7885efea403b0533beda6a22616e57f8e55038fe9e033137cf2718148e38076409a8c0341b29127bbefa3'
            'e397c07e9c252a42679283af71ea5ad4627ba766ed594d7e88653648052520083299595c803123bd856fd8590c73453ea50bd464cd26d1b99b3b0dce98908cd4'
            '9881abfd0e7e4589cd5724291f9ec06ccb9d88b842c69abb5ea7865b6c27c778a060e60a9776c3620a030555cf61b8cceded55db9f04d5e45d9c627306763bff'
            'fede2c8326512144dda3097fbaf9b48df188c8f86b7eeffe3d0ac8ee1617a37e9e8c20e5c30ed5087887933464fed405468a195e32887614d7718d7d751da645')
pkgdesc="A compatibility layer for running Windows programs"
url="https://www.winehq.org"
arch=(x86_64)
options=(staticlibs !lto)
license=(LGPL-2.1-or-later)
depends=(
  desktop-file-utils
  fontconfig
  freetype2
  gettext-tiny
  libpcap
  libxkbcommon
  wayland
)
makedepends=(autoconf bison perl flex lld
  alsa-lib
  libcups
  libpulse
  linux-headers
  mesa
  sdl2
  unixodbc
  vulkan-headers
  vulkan-icd-loader
  gstreamer-devel
  gst-plugins-base
)
optdepends=(
  alsa-lib
  alsa-plugins
  cups
  dosbox
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-good
  gstreamer
  libgphoto2
  libpulse
  opencl-icd-loader
  pcsclite
  samba
  sane
  sdl2
  unixodbc
  v4l-utils
  wine-gecko
  wine-mono
)

prepare() {
  # Allow ccache to work
  mv $pkgname-$_pkgbasever $pkgname

  _patch_ $pkgname
}

build() {
  export CC="clang"
  export CXX="clang++"
  export LD="ld.lld"

  mkdir "$pkgname-64-build"
  cd "$pkgname-64-build"
  ../$pkgname/configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --without-x \
    --with-wayland \
    --with-gstreamer \
    --enable-win64 \
    --disable-win16 \
    --disable-tests \
    --enable-archs=x86_64,i386

  make
}

package() {
  cd "$srcdir/$pkgname-64-build"
  make prefix="$pkgdir/usr" \
    libdir="$pkgdir/usr/lib" \
    dlldir="$pkgdir/usr/lib/wine" install

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/usr/share/fontconfig/conf.{avail,default}
}
