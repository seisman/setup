#!/usr/bin/env bash
#
# Setup TinyTeX
#
# https://yihui.org/tinytex/
#

curl -sL "https://yihui.org/tinytex/install-bin-unix.sh" | sh
tlmgr install \
	anyfontsize \
	ctex \
	datetime \
	enumitem \
	etaremune \
	everysel \
	fancyhdr \
	fmtcount \
	geometry \
	hyperref \
	sourcesanspro \
	sourcecodepro \
	xcolor
