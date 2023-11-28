# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pipewire
pkgver=1.0.0
pkgrel=1
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
sha256sums=('f91ef1d1161b37aae6e21b9671917d97097e2664c83d919ba3a0793d6fbc543d'
            'd23a7ae266619ca46d1d4cc135e6e6d31f0dfd798704d7a7a961a5304e614990')

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
    -D gsettings=disabled
    -D libffado=disabled
    -D selinux=disabled
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

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgname-$pkgver/COPYING
}
