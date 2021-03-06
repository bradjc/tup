#! /bin/sh -e
# tup - A file-based build system
#
# Copyright (C) 2009-2012  Mike Shal <marfey@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# Test the glob match flag (%g)

. ./tup.sh
cat > Tupfile << HERE
: *_*.txt |> touch %(gs--)_%(g01sTUP).bin |> %(g000s--)_%(g1sTUP).bin
HERE
tup touch a_text.txt b_text.txt c_text.txt
tup parse
tup_object_exist . a--b--c_textTUPtextTUPtext.bin
tup upd
tup_object_exist . "touch a--b--c_textTUPtextTUPtext.bin"

eotup
