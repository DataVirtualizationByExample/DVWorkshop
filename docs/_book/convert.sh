#
# ./convert.sh
#
# or
#
# ./convert.sh html,pdf
#
# ...where the first argument is a comma-delimited list of formats

# Program paths
ASCIIDOCTOR=asciidoctor
FOPUB=~/Projects/git/asciidoctor-fopub/fopub
ASCIIDOCTOR_PDF=~/Projects/git/asciidoctor-pdf/bin/asciidoctor-pdf

# File names
MASTER_ADOC=jboss-dv-workshop.adoc
MASTER_DOCBOOK=${MASTER_ADOC/.adoc/.xml}

if [[ ! -f $MASTER_ADOC ]]; then
   echo "Unable to process file $MASTER_ADOC - File not found..."
   exit 0;
fi

# Command options
SHARED_OPTIONS='-a numbered -a experimental -a source-highlighter=coderay -a imagesdir=images'

# Formats
if [ ! -z $1 ]; then
  read -a FORMATS <<<$(IFS=','; echo $1)
else
  FORMATS=(html
docbook
)
fi

for f in ${FORMATS[*]}; do
  if [ $f == 'html' ]; then
    echo "Converting to HTML ..."
    $ASCIIDOCTOR -v $SHARED_OPTIONS $MASTER_ADOC
  elif [ $f == 'docbook' ]; then
    echo "Converting to DocBook ..."
    $ASCIIDOCTOR -b docbook $SHARED_OPTIONS $MASTER_ADOC
  elif [ $f == 'fopdf' ]; then
    echo "Converting to FO-PDF ..."
    $FOPUB $MASTER_DOCBOOK
  elif [ $f == 'pdf' ]; then
    echo "Converting to PDF ..."
    $ASCIIDOCTOR_PDF $SHARED_OPTIONS $MASTER_ADOC
  fi
done

exit 0
