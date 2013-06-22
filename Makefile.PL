
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
    "Encode::Detect::CJK" => 0,
    "Encode::Locale" => 0,
    "File::Find::Rule" => 0,
    "HTML::ElementTable" => 0,
    "HTML::TableExtract" => 0,
    "Moo" => 0,
    "URI" => 0,
    "Web::Scraper" => 0
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "0.10",
  "test" => {
    "TESTS" => ""
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



