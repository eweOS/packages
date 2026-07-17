# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=weston
pkgver=16.0.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('musl' 'wayland' 'libxkbcommon' 'libinput' 'pixman'
  'libdrm' 'cairo' 'libpng' 'mesa' 'dbus' 'pam' 'seatd' 'libdisplay-info'
  'lcms2' 'libjpeg-turbo' 'libwebp')
makedepends=(
  'wayland-protocols' 'meson' 'ninja' 'linux-headers' 'neatvnc' 'lua54'
  'vulkan-headers' 'vulkan-icd-loader' 'libpipewire' 'glslang'
)
# 0001: Downstream, search for lua5.4 instead of lua to correctly find Lua on
#	eweOS.
optdepends=('xorg-xwayland: support x11 backend'
            'libpipewire: support pipewire backend'
            'freerdp: support rdp backend'
            'neatvnc: support vnc backend'
            'vulkan-icd-loader: support vulkan renderer'
            'lua: support lua shell')
source=("https://gitlab.freedesktop.org/wayland/${pkgname}/-/releases/$pkgver/downloads/${pkgname}-$pkgver.tar.xz"
	"0001-Change-lua-dependency-name.patch")
sha256sums=('dfb32e2bccabda957b94a8d0ec6075acd18c71c87ebc543ee3e618d294ca0f7f'
            '7c25fbd730481bd4c8dec18f42fc04883c1d335bd40bbe7e7305603c31721bdc')

_features=(
  -Dbackend-rdp=false
  -Dbackend-x11=false
  -Dxwayland=false
  -Dsystemd=false
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
