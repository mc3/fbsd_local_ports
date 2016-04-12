# $FreeBSD:$

PORTNAME=	calendar
PORTVERSION=	0.15020
DISTNAME=       pycalendar
CATEGORIES=	devel python
MASTER_SITES=	LOCAL/wg
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	axel.rau@chaos1.de
COMMENT=	iCalendar/vCard Library

LICENSE=	APACHE20

FETCH_DEPENDS=	svn:${PORTSDIR}/devel/subversion


USES=		python:2.7
USE_PYTHON=	distutils autoplist
NO_ARCH=yes

SVN_REPOSITORY_URL=	http://svn.calendarserver.org/repository/calendarserver
SVN_TAG2=	PyCalendar/trunk
SVN_CMD2=	svn export -r15020

maint-gen-distfile:
	@if [ ! -f "${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}" ] ; then \
		${MKDIR} ${WRKDIR} ; cd ${WRKDIR} ; ${RM} -Rf ${WRKDIR}/${DISTNAME} ; \
		${ECHO_MSG} "=> Checking out PyCalendar from svn.calendarserver.org/..."; \
		${SVN_CMD2} ${SVN_REPOSITORY_URL}/${SVN_TAG2} > /dev/null ; \
		${MV} trunk ${DISTNAME} ; \
		${ECHO_MSG} "=> Creating tar archive ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"; \
		cd ${WRKDIR} ; tar -czf ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ${DISTNAME} ; \
		${RM} -Rf ${WRKDIR}/${DISTNAME} ; \
	else \
		${ECHO_MSG} "===>	${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} found." ; \
	fi

.include <bsd.port.mk>
