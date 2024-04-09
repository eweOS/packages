# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cronie
pkgver=1.7.2
pkgrel=1
pkgdesc="Daemon that runs specified programs at scheduled times and related too"
url="https://github.com/cronie-crond/cronie"
license=('custom:BSD')
arch=(x86_64 aarch64 riscv64)
depends=('bash')
source=(
  "$url/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
  cron.service
)
sha256sums=('f1da374a15ba7605cf378347f96bc8b678d3d7c0765269c8242cfe5b0789c571'
            '2573646115c9dc1cb2c22f9480f6f12d98ac611f6a5353a03cf0c6bf345fbe0b')

build()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin
  make
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d "$pkgdir/var/spool/cron"
  install -d "$pkgdir/etc/cron.d"
  install -d "$pkgdir/etc/dinit.d"
  echo "# Placeholder for deny files" > $pkgdir/etc/cron.deny
  _dinit_install_services_ $srcdir/cron.service
  _install_license_ COPYING COPYING
}
