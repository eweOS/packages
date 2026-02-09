# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wine
pkgver=11.2
pkgrel=1
_pkgbasever=${pkgver/rc/-rc}
source=(
  https://dl.winehq.org/wine/source/11.x/$pkgname-$_pkgbasever.tar.xz
  llvm-unwind.patch
  rpath.patch
  30-win32-aliases.conf
  binfmt.conf
)
sha512sums=('f93b98df192c785a76ee819b22a9af718428f266346cc55dc4290e4fc2fcae047f351fae193b5d527cbd276fb5d574b6fec3ce9105e59c23cad526503520c022'
            'e397c07e9c252a42679283af71ea5ad4627ba766ed594d7e88653648052520083299595c803123bd856fd8590c73453ea50bd464cd26d1b99b3b0dce98908cd4'
            '9881abfd0e7e4589cd5724291f9ec06ccb9d88b842c69abb5ea7865b6c27c778a060e60a9776c3620a030555cf61b8cceded55db9f04d5e45d9c627306763bff'
            '8beb2fbb2602f04ce4ae67dd51253365514225a1154a41ddae67badfe892361679d5cf23d41fd734afe942143dc99b8b9616a3e6b0a8121603463d40c92a67ec'
            '1e974f238d3cdaf1bbeb04e5016100cc8c2e1b7e1f5791844204434efe039199a874fba8bf07a8915ce06f120c468e6ec4909333a78527f5f4bd3619fe288caa')
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
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/usr/share/fontconfig/conf.avail"
  ln -s ../conf.avail/30-win32-aliases.conf "$pkgdir/usr/share/fontconfig/conf.default/30-win32-aliases.conf"
  install -Dm 644 "$srcdir/binfmt.conf" "$pkgdir/usr/share/binfmt.d/wine"
}
