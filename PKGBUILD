# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sudo
pkgver=1.9.17.p2
_pkgver=${pkgver/.p/p}
pkgrel=4
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
# 0001: Backport upstream commit f97a34bc7b39 ("Use accessor for getting an
#	ASN1_STRING's length"). Get the length of ASN1_STRING, which has
#	become opaque since OpenSSL 4, with accessors.
source=("http://www.sudo.ws/sudo/dist/${pkgname}-${_pkgver}.tar.gz"
        sudo.pam
	0001-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch)
sha256sums=('4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb'
            'd1738818070684a5d2c9b26224906aad69a4fea77aabd960fc2675aee2df1fa2'
            '2e35ba5cf0ac76f58065b23f7f4f6fb295d1e55652f2f0d8da8ce49cfb1d6030')

_features=(
  --enable-static=false
  --with-sssd
  --with-env-editor
  --with-all-insults
)

prepare() {
  _patch_ "$pkgname-$_pkgver"
}

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
