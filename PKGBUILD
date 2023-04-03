# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=weston
pkgver=10.0.2
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor'
arch=(x86_64 aarch64)
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('musl' 'wayland' 'libxkbcommon' 'libinput' 'pixman'
  'libdrm' 'cairo' 'libpng' 'mesa' 'dbus')
makedepends=('wayland-protocols' 'meson' 'ninja')
source=("https://gitlab.freedesktop.org/wayland/${pkgname}/-/releases/$pkgver/downloads/${pkgname}-$pkgver.tar.xz")
sha256sums=('89646ca0d9f8d413c2767e5c3828eaa3fa149c2a105b3729a6894fa7cf1549e7')

_features=(
  -Dimage-jpeg=false
  -Dimage-webp=false
  -Dlauncher-logind=false
  -Dcolor-management-lcms=false
  -Dbackend-drm-screencast-vaapi=false
  -Dbackend-rdp=false
  -Dbackend-x11=false
  -Dxwayland=false
  -Dcolor-management-colord=false
  -Dsystemd=false
  -Dremoting=false
  -Dpipewire=false
  -Ddemo-clients=false
)

build()
{
  ewe-meson $pkgname-$pkgver build \
    --libexec=lib/weston \
    ${_features[@]}
  ninja -C build
}

package()
{
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
