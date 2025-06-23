# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sudo
pkgver=1.9.17
pkgrel=1
pkgdesc='Tool for delegating authority to users and groups.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.sudo.ws/'
license=(BSD)
depends=(openssl zlib)
makedepends=(utmps)
options=(emptydirs)
backup=('etc/sudo.conf'
        'etc/sudo_logsrvd.conf'
        'etc/sudoers')
source=("http://www.sudo.ws/sudo/dist/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3f212c69d534d5822b492d099abb02a593f91ca99f5afde5cb9bd3e1dcdad069')

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
