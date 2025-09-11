# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=git
pkgver=2.51.0
pkgrel=1
pkgdesc='the fast distributed version control system'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://git-scm.com/'
license=('GPL2')
depends=('curl' 'expat' 'perl' 'perl-error'
  'openssl' 'pcre2' 'zlib')
makedepends=('python' 'asciidoc' 'xmlto')
optdepends=('perl-mailtools: git send-email support'
	    'perl-authen-sasl: TLS support for git send-email'
	    'perl-io-socket-ssl: TLS support for git send-email')
source=("https://www.kernel.org/pub/software/scm/git/git-${pkgver}.tar.xz")
sha256sums=('60a7c2251cc2e588d5cd87bae567260617c6de0c22dca9cdbfc4c7d2b8990b62')

_make_paths=(
  prefix='/usr'
  gitexecdir='/usr/lib/git-core'
  perllibdir="$(/usr/bin/perl -MConfig -wle 'print $Config{installvendorlib}')"
)

_make_options=(
  CFLAGS="$CFLAGS"
  LDFLAGS="$LDFLAGS"
  INSTALL_SYMLINKS=1
  MAN_BOLD_LITERAL=1
  NO_PERL_CPAN_FALLBACKS=1
  USE_LIBPCRE2=1
  NO_REGEX=NeedsStartEnd
  CC=clang HOSTCC=clang
)

build()
{
  cd "$srcdir/$pkgname-$pkgver"

  make \
    "${_make_paths[@]}" \
    "${_make_options[@]}" \
    all

  make -C contrib/subtree "${_make_paths[@]}" "${_make_options[@]}" all
  make -C contrib/diff-highlight "${_make_paths[@]}" "${_make_options[@]}"

  make -C Documentation "${_make_paths[@]}" "${_make_options[@]}" man
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"

  make \
    "${_make_paths[@]}" \
    "${_make_options[@]}" \
    DESTDIR="$pkgdir" \
    install

  # bash completion
  mkdir -p "$pkgdir"/usr/share/bash-completion/completions/
  install -m 0644 ./contrib/completion/git-completion.bash "$pkgdir"/usr/share/bash-completion/completions/git

  # fancy git prompt
  mkdir -p "$pkgdir"/usr/share/git/
  install -m 0644 ./contrib/completion/git-prompt.sh "$pkgdir"/usr/share/git/git-prompt.sh

  # subtree installation
  make -C contrib/subtree "${_make_paths[@]}" "${_make_options[@]}" DESTDIR="$pkgdir" install

  # the rest of the contrib stuff
  find contrib/ -name '.gitignore' -delete
  cp -a ./contrib/* "$pkgdir"/usr/share/git/

  # mandoc
  make -C Documentation "${_make_paths[@]}" "${_make_options[@]}" \
  	DESTDIR="$pkgdir" install-man
}
