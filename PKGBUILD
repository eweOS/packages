# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pipewire
pkgver=0.3.58
pkgrel=3
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
arch=(x86_64 aarch64)
license=(MIT)
depends=('dbus' 'libudev' 'libsndfile' 'libusb')
makedepends=('meson' 'alsa-lib')
source=("https://gitlab.freedesktop.org/pipewire/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5cb73bf27b8b80e37804d7829c5ad8fa5510835f449bbb7e4773f188584771ad')

build() {
  local features=(
    -D man=disabled
    -D examples=disabled
    -D docs=disabled
    -D tests=disabled
    -D gstreamer=disabled
    -D gstreamer-device-provider=disabled
    -D systemd=disabled
    -D systemd-user-service=disabled
    -D pipewire-alsa=disabled
    -D pipewire-jack=disabled
    -D pipewire-v4l2=disabled
    -D spa-plugins=enabled
    -D pw-cat=disabled
    -D audiomixer=disabled
    -D audioconvert=disabled
    -D bluez5=disabled
    -D control=disabled
    -D audiotestsrc=disabled
    -D jack=disabled
    -D support=enabled
    -D v4l2=disabled
    -D libcamera=disabled
    -D videoconvert=disabled
    -D videotestsrc=disabled
    -D volume=disabled
    -D sdl2=disabled
    -D libpulse=disabled
    -D roc=disabled
    -D avahi=disabled
    -D echo-cancel-webrtc=disabled
    -D session-managers=[]
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
  )

  ewe-meson $pkgname-$pkgver build \
    "${features[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
