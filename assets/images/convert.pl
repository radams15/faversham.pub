#!/usr/bin/env perl

use warnings;
use strict;

my $quality = 20;

for(<*.jpg>) {
    next if(/.*\.webp/);

    if(/(.*).jpg/) {
        next if (-e "$1.webp");

        # system("convert $1.jpg -sampling-factor 4:2:0 -strip -quality $quality -interlace JPEG -colorspace RGB $1.small.jpg");
        system("cwebp -size 200000 -mt -m 6 -q 50 $1.jpg -o $1.webp");
        unlink("$1.jpg");
    }
}
