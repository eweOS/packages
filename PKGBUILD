# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=weston
pkgver=13.0.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor'
arch=(x86_64 aarch64 riscv64)
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('musl' 'wayland' 'libxkbcommon' 'libinput' 'pixman'
  'libdrm' 'cairo' 'libpng' 'mesa' 'dbus' 'pam' 'seatd')
makedepends=('wayland-protocols' 'meson' 'ninja')
source=("https://gitlab.freedesktop.org/wayland/${pkgname}/-/releases/$pkgver/downloads/${pkgname}-$pkgver.tar.xz")
sha256sums=('52ff1d4aa2394a2e416c85a338b627ce97fa71d43eb762fd4aaf145d36fc795a')

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
