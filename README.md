# README for XSLT_PEDS

  Copyright © 2020 David Yockey
  
  Copying and distribution of this file, with or without modification,
  are permitted in any medium without royalty provided the copyright
  notice and this notice are preserved.
  
---
  
  ## Description
  
  XSLT_PEDS is a collection of Bash scripts and XSLT formatting to
  facilitate viewing search results downloaded in XML format from the
  USPTO's Patent Examination Data System (https://ped.uspto.gov/peds/).


  ## Requirements & Recommendations

  The following are recommended configurations for different systems.
  All recommendations & requirements are available cost-free.

  ### Linux users
   - Xalan (required; listed in package managers as 'xalan' or 'xalan-c')
   - unzip (required)
   - zenity (recommended; omit for program feedback to appear in-terminal)

  ### Microsoft Windows 10 users
   - Windows Subsystem for Linux (WSL 1 or 2 is required; WSL 1 is recommended for setup simplicity)
   - WSL-compatible Linux (required; the latest LTS (long-term support) version of Ubuntu is recommended)
   - Packages installed within WSL-compatible Linux:
     - Xalan (required; e.g. to install in Ubuntu, run the command `sudo apt-get install xalan`)
     - unzip (required; e.g. to install in Ubuntu, run the command `sudo apt-get install unzip`)

   For detailed WSL setup information from Microsoft, please see:
   - [Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

  ### Microsoft Windows 10, 8.1, 8, 7, or Vista users
  Windows 10 users may prefer the following configuration if they already use Cygwin for other purposes.
  XSLT_PEDS is untested on Windows prior to 10, but may work with this arrangement as well. If you test on
  Windows prior to 10, please provide feedback about the results at https://github.com/dfyockey/XSLT_PEDS/issues
  so these instructions may be updated accordingly.
   - Cygwin (required)
     - sed (required; select in Cygwin setup)
     - unzip (required; select in Cygwin setup)
   - MSXML 6.0 (`msxml6.msi` required for 32-bit PCs; `msxml6_x64.msi` required for most 64-bit PCs; `msxml6_ia64.msi` required for 64-bit PCs with Itanium processors)
   - MSXSL (`msxsl.exe` required; should be placed in C:\Windows\System32)

   For downloads and more information please see:
   - [Cygwin](https://www.cygwin.com/)
   - [Microsoft Core XML Services (MSXML) 6.0](https://www.microsoft.com/en-us/download/details.aspx?id=3988)
   - [Command Line Transformation Utility (msxsl.exe)](https://www.microsoft.com/en-us/download/details.aspx?id=21714)

  ### Mac OS X users
  XSLT_PEDS is untested on OS X but may work if Xalan and unzip are provided.
  If you test on OS X, please provide feedback about the results at
  https://github.com/dfyockey/XSLT_PEDS/issues so these instructions may be
  updated accordingly.


  ## Setup

  ### Linux users
  Simply unzip the downloaded XSLT_PEDS zip file into the folder of your choice.

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

  ### Windows users
  
  1. Move the downloaded XSLT_PEDS zip file into folder of your choice.
  
  2. Extract the contents of the zip file into your chosen folder; if the
  destination folder suggested by Windows ends with the name of the zip file,
  delete the zip file name from the indicated destination folder before extracting.

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

     In Linux, the unzipping scripts may be run either from a file manager
     or the command line. In Windows, the unzipping scripts will only run
     from the command line within WSL or Cygwin. In either case, a script
     name must be preceded by `./` (e.g. `./unzipa`) when run from the
     command line.

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
     
     The file to be unzipped may alternatively be provided as an argument
     when running from the command line, in which case it will not be moved
     upon completion.
     
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

  ## Upgrading to Latest Release

  To upgrade to the latest release of XSLT_PEDS, rename or delete the
  current XSLT_PEDS folder and replace it by unzipping the new release
  zip file as described in the **Setup** section above.

  ## Tips

  1. Depending on the file manager used, you may be able to select
     multiple generated Html files and hit "Enter" -- or open a context
     menu (i.e. "right-click menu") and click "Open" -- to open the files
     in a collection of (randomly-ordered) tabs.

  2. The Html files are completely portable; i.e. you can move them to
     any folder, email them to someone, etc.

---
