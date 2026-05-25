# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=npm
pkgver=11.15.0
pkgrel=1
pkgdesc='JavaScript package manager'
arch=(any)
url="https://www.npmjs.com"
license=(Artistic-2.0)
depends=(
  node-gyp
  nodejs
  nodejs-nopt
  semver
)
# symlinks for ln -r
makedepends=(git symlinks)
optdepends=("git: for dependencies using Git URL's")
source=("npm-cli::git+https://github.com/npm/cli.git#tag=v$pkgver")
sha256sums=('e191424705a7b7184d873735a36522605f85a5849c48ae23ca9d6ddb57662ced')

build() {
  cd npm-cli
  node scripts/resetdeps.js
}

check() {
  cd npm-cli
  # Windows shims test failure
  rm test/bin/windows-shims.js
  node . run test --ignore-scripts -- --no-coverage
}

package() {
  local mod_dir=/usr/lib/node_modules/$pkgname

  install -d "$pkgdir"/usr/share/{bash-completion/completions,licenses/$pkgname}
  ln -s $mod_dir/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd npm-cli
  node . install -g --prefix="$pkgdir/usr" "$(node . pack --ignore-scripts | tail -1)"
  node . completion > "$pkgdir"/usr/share/bash-completion/completions/npm
  echo 'globalconfig=/etc/npmrc' > "$pkgdir"/$mod_dir/npmrc

  cd "$pkgdir"/$mod_dir
  # Remove superfluous scripts
  rm -r {bin/{node-gyp-bin,np{m,x}{,.{cmd,ps1}}},node_modules/.bin}

  # Experimental dedup
  rm -r node_modules/{node-gyp,nopt,semver}

  cd man
  # Workaround for https://github.com/npm/cli/issues/780
  local name page sec title
  for page in man5/folders.5 man5/install.5 man7/*.7; do
    sec=${page##*.}
    name=$(basename "$page" ."$sec")
    title=${name@U}

    sed -Ei "s/^\.TH \"$title\"/.TH \"NPM-$title\"/" "$page"
    mv "$page" "${page/\///npm-}"
  done

  gzip man?/*

  # Support both `man` and `npm help`
  local dest sec_dir
  for sec_dir in man?; do
    dest="$pkgdir"/usr/share/man/$sec_dir
    install -d "$dest"
    find "$sec_dir"/* -type f -exec ln -s "$PWD"/{} "$dest/" \;
  done
  symlinks -rcv "$pkgdir"/usr/share/man
}
