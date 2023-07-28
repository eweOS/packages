# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cronie
pkgver=1.6.1
pkgrel=3
pkgdesc="Daemon that runs specified programs at scheduled times and related too"
url="https://github.com/cronie-crond/cronie"
license=('custom:BSD')
arch=(x86_64 aarch64 riscv64)
depends=('bash')
source=(
  "$url/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz"
  cron.service
)
sha256sums=('2cd0f0dd1680e6b9c39bf1e3a5e7ad6df76aa940de1ee90a453633aa59984e62'
            'e33cecd52ffc6ac6efe01ec6cdc86d1c847784ddf43d55109cf93c9ff933855b')

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
  install "$srcdir/cron.service" "$pkgdir/etc/dinit.d/cron"

  install -Dm0644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYIG
}
