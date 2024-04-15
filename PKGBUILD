# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bash-completion
pkgver=2.11
pkgrel=1
pkgdesc='Programmable completion for the bash shell'
arch=(any)
url='https://github.com/scop/bash-completion'
license=(GPL2)
depends=(bash)
options=(!emptydirs !makeflags)
source=($url/releases/download/$pkgver/$pkgname-$pkgver.tar.xz
        $pkgname-drill.patch::https://github.com/scop/bash-completion/commit/cbec56cfd543.patch)
validpgpkeys=(A558062B6D5DA1347CD468D52B0AE2C1B09B07CB)
sha256sums=('73a8894bad94dee83ab468fa09f628daffd567e8bef1a24277f1e9a0daf911ac'
            '1542af0a7b0cd137b2ff74aeccc1d9f09db3ccc17ff99e4dfde14bb4fe396622')

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
