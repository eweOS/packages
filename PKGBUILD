# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sudo
pkgver=1.9.14
pkgrel=1
pkgdesc='Tool for delegating authority to users and groups.'
arch=(x86_64 aarch64 riscv64)
url='http://www.sudo.ws/'
license=(BSD)
depends=(zlib)
makedepends=(utmps)
options=(emptydirs)
source=("http://www.sudo.ws/sudo/dist/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7bb70e4529ab2ada47ded970cdf2fe7be3084912861ddbac239eebdc92935a29')

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
