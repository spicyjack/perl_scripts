#!/usr/bin/perl -w

# created 11/22/00 for makeing web pages out of directories of pictures
# (C) 1999 by Brian Manning <brian@sunset-cliffs.org>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA

my @filedir= <*.jpg>;
my $start = time;
my $counter = 0;
my $row = 1;
my $column = 1;

open (OUT, "> index.html");

my $head = <<EOHEAD;
<html>
<head>
<title>Thumbnail Page</title>
  <link rel="stylesheet" href="css/lightbox.min.css">
  <style>
   body {
      background-color: #332200;
      color: white;
   }
   h1 {
      color: white;
   }
   </style>
</head>
<body>

<section>
   <h3>Some header text here</h3>

   <p>Click on any of the images below to view the images in a lightbox.</p>

   <div>
EOHEAD

print OUT $head;

foreach my $filename (@filedir) {
   print "File: $filename\n";
   my $sm_name = $filename;
   $sm_name =~ s/\.jpg$/.sm.jpg/;
      print "- Resizing $filename to $sm_name\n";
my $img_link = <<EOIMG;
      <a href="$filename" data-lightbox="pix"
         data-tіtle="Click anywhere outside the image or the X to the right to close.">
         <img src="$sm_name" alt="" /></a>
EOIMG
   print OUT $img_link;
}
my $tail = <<EOTAIL;
   </div>
</section>

   <script src="js/lightbox-plus-jquery.min.js"></script>

</body>
</html>
EOTAIL

   print OUT $tail;
