cps_graduation_rates.db : graduation_rates.csv
	csvs-to-sqlite $^ $@

graduation_rates.csv : graduation_rates.xlsx
	in2csv --sheet "School 4 Year Cohort Rates" $< > $@

graduation_rates.xlsx :
	wget -O $@ "https://www.cps.edu/globalassets/cps-pages/about-cps/district-data/metrics/metrics_cohortgraduationdropoutadjusted_schoollevel_2017to2021.xlsx"


