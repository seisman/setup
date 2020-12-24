#!/usr/bin/env bash
#
# Setup TinyTeX
#
# https://yihui.org/tinytex/
#

curl -sL "https://yihui.org/tinytex/install-bin-unix.sh" | sh
tlmgr install \
	anyfontsize \
	datetime \
	geometry \
	enumitem \
	xcolor \
	fancyhdr \
	hyperref \
	etaremune \
	fmtcount \
	sourcesanspro \
	sourcecodepro \
	ctex
