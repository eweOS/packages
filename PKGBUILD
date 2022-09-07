# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sudo
pkgver=1.9.7p2
pkgrel=1
pkgdesc='Tool for delegating authority to users and groups.'
arch=(x86_64)
url='http://www.sudo.ws/'
license=(BSD)
groups=()
depends=(openssl zlib)
makedepends=(
    skalibs
    utmps
)
options=(emptydirs)

source=(
    "http://www.sudo.ws/sudo/dist/sudo-${pkgver}.tar.gz"
)

sha256sums=(
    'SKIP'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    LIBS='-lutmps -lskarnet' \
      ./configure \
      --prefix=/usr \
      --libexecdir=/usr/lib/sudo \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --with-rundir=/run/sudo \
      --with-vardir=/var/db/sudo \
      --with-logfac=auth \
      --enable-tmpfiles.d \
      --with-sssd \
      --with-env-editor \
      --with-passprompt="[sudo] password for %p: " \
      --with-all-insults
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
