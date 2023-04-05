#!/usr/bin/perl

BEGIN {
  use File::Basename;
  # Add current path to perl library search path
  use lib dirname($0);
}

require 'module_tools.pl';

my( $HAS_Spreadsheet_ParseExcel, $HAS_Compress_Raw_Zlib, $HAS_Spreadsheet_ParseXLSX);

# check if we need to do anything

($HAS_Spreadsheet_ParseExcel, 
 $HAS_Compress_Raw_Zlib, 
 $HAS_Spreadsheet_ParseXLSX) = check_modules(1);

# ParseExcel and ParseXLSX should already be available
# in this directory, so don't do any installs
# unless Zlib isn't available
install_modules() unless 
  $HAS_Spreadsheet_ParseExcel &&
  $HAS_Compress_Raw_Zlib &&
  $HAS_Spreadsheet_ParseXLSX
  ;
