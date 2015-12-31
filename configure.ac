#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.52)

m4_define([required_apertium_version], [3.4.0])
m4_define([required_lttoolbox_version], [3.3.2])

AC_INIT([Apertium Icelandic-English], [0.1.0], [hrafn65@users.sourceforge.net], [apertium-isl-eng], [http://wiki.apertium.org/wiki/Apertium-isl-eng])
AM_INIT_AUTOMAKE

AC_PROG_LN_S
AC_PROG_AWK

PKG_CHECK_MODULES(APERTIUM,   apertium >= required_apertium_version)
PKG_CHECK_MODULES(LTTOOLBOX, lttoolbox >= required_lttolbox_version)

AC_ARG_WITH(icenlp,
            [AC_HELP_STRING([--with-icenlp=PATH], [(optional) path to IceNLP toolkit])],
            [with_icenlp=$withval],
            [with_icenlp=no]
           )

AM_CONDITIONAL([ICENLP], false)


AC_PATH_PROG([CGCOMP], [cg-comp], [false], [$PATH$PATH_SEPARATOR$with_cg_comp/bin])
AS_IF([test x$CGCOMP = xfalse], [AC_MSG_ERROR([You don't have cg-comp installed])])

AC_PATH_PROG([CGPROC], [cg-proc], [false], [$PATH$PATH_SEPARATOR$with_cg_proc/bin])
AS_IF([test x$CGPROC = xfalse], [AC_MSG_ERROR([You don't have cg-proc installed])])

AC_PATH_PROG([XSLTPROC], [xsltproc], [false], [$PATH$PATH_SEPARATOR$with_xslt_proc/bin])
AS_IF([test x$XSLTPROC = xfalse], [AC_MSG_ERROR([You don't have xsltproc installed])])


m4_ifdef([AP_CHECK_LING],[],[AC_MSG_ERROR([AP_CHECK_LING not defined, is apertium.m4 in ACLOCAL_PATH? See: http://wiki.apertium.org/wiki/Installation_troubleshooting])])

AP_CHECK_LING([1], [apertium-isl])

AP_MKINCLUDE

AC_OUTPUT([Makefile])
