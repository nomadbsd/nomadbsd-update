PROGRAM             = nomadbsd-update
PREFIX             ?= /usr
BINDIR              = ${PREFIX}/bin
DATADIR             = ${PREFIX}/share/${PROGRAM}
CONFIGDIR           = /etc
INSTALL_TARGETS     = ${PROGRAM} ${PROGRAM}.cfg
BSD_INSTALL_DATA   ?= install -m 0644
BSD_INSTALL_SCRIPT ?= install -m 555

${PROGRAM}: ${PROGRAM}.in
	sed -e "s#@SELF_PATH@#${BINDIR}/${PROGRAM}#g; \
	        s#@PATH_CONFIG@#${CONFIGDIR}/${PROGRAM}.cfg#g" \
	< ${.ALLSRC} > ${.TARGET}

install: ${INSTALL_TARGETS}
	if [ ! -d ${BINDIR} ]; then mkdir -p ${BINDIR}; fi
	${BSD_INSTALL_SCRIPT} ${PROGRAM} ${DESTDIR}${BINDIR}
	if [ ! -f ${DESTDIR}${CONFIGDIR}/${PROGRAM}.cfg ]; then \
		${BSD_INSTALL_DATA} ${PROGRAM}.cfg ${DESTDIR}${CONFIGDIR}; \
	fi

clean:
	rm -f ${PROGRAM}
