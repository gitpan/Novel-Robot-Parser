
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "\345\260\217\350\257\264\347\253\231\347\202\271\350\247\243\346\236\220\345\274\225\346\223\216",
  "AUTHOR" => "Abby Pan <abbypan\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Novel-Robot-Parser",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Novel::Robot::Parser",
  "PREREQ_PM" => {
    "Encode::Detect::CJK" => "v2.0.2",
    "Encode::Locale" => "1.03",
    "File::Find::Rule" => "0.33",
    "HTML::TableExtract" => "2.11",
    "Moo" => "1.000007",
    "Web::Scraper" => "0.37"
  },
  "VERSION" => "0.06",
  "test" => {
    "TESTS" => ""
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



