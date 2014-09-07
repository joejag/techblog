---
layout: page
status: publish
published: true
title: 'Coding Dojo: Bank OCR'
author:
  display_name: Joe Wright
  login: joejag
  email: joe@joejag.com
  url: ''
author_login: joejag
author_email: joe@joejag.com
wordpress_id: 279
wordpress_url: http://code.joejag.com/?page_id=279
date: '2009-09-22 17:44:03 +0100'
date_gmt: '2009-09-22 17:44:03 +0100'
categories: []
tags: []
comments: []
---
<h2>Bank OCR</h2>
<p>Your manager has recently purchased a machine that assists in reading letters and faxes sent in by branch offices.  The machine scans the paper documents, and produces a file with a number of entries. You will write a program to parse this file.</p>

<h3>Specification</h3>

<h4>User Story 1</h4>
<p>The following format is created by the machine:</p>

<pre style="background-color: #002b36; color: #fff">
    _  _     _  _  _  _  _
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _|
</pre>

<p>Each entry is 4 lines long, and each line has 27 characters. The first 3 lines of each entry contain an account number written using pipes and underscores, and the fourth line is blank. </p>
<p>Each account number should have 9 digits, all of which should be in the range 0-9. A normal file contains around 500 entries.</p>
<p>Write a program that can take this file and parse it into actual account numbers. </p>
<h4>User Story 2</h4>
<p>You find the machine sometimes goes wrong while scanning. You will need to validate that the numbers are valid account numbers using a checksum. This can be calculated as follows: </p>

<pre style="background-color: #002b36; color: #fff">
account number:  3  4  5  8  8  2  8  6  5
position names:  d9 d8 d7 d6 d5 d4 d3 d2 d1

checksum calculation:
((1*d1) + (2*d2) + (3*d3) + ... + (9*d9)) mod 11 == 0
</pre>

<h4>User Story 3</h4>
<p>Your boss is keen to see your results. He asks you to write out a file of your findings, one for each input file, in this format:</p>

<pre style="background-color: #002b36; color: #fff">
457508000
664371495 ERR
86110??36 ILL
</pre>

<p>The output file has one account number per row. If some characters are illegible, they are replaced by a ?. In the case of a wrong checksum, or illegible number, this is noted in a second column indicating status.</p>

<h4>User Story 4</h4>
<p>It turns out that often when a number comes back as ERR or ILL it is because the scanner has failed to pick up on one pipe or underscore for one of the figures. For example:</p>
<pre style="background-color: #002b36; color: #fff">
    _  _  _  _  _  _     _
|_||_|| || ||_   |  |  ||_
  | _||_||_||_|  |  |  | _|
</pre>

<p>The 9 could be an 8 if the scanner had missed one |. Or the 0 could be an 8. Or the 1 could be a 7. The 5 could be a 9 or 6. So your next task is to look at numbers that have come back as ERR or ILL, and try to guess what they should be, by adding or removing just one pipe or underscore. </p>
<p>If there is only one possible number with a valid checksum, then use that. If there are several options, the status should be AMB. If you still can't work out what it should be, the status should be reported ILL.</p>

<h3>Example input and output</h3>

<h4>User Story 1</h4>
<pre style="background-color: #002b36; color: #fff">
 _  _  _  _  _  _  _  _  _
| || || || || || || || || |
|_||_||_||_||_||_||_||_||_|

=> 000000000

  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |

=> 111111111

 _  _  _  _  _  _  _  _  _
 _| _| _| _| _| _| _| _| _|
|_ |_ |_ |_ |_ |_ |_ |_ |_ 

=> 222222222

 _  _  _  _  _  _  _  _  _
 _| _| _| _| _| _| _| _| _|
 _| _| _| _| _| _| _| _| _|

=> 333333333

|_||_||_||_||_||_||_||_||_|
  |  |  |  |  |  |  |  |  |

=> 444444444

 _  _  _  _  _  _  _  _  _
|_ |_ |_ |_ |_ |_ |_ |_ |_
 _| _| _| _| _| _| _| _| _|

=> 555555555

 _  _  _  _  _  _  _  _  _
|_ |_ |_ |_ |_ |_ |_ |_ |_
|_||_||_||_||_||_||_||_||_|

=> 666666666

 _  _  _  _  _  _  _  _  _
  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |

=> 777777777

 _  _  _  _  _  _  _  _  _
|_||_||_||_||_||_||_||_||_|
|_||_||_||_||_||_||_||_||_|

=> 888888888

 _  _  _  _  _  _  _  _  _
|_||_||_||_||_||_||_||_||_|
 _| _| _| _| _| _| _| _| _|

=> 999999999

    _  _     _  _  _  _  _
  | _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _| 

=> 123456789
</pre>

<h4>User Story 2</h4>
<pre style="background-color: #002b36; color: #fff">
Valid:
711111111
123456789
490867715

Invalid:
888888888
490067715
012345678
</pre>

<h4>User Story 3</h4>
<pre style="background-color: #002b36; color: #fff">
 _  _  _  _  _  _  _  _
| || || || || || || ||_   |
|_||_||_||_||_||_||_| _|  |

=> 000000051
    _  _  _  _  _  _     _
|_||_|| || ||_   |  |  | _
  | _||_||_||_|  |  |  | _|

=> 49006771? ILL
    _  _     _  _  _  _  _
  | _| _||_| _ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _ 

=> 1234?678? ILL
</pre>

<h4>User Story 4</h4>
<pre style="background-color: #002b36; color: #fff">

  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |

=> 711111111
 _  _  _  _  _  _  _  _  _
  |  |  |  |  |  |  |  |  |
  |  |  |  |  |  |  |  |  |

=> 777777177
 _  _  _  _  _  _  _  _  _
 _|| || || || || || || || |
|_ |_||_||_||_||_||_||_||_|

=> 200800000
 _  _  _  _  _  _  _  _  _
 _| _| _| _| _| _| _| _| _|
 _| _| _| _| _| _| _| _| _|

=> 333393333
 _  _  _  _  _  _  _  _  _
|_||_||_||_||_||_||_||_||_|
|_||_||_||_||_||_||_||_||_|

=> 888888888 AMB ['888886888', '888888880', '888888988']
 _  _  _  _  _  _  _  _  _
|_ |_ |_ |_ |_ |_ |_ |_ |_
 _| _| _| _| _| _| _| _| _|

=> 555555555 AMB ['555655555', '559555555']
 _  _  _  _  _  _  _  _  _
|_ |_ |_ |_ |_ |_ |_ |_ |_
|_||_||_||_||_||_||_||_||_|

=> 666666666 AMB ['666566666', '686666666']
 _  _  _  _  _  _  _  _  _
|_||_||_||_||_||_||_||_||_|
 _| _| _| _| _| _| _| _| _|

=> 999999999 AMB ['899999999', '993999999', '999959999']
    _  _  _  _  _  _     _
|_||_|| || ||_   |  |  ||_
  | _||_||_||_|  |  |  | _|

=> 490067715 AMB ['490067115', '490067719', '490867715']
    _  _     _  _  _  _  _
 _| _| _||_||_ |_   ||_||_|
  ||_  _|  | _||_|  ||_| _| 

=> 123456789
 _     _  _  _  _  _  _
| || || || || || || ||_   |
|_||_||_||_||_||_||_| _|  |

=> 000000051
    _  _  _  _  _  _     _
|_||_|| ||_||_   |  |  | _
  | _||_||_||_|  |  |  | _|

=> 490867715 
</pre>
