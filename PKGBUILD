# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sudo
pkgver=1.9.17.p2
_pkgver=${pkgver/.p/p}
pkgrel=3
pkgdesc='Tool for delegating authority to users and groups.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.sudo.ws/'
license=(ISC)
depends=(openssl zlib pam)
makedepends=(utmps)
options=(emptydirs)
backup=('etc/pam.d/sudo'
	'etc/sudo.conf'
        'etc/sudo_logsrvd.conf'
        'etc/sudoers')
source=("http://www.sudo.ws/sudo/dist/${pkgname}-${_pkgver}.tar.gz" sudo.pam)
sha256sums=('4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb'
            'd1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2')

_features=(
  --enable-static=false
  --with-sssd
  --with-env-editor
  --with-all-insults
)

build() {
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

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/sudo.pam" "$pkgdir/etc/pam.d/sudo"

  _install_license_ LICENSE.md
}
