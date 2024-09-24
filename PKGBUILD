# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wpa_supplicant
pkgver=2.11
pkgrel=2
pkgdesc='A utility providing key negotiation for WPA wireless networks'
url='https://w1.fi/wpa_supplicant/'
arch=(x86_64 aarch64 riscv64)
license=(GPL)
depends=(openssl dbus libnl)
makedepends=(linux-headers)
source=(
  https://w1.fi/releases/${pkgname}-${pkgver}.tar.gz
  config
  wpa_supplicant.service
)
sha256sums=('912ea06f74e30a8e36fbb68064d6cdff218d8d591db0fc5d75dee6c81ac7fc0a'
            'c22c3998f9bb0cae019435dcb0e85dcb5ddd2922a70eff17b797aacd48a4f011'
            'fe518aa7e03cc732a3c7bc73a40d345bfb42e23e07ed73127ba26dfb50dc6ac9')

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

  _dinit_install_services_ $srcdir/wpa_supplicant.service
  install -d $pkgdir/usr/lib/dinit.d/connman.d
  ln -s ../wpa_supplicant $pkgdir/usr/lib/dinit.d/connman.d/wpa_supplicant
}
