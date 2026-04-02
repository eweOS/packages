# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.62
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('fa4086ea5b2ef27d6e06edb4b006d74e442ebbe7e3e4ef08c93ed0fa1f7ecba3')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
