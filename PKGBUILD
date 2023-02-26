# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wpa_supplicant
pkgver=2.10
pkgrel=1
pkgdesc='A utility providing key negotiation for WPA wireless networks'
url='https://w1.fi/wpa_supplicant/'
arch=(x86_64 aarch64)
license=(GPL)
depends=(openssl dbus libnl)
source=(
  https://w1.fi/releases/${pkgname}-${pkgver}.tar.gz
  config
)
sha256sums=('SKIP' 'SKIP')

prepare()
{
  cp config $pkgname-$pkgver/$pkgname/.config
}

build()
{
  cd $pkgname-$pkgver/$pkgname

  make LIBDIR=/usr/lib BINDIR=/usr/bin
}

package()
{
  cd $pkgname-$pkgver/$pkgname

  make LIBDIR=/usr/lib BINDIR=/usr/bin DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/etc/wpa_supplicant"
  install -Dm644 wpa_supplicant.conf -t "$pkgdir/usr/share/doc/wpa_supplicant"

  install -Dm644 dbus/fi.w1.wpa_supplicant1.service \
    -t "$pkgdir/usr/share/dbus-1/system-services"

  install -Dm644 dbus/dbus-wpa_supplicant.conf \
    "$pkgdir/usr/share/dbus-1/system.d/wpa_supplicant.conf"

  install -Dm644 doc/docbook/*.5 -t "$pkgdir/usr/share/man/man5"
  install -Dm644 doc/docbook/*.8 -t "$pkgdir/usr/share/man/man8"
  rm "$pkgdir"/usr/share/man/man8/wpa_{priv,gui}.8
}
