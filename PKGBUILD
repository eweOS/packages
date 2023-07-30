# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pipewire
pkgver=0.3.75
pkgrel=3
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=('dbus' 'libudev' 'libsndfile' 'libusb' 'libpulse')
makedepends=('meson' 'alsa-lib')
source=(
  "https://gitlab.freedesktop.org/pipewire/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  fix-udev-zero.patch
)
sha256sums=('182fb03e8b5f4949a4564397c58cdfc20562afa8618db6f4fec7c860d17bd528'
            'ba1eb2fd3076d475a695b0dd257291266ce6c2d0342a830ec264e52472cf5665')

prepare()
{
  cd $pkgname-$pkgver
  # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2398
  patch -p1 < ../fix-udev-zero.patch
}

build()
{
  local features=(
    -D man=disabled
    -D examples=disabled
    -D docs=disabled
    -D tests=disabled
    -D gstreamer=disabled
    -D gstreamer-device-provider=disabled
    -D systemd=disabled
    -D systemd-user-service=disabled
    -D pipewire-jack=disabled
    -D pipewire-v4l2=disabled
    -D spa-plugins=enabled
    -D pw-cat=disabled
    -D audiomixer=enabled
    -D bluez5=disabled
    -D control=enabled
    -D audiotestsrc=disabled
    -D jack=disabled
    -D support=enabled
    -D v4l2=disabled
    -D libcamera=disabled
    -D videoconvert=disabled
    -D videotestsrc=disabled
    -D volume=disabled
    -D sdl2=disabled
    -D libpulse=enabled
    -D roc=disabled
    -D avahi=disabled
    -D echo-cancel-webrtc=disabled
    -D session-managers='[]'
    -D raop=disabled
    -D lv2=disabled
    -D x11=disabled
    -D x11-xfixes=disabled
    -D libcanberra=disabled
    -D legacy-rtkit=false
    -D avb=disabled
    -D flatpak=disabled
    -D libusb=enabled
    -D sndfile=enabled
    -D libmysofa=disabled
    -D gsettings=disabled
    -D libffado=disabled
    -D udevrulesdir=/usr/lib/udev/rules.d
  )

  ewe-meson $pkgname-$pkgver build \
    "${features[@]}"
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
