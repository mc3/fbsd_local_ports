# $FreeBSD: head/www/calendarserver/Makefile 400207 2015-10-26 21:03:57Z pi $

PORTNAME=	calendarserver
PORTVERSION=	7.0
CATEGORIES=	www python
MASTER_SITES=	LOCAL/wg
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	CalendarServer-${PORTVERSION}

MAINTAINER=	axel.rau@chaos1.de
COMMENT=	Calendar and Contacts Server from Apple (RFC 4791, RFC 6352)

LICENSE=	APACHE20

FETCH_DEPENDS=	svn:${PORTSDIR}/devel/subversion
BUILD_DEPENDS=	${FETCH_DEPENDS}
RUN_DEPENDS=	memcached:${PORTSDIR}/databases/memcached \
		${PYTHON_PKGNAMEPREFIX}calendar=0.15020:${PORTSDIR}/devel/py-calendar \
		${PYTHON_PKGNAMEPREFIX}PyGreSQL>=4.1:${PORTSDIR}/databases/py-PyGreSQL \
		${PYTHON_PKGNAMEPREFIX}pycrypto>=2.6.1:${PORTSDIR}/security/py-pycrypto \
		${PYTHON_PKGNAMEPREFIX}dateutil>=2.1:${PORTSDIR}/devel/py-dateutil \
		${PYTHON_PKGNAMEPREFIX}openssl>=0.14:${PORTSDIR}/security/py-openssl \
		${PYTHON_PKGNAMEPREFIX}pg8000>=1.10.2:${PORTSDIR}/databases/py-pg8000 \
		${PYTHON_PKGNAMEPREFIX}psutil121>=1.2:${PORTSDIR}/sysutils/py-psutil121 \
		${PYTHON_PKGNAMEPREFIX}pytz>=2016.1:${PORTSDIR}/devel/py-pytz \
		${PYTHON_PKGNAMEPREFIX}service_identity>=14.0.0:${PORTSDIR}/security/py-service_identity \
		${PYTHON_PKGNAMEPREFIX}setproctitle>=1.1.8:${PORTSDIR}/devel/py-setproctitle \
		${PYTHON_PKGNAMEPREFIX}sqlparse>=0.1:${PORTSDIR}/databases/py-sqlparse \
		${PYTHON_PKGNAMEPREFIX}twext=0.7.0.dev15059:${PORTSDIR}/devel/py-twext \
		${PYTHON_PKGNAMEPREFIX}zope.interface>=4.1.2:${PORTSDIR}/devel/py-zope.interface

OPTIONS_DEFINE=	EXAMPLES DOCS
EXAMPLES_DESC=	Install configuration examples
DOCS_DESC=	Install additional documentation
OPTIONS_DEFAULT=	EXAMPLES DOCS
.include <bsd.port.options.mk>

USES=	pgsql:9.1+ python:2.7 \
		twisted:run,conch,mail,names,runner,web,words
USE_PYTHON=	autoplist distutils

SUB_FILES=	pkg-message
SUB_LIST+=	USER=${USERS}

USE_RC_SUBR=	caldavd
SUB_LIST+=	PYTHON_CMD=${PYTHON_CMD}

SVN_REPOSITORY_URL=	http://svn.calendarserver.org/repository/calendarserver
SVN_TAG1=	CalendarServer/tags/release/${DISTNAME}
SVN_CMD1=	svn export -r15178

LOGDIR=		/var/log/caldavd
SHAREDIR=	${PREFIX}/share/caldavd

ETCDIR=		${PREFIX}/etc/caldavd

CALDAVD_USER=	caldavd
USERS=		${CALDAVD_USER}
GROUPS=		${CALDAVD_USER}

maint-gen-distfile:
	@if [ ! -f "${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}" ] ; then \
		${MKDIR} ${WRKDIR} ; cd ${WRKDIR} ; ${RM} -Rf ${WRKDIR}/${DISTNAME} ; \
		${ECHO_MSG} "=> Checking out CalendarServer from svn.calendarserver.org/..."; \
		${SVN_CMD1} ${SVN_REPOSITORY_URL}/${SVN_TAG1} > /dev/null ; \
		${ECHO_MSG} "=> Creating tar archive ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"; \
		cd ${WRKDIR} ; tar -czf ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ${DISTNAME} ; \
		${RM} -Rf ${WRKDIR}/${DISTNAME} ; \
	else \
		${ECHO_MSG} "===>	${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} found." ; \
	fi

post-patch:
	@${REINPLACE_CMD} -e 's|"{}.a1+unknown".format(base_version)|"7.0"|' ${WRKSRC}/setup.py
	@${REINPLACE_CMD} -e 's|"/etc/caldavd/caldavd.plist"|"${ETCDIR}/caldavd.plist"|g' ${WRKSRC}/twistedcaldav/stdconfig.py

post-install:
	@${MKDIR} ${STAGEDIR}${ETCDIR}/auth
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/conf && ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR})
	(cd ${WRKSRC}/doc && \
		for i in `ls |${GREP} -v '.8'`; do \
		${MKDIR} ${STAGEDIR}${DOCSDIR}/$${i} && \
		${INSTALL_MAN} ${WRKSRC}/doc/$${i}/* \
		${STAGEDIR}${DOCSDIR}/$${i}; \
		done)
	${CP} -p ${WRKSRC}/txdav/common/datastore/sql_schema/current.sql \
		${STAGEDIR}${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/*.8 ${STAGEDIR}${PREFIX}/man/man8

.include <bsd.port.mk>
