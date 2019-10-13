---
layout: post
title: "The Text Editing Kata - Challenge Two"
---

Using the editor/tools you currently use on your project. 
Convert this list of strings into the expected CSV output. 

For example.

{% highlight csv %}
DDBQRGGR,TVJWJMZJ
TNJQCMDP,MBXHDDJB
{% endhighlight %}

becomes:

{% highlight csv %}
1,DDBQRGGR
1,TVJWJMZJ
2,TNJQCMDP
2,MBXHDDJB
{% endhighlight %}

### The List

{% highlight csv %}
DDBQRGGR,TVJWJMZJ
TNJQCMDP,MBXHDDJB
LKZPMTTR,CMDWBKSS
GZVCMQPK,PHJFKNLG
TXXZSXZB,TXXZSXZB
KLCJFKJB,LFJPJRDX,RHXXQDPQ
LZPFGRSL,BTSDJPXM,GNHVHVWK,NHGBCHDC
ZBWDVCLM,SQBSTPMP
KZFTCFGB,XMGKCWJG
JQRBKHBM,KMLVMMPL,VJWPZQKF
BMRDFKCF,BSWVLJCJ
KDDRTMZZ,ZPZWWKMZ
JTFHRLMW,XXZSDZFJ,SNNCRVXT
TCNHKSFH,TGFDNNVC
JSGLRCQK,XVQJNPDR
VQFXSTZB,NZMBQQPW
LWNVLTWM,PNKWKHRW
FLRZJBMX,NMXVKHSL,LKHNMWST
SSTZZZCX,DHDKSHDT
ZNQTXLQS,KJJTKHKD
JMCRXSGP,RJXCDZNC
ZXLZBBQN,FCMRXGMM
WCKXQWBP,THPNSBVS
{% endhighlight %}

### The expected result

{% highlight csv %}
1,DDBQRGGR
1,TVJWJMZJ
2,TNJQCMDP
2,MBXHDDJB
3,LKZPMTTR
3,CMDWBKSS
4,GZVCMQPK
4,PHJFKNLG
5,TXXZSXZB
5,TXXZSXZB
6,KLCJFKJB
6,LFJPJRDX
6,RHXXQDPQ
7,LZPFGRSL
7,BTSDJPXM
7,GNHVHVWK
7,NHGBCHDC
8,ZBWDVCLM
8,SQBSTPMP
9,KZFTCFGB
9,XMGKCWJG
10,JQRBKHBM
10,KMLVMMPL
10,VJWPZQKF
11,BMRDFKCF
11,BSWVLJCJ
12,KDDRTMZZ
12,ZPZWWKMZ
13,JTFHRLMW
13,XXZSDZFJ
13,SNNCRVXT
14,TCNHKSFH
14,TGFDNNVC
15,JSGLRCQK
15,XVQJNPDR
16,VQFXSTZB
16,NZMBQQPW
17,LWNVLTWM
17,PNKWKHRW
18,FLRZJBMX
18,NMXVKHSL
18,LKHNMWST
19,SSTZZZCX
19,DHDKSHDT
20,ZNQTXLQS
20,KJJTKHKD
21,JMCRXSGP
21,RJXCDZNC
22,ZXLZBBQN
22,FCMRXGMM
23,WCKXQWBP
23,THPNSBVS
{% endhighlight %}

Good luck!