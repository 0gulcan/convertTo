#!/bin/bash
echo "Enter your file's encoding(Default is ISO8859-9):"
read from
if [ -z "$from" ]
  then
    from="ISO8859-9"
fi
echo "Enter output encoding(Default is UTF-8):"
read to
if [ -z "$to" ]
  then
    to="UTF-8"
fi
echo "Enter file extesion(Default is srt):"
read extension
if [ -z "$extension" ]
  then
    extension="srt"
fi
for file in `find . -name \*.$extension`;
do
  echo " $file"
  mv $file $file.tmp
  iconv -f $from -t $to $file.tmp > $file
  rm -f $file.tmp
done

