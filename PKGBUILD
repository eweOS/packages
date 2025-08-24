# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=weston
pkgver=14.0.2
pkgrel=3
pkgdesc='Reference implementation of a Wayland compositor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('musl' 'wayland' 'libxkbcommon' 'libinput' 'pixman'
  'libdrm' 'cairo' 'libpng' 'mesa' 'dbus' 'pam' 'seatd' 'libdisplay-info')
makedepends=('wayland-protocols' 'meson' 'ninja' 'linux-headers')
# backport: Allow libdisplay-info 0.3.0
#   https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1815
source=(
  "https://gitlab.freedesktop.org/wayland/${pkgname}/-/releases/$pkgver/downloads/${pkgname}-$pkgver.tar.xz"
  "fix-libdisplay-info-0.3.patch"
)
sha256sums=('b47216b3530da76d02a3a1acbf1846a9cd41d24caa86448f9c46f78f20b6e0ac'
            '183cdc9a5155c7673d5912503c2e9513d20bcce1a4540ea9465cdae3d64a1f4f')

_features=(
  -Dimage-jpeg=false
  -Dimage-webp=false
  -Dcolor-management-lcms=false
  -Dbackend-drm-screencast-vaapi=false
  -Dbackend-rdp=false
  -Dbackend-pipewire=false
  -Dbackend-vnc=false
  -Dbackend-x11=false
  -Dxwayland=false
  -Dsystemd=false
  -Dremoting=false
  -Dpipewire=false
  -Ddemo-clients=false
)

prepare()
{
  _patch_ $pkgname-$pkgver
  cd $pkgname-$pkgver
  for filename in tools/zunitc/src/zunitc_impl.c libweston/backend-drm/libbacklight.c; do
    sed -i '1s/^/#include <libgen.h>\n/' $filename
  done
}

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
