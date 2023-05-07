#!/bin/bash

FILES_DIR="/home/brian/Downloads"
JEKYLL_DIR="../_files"

# Delete existing pages in _files directory
mkdir -p ${JEKYLL_DIR}
rm -rf ${JEKYLL_DIR}/*

mkdir -p ../assets/files/
rsync -a $1/ ../assets/files/

level=0;
# Generate index files for all directories in files directory
find "${FILES_DIR}" -type d | while read DIR
do
  # Get relative and absolute paths of directory
  RELATIVE_PATH=$(realpath --relative-to="${FILES_DIR}" "${DIR}")
  ABSOLUTE_PATH=$(cd "${DIR}" && pwd)

  # Create index file for directory
  mkdir -p "${JEKYLL_DIR}/${RELATIVE_PATH}"
  INDEX_FILE="${JEKYLL_DIR}/${RELATIVE_PATH}/index.md"
  echo "---" > "${INDEX_FILE}"
  permalink=$(echo "$ABSOLUTE_PATH" | sed "s|$FILES_DIR|files|")
  echo "permalink: $permalink" >> "${INDEX_FILE}"
  echo "title: $permalink" >> "${INDEX_FILE}"
  echo "layout: posts" >> "${INDEX_FILE}"
  echo "navBar: navBarNoHero" >> "${INDEX_FILE}"
  echo "---" >> "${INDEX_FILE}"


  if [ $level -gt 0 ]; then
    prevDir=$(echo "$permalink" | sed 's/\/[^\/]*$//')
    echo "<a class=\"button\" href=\"{{site.baseurl}}$prevDir\"><i class=\"fa fa-arrow-up\" aria-hidden=\"true\">..($prevDir)</i></a>" >> "${INDEX_FILE}"
   fi

  # List child directories in alphabetical order
  echo "## Directories" >> "${INDEX_FILE}"
  echo "" >> "${INDEX_FILE}"
  echo "| Directory |" >> "${INDEX_FILE}"
  echo "|-----------|" >> "${INDEX_FILE}"
  find "${DIR}" -maxdepth 1 -type d ! -path "${DIR}" | sort | while read CHILD_DIR
  do
    CHILD_NAME=$(basename -- "${CHILD_DIR}")
    CHILD_LINK=$(realpath --relative-to="${JEKYLL_DIR}/${RELATIVE_PATH}" "${CHILD_DIR}")
    permalink=$(echo "$CHILD_DIR"| sed "s|$FILES_DIR|files|")
    echo "| [$CHILD_NAME]({{site.baseurl}}$permalink/) |" >> "${INDEX_FILE}"
  done
  echo "| |" >> "${INDEX_FILE}"
  echo "" >> "${INDEX_FILE}"

  # List files in alphabetical order
  echo "## Files" >> "${INDEX_FILE}"
  echo "" >> "${INDEX_FILE}"
  echo "| Filename | Download Link |" >> "${INDEX_FILE}"
  echo "|----------|---------------|" >> "${INDEX_FILE}"
  find "${DIR}" -maxdepth 1 -type f | sort | while read FILE
  do
    FILENAME=$(basename -- "$FILE")
    PERMALINK=$(echo "$RELATIVE_PATH/$FILENAME" | sed 's|/|-|g;s|^-||')
    # echo "| $FILENAME | [Download](${FILES_DIR}/${RELATIVE_PATH}/${FILENAME}) |" >> "${INDEX_FILE}"
    tmp=$(echo "$RELATIVE_PATH/${FILENAME}" | sed 's/^\.\///')
    echo "| $FILENAME | [Download]({{site.baseurl}}assets/files/${tmp}/${FILENAME}) |" >> "${INDEX_FILE}"
  done
  echo "|||" >> "${INDEX_FILE}"
  echo "" >> "${INDEX_FILE}"
  ((level++))
done