# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=rust
pkgname=(rust rust-nightly)
pkgver=1.74.0
pkgrel=2
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=(x86_64 aarch64 riscv64)
url='https://www.rust-lang.org/'
license=(MIT Apache)
options=(!lto)
source=(
  https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz
  config.toml.x86_64
  config.toml.aarch64
  config.toml.riscv64
)
sha256sums=('882b584bc321c5dcfe77cdaa69f277906b936255ef7808fcd5c7492925cf1049'
            '970d3ee0c309450eaab3fd62d8a323f725111352213656382c7d3f7b039b8c01'
            '501211c5a26b2838646a1dfe5a95c0ccbaf013398c75a9977c65e736c0386f86'
            '099da1435aba9a13fa29300cdc056b25af198264f1defcfacbbe362b7cd9a013')

depends=(musl llvm-libs musl-static curl libssh2)
makedepends=(rust llvm libffi perl python cmake ninja)

build()
{
  sed -i "s@%RUSTVER%@$pkgver@g" config.toml.${CARCH}
  cp -r ${pkgbase}c-$pkgver-src ${pkgbase}c-$pkgver-src-nightly
  cp config.toml.${CARCH} ${pkgbase}c-$pkgver-src/config.toml
  cp config.toml.${CARCH} ${pkgbase}c-$pkgver-src-nightly/config.toml
  sed -i 's/stable/nightly/g' ${pkgbase}c-$pkgver-src-nightly/config.toml

  export RUST_BACKTRACE=1

  cd $srcdir/${pkgbase}c-${pkgver}-src
  DESTDIR="$srcdir/install" python ./x.py install -j "$(nproc)"

  cd $srcdir/${pkgbase}c-${pkgver}-src-nightly
  DESTDIR="$srcdir/install-nightly" python ./x.py install -j "$(nproc)"
}

package_rust()
{
  provides=(cargo rustfmt)
  conflicts=(rust-nightly)
  cp -r $srcdir/install/* "$pkgdir"

  rm $pkgdir/usr/lib/rustlib/{components,install.log,rust-installer-version,uninstall.sh}
  rm $pkgdir/usr/lib/rustlib/manifest-*

  install -d $pkgdir/usr/share/bash-completion
  install -d $pkgdir/usr/share/licenses/rust
  mv -t $pkgdir/usr/share/licenses/rust $pkgdir/usr/share/doc/rust/LICENSE*
}

package_rust-nightly()
{
  provides=(rust cargo rustfmt)
  conflicts=(rust)
  cp -r $srcdir/install-nightly/* "$pkgdir"

  rm $pkgdir/usr/lib/rustlib/{components,install.log,rust-installer-version,uninstall.sh}
  rm $pkgdir/usr/lib/rustlib/manifest-*

  install -d $pkgdir/usr/share/bash-completion
  install -d $pkgdir/usr/share/licenses/rust-nightly
  mv -t $pkgdir/usr/share/licenses/rust-nightly $pkgdir/usr/share/doc/rust/LICENSE*
}
