-- Creating table and uploading data from Public Libraries Survey 2019

CREATE TABLE pls_2019 (
  stabr varchar(2) NOT NULL,
  fscskey varchar(6) CONSTRAINT fscskey19_key PRIMARY KEY,
  libid varchar(20) NOT NULL,
  libname varchar(100) NOT NULL,
  address varchar(35) NOT NULL,
  city varchar(20) NOT NULL,
  zip varchar(5) NOT NULL,
  cnty varchar(20) NOT NULL,
  c_fscs varchar(1) NOT NULL,
  geocode varchar(3) NOT NULL,
  startdat varchar(10),
  enddate varchar(10),
  popu_und integer NOT NULL,
  centlib integer NOT NULL,
  branlib integer NOT NULL,
  bkmob integer NOT NULL,
  master numeric(8,2) NOT NULL,
  libraria numeric(8,2) NOT NULL,
  othpaid numeric(8,2) NOT NULL,
  totstaff numeric(8,2) NOT NULL,
  locgvt integer NOT NULL,
  stgvt integer NOT NULL,
  fedgvt integer NOT NULL,
  othincm integer NOT NULL,
  totincm integer NOT NULL,
  salaries integer,
  benefit integer,
  staffexp integer,
  prmatexp integer NOT NULL,
  elmatexp integer NOT NULL,
  othmatex integer NOT NULL,
  totexpco integer NOT NULL,
  othopexp integer NOT NULL,
  totopexp integer NOT NULL,
  lcap_rev integer NOT NULL,
  scap_rev integer NOT NULL,
  fcap_rev integer NOT NULL,
  ocap_rev integer NOT NULL,
  cap_rev integer NOT NULL,
  capital integer NOT NULL,
  bkvol integer NOT NULL,
  ebook integer NOT NULL,
  audio_ph integer NOT NULL,
  audio_dl float NOT NULL,
  video_ph integer NOT NULL,
  video_dl float NOT NULL,
  ec_lo_ot smallint NOT NULL,
  ec_st smallint NOT NULL,
  eleccoll smallint NOT NULL,
  subscrip integer NOT NULL,
  hrs_open integer NOT NULL,
  visits integer NOT NULL,
  referenc integer NOT NULL,
  regbor integer NOT NULL,
  totcir integer NOT NULL,
  kidcircl integer NOT NULL,
  elmatcir integer NOT NULL,
  physcir integer NOT NULL,
  elinfo integer NOT NULL,
  elcont integer NOT NULL,
  totcoll integer NOT NULL,
  loanto integer NOT NULL,
  loanfm integer NOT NULL,
  totpro integer NOT NULL,
  kidpro integer NOT NULL,
  yapro integer NOT NULL,
  totatten integer NOT NULL,
  kidatten integer NOT NULL,
  yaatten integer NOT NULL,
  gpterms integer NOT NULL,
  pitusr integer NOT NULL,
  wifisess integer NOT NULL,
  webvisit integer NOT NULL,
  yr_sub integer NOT NULL,
  obereg smallint NOT NULL,
  rstatus smallint NOT NULL,
  statstru smallint NOT NULL,
  statname smallint NOT NULL,
  stataddr smallint NOT NULL,
  cntypop integer NOT NULL,
  locale_add smallint NOT NULL
);

CREATE INDEX lname19_idx ON pls_2019(libname);
CREATE INDEX lst19_idx ON pls_2019(stabr);
CREATE INDEX lcity19_idx ON pls_2019(city);
CREATE INDEX lvisits19_idx ON pls_2019(visits);
CREATE INDEX lwifisess19_idx ON pls_2019(wifisess);
CREATE INDEX lwebvisit19_idx ON pls_2019(webvisit);
CREATE INDEX lsubscrip19_idx ON pls_2019(subscrip);

COPY pls_2019
FROM 'C:\Location\lib_2019.csv'
WITH (FORMAT CSV, HEADER);

-- Creating table and uploading data from Public Libraries Survey 2018

CREATE TABLE pls_2018 (
  stabr varchar(2) NOT NULL,
  fscskey varchar(6) CONSTRAINT fscskey18_key PRIMARY KEY,
  libid varchar(20) NOT NULL,
  libname varchar(100) NOT NULL,
  address varchar(35) NOT NULL,
  city varchar(20) NOT NULL,
  zip varchar(5) NOT NULL,
  cnty varchar(20) NOT NULL,
  c_fscs varchar(1) NOT NULL,
  geocode varchar(3) NOT NULL,
  startdat varchar(10),
  enddate varchar(10),
  popu_und integer NOT NULL,
  centlib integer NOT NULL,
  branlib integer NOT NULL,
  bkmob integer NOT NULL,
  master numeric(8,2) NOT NULL,
  libraria numeric(8,2) NOT NULL,
  othpaid numeric(8,2) NOT NULL,
  totstaff numeric(8,2) NOT NULL,
  locgvt integer NOT NULL,
  stgvt integer NOT NULL,
  fedgvt integer NOT NULL,
  othincm integer NOT NULL,
  totincm integer NOT NULL,
  salaries integer,
  benefit integer,
  staffexp integer,
  prmatexp integer NOT NULL,
  elmatexp integer NOT NULL,
  othmatex integer NOT NULL,
  totexpco integer NOT NULL,
  othopexp integer NOT NULL,
  totopexp integer NOT NULL,
  lcap_rev integer NOT NULL,
  scap_rev integer NOT NULL,
  fcap_rev integer NOT NULL,
  ocap_rev integer NOT NULL,
  cap_rev integer NOT NULL,
  capital integer NOT NULL,
  bkvol integer NOT NULL,
  ebook integer NOT NULL,
  audio_ph integer NOT NULL,
  audio_dl float NOT NULL,
  video_ph integer NOT NULL,
  video_dl float NOT NULL,
  ec_lo_ot smallint NOT NULL,
  ec_st smallint NOT NULL,
  eleccoll smallint NOT NULL,
  subscrip integer NOT NULL,
  hrs_open integer NOT NULL,
  visits integer NOT NULL,
  referenc integer NOT NULL,
  regbor integer NOT NULL,
  totcir integer NOT NULL,
  kidcircl integer NOT NULL,
  elmatcir integer NOT NULL,
  physcir integer NOT NULL,
  elinfo integer NOT NULL,
  elcont integer NOT NULL,
  totcoll integer NOT NULL,
  loanto integer NOT NULL,
  loanfm integer NOT NULL,
  totpro integer NOT NULL,
  kidpro integer NOT NULL,
  yapro integer NOT NULL,
  totatten integer NOT NULL,
  kidatten integer NOT NULL,
  yaatten integer NOT NULL,
  gpterms integer NOT NULL,
  pitusr integer NOT NULL,
  wifisess integer NOT NULL,
  webvisit integer NOT NULL,
  yr_sub integer NOT NULL,
  obereg smallint NOT NULL,
  rstatus smallint NOT NULL,
  statstru smallint NOT NULL,
  statname smallint NOT NULL,
  stataddr smallint NOT NULL,
  cntypop integer NOT NULL,
  locale_add smallint NOT NULL
);

CREATE INDEX lname18_idx ON pls_2018(libname);
CREATE INDEX lst18_idx ON pls_2018(stabr);
CREATE INDEX lcity18_idx ON pls_2018(city);
CREATE INDEX lvisits18_idx ON pls_2018(visits);
CREATE INDEX lwifisess18_idx ON pls_2018(wifisess);
CREATE INDEX lwebvisit18_idx ON pls_2018(webvisit);
CREATE INDEX lsubscrip18_idx ON pls_2018(subscrip);

COPY pls_2018
FROM 'C:\Location\lib_2018.csv'
WITH (FORMAT CSV, HEADER);

/* Queary to find total visits for 2018 and 2019 with percentage change
between the two years, group by State.*/

SELECT pls19.stabr, 
	SUM(pls19.visits) AS visits_2019,
	SUM(pls18.visits) AS visits_2018,
	round( (CAST(SUM(pls19.visits) AS decimal(10,1)) - SUM(pls18.visits)) /
                    SUM(pls18.visits) * 100, 2 ) AS percentage_change
FROM pls_2019 pls19 JOIN pls_2018 pls18
ON pls19.fscskey = pls18.fscskey
WHERE pls19.visits >= 0 AND pls18.visits >= 0
GROUP BY pls19.stabr
ORDER BY percentage_change DESC; 

/* Queary to find total wifi sessions for 2018 and 2019 with percentage change
between the two years, group by State.*/

SELECT pls19.stabr, 
	SUM(pls19.wifisess) AS wifi_sessions_2019,
	SUM(pls18.wifisess) AS wifi_sessions_2018,
	round( (CAST(SUM(pls19.wifisess) AS decimal(10,1)) - SUM(pls18.wifisess)) /
                    SUM(pls18.wifisess) * 100, 2 ) AS percentage_change
FROM pls_2019 pls19 JOIN pls_2018 pls18
ON pls19.fscskey = pls18.fscskey
WHERE pls19.wifisess >= 0 AND pls18.wifisess >= 0
GROUP BY pls19.stabr
ORDER BY percentage_change DESC; 

/* Queary to find total library website visits sessions for 2018 and 2019 with percentage change
between the two years, group by State.*/

SELECT pls19.stabr,
       SUM(pls19.webvisit) AS websessions_2019,
       SUM(pls18.webvisit) AS websessions_2018,
       round( (CAST(SUM(pls19.webvisit) AS decimal(10,1)) - SUM(pls18.webvisit)) /
                    SUM(pls18.webvisit) * 100, 2 ) AS percentage_change
FROM pls_2019 pls19 JOIN pls_2018 pls18
ON pls19.fscskey = pls18.fscskey
WHERE pls19.webvisit >= 0 AND pls18.webvisit >= 0
GROUP BY pls19.stabr
ORDER BY percentage_change DESC;

/* Queary to find total public computers sessions for 2018 and 2019 with percentage change
between the two years, group by State.*/

SELECT pls19.stabr,
       SUM(pls19.pitusr) AS computers_used_2019,
       SUM(pls18.pitusr) AS computers_used_2018,
       round( (CAST(SUM(pls19.pitusr) AS decimal(10,1)) - SUM(pls18.pitusr)) /
                    SUM(pls18.pitusr) * 100, 2 ) AS percentage_change
FROM pls_2019 pls19 JOIN pls_2018 pls18
ON pls19.fscskey = pls18.fscskey
WHERE pls19.pitusr >= 0 AND pls18.pitusr >= 0
GROUP BY pls19.stabr
ORDER BY percentage_change DESC;


