PREFIX	=/usr
SKINDIR	=${PREFIX}/lib/gdeskcal/skins/Lexx

.SUFFIXES: .png .jpg .svg

.svg.png:
	batik $<

.svg.jpg:
	batik -m image/jpq -q 0.5 $<

SVGFILES=home.svg next.svg prev.png today.png
JPGFILES=${SVGFILES:.svg=.jpg}
PNGFILES=${SVGFILES:.svg=.png}

XMLFILES=skin.xml

all: ${PNGFILES}

clean:

distclean clobber: clean
	${RM} ${JPGFILES}
	${RM} ${PNGFILES}

install: ${PNGFILES} ${XMLFILES}
	install -d ${SKINDIR}
	install -c -m 0644 ${PNGFILES} ${XMLFILES} ${SKINDIR}/

uninstall:
	${RM} -r ${SKINDIR}
