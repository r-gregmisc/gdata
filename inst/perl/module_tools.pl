#!/usr/bin/perl

BEGIN {
  # Add current path to perl library search path
  use FindBin qw($Bin); # where was script installed? 
  use lib $Bin; # use that dir for libs, too docstore.mik.ua/orelly/perl2/prog/ch31_13.htm
}

use strict;
use warnings;
use Data::Dumper;
use Cwd;

sub check_modules(;$)
  {
    my(
       $VERBOSE, 
       $HAS_Spreadsheet_ParseExcel,
       $HAS_Compress_Raw_Zlib,
       $HAS_Spreadsheet_ParseXLSX
      );
    $VERBOSE=$_[0];

    # Check if we can load the libraries we need
    eval
      {
        require Spreadsheet::ParseExcel;
	      use Spreadsheet::ParseExcel::Utility qw(ExcelFmt);
        $HAS_Spreadsheet_ParseExcel=1;
        print "Loaded Spreadsheet::ParseExcel\n" if $VERBOSE;
      };
    eval
      {
        require Compress::Raw::Zlib;
        $HAS_Compress_Raw_Zlib=1;
        print "Loaded Compress::Raw::Zlib\n" if $VERBOSE;
      };
    eval
      {
        require Spreadsheet::ParseXLSX;
        $HAS_Spreadsheet_ParseXLSX=1;
        print "Loaded Spreadsheet::ParseXLSX\n" if $VERBOSE;
      };

    if($VERBOSE)
      {
        print "WARNING: Unable to load Spreadsheet::ParseExcel perl module! \n"
	  if !$HAS_Spreadsheet_ParseExcel;
        print "WARNING: Unable to load Compress::Raw::Zlib perl module! \n"
	  if ! $HAS_Compress_Raw_Zlib;
        print "WARNING: Unable to load Spreadsheet::ParseXLSX perl module! \n"
	  if ! $HAS_Spreadsheet_ParseXLSX;
      }

    return $HAS_Spreadsheet_ParseExcel, $HAS_Compress_Raw_Zlib, $HAS_Spreadsheet_ParseXLSX;
  }

sub check_modules_and_notify()
  {
    my( 
       $HAS_Spreadsheet_ParseExcel,
       $HAS_Compress_Raw_Zlib,
       $HAS_Spreadsheet_ParseXLSX) = check_modules(0);

    $HAS_Spreadsheet_ParseExcel or
      warn("WARNING: Perl module Spreadsheet::ParseExcel cannot be loaded.\n");

    $HAS_Compress_Raw_Zlib or
      warn("WARNING: Perl module Compress::Raw::Zlib cannot be loaded.\n");

    $HAS_Spreadsheet_ParseXLSX or
      warn("WARNING: Perl module Spreadsheet::ParseXLSX cannot be loaded.\n");

    ($HAS_Compress_Raw_Zlib && $HAS_Spreadsheet_ParseXLSX ) or
      warn("WARNING: Microsoft Excel 2007 'XLSX' formatted files will not be processed.\n");
      
    return $HAS_Spreadsheet_ParseExcel, $HAS_Compress_Raw_Zlib, $HAS_Spreadsheet_ParseXLSX;
  }

sub install_modules(;$)
  {
    my($VERBOSE, $mod, $obj, $here);
    
    $VERBOSE=$_[0];
    $here = dirname($0);

    # load the module
    require CPANPLUS;
    
    # install the libraries we want
    #  Spreadsheet::ParseExcel
    #  Spreadsheet::ParseXLSX
    for $mod (qw( 
      Compress::Raw::Zlib 
      )){
        print "Installing module '$mod' into '$here'.." if $VERBOSE;
        CPANPLUS::install("$mod");
        print "Done." if $VERBOSE;
    }

  }

1;
