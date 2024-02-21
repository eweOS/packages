# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pipewire
pkgver=1.0.3
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
  pipewire.user.service
  pipewire-pulse.user.service
)
sha256sums=('bddb29b9310c344ca069df410f6f02b7f3d8c518811c0505c7fe62d8428fd767'
            '5e41f524ac1112cc093858412d948637d31d42da989a1a4ad562aef83f6dda37'
            '4d808f22ea2adc5137d98702b21aeecbe00e15fed4ab9768da7d68a0acbe8560'
            'bca9d53e4c5cf0eb1ecb7124365abf5ea740889887690423fef1d7b377b3660b')

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

  _dinit_install_user_services_ $srcdir/pipewire.user.service $srcdir/pipewire-pulse.user.service

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgname-$pkgver/COPYING
}
