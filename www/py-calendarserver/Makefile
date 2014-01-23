# Created by: Axel Rau <axel.rau@chaos1.de>
# $FreeBSD$
#

PORTNAME=		calendarserver
PORTVERSION=	5.1
PORTREVISION=	2
CATEGORIES=		www python
MASTER_SITES=	https://svn.calendarserver.org/repository/calendarserver/CalendarServer/tags/release/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=		CalendarServer-${PORTVERSION}

MAINTAINER=		axel.rau@chaos1.de
COMMENT=		Calendar and Contacts Server from Apple (RFC 4791, RFC 6352)

LICENSE=		APACHE20

FETCH_DEPENDS=	svn:${PORTSDIR}/devel/subversion
BUILD_DEPENDS=	${FETCH_DEPENDS}
RUN_DEPENDS=	bash:${PORTSDIR}/shells/bash
RUN_DEPENDS+=	memcached:${PORTSDIR}/databases/memcached
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}pycrypto>=2.5:${PORTSDIR}/security/py-pycrypto
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}dateutil>=2.1:${PORTSDIR}/devel/py-dateutil
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}openssl>=0.13:${PORTSDIR}/security/py-openssl
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}psutil>=1.2:${PORTSDIR}/sysutils/py-psutil
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}PyGreSQL>=4.1:${PORTSDIR}/databases/py-PyGreSQL
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}sqlite3>=2.7:${PORTSDIR}/databases/py-sqlite3
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}sqlparse>=0.1:${PORTSDIR}/databases/py-sqlparse
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}xattr>=0.6:${PORTSDIR}/devel/py-xattr
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}zope.interface>=3.8:${PORTSDIR}/devel/py-zope.interface

NEED_ROOT=			yes
USE_PYTHON=			2.7+
USE_PGSQL=			yes
WANT_PGSQL_VER=		90+
USES=				shebangfix twisted:run,conch,mail,names,runner,web,words
USE_PYDISTUTILS=	yes
PYDISTUTILS_PKGVERSION=	5.1
PYDISTUTILS_AUTOPLIST=	yes

SHEBANG_FILES=\
	${WRKSRC}/calendarserver/tools/backup_pg.py \
	${WRKSRC}/calendarserver/tools/backup.py \
	${WRKSRC}/twext/python/test/pullpipe.py

USE_RC_SUBR=	caldavd

SVN_REPOSITORY_URL=\
https://svn.calendarserver.org/repository/calendarserver
SVN_TAG1=		CalendarServer/tags/release/${DISTNAME}
SVN_CMD1=		svn --trust-server-cert export
SVN_TAG2=		PyCalendar/trunk
SVN_CMD2=		svn --trust-server-cert export -r11458

DOCROOTDIR=		/var/db/caldavd/Data/Documents
LOGDIR=			/var/log/caldavd
SHAREDIR=		${PREFIX}/share/caldavd

DOCSDIR=	   	${PREFIX}/share/doc/${PORTNAME}
EXAMPLESDIR=	${PREFIX}/share/examples/${PORTNAME}
CONFIGDIR=		${PREFIX}/etc/caldavd
PORTDOCS=		${WRKSRC}/doc/\*

CALDAVD_USER=	_dcs
USERS=		${CALDAVD_USER}
GROUPS=		${CALDAVD_USER}

do-fetch:
	@if [ ! -f "${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}" ] ; then \
		${MKDIR} ${WRKDIR} ; cd ${WRKDIR} ; ${RM} -Rf ${WRKDIR}/${DISTNAME} ; \
		${ECHO_MSG} "=> Checking out CalendarServer from svn.calendarserver.org/..."; \
		${SVN_CMD1} ${SVN_REPOSITORY_URL}/${SVN_TAG1} > /dev/null ; \
		${ECHO_MSG} "=> Checking out PyCalendar from svn.calendarserver.org/..."; \
		cd ${WRKDIR}/${DISTNAME} ; ${SVN_CMD2} ${SVN_REPOSITORY_URL}/${SVN_TAG2} > /dev/null ; \
		${MV} trunk/src/* . ; \
		${ECHO_MSG} "=> Creating tar archive ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"; \
		cd ${WRKDIR} ; tar -czf ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ${DISTNAME} ; \
		${RM} -Rf ${WRKDIR}/${DISTNAME} ; \
	else \
		${ECHO_MSG} "===>	${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} found." ; \
	fi

post-patch:

	@${REINPLACE_CMD} -e 's|"{number} ({info})".format(number=version_number, info=version_info)|"5.1"|' ${WRKSRC}/setup.py
	@${REINPLACE_CMD} -e 's|distutils.core|setuptools|g' ${WRKSRC}/setup.py
	@${REINPLACE_CMD} -e 's|bin/bash|usr/bin/env bash|' ${WRKSRC}/bin/caldavd
	@${REINPLACE_CMD} -e 's|/usr/bin|/usr/local/bin|g' ${WRKSRC}/calendarserver/tools/bootstrapdatabase.py
	@${REINPLACE_CMD} -e 's|"/etc/caldavd/caldavd.plist"|"${CONFIGDIR}/caldavd.plist"|g' ${WRKSRC}/twistedcaldav/stdconfig.py
	@${REINPLACE_CMD} -e 's|/usr/share/caldavd/lib/python/txdav/common/datastore|${SHAREDIR}|' ${WRKSRC}/calendarserver/tools/bootstrapdatabase.py
	@${REINPLACE_CMD} -e 's|"_postgres"|"pgsql"|' ${WRKSRC}/calendarserver/tools/bootstrapdatabase.py

post-install:

	${MKDIR} ${STAGEDIR}${DOCROOTDIR}
	${MKDIR} ${STAGEDIR}${CONFIGDIR}
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${MKDIR} ${STAGEDIR}${LOGDIR}
	(cd ${WRKSRC}/bin && ${COPYTREE_BIN} . ${STAGEDIR}${$PREFIX}/bin)
	${CP} -p ${WRKSRC}/conf/caldavd.plist ${STAGEDIR}${CONFIGDIR}/caldavd.plist.sample
	(cd ${WRKSRC}/conf && ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR})

.if !defined(NOPORTDOCS)
	cd ${WRKSRC}/doc && \
	for i in `ls |${GREP} -v '.8'`; do \
		${MKDIR} -p ${STAGEDIR}${DOCSDIR}/$${i} && \
		${INSTALL_MAN} ${WRKSRC}/doc/$${i}/* ${STAGEDIR}${DOCSDIR}/$${i}; done
	${CP} -p ${WRKSRC}/txdav/common/datastore/sql_schema/current.sql ${STAGEDIR}${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/*.8 ${STAGEDIR}${PREFIX}/man/man8
.endif

.include <bsd.port.mk>
