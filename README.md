README for XSLT_PEDS

  Copyright © 2020 David Yockey
  
  Copying and distribution of this file, with or without modification,
  are permitted in any medium without royalty provided the copyright
  notice and this notice are preserved.
  
<hr />
  
  ** Description **
  
  XSLT_PEDS is a collection of scripts and XSLT formatting to facilitate
  viewing search results downloaded in XML format from the USPTO's
  Patent Examination Data System (https://ped.uspto.gov/peds/).
  

  ** Requirements & Recommendations **
  
  The following software is required or recommended for use with XSLT_PEDS:
  
    - Xalan (may be listed in package managers as 'xalan-c', required)
    - Xerces (may be listed in package managers as 'xerces-c', required)
    - unzip (required)
    - zenity (recommended)

    
  ** Setup **

  Simply unzip the downloaded XSLT_PEDS zip file into folder of your choice.
  
  
  ** Usage **
  
  1. Perform a search on the USPTO's Patent Examination Data System at
  https://ped.uspto.gov/peds/.
  
  2. Request and download the resulting data in XML format.
    
  3. Move the downloaded .zip file to your XSLT_PEDS folder.
  
  4. Run the unzipping script of your choice depending on the desired
     form of the results:
     
         unzipa - Unzip All: Unzips a PEDS collection of Xml files and
                  creates from them a collection of Html files in the
                  XSLT_PEDS folder, each Html file having a unique name.
         
         unzipf - Unzip to Folder: Unzips a PEDS collection of Xml files
                  and creates from them a collection of Html files in a
                  new folder having a unique name.
         
         unzipo - Unzip to One - Unzips a PEDS collection of Xml files
                  and combines them into one uniquely-named Html file
                  located in the XSLT_PEDS folder.
  
     When run, the choosen unzipping script will act on the latest .zip
     file it finds in the XSLT_PEDS folder. The Html file, files, or
     folder containing Html files should appear in the XSLT_PEDS folder.
     Each of these files is formatted for viewing in any modern browser.
     
     Additionally, the downloaded .zip file should disappear and, if not
     already there, a zipTrash folder should appear. The unzipping
     scripts move downloaded .zip files into zipTrash upon completion.
     The downloded .zip files are unchanged, so they can be used again if
     desired. You can retain or delete zipTrash or its contents as you
     wish.
     
     The unzipping scripts may be run either from a file manager or the
     command line. If run from the command line, the file to be unzipped
     may alternatively be provided as an argument.
     
  5. Open one of the generated Html files to view the formatted PEDS data.
  
  6. Depending on the file manager used, you may be able to select
     multiple generated Html files and hit "Enter" -- or open a context
     menu (i.e. "right-click menu") and click "Open" -- to open the files
     in a collection of (randomly-ordered) tabs.
  
  7. The Html files are completely portable (i.e. you can move them to
     any folder, email them to someone, etc.)

<hr />

  If you find XSLT_PEDS of use and would like to offer thanks or support,
  I'd be thrilled if you were to
  
  <a href='https://ko-fi.com/T6T61X3W6' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi1.png?v=2' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>
