# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rust
pkgver=1.73.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=(x86_64 aarch64 riscv64)
url='https://www.rust-lang.org/'
license=(MIT Apache)
source=(
  https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz
  config.toml.x86_64
  config.toml.aarch64
)
sha256sums=('96d62e6d1f2d21df7ac8acb3b9882411f9e7c7036173f7f2ede9e1f1f6b1bb3a'
            '970d3ee0c309450eaab3fd62d8a323f725111352213656382c7d3f7b039b8c01'
            '501211c5a26b2838646a1dfe5a95c0ccbaf013398c75a9977c65e736c0386f86')

depends=(musl llvm-libs musl-static curl libssh2)
makedepends=(rust llvm libffi perl python cmake ninja)

build()
{
  cp config.toml.${CARCH} ${pkgname}c-${pkgver}-src/config.toml

  cd ${pkgname}c-${pkgver}-src

  sed -i "s@%RUSTVER%@$pkgver@g" config.toml

  export RUST_BACKTRACE=1

  DESTDIR="$srcdir/install" python ./x.py install -j "$(nproc)"
}

package()
{
  provides=(cargo rustfmt)
  cp -r $srcdir/install/* "$pkgdir"

  rm $pkgdir/usr/lib/rustlib/{components,install.log,rust-installer-version,uninstall.sh}
  rm $pkgdir/usr/lib/rustlib/manifest-*

  install -d $pkgdir/usr/share/bash-completion
  install -d $pkgdir/usr/share/licenses/rust
  mv -t $pkgdir/usr/share/licenses/rust $pkgdir/usr/share/doc/rust/LICENSE*
}
