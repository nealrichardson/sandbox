FILE=$(ls foo*.bar)
if [ "$FILE" = "" ]; then
  echo "File not found"
else
  FILE=$(ls READM*)
  echo $FILE
fi
