Icelandic and English: `apertium-isl-eng`
===============================================================================

This is an Apertium language pair for translating from Icelandic to
English. What you can use this language package for:

* Translating from Icelandic to English
* Morphological analysis of Icelandic
* Part-of-speech tagging of Icelandic

For information on the latter two points, see subheading "For more
information" below.

Requirements
-------------------------------------------------------------------------------

You will need the following software installed:

* lttoolbox (>= 3.3.0)
* apertium (>= 3.3.0)
* vislcg3 (>= 0.9.9.10297)

If this does not make any sense, we recommend you look at: www.apertium.org.

Compiling
-------------------------------------------------------------------------------

Given the requirements being installed, you should be able to just run:

```console
$ ./configure
$ make
# make install
```

You can use `./autogen.sh` instead of `./configure` in case you're compiling
from source. If you installed any prerequisite language packages using a
`--prefix` with `./configure`, make sure to use the same `--prefix` when running
`./configure` here.

Testing
-------------------------------------------------------------------------------

If you are in the source directory after running make, the following
commands should work:

```console
$ echo "gamli maðurinn borðaði kalda súpu með mjög góðri lyst" | apertium -d . isl-eng
The old man ate cold soup with very good appetite
```

After installing somewhere in `$PATH`, you should be able to do e.g.

```console
$ echo "gamli maðurinn borðaði kalda súpu með mjög góðri lyst" | apertium isl-eng
The old man ate cold soup with very good appetite
```

The following commands run tests which are on the Apertium wiki page:

`$ sh regression-tests.sh`

`$ sh pending-tests.sh`

Files and data
-------------------------------------------------------------------------------
* [`apertium-isl-eng.eng.dix`](apertium-isl-eng.eng.dix) - Monolingual dictionary for English

* [`apertium-isl-eng.isl-eng.dix`](apertium-isl-eng.isl-eng.dix) - Bilingual dictionary

* [`apertium-isl-eng.isl-eng.rlx`](apertium-isl-eng.isl-eng.rlx) - Constraint Grammar for Icelandic
* [`apertium-isl-eng.isl-eng.t0x`](apertium-isl-eng.isl-eng.t0x) - Pre-transfer rules for translating into English
* [`apertium-isl-eng.isl-eng.t1x`](apertium-isl-eng.isl-eng.t1x) - Transfer rules for translating into English
* [`apertium-isl-eng.isl-eng.t2x`](apertium-isl-eng.isl-eng.t2x) - Interchunk rules for translating into English
* [`apertium-isl-eng.isl-eng.t3x`](apertium-isl-eng.isl-eng.t3x) - Interchunk rules for translating into English
* [`apertium-isl-eng.isl-eng.t4x`](apertium-isl-eng.isl-eng.t4x) - Postchunk rules for translating into English
* [`apertium-isl-eng.isl-eng.lrx`](apertium-isl-eng.isl-eng.lrx) - Lexical selection rules for translating into English

* [`modes.xml`](modes.xml) - Translation modes

For more information
-------------------------------------------------------------------------------

* http://wiki.apertium.org/wiki/Installation
* http://wiki.apertium.org/wiki/apertium-isl-eng
* http://wiki.apertium.org/wiki/Using_an_lttoolbox_dictionary

Help and support
-------------------------------------------------------------------------------

If you need help using this language pair or data, you can contact:

* Mailing list: apertium-stuff@lists.sourceforge.net
* IRC: `#apertium` on irc.freenode.net (irc://irc.freenode.net/#apertium)

See also the file [`AUTHORS`](AUTHORS), included in this distribution.
