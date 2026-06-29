# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=wireplumber
pkgname=(
  wireplumber
  libwireplumber
)
pkgver=0.5.15
pkgrel=1
pkgdesc="Session / policy manager implementation for PipeWire"
url="https://pipewire.pages.freedesktop.org/wireplumber/"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
# fix-enum.patch: downstream, fix device enum in libudev-zero
source=(
  "https://gitlab.freedesktop.org/pipewire/$pkgbase/-/archive/$pkgver/$pkgbase-$pkgver.tar.gz"
  wireplumber.user.service
  fix-enum.patch
)
sha256sums=('baa121bc918df5fa0e0e70755bb1c99ffab0ab107225ecf99aa470e2c6ba5e7b'
            '019fac03a27fef4f51d79cf6a390766dc91f0050a77e7b80c0d823c4921ec732'
            '02b051ad202a14d6e6f5fd53144731f668b44debb5cd86af4b249597135ff3a6')

prepare() {
  _patch_ $pkgbase-$pkgver
}

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
  provides=(pipewire-session-manager)
  meson install -C build --destdir "$pkgdir"
  (
    cd "$pkgdir"
    _pick_ libw usr/lib/libwireplumber-$_ver.so*
    _pick_ libw usr/lib/girepository-1.0
    _pick_ libw usr/lib/pkgconfig
    _pick_ libw usr/include
    _pick_ libw usr/share/gir-1.0
  )

  _dinit_install_user_services_ $srcdir/wireplumber.user.service

  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 $pkgbase-$pkgver/{NEWS,README}*

  _install_license_ $pkgbase-$pkgver/LICENSE
}

package_libwireplumber()
{
  pkgdesc+=" - client library"
  depends=(glib pipewire)
  mv pkgs/libw/* "$pkgdir"
  _install_license_ $pkgbase-$pkgver/LICENSE
}
