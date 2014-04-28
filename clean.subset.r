###########################################
# Data cleaning, transformation, etc. 
###########################################
# Select out if student took assessment in English.
FACES2006.subset <- subset(FACES2006_missing, COHORT == 3)
FACES2006.subset <- subset(FACES2006_missing, A1_LANG==11 | A2_LANG==11 | A3_LANG==11 | A4_LANG==11)
row.names(FACES2006.subset) <- NULL
# Note. These numbers vary slightly from what are in the manual, in that there are more students, by 
# just a few in each category. 
# Select out variables of interest
###NOTE? Sort out by KG year?


CHILDID
CLS1_ID
CLS2_ID
CLS3_ID
T1_ID
T2_ID
T3_ID
C1_ID
C2_ID
C3_ID
P1RCAGE
CHGENDER
CRACE
MRACE
FRACE
A1_DATA
A2_DATA
A3_DATA
A4_DATA
STRAT
PSI
COHORT
PKYEAR
S08_GRADE
KGYEAR
/*****ASSESSMENT 1*******/
  A1CAGE
A1LNGSCR
A1PPVT4W
A1PPVT4R
A1WJAPR
A1WJAPW
A1WJLWR
A1WJLWW
A1WJSR
A1WJSW
A1WWAPR
A1WWAPW
A1WWLWR
A1WWLWW
A1WWSR
A1WWSW
/*****ASSESSMENT 2*******/
  A2CAGE
A2LNGSCR
A2PPVT4W
A2PPVT4R
A2WJAPR
A2WJAPW
A2WJLWR
A2WJLWW
A2WJSR
A2WJSW
A2WWAPR
A2WWAPW
A2WWLWR
A2WWLWW
A2WWSR
A2WWSW
/*****ASSESSMENT 3*******/
  A3CAGE
A3LNGSCR
A3PPVT4W
A3PPVT4R
A3WJAPR
A3WJAPW
A3WJLWR
A3WJLWW
A3WJSR
A3WJSW
A3WWAPR
A3WWAPW
A3WWLWR
A3WWLWW
A3WWSR
A3WWSW
/*****ASSESSMENT 4*******/
  A4CAGE
A4LNGSCR
A4PPVT4W
A4PPVT4R
A4WJAPR
A4WJAPW
A4WJLWR
A4WJLWW
A4WJSR
A4WJSW
A4WWAPR
A4WWAPW
A4WWLWR
A4WWLWW
A4WWSR
A4WWSW
/******PLBS1*****/
  R1ATTUDE
R1BAGGR
R1BHYPER
R1BPROB
R1BWITH
R1MOTIVE
R1PRSIST
R1SSRS
R1TPELS
R1TPLBS
/******PLBS2*****/
  R2ATTUDE
R2BAGGR
R2BHYPER
R2BPROB
R2BWITH
R2MOTIVE
R2PRSIST
R2SSRS
R2TPELS
R2TPLBS
/******PLBS3*****/
  R3ATTUDE
R3BAGGR
R3BHYPER
R3BPROB
R3BWITH
R3MOTIVE
R3PRSIST
R3SSRS
R3TPELS
R3TPLBS
/******PLBS4*****/
  KR4ATTUDE
KR4BAGGR
KR4BHYPER
KR4BPROB
KR4BWITH
KR4MOTIVE
KR4PRSIST
KR4SSRS
KR4TPELS
KR4TPLBS
*******
  P1HHLAN2- P1:Household Language:English, Spanish,Other
P1CAUTSM- P1: Child Autism or Pervasive Developmental
P1DEPSCO- P1: Parent Depression Score - CES-D Short Form
P1INCOME- P1: Household Income
P1MOMEMP- P1: Mother's Employment Status
P1NUMSIB- P1: Number of Siblings
P1PBEPRB- P1: Parent reported total behavior problems index
P1PELS- P1: Parent reported Emergent Literacy Scale
P1POVRTO- P1: Ratio of Income to Poverty
P1POVRTY- P1: Poverty Status
P1PRGTYP- P1: Child program Type
P1PWKACT- P1: # of parent-child activities in past week
P1RDADED- P1: Father's Highest Education
P1READS- P1: Read to child 3+ times in past week
P1RHHLNG- P1: Household Language
P1RMARTL- P1: Parent Marital Status
P1RMOMED- P1: Mother's Highest Education
P1ANYCCR- P1:Any child care before or after Head Start
P1ECRISK- P1: Economic Family Risk
P1HRWKCC- P1: Number of hours per week in child care
P1_3VS4- P1:Child Age at Beginning of Prog. Yr
P2PSAHSC- P2:Parent satisfaction w/Head Start-Child related
subscale
P2PSAHSP- P2:Parent satisfaction w/Head Start-Family
related subscale
P2PSOCHS- P2: Parnt partcipatd socially wth othr HS adult in yr
P2PVOLHS- P2: Parent volunteered in any way at Head Start
in year
P3HRWKK- P3: Number of hours per week in kindergarten
P3PAGGR- P3: Parnt report total behavior probs-aggressive
score
P3PBEPRB- P3: Parent reported total behavior problems index
P3PRGTYP- P3: Child Program Type
P2, 
pg 100
A1_Lang- 11= English speaker assessed in English



