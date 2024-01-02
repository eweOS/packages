# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=catnest
pkgver=0.1.1.dev
pkgrel=1
pkgdesc="A substitution of systemd-sysusers"
url="https://github.com/eweOS/catnest"
license=(MIT)
arch=(x86_64 aarch64 riscv64)
makedepends=(git)
_commit="1c6d7a0c35b89debf9707e096e7c2457ee08255d"
options=(emptydirs)
source=(
  "git+https://github.com/eweOS/catnest#commit=${_commit}"
  "$pkgname.service"
  "basic.conf"
)
sha256sums=('SKIP'
            '37ac92afc1b5b79f72fffdd57c1771b8bc060f659b1e71c266da1d08982f65eb'
            '23f9c703fb4cb7887cc91a3137e139f8d3b2b1bc43f2cb597c94a1707f47be58')

build()
{
  cd $pkgname
  cc -o $pkgname $pkgname.c -DARCH=$arch
}

package()
{
  cd $pkgname
  mkdir -p $pkgdir/etc/sysusers.d
  install -D $pkgname $pkgdir/usr/bin/$pkgname
  install -D ../basic.conf $pkgdir/usr/lib/sysusers.d/00-basic.conf
  install -D $pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
  install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  _dinit_install_services_ $srcdir/$pkgname.service
}
