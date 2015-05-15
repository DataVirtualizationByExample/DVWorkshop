## JBoss Data Virtualization Workshop
This directory contains all the labs to get familiar with installing and using JBoss Data Virtualization.
Stay tuned, more labs coming soon.

### Documentation

[Workshop in HTML format](http://htmlpreview.github.io/?https://raw.githubusercontent.com/DataVirtualizationByExample/DVWorkshop/master/docs/jboss-dv-workshop.html)

[Workshop in DocBook format](https://github.com/DataVirtualizationByExample/DVWorkshop/raw/master/docs/jboss-dv-workshop.xml)

### How to build the labs
The labs are created in asciidoc using [asciidoctor](http://asciidoctor.org/).
To convert the labs into html you can use the following command in the docs directory:

        $ asciidoctor jboss-dv-workshop.adoc

For your convenience we added a convert.sh script which converts the labs from asciidoc into html and docbook and pdf.

        $ ./convert.sh

