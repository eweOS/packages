# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=fzf
pkgver=0.75.0
pkgrel=1
pkgdesc='Command-line fuzzy finder'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/junegunn/fzf'
license=('MIT')
depends=('bash')
makedepends=('git' 'go')
optdepends=('fish: fish keybindings'
  'tmux: fzf-tmux script for launching fzf in a tmux pane'
  'vim: plugin'
  'zsh: zsh keybindings')
source=("git+https://github.com/junegunn/fzf.git#tag=v${pkgver}")
sha512sums=('27974bafc9152ee82d5dc0e08cb427ae66c4be681bad9e8f4f5e4056e087a78950e42890e6b93edd5a37f0199529d9688265e0498ac68eeaa8c995c87a302466')

prepare()
{
  cd "${pkgname}"
  sed -i 's/-w /-w -linkmode external /' Makefile
}

build()
{
  cd "${pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  make
}

check()
{
  cd "${pkgname}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go test ./...
}

package()
{
  cd "${pkgname}"

  ## Man page
  install -Dm644 man/man1/fzf.1 "$pkgdir"/usr/share/man/man1/fzf.1
  install -Dm644 man/man1/fzf-tmux.1 "$pkgdir"/usr/share/man/man1/fzf-tmux.1

  ## License
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/fzf/LICENSE

  ## Binaries
  install -dm755 "$pkgdir"/usr/bin
  install -m755 bin/fzf-tmux "$pkgdir"/usr/bin/
  install -Dm755 target/fzf-linux_* "$pkgdir"/usr/bin/fzf

  ## Completion and keybindings
  install -dm755 "$pkgdir"/usr/share/fzf
  install -m644 shell/*.bash shell/*.zsh "$pkgdir"/usr/share/fzf

  ## Fish keybindings
  install -Dm644 shell/key-bindings.fish "$pkgdir"/usr/share/fish/vendor_functions.d/fzf_key_bindings.fish

  ## Vim plugin
  install -Dm644 doc/fzf.txt "$pkgdir"/usr/share/vim/vimfiles/doc/fzf.txt
  install -Dm644 plugin/fzf.vim "$pkgdir"/usr/share/vim/vimfiles/plugin/fzf.vim
}
