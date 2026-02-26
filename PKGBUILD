# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=weston
pkgver=15.0.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('musl' 'wayland' 'libxkbcommon' 'libinput' 'pixman'
  'libdrm' 'cairo' 'libpng' 'mesa' 'dbus' 'pam' 'seatd' 'libdisplay-info'
  'lua54')
makedepends=('wayland-protocols' 'meson' 'ninja' 'linux-headers')
# 0001: Downstream, search for lua5.4 instead of lua to correctly find Lua on
#	eweOS.
source=("https://gitlab.freedesktop.org/wayland/${pkgname}/-/releases/$pkgver/downloads/${pkgname}-$pkgver.tar.xz"
	"0001-Change-lua-dependency-name.patch")
sha256sums=('58c6186d29a5d2f0be0dec4882af71cc190a11da803f6ed1bf0b2c74120da973'
            '7c25fbd730481bd4c8dec18f42fc04883c1d335bd40bbe7e7305603c31721bdc')

_features=(
  -Dimage-jpeg=false
  -Dimage-webp=false
  -Dcolor-management-lcms=false
  -Dbackend-rdp=false
  -Dbackend-pipewire=false
  -Dbackend-vnc=false
  -Dbackend-x11=false
  -Dxwayland=false
  -Dsystemd=false
  -Dremoting=false
  -Dpipewire=false
  -Ddemo-clients=false
  -Drenderer-vulkan=false
)

prepare()
{
  _patch_ $pkgname-$pkgver
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
