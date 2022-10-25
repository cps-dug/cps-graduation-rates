cps_graduation_rates.db : graduation_rates.csv crosswalk.csv zoned_and_sending.csv
	csvs-to-sqlite $^ $@

graduation_rates.csv : graduation_rates.xlsx
	in2csv --sheet "School 4 Year Cohort Rates" $< | \
         tail +3 | \
         sed '1 s/^.*/School ID,School Name,Status as of 2021,Cohort Dropout Rates: 2017,Cohort Dropout Rates: 2018,Cohort Dropout Rates: 2019,Cohort Dropout Rates: 2020,Cohort Dropout Rates: 2021,Cohort Graduation Rates: 2017,Cohort Graduation Rates: 2018,Cohort Graduation Rates: 2019,Cohort Graduation Rates: 2020,Cohort Graduation Rates: 2021,Cohort Number of Dropouts: 2017,Cohort Number of Dropouts: 2018,Cohort Number of Dropouts: 2019,Cohort Number of Dropouts: 2020,Cohort Number of Dropouts: 2021,Cohort Number of Graduates: 2017,Cohort Number of Graduates: 2018,Cohort Number of Graduates: 2019,Cohort Number of Graduates: 2020,Cohort Number of Graduates: 2021,Number of Students in Original 9th Grade Cohort: 2017,Number of Students in Original 9th Grade Cohort: 2018,Number of Students in Original 9th Grade Cohort: 2019,Number of Students in Original 9th Grade Cohort: 2020,Number of Students in Original 9th Grade Cohort: 2021,Number of Students in Adjusted 9th Grade Cohort: 2017,Number of Students in Adjusted 9th Grade Cohort: 2018,Number of Students in Adjusted 9th Grade Cohort: 2019,Number of Students in Adjusted 9th Grade Cohort: 2020,Number of Students in Adjusted 9th Grade Cohort: 2021/' > $@

zoned_and_sending.csv : raw/FOIA_N009685-061021-__ZonedByResHS.xlsx
	in2csv --sheet "Data" $< > $@

graduation_rates.xlsx :
	wget -O $@ "https://www.cps.edu/globalassets/cps-pages/about-cps/district-data/metrics/metrics_cohortgraduationdropoutadjusted_schoollevel_2017to2021.xlsx"

crosswalk.csv :
	wget -O $@ "https://docs.google.com/spreadsheets/d/e/2PACX-1vQeia_Yl8NruabURZy0YNNw_8kkOeOzU4c84NCc4EVilttUAlyLlqYG7fsV-x9baMWkZ833dlaaVRHz/pub?gid=0&single=true&output=csv"
