# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pipewire
pkgver=1.2.2
pkgrel=1
pkgdesc="Low-latency audio/video router and processor"
url="https://pipewire.org"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=('dbus' 'libudev' 'libsndfile' 'libusb' 'libpulse' 'alsa-lib' 'glib')
makedepends=('meson' 'linux-headers')
source=(
  "https://gitlab.freedesktop.org/pipewire/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  pipewire.user.service
  pipewire-pulse.user.service
  pipewire.conf.in
)
sha256sums=('8255d7b7c6d7844ed20b5bb9cc7af66ddcaba32fee9902728471de7c02213bac'
            '4d808f22ea2adc5137d98702b21aeecbe00e15fed4ab9768da7d68a0acbe8560'
            'bca9d53e4c5cf0eb1ecb7124365abf5ea740889887690423fef1d7b377b3660b'
            'a1d7812aabba038ff1d90a0af2139f0c420419c5f66ee401b9bc45d0445edfdd')

prepare()
{
  cp pipewire.conf.in $pkgname-$pkgver/src/daemon/pipewire.conf.in
}

build()
{
  local features=(
    -D man=disabled
    -D docs=disabled
    -D tests=disabled
    -D gstreamer=disabled
    -D gstreamer-device-provider=disabled
    -D systemd=disabled
    -D systemd-user-service=disabled
    -D pipewire-jack=disabled
    -D pipewire-v4l2=disabled
    -D pw-cat=disabled
    -D bluez5=disabled
    -D audiotestsrc=disabled
    -D jack=disabled
    -D v4l2=disabled
    -D libcamera=disabled
    -D videoconvert=disabled
    -D videotestsrc=disabled
    -D volume=disabled
    -D sdl2=disabled
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
    -D libmysofa=disabled
    -D libffado=disabled
    -D selinux=disabled
    -D snap=disabled
    -D udevrulesdir=/usr/lib/udev/rules.d
  )

  ewe-meson $pkgname-$pkgver build \
    "${features[@]}"
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"

  # ALSA configuration
  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf \
    "$pkgdir/etc/alsa/conf.d/99-pipewire-default.conf"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-alsa"

  # pulse replacement

  mkdir -p "$pkgdir/etc/pipewire/pipewire-pulse.conf.d"

  install -Dm644 /dev/null \
    "$pkgdir/usr/share/pipewire/media-session.d/with-pulseaudio"

  _dinit_install_user_services_ $srcdir/pipewire.user.service $srcdir/pipewire-pulse.user.service

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgname-$pkgver/COPYING
}
