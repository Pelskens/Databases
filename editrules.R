DOMAIN_ttw <- c('n/a', 'works at home', 'motorized vehicle', 'on foot', 'bicyle', 'public transport', 'other')
DOMAIN_lw <- c('n/a', 'never worked', 'now', 'previous year', 'longer ago')
DOMAIN_wly <- c('yes', 'no')
DOMAIN_is <- c('yes', 'no')
DOMAIN_ed <- c('none', 'elementary school', 'middle school', 'high school', 'college')
DOMAIN_es <- c('n/a', 'unemployed', 'employed')

transport_to_work %in% DOMAIN_ttw
last_worked %in% DOMAIN_lw
worked_last_year %in% DOMAIN_wly
in_school %in% DOMAIN_is
education %in% DOMAIN_ed
employment_status %in% DOMAIN_es

#E1
if (in_school=='no') education=='none'

#E2
if (in_school=='yes') !education=='none'

#E3
if (education %in% c('elementary school', 'middle school', 'high school'))
  !employment_status %in% c('employed', 'unemployed')
  
#E5
if (last_worked %in% c('longer ago','never worked', 'previous year', 'now')) 
  !employment_status=='n/a'

#E6
if (worked_last_year=='yes') !employment_status=='n/a'

#E7
if (transport_to_work %in% c('works at home', 'motorized vehicle', 'on foot', 
                              'bicyle', 'public transport', 'other')) 
  !employment_status %in% c('n/a', 'unemployed')

#E8
if (last_worked %in% c('n/a', 'now')) !employment_status=='unemployed'

#E9
if (last_worked %in% c('n/a', 'never worked', 'previous year', 'longer ago'))
  !employment_status=='employed'

#E10
if (transport_to_work=='n/a') !employment_status=='employed'

#E11
if (transport_to_work=='n/a') !last_worked=='now'

#E13
if (last_worked=='previous year') !worked_last_year=='no'

#E14
if (last_worked %in% c('never worked', 'longer ago')) !worked_last_year=='yes'

#E15
if (last_worked=='now') !employment_status %in% c('n/a', 'unemployed')

#E16
if (last_worked %in% c('now', 'never worked', 'previous year', 'longer ago')) 
  !education %in% c('elementary school', 'middle school', 'high school')

#E17
if (worked_last_year=='yes')
  !education %in% c('elementary school', 'middle school', 'high school')

#E18
if (transport_to_work %in% c('works at home', 'motorized vehicle', 'on foot', 
                             'bicyle', 'public transport', 'other'))
  !education %in% c('elementary school', 'middle school', 'high school')

#E19
if (transport_to_work %in% c('works at home', 'motorized vehicle', 'on foot', 
                             'bicyle', 'public transport', 'other')) 
  !last_worked %in% c('n/a', 'never worked', 'previous year', 'longer ago')