FILE=$(ls foo*.bar 2> /dev/null)
if [ "$FILE" = "" ]; then
  echo "File not found"
else
  FILE=$(ls READM* 2> /dev/null)
  echo $FILE
fi
