#!/usr/bin/env perl

use warnings;
use strict;

my $quality = 20;

for(<*.jpg>) {
    next if(/.*\.small.jpg/);

    if(/(.*).jpg/) {
        next if (-e "$1.small.jpg");

        system("convert $1.jpg -sampling-factor 4:2:0 -strip -quality $quality -interlace JPEG -colorspace RGB $1.small.jpg");
        unlink("$1.jpg");
    }
}
