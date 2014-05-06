#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.


AC_PREREQ(2.52)

AC_INIT([apertium-is-en], [0.1.0], [hrafn65@users.sourceforge.net])
AM_INIT_AUTOMAKE([apertium-is-en], [0.1.0], no-define)
AC_PROG_LN_S
AC_PROG_AWK
AC_CONFIG_HEADER([config])

AC_ARG_WITH(icenlp,
            [AC_HELP_STRING([--with-icenlp=PATH], [(optional) path to IceNLP toolkit])],
            [with_icenlp=$withval],
            [with_icenlp=no]
           )

AM_CONDITIONAL([ICENLP], false)

m4_define([required_apertium_version], [3.2.0])
PKG_CHECK_MODULES(APERTIUM,   apertium >= required_apertium_version)


AC_SUBST(APERTIUM_VER)


#
# Check for VISL constraint grammar
#

AC_PATH_PROG(CGCOMP, cg-comp, no)
if test x$ac_cv_path_CGCOMP = x
then
  AC_MSG_ERROR([You don't have cg-comp installed.])
fi
if test x$ac_cv_path_CGPROC = xno
then
  AC_MSG_ERROR([You don't have cg-comp installed.])
fi

AC_PATH_PROG(CGPROC, cg-proc, no)
if test x$ac_cv_path_CGPROC = x
then
  AC_MSG_ERROR([You don't have cg-proc installed.])
fi
if test x$ac_cv_path_CGPROC = xno
then
  AC_MSG_ERROR([You don't have cg-proc installed.])
fi

#
# Check for xsltproc
#

AC_PATH_PROG(XSLTPROC, xsltproc, no)
if test x$ac_cv_path_XSLTPROC = x
then
  AC_MSG_ERROR([You don't have xsltproc installed.])
fi
if test x$ac_cv_path_XSLTPROC = xno
then
  AC_MSG_ERROR([You don't have xsltproc installed.])
fi

AP_CHECK_LING([1], [apertium-isl])

AP_MKINCLUDE


AC_OUTPUT([Makefile])
