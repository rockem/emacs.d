#!/usr/bin/perl

use LWP::Simple;

$URL = "http://www.pkmeco.com/seinfeld/";

@chapters = getAllChapterNames();

# fetch each page and print to std out
 foreach $chapter (@chapters) {
   $quotes = getUrl($URL . $chapter);
   print stripHtml($quotes) . "---\n";
   die;
}

sub getAllChapterNames {
  my($content, @chapters);
  $content = getUrl($URL);
  @chapters = $content =~ m{\w+\.htm}gx;
  shift @chapters; # remove the first link 
  return @chapters;
}

sub getUrl {
  my($url) = @_;
  my($content);
  unless(defined($content = get $url)) {
    die "ERROR! could not get $URL\n";
  }
  return $content;
}

sub stripHtml {
  my($html) = @_;
  $html = substr($html, index($html, "<hr>")); # delete the header
  $html =~ s/&quot;/"/g;                       # convert quotes
  $html =~ s/<[^>]+>//g;                       # delete html tags
  $html =~ s/\s+/ /g;                          # trim spaces
  $html =~ s/&nbsp/\n---\n/g;                  # insert --- between quotes
  $html =~ s/(\.\")/$1\n/g;                    # insert \n in the end of a sentence
  $html =~ s/(\!\")/$1\n/g;                    # same
  $html =~ s/(\?\")/$1\n/g;                    # same
  $html =~ s/;//g;                             # remove all the ;
  $html = substr($html, 1, index($html, "\n---\n \n---")); #get rid of the footer

  return $html;
}
