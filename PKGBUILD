# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.73
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('4cbde93a74b6e59642f0c1b45ca3426f8be04a12188d542b2a279abebe4c107b')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
