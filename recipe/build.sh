#!/bin/bash

export DISABLE_AUTOBREW=1

sed -i 's/-mmacosx-version-min=10.13//g' ${PREFIX}/lib/R/etc/Makeconf
sed -i 's/PKG_CPPFLAGS = /PKG_CPPFLAGS = -D_LIBCPP_DISABLE_AVAILABILITY/' src/Makevars

# shellcheck disable=SC2086
${R} CMD INSTALL --build . ${R_ARGS}
