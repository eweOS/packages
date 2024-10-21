# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=rust
pkgname=(rust rust-src)
pkgver=1.82.0
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.rust-lang.org/'
license=(MIT Apache)
options=(!lto)
source=(
  https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz
  config.toml.tpl
  0001-musl-static.patch
  0002-disable-no-default-libraries.patch
  0003-drop-latomic-for-riscv-targets.patch
)
sha256sums=('7c53f4509eda184e174efa6ba7d5eeb586585686ce8edefc781a2b11a7cf512a'
            'd5879bb6d754707d75791c2c7fd80aeeffbac3e0ac8d79495b2cb5edb2a368b2'
            'e36b2a8dbcaccb27ae0ac113168bd57bee10610106df2dcbfce1e3f095e75795'
            'f9340dde4ba5ed44b21f36de3605994fc32fbeaf24234a1036b162c1ee94b58d'
            '623d6c35fac21a18bd95a40e6cda51aa5890ae0432f3dadf569c0914c814e52d')

depends=(musl llvm-libs musl-static curl libssh2 openssl)
makedepends=(rust llvm-devel libffi perl python cmake ninja)

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
  cp config.toml.tpl ${pkgbase}c-$pkgver-src/config.toml

  export RUST_BACKTRACE=1

  cd $srcdir/${pkgbase}c-${pkgver}-src
  DESTDIR="$srcdir/install" python ./x.py install -j "$(nproc)"

  cd $srcdir/install
  _pick_ rust-src usr/lib/rustlib/src
}

package_rust()
{
  provides=(cargo rustfmt)
  cp -r $srcdir/install/* "$pkgdir"

  rm $pkgdir/usr/lib/rustlib/{components,install.log,rust-installer-version,uninstall.sh}
  rm $pkgdir/usr/lib/rustlib/manifest-*

  install -d $pkgdir/usr/share/bash-completion
  install -d $pkgdir/usr/share/licenses/rust

  mv -t $pkgdir/usr/share/licenses/rust $pkgdir/usr/share/doc/rustc/LICENSE*
}

package_rust-src() {
  pkgdesc="Source code for the Rust standard library"
  depends=(rust)

  cp -a pkgs/rust-src/* "$pkgdir"
}
