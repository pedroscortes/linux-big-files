csv_file="file_name.csv"
column_name="column_name"

# Check if the CSV file exists
if [ ! -f "$csv_file" ]; then
    echo "Error: $csv_file not found in the current directory."
    exit 1
fi

# Get the column index of "DateTimeSend" using the header in the first row
column_index=$(awk -F, 'NR==1 {for(i=1; i<=NF; i++) {if ($i == "'"$column_name"'") print i}}' "$csv_file")

# Check if the column exists in the CSV file
if [ -z "$column_index" ]; then
    echo "Error: Column '$column_name' not found in the CSV file."
    exit 1
fi

# Use awk to extract the "DateTimeSend" column and sort it to get max and min values
max_value=$(awk -F, -v col="$column_index" 'NR > 1 {if ($col != "") print $col}' "$csv_file" | sort -r | head -n 1)
min_value=$(awk -F, -v col="$column_index" 'NR > 1 {if ($col != "") print $col}' "$csv_file" | sort | head -n 1)

# Print the results
echo "Maximum value in '$column_name' column: $max_value"
echo "Minimum value in '$column_name' column: $min_value"
