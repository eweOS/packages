# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sudo
pkgver=1.9.17.p1
_pkgver=${pkgver/.p/p}
pkgrel=1
pkgdesc='Tool for delegating authority to users and groups.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.sudo.ws/'
license=(ISC)
depends=(openssl zlib)
makedepends=(utmps)
options=(emptydirs)
backup=('etc/sudo.conf'
        'etc/sudo_logsrvd.conf'
        'etc/sudoers')
source=("http://www.sudo.ws/sudo/dist/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32')

_features=(
  --enable-static=false
  --with-sssd
  --with-env-editor
  --with-all-insults
)

build()
{
  cd "$srcdir/$pkgname-$_pkgver"
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
  cd "$srcdir/$pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install
  _install_license_ LICENSE.md
}
