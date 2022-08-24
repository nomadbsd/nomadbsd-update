PROGRAM             = nomadbsd-update
PREFIX             ?= /usr
BINDIR              = ${PREFIX}/bin
DATADIR             = ${PREFIX}/share/${PROGRAM}
INSTALL_TARGETS     = ${PROGRAM}
BSD_INSTALL_DATA   ?= install -m 0644
BSD_INSTALL_SCRIPT ?= install -m 555

install: ${INSTALL_TARGETS}
	if [ ! -d ${BINDIR} ]; then mkdir -p ${BINDIR}; fi
	${BSD_INSTALL_SCRIPT} ${PROGRAM} ${DESTDIR}${BINDIR}
