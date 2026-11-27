
# Make the MinIO client available
export PATH="$HOME/minio-binaries:$PATH"

# Install it only if it is missing
if ! command -v mc >/dev/null 2>&1; then
    echo "Installing MinIO client..."
    mkdir -p "$HOME/minio-binaries"

    curl -fL \
      "https://github.com/minio/mc/releases/download/RELEASE.2025-08-13T08-35-41Z/mc.linux-amd64.RELEASE.2025-08-13T08-35-41Z" \
      -o "$HOME/minio-binaries/mc" || exit 1

    chmod +x "$HOME/minio-binaries/mc" || exit 1
fi

# Stop immediately if the client cannot run
mc --version || exit 1

#!/usr/bin/env bash
echo "Executing the download_data.sh script"

# === Description ===
# This script downloads a data file from an S3 bucket using `mc` (MinIO client)
# and stores it in the ~/work/data directory.

# === Config destination folder ===
DEST_DIR="$HOME/work/data"
# Ensure destination folder exists
mkdir -p "$DEST_DIR"

# === S3 settings ===

# Configure alias for the public S3 endpoint (anonymous access)
mc alias set s3sspcloud https://minio.lab.sspcloud.fr "" ""

# === Download all data files ===
# You can modify the list of files
FILES=(
  "s3sspcloud/projet-aiml4os-wp10/NorwayData/train_norwaydata_2026-01-13.parquet"
  "s3sspcloud/projet-aiml4os-wp10/NorwayData/test_norwaydata_2026-01-13.parquet"
  "s3sspcloud/andresjp/WP10-Statcodgen_tutorial/NACErev21_explanatory_notes.csv"
  "s3sspcloud/andresjp/WP10-Statcodgen_tutorial/NACErev21_structure.xlsx"
  "s3sspcloud/andresjp/WP10-Statcodgen_tutorial/sample_index_entries nb.xlsx"
  "s3sspcloud/andresjp/WP10-Statcodgen_tutorial/klassifikasjon-koder-3218-nb.csv"
)

# Function to download with retry
download_file() {
    local file=$1
    local dest=$2
    local retries=3
    local count=0

    while [ $count -lt $retries ]; do
        echo "Attempt $((count+1)) to download $file..."
        if mc cp "$file" "$dest"; then
            echo "Download of $file succeeded."
            return 0
        else
            echo "Download failed for $file. Retrying..."
            ((count++))
            sleep 2
        fi
    done
    echo "Failed to download $file after $retries attempts."
    return 1
}

# Iterate and download each file
for FILE in "${FILES[@]}"; do
    echo "Downloading $FILE to $DEST_DIR..."
    download_file "$FILE" "$DEST_DIR"
done

# Download the contents of the input folder
mkdir -p "$DEST_DIR/input"

mc cp --recursive \
    "s3sspcloud/andresjp/WP10-Statcodgen_tutorial/input/" \
    "$DEST_DIR/input/"