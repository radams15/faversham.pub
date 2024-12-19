use warnings;
use strict;

my $quality = 50;

for(<*.jpg>) {
    next if(/.*\.small.jpg/);

    if(/(.*).jpg/) {
        next if (-e "$1.small.jpg");

        system("convert $1.jpg -auto-orient -compress JPEG -quality $quality $1.small.jpg");
        unlink("$1.jpg");
    }
}
