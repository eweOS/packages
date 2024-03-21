# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=rust
pkgname=(rust rust-nightly)
pkgver=1.76.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=(x86_64 aarch64 riscv64)
url='https://www.rust-lang.org/'
license=(MIT Apache)
options=(!lto)
source=(
  https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz
  config.toml.tpl
  musl-static.patch
  handle-vendored-sources.patch
)
sha256sums=('9e5cff033a7f0d2266818982ad90e4d3e4ef8f8ee1715776c6e25073a136c021'
            '1f4a6ec736919d0548573239c655d7d49400f9becfc867ef48947748416545c8'
            'e36b2a8dbcaccb27ae0ac113168bd57bee10610106df2dcbfce1e3f095e75795'
            'b5b331df7996168b8034cbc67c759a99022e216be3d5257a5fb61bb7b90597b2')

depends=(musl llvm-libs musl-static curl libssh2)
makedepends=(rust llvm libffi perl python cmake ninja)

prepare()
{
  _patch_ ${pkgbase}c-$pkgver-src
}

build()
{
  sed -i "s@%RUSTVER%@$pkgver@g" config.toml.tpl
  case $CARCH in
    riscv64)
      sed -i "s@%RUSTTARGET%@riscv64gc-unknown-linux-musl@g" config.toml.tpl
      ;;
    *)
      sed -i "s@%RUSTTARGET%@${CARCH}-unknown-linux-musl@g" config.toml.tpl
      ;;
  esac
  cp -r ${pkgbase}c-$pkgver-src ${pkgbase}c-$pkgver-src-nightly
  cp config.toml.tpl ${pkgbase}c-$pkgver-src/config.toml
  cp config.toml.tpl ${pkgbase}c-$pkgver-src-nightly/config.toml
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
