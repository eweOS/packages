# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=wireplumber
pkgname=(
  wireplumber
  libwireplumber
)
pkgver=0.5.5
pkgrel=1
pkgdesc="Session / policy manager implementation for PipeWire"
url="https://pipewire.pages.freedesktop.org/wireplumber/"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(
  git
  lua54
  meson
  pipewire
  glib
  python-packaging
)
checkdepends=(pipewire)
source=("https://gitlab.freedesktop.org/pipewire/$pkgbase/-/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha256sums=('49075cd5c2f4820839a9e69d4a22386bc280c62b92c153af9be39ca439d45a09')

build()
{
  local meson_options=(
    -D doc=disabled
    -D elogind=disabled
    -D system-lua=true
    -D systemd=disabled
    -D introspection=disabled
  )

  ewe-meson $pkgbase-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check()
{
  cd $srcdir
  # TODO: No such file or directory for test 9,14
  #meson test -C build --print-errorlogs
}

_ver=${pkgver:0:3}

package_wireplumber()
{
  depends=(
    "libwireplumber=$pkgver-$pkgrel"
    lua54
    pipewire
  )
  meson install -C build --destdir "$pkgdir"
  (
    cd "$pkgdir"
    _pick_ libw usr/lib/libwireplumber-$_ver.so*
    _pick_ libw usr/lib/girepository-1.0
    _pick_ libw usr/lib/pkgconfig
    _pick_ libw usr/include
    _pick_ libw usr/share/gir-1.0
  )

  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 $pkgbase-$pkgver/{NEWS,README}*
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgbase-$pkgver/LICENSE
}

package_libwireplumber()
{
  pkgdesc+=" - client library"
  depends=(glib pipewire)
  mv pkgs/libw/* "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgbase-$pkgver/LICENSE
}
