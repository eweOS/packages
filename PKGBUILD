# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.66.1
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('f4c75fd8bba2ca2338d2b0b361b4b1ca0cff3cb706cd98d43b3ad4ffa265eb92')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
