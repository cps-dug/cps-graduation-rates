cps_graduation_rates.db : graduation_rates.csv crosswalk.csv
	csvs-to-sqlite $^ $@

graduation_rates.csv : graduation_rates.xlsx
	in2csv --sheet "School 4 Year Cohort Rates" $< > $@

graduation_rates.xlsx :
	wget -O $@ "https://www.cps.edu/globalassets/cps-pages/about-cps/district-data/metrics/metrics_cohortgraduationdropoutadjusted_schoollevel_2017to2021.xlsx"

crosswalk.csv :
	wget -O $@ "https://docs.google.com/spreadsheets/d/e/2PACX-1vQeia_Yl8NruabURZy0YNNw_8kkOeOzU4c84NCc4EVilttUAlyLlqYG7fsV-x9baMWkZ833dlaaVRHz/pub?gid=0&single=true&output=csv"
