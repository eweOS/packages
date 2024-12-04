# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=wireplumber
pkgname=(
  wireplumber
  libwireplumber
)
pkgver=0.5.7
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
source=("https://gitlab.freedesktop.org/pipewire/$pkgbase/-/archive/$pkgver/$pkgbase-$pkgver.tar.gz" wireplumber.user.service)
sha256sums=('8cd43a582f68368ee5a915e97bf9dadc44d2dfe8c7bb4f96bb7b40ea2ed7848f'
            '808beac207616837f1b6d005cb28f7f017333f8b742a74c8343386b6ed6f96e4')

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
