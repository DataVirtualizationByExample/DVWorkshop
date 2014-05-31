## JBoss Data Virtualization Workshop
This directory contains all the labs to get familiar with installing and using JBoss Data Virtualization.
Stay tuned, more labs coming soon.

### Documentation

[Workshop in HTML format](http://htmlpreview.github.io/?https://raw.githubusercontent.com/DataVirtualizationByExample/DVWorkshop/master/docs/jboss-dv-workshop.html#_create_relational_model_from_wsdl)

[Workshop in PDF format](https://github.com/DataVirtualizationByExample/DVWorkshop/raw/master/docs/jboss-dv-workshop.pdf)

### How to build the labs
The labs are created in asciidoc using [asciidoctor](http://asciidoctor.org/).
To convert the labs into html you can use the following command in the docs directory:

        $ asciidoctor jboss-dv-workshop.adoc

For your convenience we added a convert.sh script which converts the labs from asciidoc into html, docbook and pdf.

        $ ./convert.sh

Note: To convert the labs into pdf one need to download [asciidoctor-fopub](https://github.com/asciidoctor/asciidoctor-fopub) and/or [asciidoctor-pdf](https://github.com/opendevise/asciidoctor-pdf). The convert.sh script contains an environment variable called FOPUB and ASCIIDOCTOR_PDF which needs to be set to the correct directory location where asciidoctor-fopub/pdf is installed.