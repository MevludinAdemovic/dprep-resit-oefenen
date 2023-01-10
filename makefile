DATA = ../../DATA
TEMP = ../../gen/DATA-preparation/temp
OUTPUT = ../../gen/DATA-preparation/output

all: reviews.csv \
listings.csv \
aggregated_df.csv \
pivot_table.csv \
plot_Antwerp.pdf \
plot_all.pdf

reviews.csv \
listings.csv: download.R
	R --vanilla < download_data.R

aggregated_df.csv \
aggregated_df.csv: \
clean_data.R \
reviews.csv \
listings.csv
	R --vanilla < clean_data.R

pivot_table.csv \
pivot_table.csv: \
pivot_data.R \
aggregated_df.csv
	R --vanilla < pivot_data.R

plot_Antwerp.pdf \
plot_Antwerp.pdf: \
plot_Antwerp_data.R \
pivot_table.csv
	R --vanilla < plot_Antwerp_data.R

plot_all.pdf \
plot_all.pdf: \
plot_all_data.R \
plot_Antwerp.pdf
	R --vanilla < plot_all_data.R
