# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.57.3
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('af034c850881b5f5c6c617961880d198d5ed70cabd04cf01abe2f67b4f502797')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
