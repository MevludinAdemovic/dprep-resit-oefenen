DATA = ../../data
TEMP = ../../gen/temp

all: $(DATA)/listings.csv $(DATA)/reviews.csv $(TEMP)/aggregated_df.csv

../../data/reviews.csv: download_data.R
	R --vanilla < download_data.R

../../data/listings.csv: download_data.R
	mkdir -p ../../data
	R --vanilla < download_data.R

../../gen/temp/aggregated_df.csv: ../../data/listings.csv ../../data/reviews.csv  clean_data.R
	mkdir -p ../../gen/temp
	R --vanilla < clean_data.R
