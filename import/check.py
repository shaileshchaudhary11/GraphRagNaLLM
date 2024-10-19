import csv

def modify_csv_headers(input_file):
    try:
        # Read the input CSV file and modify headers
        with open(input_file, 'r', newline='') as infile:
            reader = csv.reader(infile)
            rows = list(reader)
            header = rows[0]

            # Replace redundant headers with their respective categories
            new_header = []
            previous_value = None
            for col in header:
                if col.strip() != '':
                    previous_value = col.strip()
                new_header.append(previous_value)
            
            # Update the header in the rows
            rows[0] = new_header

        # Write the modified CSV back to the same file
        with open(input_file, 'w', newline='') as outfile:
            writer = csv.writer(outfile)
            writer.writerows(rows)
        
        print(f"Modified headers successfully written to {input_file}")

    except Exception as e:
        print(f"Error processing {input_file}: {e}")

# Path to the input file
input_file = 'header.csv'

# Modify the headers and save back to the input file
modify_csv_headers(input_file)
