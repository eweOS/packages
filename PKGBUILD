# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bash-completion
pkgver=2.16.0
pkgrel=2
pkgdesc='Programmable completion for the bash shell'
arch=(any)
url='https://github.com/scop/bash-completion'
license=(GPL2)
depends=(bash)
options=(!emptydirs !makeflags)
# 0001: Fix file conflicts with libsecret
source=($url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz
	"0001-deprecate-secret-tool.patch::https://github.com/scop/bash-completion/commit/af8a80d8916edd4a1c146afb2743651b6c3ca406.patch")
validpgpkeys=(A558062B6D5DA1347CD468D52B0AE2C1B09B07CB)
sha256sums=('3369bd5e418a75fb990863925aed5b420398acebb320ec4c0306b3eae23f107a'
            '09362a55277766f49d7d06020f912807b3e4916b5bc8be1bc06596a14ee35359')

prepare() {
  _patch_ $pkgname-$pkgver

  cd $pkgname-$pkgver
  autoreconf -fiv
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
