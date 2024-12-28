# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bash-completion
pkgver=2.16.0
pkgrel=1
pkgdesc='Programmable completion for the bash shell'
arch=(any)
url='https://github.com/scop/bash-completion'
license=(GPL2)
depends=(bash)
options=(!emptydirs !makeflags)
source=($url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz)
validpgpkeys=(A558062B6D5DA1347CD468D52B0AE2C1B09B07CB)
sha256sums=('3369bd5e418a75fb990863925aed5b420398acebb320ec4c0306b3eae23f107a')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # bash-completion is sourced in /etc/bash.bashrc so that non-bash shell don't source it
  rm "$pkgdir/etc/profile.d/bash_completion.sh"

  # remove Slackware's makepkg completion
  rm "$pkgdir/usr/share/bash-completion/completions/makepkg"
}
