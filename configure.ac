#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.


AC_PREREQ(2.52)

AC_INIT([apertium-is-en], [0.1.0], [hrafn65@users.sourceforge.net])
AM_INIT_AUTOMAKE([apertium-is-en], [0.1.0], no-define)
AC_PROG_LN_S
AC_PROG_AWK
AC_CONFIG_HEADER([config])

AC_DEFUN([PKG_CHECK_APERTIUM], [
  APERTIUM_VER=0
  PKG_CHECK_MODULES(APERTIUM, apertium-3.0 >= 3.0.0,
  [
    APERTIUM_VER=30
  ],
  [
    PKG_CHECK_MODULES(APERTIUM, apertium-3.1 >= 3.1.0)
    APERTIUM_VER=31
  ])
  AC_SUBST(APERTIUM_VER)
])

PKG_CHECK_APERTIUM

AC_SUBST(APERTIUM_VER)

AC_OUTPUT([Makefile])
