# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sudo
pkgver=1.9.15
pkgrel=2
pkgdesc='Tool for delegating authority to users and groups.'
arch=(x86_64 aarch64 riscv64)
url='http://www.sudo.ws/'
license=(BSD)
depends=(openssl zlib)
makedepends=(utmps)
options=(emptydirs)
backup=('etc/sudo.conf'
        'etc/sudo_logsrvd.conf'
        'etc/sudoers')
source=("http://www.sudo.ws/sudo/dist/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fd0e254870e92e873b508ba16382f5ac3af81a5a38d1ea9cf973606db4262589')

_features=(
  --enable-static=false
  --with-sssd
  --with-env-editor
  --with-all-insults
)

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/sudo \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-rundir=/run/sudo \
    --with-vardir=/var/db/sudo \
    --with-passprompt="[sudo] password for %p: " \
    ${_features[@]}
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
