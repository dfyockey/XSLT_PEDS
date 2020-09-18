# README for XSLT_PEDS

  Copyright © 2020 David Yockey
  
  Copying and distribution of this file, with or without modification,
  are permitted in any medium without royalty provided the copyright
  notice and this notice are preserved.
  
---
  
  ## Description
  
  XSLT_PEDS is a collection of scripts and XSLT formatting to facilitate
  viewing search results downloaded in XML format from the USPTO's
  Patent Examination Data System (https://ped.uspto.gov/peds/).

  ## Requirements & Recommendations

  ### Linux users
    - Xalan (may be listed in package managers as 'xalan' or 'xalan-c', required)
    - unzip (required)
    - zenity (recommended; omit for program feedback to appear in-terminal)

  ### Windows 10 users
    - WSL 1 or better (required)
    - WSL-compatible Linux (required)
    - Packages installed within Linux:
        - Xalan (may be listed in package managers as 'xalan' or 'xalan-c', required)
        - unzip (required)

  ### Mac OS X users
  XSLT_PEDS is untested on OS X but may work if Xalan and unzip are provided.
  If you test on OS X, please provide feedback about the results at
  https://github.com/dfyockey/XSLT_PEDS/issues so these instructions may be
  updated accordingly.

  ## Setup

  ### Linux users
  Simply unzip the downloaded XSLT_PEDS zip file into folder of your choice.

  If you are planning to use the Gnome Files file manager (and perhaps other
  FMs), you may need to change a preference to enable running XSLT_PEDS
  scripts from your file manager.
  
    In Gnome Files:
  
    1. Click ☰
    
    2. Click "Preferences"

    3. Click "Behavior"
    
    4. Under "Executable Text Files", select either "Run them" or
       "Ask what to do", whichever you prefer.
       
    5. Close the "Preferences" window.
    
  Note: Nothing tragic will happen if you try to run a script and the file
  manager isn't set up or able to do it. It'll just open a text editor
  showing program code.

  ### Windows 10 users
    1. Move the downloaded XSLT_PEDS zip file into folder of your choice.
    2. Run the command `unzip zipfile`,
       where "zipfile" is the name of the downloaded XSLT_PEDS zip file.
  
  ## Usage
  
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
  
     When run, the chosen unzipping script will act on the latest .zip
     file it finds in the XSLT_PEDS folder. The Html file, files, or
     folder containing Html files should appear in the XSLT_PEDS folder.
     Each of these files is formatted for viewing in any modern browser.
     
     Additionally, the downloaded .zip file should disappear and, if not
     already there, a zipTrash folder should appear. The unzipping
     scripts move downloaded .zip files into zipTrash upon completion.
     The downloaded .zip files are unchanged, so they can be used again if
     desired. You can retain or delete zipTrash or its contents as you
     wish.
     
     The unzipping scripts may be run either from a file manager or the
     command line. If run from the command line, the script name must be
     preceded by `./` (e.g. `./unzipa`). Also, the file to be unzipped may
     alternatively be provided as an argument when running from the
     command line.
     
  5. Open the generated Html files to view the formatted PEDS data.

  ## Viewing Options
  
  1. Click any Application Data heading in a generated Html file to hide
     all data sections in the file *except* Application Data sections. Click
     any Application Data heading again to show the hidden sections. This
     feature can be useful in browsing through a large collection of
     results to find applications of interest.
     
  2. Click any application title in a generated Html file to hide all
     *other* information in the file except that for the clicked title.
     Click the one remaining application title again to show the hidden
     information for the other titles. This feature can be useful for
     printing information for a single application to paper or PDF.
  
  ## Tips

  1. Depending on the file manager used, you may be able to select
     multiple generated Html files and hit "Enter" -- or open a context
     menu (i.e. "right-click menu") and click "Open" -- to open the files
     in a collection of (randomly-ordered) tabs.

  2. The Html files are completely portable; i.e. you can move them to
     any folder, email them to someone, etc.

---
