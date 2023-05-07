#!/bin/bash

FILES_DIR="/home/brian/Downloads"
JEKYLL_DIR="../_files"

# Delete existing pages in _files directory
mkdir -p ${JEKYLL_DIR}
rm -rf ${JEKYLL_DIR}/*

# ls ~
# # Generate pages for all files in files directory
# find ${FILES_DIR} -type f | while read FILE
# do
#   # Get filename and path
#   FILENAME=$(basename -- "$FILE")
#   RELATIVE_PATH=$(dirname -- "$FILE")
#   ABSOLUTE_PATH=$(cd "$RELATIVE_PATH" && pwd)

#   # Generate permalink
#   PERMALINK=$(echo "$ABSOLUTE_PATH/$FILENAME" | sed 's|/|-|g;s|^-||')
  
#   # Generate markdown content with link to file
#   CONTENT="[Download $FILENAME]($FILE)"

#   # Create Jekyll page with permalink and content
#   mkdir -p "${JEKYLL_DIR}/${ABSOLUTE_PATH}"
#   echo "---" > "${JEKYLL_DIR}/${ABSOLUTE_PATH}/${FILENAME}.md"
#   echo "permalink: /${PERMALINK}/" >> "${JEKYLL_DIR}/${ABSOLUTE_PATH}/${FILENAME}.md"
#   echo "---" >> "${JEKYLL_DIR}/${ABSOLUTE_PATH}/${FILENAME}.md"
#   echo "$CONTENT" >> "${JEKYLL_DIR}/${ABSOLUTE_PATH}/${FILENAME}.md"
# done



# #!/bin/bash

# FILES_DIR="files"
# JEKYLL_DIR="_files"

# # Delete existing pages and index files in _files directory
# rm -rf ${JEKYLL_DIR}/*

# # Generate pages and index files for all files in files directory
# find ${FILES_DIR} -type f | while read FILE
# do
#   # Get filename and path
#   FILENAME=$(basename -- "$FILE")
#   RELATIVE_PATH=$(dirname -- "$FILE")
#   ABSOLUTE_PATH=$(cd "$RELATIVE_PATH" && pwd)

#   # Generate permalink
#   PERMALINK=$(echo "$ABSOLUTE_PATH/$FILENAME" | sed 's|/|-|g;s|^-||')
  
#   # Generate markdown content with link to file
#   CONTENT="[Download $FILENAME]($FILE)"

#   # Create Jekyll page with permalink and content
#   mkdir -p "${JEKYLL_DIR}/${ABSOLUTE_PATH}"
#   echo "---" > "${JEKYLL_DIR}/${ABSOLUTE_PATH}/${FILENAME}.md"
#   echo "permalink: "/${PERMALINK}/" >> ${JEKYLL_DIR}/${ABSOLUTE_PATH}/${FILENAME}.md"
#   echo "---" >> "${JEKYLL_DIR}/${ABSOLUTE_PATH}/${FILENAME}.md"
#   echo "$CONTENT" >> "${JEKYLL_DIR}/${ABSOLUTE_PATH}/${FILENAME}.md"

#   # Add file to index file for directory
#   INDEX_FILE="${JEKYLL_DIR}/${ABSOLUTE_PATH}/index.md"
#   echo "---" > "${INDEX_FILE}"
#   echo "title: "$ABSOLUTE_PATH" >> ${INDEX_FILE}"
#   echo "---" >> "${INDEX_FILE}"
#   echo "| Filename | Download Link |" >> "${INDEX_FILE}"
#   echo "|----------|---------------|" >> "${INDEX_FILE}"
#   echo "| $FILENAME | [Download](${PERMALINK}/) |" >> "${INDEX_FILE}"
# done

# # Generate index files for all directories in files directory
# find ${FILES_DIR} -type d | while read DIR
# do
#   # Get relative and absolute paths of directory
#   RELATIVE_PATH=$(realpath --relative-to="${FILES_DIR}" "${DIR}")
#   ABSOLUTE_PATH=$(cd "$DIR" && pwd)

#   # Create index file for directory
#   INDEX_FILE="${JEKYLL_DIR}/${RELATIVE_PATH}/index.md"
#   echo "---" > "${INDEX_FILE}"
#   echo "title: $ABSOLUTE_PATH" >> "${INDEX_FILE}"
#   echo "---" >> ${INDEX_FILE}
#   echo "| Filename | Download Link |" >> "${INDEX_FILE}"
#   echo "|----------|---------------|" >> "${INDEX_FILE}"

#   # Add all files in directory to index file
#   find ${DIR} -maxdepth 1 -type f | while read FILE
#   do
#     FILENAME=$(basename -- "$FILE")
#     PERMALINK=$(echo "$RELATIVE_PATH/$FILENAME" | sed 's|/|-|g;s|^-||')
#     echo "| $FILENAME | [Download](${PERMALINK}/) |" >> "${INDEX_FILE}"
#   done
# done


# Generate index files for all directories in files directory
find "${FILES_DIR}" -type d | while read DIR
do
  # Get relative and absolute paths of directory
  RELATIVE_PATH=$(realpath --relative-to="${FILES_DIR}" "${DIR}")
  ABSOLUTE_PATH=$(cd "${DIR}" && pwd)

  # Create index file for directory
  INDEX_FILE="${JEKYLL_DIR}/${RELATIVE_PATH}/index.md"
  mkdir -p "${JEKYLL_DIR}/${RELATIVE_PATH}"
  echo "---" > "${INDEX_FILE}"
  echo "title: $ABSOLUTE_PATH" >> "${INDEX_FILE}"
  echo "---" >> "${INDEX_FILE}"
  echo "| Filename | Download Link |" >> "${INDEX_FILE}"
  echo "|----------|---------------|" >> "${INDEX_FILE}"

  # Add all files in directory to index file
  find "${DIR}" -maxdepth 1 -type f | while read FILE
  do
    FILENAME=$(basename -- "$FILE")
    PERMALINK=$(echo "$RELATIVE_PATH/$FILENAME" | sed 's|/|-|g;s|^-||')
    echo "| $FILENAME | [Download](${FILES_DIR}/${RELATIVE_PATH}/${FILENAME}) |" >> "${INDEX_FILE}"
  done
done