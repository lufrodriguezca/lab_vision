# Warmup Questions

1.  What is the clone url of this repository?
    >   Answer: https://github.com/diego0020/lab_vision

2.  What is the output of the ``cal`` command?

    >   Answer: The call command displays a calendar and the date of Easter


# Homework Questions

1.  What is the ``grep``command?
    >   Answer: The ``grep`` command print lines matching a pattern

2.  What is a *makefile*?
    >   Answer: Makefile is a way to organize code compilation, is more complex than make

3.  What is *git*?
    >   Answer: *git* is a feature that allows to manage independently a file using a branching model. It is possible to have multiple branches of the same file to test, experiment, switch contents.

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   Answer: The ``-prune`` option of the ``find`` command exclude a directory within a directory tree. The following example will show all the files at the same level except than the file current directory: ``find . ! -name . -prune``

5.  Where is the file ``xxxxxx``
    >   Answer: ``find -name 'xxxxxx'``

6.  How many files with ``gnu`` in its name are in ``dir`` and ``/usr/src``
    >   Answer: ``find ~/dir  -name '*gnu*' | wc -l`` and ``find /usr/src -name '*gnu*' | wc -l``

7.  How many files contain ``gpl`` inside in ``dir``
    >   Answer: ``cd dir `` (enter key) ``grep -l "gpl" * | wc -l``

8.  What does the ``cut`` command do?
    >   Answer: ``whatis cut`` generates the following output: ``remove sections from each line of a file or files``

9.  What does the ``wget`` command do?
    >   Answer: ``wget`` command is a non interactive network downloader. It supports HTTP, HTTPS, FTP protocols and HTTP proxies

10.  What does the ``diff`` command do?
    >   answer: the ``diff`` command compares files line by line

11.  How many users exist in *Guitaca*?
    >   Answer: 

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   Answer:

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   Answer:

14.  What is the name of the linux distribution running on *Guitaca*?
    >   Answer: linux gnome

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github
	> Answer: Code on the script: 
	``#!/bin/bash
	cd ~
	$(find folderWithImagesToCheck/  -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 15 > dupes.txt)
	wc -l dupes.txt
	cat dupes.txt``
	Part of the code was taken from: http://www.linux.com/learn/tutorials/774031-how-to-sort-and-remove-duplicate-photos-in-linux
16. How many unique images are in the ``sipi_images`` folder?
    >   Answer: ``find sipi_images/  -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 15 > dupes.txt`` enter ``wc -l dupes.txt`` enter


    
