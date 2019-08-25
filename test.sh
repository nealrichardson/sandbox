echo "% something"
FILE=$(ls foo*.bar 2> /dev/null)
if [ "$FILE" = "" ]; then
  FILE=$(ls READM* 2> /dev/null)
fi
echo $FILE
