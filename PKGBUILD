# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=catnest
_commit="708d9351fc0bd8335508ac38c60295e391e90f70"
pkgver=0.2.1.${_commit:0:7}
pkgrel=2
pkgdesc="A substitution of systemd-sysusers"
url="https://github.com/eweOS/catnest"
license=(MIT)
arch=(x86_64 aarch64 riscv64)
makedepends=(git)
options=(emptydirs)
source=(
  "git+https://github.com/eweOS/catnest#commit=${_commit}"
  "$pkgname.service"
  "basic.conf"
  "catnest-reload.hook"
)
sha256sums=('SKIP'
            '37ac92afc1b5b79f72fffdd57c1771b8bc060f659b1e71c266da1d08982f65eb'
            '23f9c703fb4cb7887cc91a3137e139f8d3b2b1bc43f2cb597c94a1707f47be58'
            'da464cea8c2c804b10f79efefaf57c9e8511d52d7e79cf2294ee50f3d6e241b3')

prepare()
{
  # Use Clang!
  sed -i 's/gcc/cc/g; s/-Werror/-Werror -Wno-missing-field-initializers/g' $pkgname/release.sh
}

build()
{
  cd $pkgname
  ./release.sh
}

package()
{
  cd $pkgname
  mkdir -p $pkgdir/etc/sysusers.d
  install -D $pkgname $pkgdir/usr/bin/$pkgname
  install -D ../basic.conf $pkgdir/usr/lib/sysusers.d/basic.conf
  install -D $pkgname.1 $pkgdir/usr/share/man/man1/$pkgname.1
  _install_license_ LICENSE
  _dinit_install_services_ $srcdir/$pkgname.service
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 $srcdir/catnest-reload.hook
}
