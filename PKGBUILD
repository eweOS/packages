# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wine
pkgver=11.10
pkgrel=1
_pkgbasever=${pkgver/rc/-rc}
# llvm-unwind.patch: Explicitly link LLVM libunwind for _Unwind_Find_FDE, this
#	isn't necessary for libgcc-based systems, where libgcc_s.so.1 provides
#	the symbol.
# rpath.patch: Taken from Alpine Linux, fix library search path on musl which
#	doesn't satisfy a dlopened DSO's DT_NEED tag with already loaded DSO's
#	SONAME.
#	Upstream report: https://bugs.winehq.org/show_bug.cgi?id=52418
#	Alpine patch: https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/27930
#	Should be upstreamed.
source=(
  https://dl.winehq.org/wine/source/11.x/$pkgname-$_pkgbasever.tar.xz
  llvm-unwind.patch
  rpath.patch
  30-win32-aliases.conf
  binfmt.conf
)
sha512sums=('fd1eeac9b2f2fb14edc1d21795ebb29c49be0333493357481db5eca8de9681de3f07fbf4a6876a73ab2ab5369f545d9cf59a6f51f0ee29373ce4c12f76c24679'
            'ccd4a1831755d8cdd50bbb77dcec29b480d866f0ff142953ff55353277621f0b39aead3e862c4796c033863341627638fa77ff39429b64f54daeb782e0776ca9'
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
# musl-static: Wine links some of its programs (e.g. winepreloader) as static
# binaries, and run some checks against -static-pie flag, which would fail
# without static libc, though the loader itself makes no use of it in fact.
# In case of failure, linking fallbacks to naive -static with fixed address,
# and might fail with "relocation truncated to fit".
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
  musl-static
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
  _patch_ $pkgname-$pkgver
}

build() {
  export CC="clang"
  export CXX="clang++"
  export LD="ld.lld"

  mkdir -p "$pkgname-64-build"
  cd "$pkgname-64-build"
  ../$pkgname-$pkgver/configure \
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
