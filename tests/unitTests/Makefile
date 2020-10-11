TOP=../..
PKG=${shell cd ${TOP};pwd}
SUITE=runRUnitTests.R

test: # Run unit tests
	Rscript ${SUITE}

all: inst test

echo: # Echo env. variables
	@echo "Package folder: ${PKG}"
	@echo "R binary: ${R}"

help: # Help
	@echo -e '\nTarget: Dependency # Description'; \
	echo '=================================================='; \
	egrep '^[[:alnum:].+_()%]*:' ./Makefile
