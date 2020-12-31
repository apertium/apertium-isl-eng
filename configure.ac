AC_PREREQ(2.52)

AC_INIT([Apertium Icelandic-English], [0.1.1], [apertium-stuff@lists.sourceforge.net], [apertium-isl-eng], [https://wiki.apertium.org/wiki/Apertium-isl-eng])
AM_INIT_AUTOMAKE

AC_PROG_AWK

PKG_CHECK_MODULES(APERTIUM, apertium >= 3.7.1)
PKG_CHECK_MODULES(LTTOOLBOX, lttoolbox >= 3.5.3)
PKG_CHECK_MODULES(CG3, cg3 >= 1.3.2)

AC_ARG_WITH(icenlp,
            [AC_HELP_STRING([--with-icenlp=PATH], [(optional) path to IceNLP toolkit])],
            [with_icenlp=$withval],
            [with_icenlp=no]
           )

AM_CONDITIONAL([ICENLP], false)

m4_ifdef([AP_CHECK_LING],[],[AC_MSG_ERROR([AP_CHECK_LING not defined, is apertium.m4 in ACLOCAL_PATH? See: http://wiki.apertium.org/wiki/Installation_troubleshooting])])

AP_CHECK_LING([1], [apertium-isl], [0.1.1])

AP_MKINCLUDE

AC_OUTPUT([Makefile])
