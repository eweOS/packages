# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=yq
pkgver=4.54.3
pkgrel=1
pkgdesc='A portable command-line YAML, JSON, XML, CSV, TOML, HCL and properties processor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://mikefarah.gitbook.io/yq
license=(MIT)
depends=(musl)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/mikefarah/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('93143d49b2a3bd6cb723477f585366b29f70c636af4653191d61b49b0c47de7f')

prepare() {
  cd $pkgname-$pkgver
  go mod download
}

build() {
  cd $pkgname-$pkgver
  go build
}

check() {
  cd $pkgname-$pkgver
  go test
}

package() {
  cd $pkgname-$pkgver
  install -Dt "$pkgdir"/usr/bin yq
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
  _install_license_ LICENSE
  ./yq shell-completion bash | install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/yq
  ./yq shell-completion zsh | install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_yq
  ./yq shell-completion fish | install -Dm644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/yq.fish
}
