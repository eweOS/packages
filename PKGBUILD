# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rust
pkgver=1.67.1
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=(x86_64 aarch64)
url='https://www.rust-lang.org/'
license=(MIT Apache)
source=(
  https://static.rust-lang.org/dist/rustc-$pkgver-src.tar.gz
  https://sh.rustup.rs/rustup-init.sh
  config.toml.x86_64
  config.toml.aarch64
)
sha256sums=('46483d3e5de85a3bd46f8e7a3ae1837496391067dbe713a25d3cf051b3d9ff6e'
            '41262c98ae4effc2a752340608542d9fe411da73aca5fbe947fe45f61b7bd5cf'
            '6ae6ca31ab75bd9474a0f9edf2431630603cb4db475edc6e15a41793861d9615'
            'b03d82b27697e7c6851ead47e8eca74458ad3a34f3ba8663d6216fdecf4025c0')

depends=(musl llvm-libs musl-static curl libssh2)
makedepends=(rust llvm libffi perl python cmake ninja)

prepare()
{
  chmod +x rustup-init.sh
  ./rustup-init.sh --profile minimal -y
  source "$HOME/.cargo/env"
}

build()
{
  cp config.toml.${CARCH} ${pkgname}c-${pkgver}-src/config.toml

  source "$HOME/.cargo/env"

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
  mv $pkgdir/etc/bash_completion.d $pkgdir/usr/share/bash-completion/completions
  mv -t $pkgdir/usr/share/licenses/rust $pkgdir/usr/share/doc/rust/{COPYRIGHT,LICENSE*}
}
