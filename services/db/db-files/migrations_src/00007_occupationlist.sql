-- +goose Up
-- SQL in this section is executed when the migration is applied.
create table occupations
(
    id SERIAL PRIMARY KEY not null,
    isco08 integer not null,
    isco88 integer not null,
    name character varying(256) not null
);

CREATE INDEX occupation_ix_name ON occupations USING gin (name gin_trgm_ops);

with occupation_json (doc) as (
   values
    ('[
    {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Abbess"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Abbot"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Academic, university: head of department or facluty"
  },
  {
    "isco08": 2310,
    "isco88": 2310,
    "name": "Academic, university: lecturer"
  },
  {
    "isco08": 3433,
    "isco88": 3439,
    "name": "Accessioner, library"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Accompanist"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Accountant"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Accountant, certified"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Accountant, chartered"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Accountant, management"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Accountant, tax"
  },
  {
    "isco08": 3117,
    "isco88": 3117,
    "name": "Acidiser, oil and gas well"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Acrobat"
  },
  {
    "isco08": 2655,
    "isco88": 2455,
    "name": "Actor"
  },
  {
    "isco08": 2120,
    "isco88": 2121,
    "name": "Actuary"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Acupuncturist"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Adjuster, claims"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Adjuster, precision instrument"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Adjuster, watch"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Administrator, city"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Administrator, computer systems"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Administrator, computer: systems administration"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Administrator, conference"
  },
  {
    "isco08": 2521,
    "isco88": 2131,
    "name": "Administrator, data"
  },
  {
    "isco08": 2521,
    "isco88": 2131,
    "name": "Administrator, database"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Administrator, government"
  },
  {
    "isco08": 1342,
    "isco88": 1319,
    "name": "Administrator, health facility"
  },
  {
    "isco08": 1342,
    "isco88": 1319,
    "name": "Administrator, hospital"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Administrator, intergovernmental organization"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Administrator, IT systems"
  },
  {
    "isco08": 1342,
    "isco88": 1319,
    "name": "Administrator, medical"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Administrator, network"
  },
  {
    "isco08": 3341,
    "isco88": 3439,
    "name": "Administrator, office"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Administrator, SAP: business analysis"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Administrator, systems: computers"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Administrator, unix"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Administrator, WAN"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Administrator, website"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Admiral"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Adviser, academic"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Adviser, after-sales service"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Adviser, agricultural"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Adviser, careers"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Adviser, debt"
  },
  {
    "isco08": 2631,
    "isco88": 2441,
    "name": "Adviser, economic"
  },
  {
    "isco08": 2631,
    "isco88": 2441,
    "name": "Adviser, economic policy"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Adviser, education"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Adviser, education: methods"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Adviser, environmental"
  },
  {
    "isco08": 2263,
    "isco88": 3222,
    "name": "Adviser, environmental health"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Adviser, environmental management"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Adviser, farming"
  },
  {
    "isco08": 2412,
    "isco88": 2411,
    "name": "Adviser, financial"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Adviser, fisheries"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Adviser, forestry"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Adviser, grower''s"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Adviser, horticultural"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Adviser, human resources"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Adviser, industrial relations"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Adviser, investment"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Adviser, labour relations"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Adviser, legal"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Adviser, legislative"
  },
  {
    "isco08": 2263,
    "isco88": 3152,
    "name": "Adviser, occupational health and safety"
  },
  {
    "isco08": 2263,
    "isco88": 3152,
    "name": "Adviser, occupational hygiene"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Adviser, pensions"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Adviser, political"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Adviser, public policy"
  },
  {
    "isco08": 2263,
    "isco88": 3222,
    "name": "Adviser, radiation protection"
  },
  {
    "isco08": 2359,
    "isco88": 2359,
    "name": "Adviser, student"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Adviser, superannuation"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Adviser, taxation"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Adviser, teaching methods"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Adviser, travel"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Adviser, wealth management"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Adviser, workplace relations"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Advocate, legal"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Aerialist, entertainment"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Aerialist, sport"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Aerodynamicist"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Aeromechanic"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Agent, booking: travel"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Agent, check-in"
  },
  {
    "isco08": 3331,
    "isco88": 3422,
    "name": "Agent, clearing"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Agent, directory assistance"
  },
  {
    "isco08": 3333,
    "isco88": 3423,
    "name": "Agent, employment"
  },
  {
    "isco08": 3334,
    "isco88": 3413,
    "name": "Agent, estate"
  },
  {
    "isco08": 3331,
    "isco88": 3422,
    "name": "Agent, export"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Agent, field service: agriculture"
  },
  {
    "isco08": 3331,
    "isco88": 3422,
    "name": "Agent, forwarding"
  },
  {
    "isco08": 3321,
    "isco88": 3412,
    "name": "Agent, group insurance"
  },
  {
    "isco08": 3334,
    "isco88": 3413,
    "name": "Agent, house"
  },
  {
    "isco08": 3331,
    "isco88": 3422,
    "name": "Agent, import"
  },
  {
    "isco08": 3355,
    "isco88": 3450,
    "name": "Agent, inquiry: police"
  },
  {
    "isco08": 3411,
    "isco88": 3450,
    "name": "Agent, inquiry: private"
  },
  {
    "isco08": 3321,
    "isco88": 3412,
    "name": "Agent, insurance"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Agent, leasing: vehicle"
  },
  {
    "isco08": 3339,
    "isco88": 3429,
    "name": "Agent, literary"
  },
  {
    "isco08": 3339,
    "isco88": 3429,
    "name": "Agent, musical performance"
  },
  {
    "isco08": 3339,
    "isco88": 2419,
    "name": "Agent, patent"
  },
  {
    "isco08": 3323,
    "isco88": 3416,
    "name": "Agent, procurement"
  },
  {
    "isco08": 3334,
    "isco88": 3413,
    "name": "Agent, property"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Agent, publicity"
  },
  {
    "isco08": 3323,
    "isco88": 3416,
    "name": "Agent, purchasing"
  },
  {
    "isco08": 3334,
    "isco88": 3413,
    "name": "Agent, real estate"
  },
  {
    "isco08": 3334,
    "isco88": 3413,
    "name": "Agent, rental: apartment"
  },
  {
    "isco08": 3334,
    "isco88": 3413,
    "name": "Agent, rental: housing"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Agent, sales: commercial"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Agent, sales: communications (technology)"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Agent, sales: computer (systems)"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Agent, sales: engineering"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Agent, sales: information technology"
  },
  {
    "isco08": 3321,
    "isco88": 3412,
    "name": "Agent, sales: insurance"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Agent, sales: manufacturing"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Agent, sales: medical"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Agent, sales: technical"
  },
  {
    "isco08": 3331,
    "isco88": 3422,
    "name": "Agent, shipping"
  },
  {
    "isco08": 3339,
    "isco88": 3429,
    "name": "Agent, sports"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Agent, technical support: information technology"
  },
  {
    "isco08": 3339,
    "isco88": 3429,
    "name": "Agent, theatrical"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Agent, ticket: airline"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Agent, ticket: entertainment and sporting events"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Agent, ticket: travel"
  },
  {
    "isco08": 4221,
    "isco88": 1319,
    "name": "Agent, travel"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Agriculturist"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Agrologist"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Agronomist"
  },
  {
    "isco08": 3253,
    "isco88": 3221,
    "name": "Aide, community health"
  },
  {
    "isco08": 5329,
    "isco88": 5132,
    "name": "Aide, dental"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Aide, home care"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Aide, nursing: clinic"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Aide, nursing: home"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Aide, nursing: hospital"
  },
  {
    "isco08": 5329,
    "isco88": 5139,
    "name": "Aide, pharmacy"
  },
  {
    "isco08": 5312,
    "isco88": 5131,
    "name": "Aide, pre-school"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Aide, psychiatric"
  },
  {
    "isco08": 5329,
    "isco88": 5139,
    "name": "Aide, sterilization"
  },
  {
    "isco08": 5312,
    "isco88": 5131,
    "name": "Aide, teacher''s"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Aide, therapist: physiotherapy"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Aide, therapy: physiotherapy"
  },
  {
    "isco08": 5164,
    "isco88": 5139,
    "name": "Aide, veterinary"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Aircrew woman, navy"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Aircrewman, navy"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Airman, air force"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Airman, air force: warrant officer"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Airwoman, air force"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Airwoman, air force: warrant officer"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Alderman"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Alderwoman"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Allergist, clinical"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Almoner, associate professional"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Almoner, professional"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Ambassador"
  },
  {
    "isco08": 3258,
    "isco88": 5132,
    "name": "Ambulanceman"
  },
  {
    "isco08": 3258,
    "isco88": 5132,
    "name": "Ambulancewoman"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Anaesthesiologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Anaesthetist"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Anaesthetist, nurse"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Analyst, air pollution"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Analyst, application support"
  },
  {
    "isco08": 2413,
    "isco88": 2419,
    "name": "Analyst, bond"
  },
  {
    "isco08": 2631,
    "isco88": 2441,
    "name": "Analyst, business: economics"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Analyst, business: IT"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Analyst, business: systems design"
  },
  {
    "isco08": 2519,
    "isco88": 2131,
    "name": "Analyst, business: testing software"
  },
  {
    "isco08": 2523,
    "isco88": 2131,
    "name": "Analyst, communications: computers"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Analyst, communications: except computers"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Analyst, computer: business analysis"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Analyst, computer: helpdesk"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Analyst, computer: software support"
  },
  {
    "isco08": 2519,
    "isco88": 2131,
    "name": "Analyst, computer: testing software"
  },
  {
    "isco08": 2421,
    "isco88": 2419,
    "name": "Analyst, cost"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Analyst, credit: assessing credit or loans"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Analyst, data mining"
  },
  {
    "isco08": 2521,
    "isco88": 2131,
    "name": "Analyst, database"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Analyst, desktop: support"
  },
  {
    "isco08": 2631,
    "isco88": 2441,
    "name": "Analyst, economic"
  },
  {
    "isco08": 2143,
    "isco88": 2149,
    "name": "Analyst, environmental"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Analyst, financial: assessing credit worthiness of clients"
  },
  {
    "isco08": 2413,
    "isco88": 2419,
    "name": "Analyst, financial: investments"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Analyst, helpdesk"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Analyst, information systems"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Analyst, infrastructure: systems administration"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Analyst, intelligence"
  },
  {
    "isco08": 2413,
    "isco88": 2419,
    "name": "Analyst, investment"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Analyst, IT helpdesk"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Analyst, job"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Analyst, land degradation"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Analyst, loans"
  },
  {
    "isco08": 2421,
    "isco88": 2419,
    "name": "Analyst, management"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Analyst, market: research"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Analyst, medical records"
  },
  {
    "isco08": 2523,
    "isco88": 2131,
    "name": "Analyst, network"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Analyst, occupational"
  },
  {
    "isco08": 2120,
    "isco88": 2121,
    "name": "Analyst, operations research"
  },
  {
    "isco08": 2421,
    "isco88": 2419,
    "name": "Analyst, organization and methods"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Analyst, PC support"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Analyst, policy"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Analyst, programme: computers"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Analyst, programmer"
  },
  {
    "isco08": 2634,
    "isco88": 2445,
    "name": "Analyst, psychological"
  },
  {
    "isco08": 2519,
    "isco88": 2131,
    "name": "Analyst, quality assurance: computers"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Analyst, risk: assessing credit worthiness of clients"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Analyst, SAP"
  },
  {
    "isco08": 2413,
    "isco88": 2419,
    "name": "Analyst, securities"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Analyst, security: computer"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Analyst, security: data"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Analyst, security: ICT"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Analyst, security: policy"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Analyst, software: support"
  },
  {
    "isco08": 2519,
    "isco88": 2131,
    "name": "Analyst, software: testing"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Analyst, strategy"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Analyst, systems: computers"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Analyst, systems: except computers"
  },
  {
    "isco08": 2519,
    "isco88": 2131,
    "name": "Analyst, test: software"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Analyst, treasury: government policy"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Analyst, water quality"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Anatomist"
  },
  {
    "isco08": 2656,
    "isco88": 3472,
    "name": "Anchor, news"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Animator"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Annealer"
  },
  {
    "isco08": 2656,
    "isco88": 3472,
    "name": "Announcer, news"
  },
  {
    "isco08": 2656,
    "isco88": 3472,
    "name": "Announcer, radio"
  },
  {
    "isco08": 2656,
    "isco88": 3472,
    "name": "Announcer, sports"
  },
  {
    "isco08": 2656,
    "isco88": 3472,
    "name": "Announcer, television"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Anodiser"
  },
  {
    "isco08": 2632,
    "isco88": 2442,
    "name": "Anthropologist"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Apiarist"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Applier, veneer"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Appraiser"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Appraiser, real estate"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Arbitrator, industrial relations"
  },
  {
    "isco08": 6112,
    "isco88": 2213,
    "name": "Arboriculturist"
  },
  {
    "isco08": 2632,
    "isco88": 2442,
    "name": "Archaeologist"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Archbishop"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Archdeacon"
  },
  {
    "isco08": 2161,
    "isco88": 2141,
    "name": "Architect, building"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Architect, business solutions"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Architect, business: business analysis"
  },
  {
    "isco08": 2521,
    "isco88": 2131,
    "name": "Architect, database"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Architect, information: business analysis"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Architect, information: computing (website)"
  },
  {
    "isco08": 2161,
    "isco88": 2141,
    "name": "Architect, interior"
  },
  {
    "isco08": 2162,
    "isco88": 2141,
    "name": "Architect, landscape"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Architect, marine"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Architect, naval"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Architect, solutions: business"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Architect, website"
  },
  {
    "isco08": 2621,
    "isco88": 2431,
    "name": "Archivist"
  },
  {
    "isco08": 2653,
    "isco88": 2454,
    "name": "Arranger, ballet"
  },
  {
    "isco08": 7549,
    "isco88": 5220,
    "name": "Arranger, flower"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Arranger, music"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Arranger, music"
  },
  {
    "isco08": 3435,
    "isco88": 3471,
    "name": "Artist, body"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Artist, ceramic"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Artist, commercial"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Artist, digital"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Artist, graphic"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Artist, high-wire"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Artist, landscape"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Artist, make-up"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Artist, paintings"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Artist, poster"
  },
  {
    "isco08": 2653,
    "isco88": 3474,
    "name": "Artist, strip-tease"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Artist, stunt"
  },
  {
    "isco08": 3435,
    "isco88": 3471,
    "name": "Artist, tattoo"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Artist, tight-rope"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Artist, trapeze"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Artist-painter"
  },
  {
    "isco08": 2146,
    "isco88": 2147,
    "name": "Assayer"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, agricultural machinery"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, aircraft"
  },
  {
    "isco08": 8219,
    "isco88": 8290,
    "name": "Assembler, ammunition"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Assembler, armature"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, audio-visual equipment"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, bicycle"
  },
  {
    "isco08": 8219,
    "isco88": 8286,
    "name": "Assembler, cardboard products"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, chronometer"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, clock"
  },
  {
    "isco08": 8219,
    "isco88": 8290,
    "name": "Assembler, composite products"
  },
  {
    "isco08": 8219,
    "isco88": 8290,
    "name": "Assembler, door"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, earth-moving equipment"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Assembler, electrical components"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Assembler, electrical equipment"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, electromechanical equipment"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, electronic components"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, electronic equipment"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, engine"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, eyeglass frame"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, furniture"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, gearbox"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, hearing aid"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, industrial machinery"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, jewellery"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, knife"
  },
  {
    "isco08": 8219,
    "isco88": 8286,
    "name": "Assembler, leather products"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, machine-tool"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, mechanical machinery"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, metal products: except mechanical"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, microelectronics equipment"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, mining machinery"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, office machinery"
  },
  {
    "isco08": 8219,
    "isco88": 8286,
    "name": "Assembler, paperboard products"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, pen and pencil"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, plastic products"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, plastic toy"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Assembler, plywood panel"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, precision instrument"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Assembler, prefabricated building"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Assembler, prefabricated houses"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, printing machinery"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, radio"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Assembler, raft: logging"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, rubber products"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, steam engine"
  },
  {
    "isco08": 8219,
    "isco88": 8286,
    "name": "Assembler, sun-blinds"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, telephone"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, television"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, textile machinery"
  },
  {
    "isco08": 8219,
    "isco88": 8286,
    "name": "Assembler, textile products"
  },
  {
    "isco08": 8219,
    "isco88": 8284,
    "name": "Assembler, thermos bottle"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, turbine"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, vehicle"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Assembler, watch"
  },
  {
    "isco08": 8219,
    "isco88": 8285,
    "name": "Assembler, wood products"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Assembler, woodworking machinery"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Assessor, claims"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Assessor, credit"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Assessor, insurance"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Assessor, loans"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Assessor, loss"
  },
  {
    "isco08": 2424,
    "isco88": 2412,
    "name": "Assessor, training"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Assignee, bankruptcy"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Assignee, insolvency"
  },
  {
    "isco08": 3513,
    "isco88": 3121,
    "name": "Assistant , communications: ICT"
  },
  {
    "isco08": 3313,
    "isco88": 3434,
    "name": "Assistant, accounting"
  },
  {
    "isco08": 3314,
    "isco88": 3434,
    "name": "Assistant, actuarial"
  },
  {
    "isco08": 3343,
    "isco88": 3431,
    "name": "Assistant, administrative"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Assistant, administrative: doctors surgery"
  },
  {
    "isco08": 3342,
    "isco88": 3431,
    "name": "Assistant, administrative: legal"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Assistant, administrative: medical office"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Assistant, allied health: physiotherapy"
  },
  {
    "isco08": 4211,
    "isco88": 3432,
    "name": "Assistant, bank"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Assistant, barrister''s"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Assistant, birth: clinic or hospital"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Assistant, birth: home"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Assistant, bricklayer''s"
  },
  {
    "isco08": 4312,
    "isco88": 3432,
    "name": "Assistant, broker''s"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Assistant, cabinet: supermarket (filling shelf, fridge or freezer)"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Assistant, call centre"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Assistant, carpenter''s"
  },
  {
    "isco08": 2240,
    "isco88": 3221,
    "name": "Assistant, clinical: diagnosing and treating patients"
  },
  {
    "isco08": 3256,
    "isco88": 3221,
    "name": "Assistant, clinical: helping doctor"
  },
  {
    "isco08": 3513,
    "isco88": 3121,
    "name": "Assistant, computer: communications"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Assistant, computer: database"
  },
  {
    "isco08": 3114,
    "isco88": 3121,
    "name": "Assistant, computer: engineering (hardware)"
  },
  {
    "isco08": 3511,
    "isco88": 3122,
    "name": "Assistant, computer: engineering (operations)"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Assistant, computer: engineering (software support)"
  },
  {
    "isco08": 3513,
    "isco88": 3121,
    "name": "Assistant, computer: network"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Assistant, computer: programming"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Assistant, computer: systems analysis"
  },
  {
    "isco08": 3513,
    "isco88": 3121,
    "name": "Assistant, computer: systems design"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Assistant, computer: user services"
  },
  {
    "isco08": 3343,
    "isco88": 3431,
    "name": "Assistant, correspondence"
  },
  {
    "isco08": 3433,
    "isco88": 3471,
    "name": "Assistant, curatorial"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Assistant, day care: aged or disabled"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Assistant, day care: children"
  },
  {
    "isco08": 3251,
    "isco88": 3225,
    "name": "Assistant, dental"
  },
  {
    "isco08": 3251,
    "isco88": 3225,
    "name": "Assistant, dental: school service"
  },
  {
    "isco08": 3256,
    "isco88": 3221,
    "name": "Assistant, doctor''s"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Assistant, evening fill"
  },
  {
    "isco08": 3343,
    "isco88": 3431,
    "name": "Assistant, executive"
  },
  {
    "isco08": 3342,
    "isco88": 3431,
    "name": "Assistant, executive: legal"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Assistant, gardener''s"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Assistant, greenkeeper''s"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Assistant, grocery: filling shelf, fridge or freezer"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Assistant, homecare: aged or disabled"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Assistant, horticultural nursery"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Assistant, human resource"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Assistant, hydrotherapy"
  },
  {
    "isco08": 4312,
    "isco88": 3432,
    "name": "Assistant, insurance: adjustment"
  },
  {
    "isco08": 4312,
    "isco88": 3432,
    "name": "Assistant, insurance: claims"
  },
  {
    "isco08": 4312,
    "isco88": 3432,
    "name": "Assistant, insurance: policy"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Assistant, kitchen"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Assistant, legal"
  },
  {
    "isco08": 3342,
    "isco88": 3431,
    "name": "Assistant, legal: secretarial tasks"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Assistant, library"
  },
  {
    "isco08": 3314,
    "isco88": 3434,
    "name": "Assistant, mathematical"
  },
  {
    "isco08": 5329,
    "isco88": 5132,
    "name": "Assistant, medical imaging"
  },
  {
    "isco08": 2240,
    "isco88": 3221,
    "name": "Assistant, medical: diagnosing and treating patients"
  },
  {
    "isco08": 3253,
    "isco88": 3221,
    "name": "Assistant, medical: family planning"
  },
  {
    "isco08": 3256,
    "isco88": 3221,
    "name": "Assistant, medical: helping doctor"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Assistant, merchandise: filling shelf, fridge or freezer"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Assistant, midwifery: clinic or hospital"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Assistant, nightfill"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Assistant, nursery: horticulture"
  },
  {
    "isco08": 3256,
    "isco88": 3221,
    "name": "Assistant, ophthalmic"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Assistant, patient care"
  },
  {
    "isco08": 3343,
    "isco88": 3431,
    "name": "Assistant, personal"
  },
  {
    "isco08": 3213,
    "isco88": 3228,
    "name": "Assistant, pharmaceutical"
  },
  {
    "isco08": 3213,
    "isco88": 3228,
    "name": "Assistant, pharmacy: dispensing"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Assistant, pharmacy: sales"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Assistant, physiotherapy"
  },
  {
    "isco08": 5312,
    "isco88": 5131,
    "name": "Assistant, pre-school"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Assistant, production: media"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Assistant, production: motion picture"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Assistant, programming: ICT"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Assistant, residential care: aged or disabled"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Assistant, respite care"
  },
  {
    "isco08": 5249,
    "isco88": 5220,
    "name": "Assistant, sales: car hire"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Assistant, sales: checkout"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Assistant, sales: filling shelf, fridge or freezer"
  },
  {
    "isco08": 5211,
    "isco88": 5230,
    "name": "Assistant, sales: market stall"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Assistant, sales: nightfill"
  },
  {
    "isco08": 5249,
    "isco88": 5220,
    "name": "Assistant, sales: rental"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Assistant, sales: shop"
  },
  {
    "isco08": 5211,
    "isco88": 5230,
    "name": "Assistant, sales: street stall"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Assistant, sales: supermarket (stock control)"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Assistant, secretarial: doctors surgery"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Assistant, secretarial: medical"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Assistant, shop"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Assistant, shop: checkout"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Assistant, solicitor''s"
  },
  {
    "isco08": 3259,
    "isco88": 3229,
    "name": "Assistant, speech therapy"
  },
  {
    "isco08": 3314,
    "isco88": 3434,
    "name": "Assistant, statistical"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Assistant, survey: interviewing"
  },
  {
    "isco08": 5312,
    "isco88": 5131,
    "name": "Assistant, teacher''s"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Assistant, technical: physiotherapy"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Assistant, therapy: physiotherapy"
  },
  {
    "isco08": 3240,
    "isco88": 3227,
    "name": "Assistant, veterinary"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Associate, research: clinical"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Associate, research: medical"
  },
  {
    "isco08": 5161,
    "isco88": 5151,
    "name": "Astrologer"
  },
  {
    "isco08": 3153,
    "isco88": 3143,
    "name": "Astronaut"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Astronomer"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Astronomer, radio"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Astrophysicist"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Athlete"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Attach�, legal"
  },
  {
    "isco08": 4221,
    "isco88": 5111,
    "name": "Attendant, airport: check-in"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Attendant, airport: handling baggage"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Attendant, airport: ramp"
  },
  {
    "isco08": 3258,
    "isco88": 5132,
    "name": "Attendant, ambulance"
  },
  {
    "isco08": 9629,
    "isco88": 9152,
    "name": "Attendant, amusement park"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Attendant, animal"
  },
  {
    "isco08": 5132,
    "isco88": 5123,
    "name": "Attendant, bar: drinks service"
  },
  {
    "isco08": 5246,
    "isco88": 5220,
    "name": "Attendant, bar: food service"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Attendant, bath"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Attendant, birth: clinic or hospital"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Attendant, birth: home birth"
  },
  {
    "isco08": 5111,
    "isco88": 5111,
    "name": "Attendant, cabin"
  },
  {
    "isco08": 5246,
    "isco88": 5220,
    "name": "Attendant, canteen: food service"
  },
  {
    "isco08": 9629,
    "isco88": 9152,
    "name": "Attendant, car park"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Attendant, car park: driving cars"
  },
  {
    "isco08": 9622,
    "isco88": 9151,
    "name": "Attendant, cellar: hotel"
  },
  {
    "isco08": 9622,
    "isco88": 9151,
    "name": "Attendant, cellar: restaurant"
  },
  {
    "isco08": 4221,
    "isco88": 5111,
    "name": "Attendant, check-in: airline"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Attendant, checkout"
  },
  {
    "isco08": 9629,
    "isco88": 9152,
    "name": "Attendant, cloakroom"
  },
  {
    "isco08": 5246,
    "isco88": 5220,
    "name": "Attendant, counter: cafeteria"
  },
  {
    "isco08": 5246,
    "isco88": 5220,
    "name": "Attendant, counter: food service"
  },
  {
    "isco08": 5329,
    "isco88": 5132,
    "name": "Attendant, dental"
  },
  {
    "isco08": 5245,
    "isco88": 5220,
    "name": "Attendant, driveway"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Attendant, dry dock"
  },
  {
    "isco08": 9629,
    "isco88": 9152,
    "name": "Attendant, fairground"
  },
  {
    "isco08": 5329,
    "isco88": 5132,
    "name": "Attendant, first aid"
  },
  {
    "isco08": 5111,
    "isco88": 5111,
    "name": "Attendant, flight"
  },
  {
    "isco08": 5163,
    "isco88": 5143,
    "name": "Attendant, funeral"
  },
  {
    "isco08": 9629,
    "isco88": 9152,
    "name": "Attendant, fun-fair"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Attendant, gas station: cashier"
  },
  {
    "isco08": 5245,
    "isco88": 5220,
    "name": "Attendant, gas station: gas pump"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Attendant, hospital"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Attendant, hot-room"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Attendant, kennel"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Attendant, laboratory: animal"
  },
  {
    "isco08": 9112,
    "isco88": 9152,
    "name": "Attendant, lavatory"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Attendant, lift"
  },
  {
    "isco08": 5245,
    "isco88": 5220,
    "name": "Attendant, marina"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Attendant, midwifery: clinic or hospital"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Attendant, midwifery: home birth"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Attendant, nursing: except home"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Attendant, nursing: home"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Attendant, pantry"
  },
  {
    "isco08": 9629,
    "isco88": 9152,
    "name": "Attendant, parking"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Attendant, parking: driving cars"
  },
  {
    "isco08": 5245,
    "isco88": 5220,
    "name": "Attendant, petrol pump"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Attendant, pool"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Attendant, pullman car"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Attendant, restaurant seating"
  },
  {
    "isco08": 9112,
    "isco88": 9152,
    "name": "Attendant, rest-room"
  },
  {
    "isco08": 5246,
    "isco88": 5220,
    "name": "Attendant, salad bar"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Attendant, sauna"
  },
  {
    "isco08": 5312,
    "isco88": 5131,
    "name": "Attendant, schoolchildren"
  },
  {
    "isco08": 5245,
    "isco88": 5220,
    "name": "Attendant, service station"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Attendant, service station: cashier"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Attendant, service station: console"
  },
  {
    "isco08": 5245,
    "isco88": 5220,
    "name": "Attendant, service station: petrol pump"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Attendant, shop"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Attendant, sleeping car"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Attendant, spa"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Attendant, swimming pool"
  },
  {
    "isco08": 9629,
    "isco88": 9152,
    "name": "Attendant, theatre"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Attendant, tool crib"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Attendant, turkish bath"
  },
  {
    "isco08": 5163,
    "isco88": 5143,
    "name": "Attendant, undertaker''s"
  },
  {
    "isco08": 5329,
    "isco88": 5132,
    "name": "Attendant, ward"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Attorney"
  },
  {
    "isco08": 3339,
    "isco88": 3417,
    "name": "Auctioneer"
  },
  {
    "isco08": 2266,
    "isco88": 3229,
    "name": "Audiologist"
  },
  {
    "isco08": 2266,
    "isco88": 3229,
    "name": "Audiometrist"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Auditor"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Auditor, environmental"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Auditor, information technology"
  },
  {
    "isco08": 3313,
    "isco88": 3434,
    "name": "Auditor, night: hotel"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Author"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Author, dvd"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Author, html"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Author, internet content"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Author, multimedia"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Author, technical"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Author, web"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Author, website"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Autoglazier"
  },
  {
    "isco08": 3251,
    "isco88": 3225,
    "name": "Auxiliary, dental"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Axeman"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Axewoman"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Ayah, creche"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Ayah, home"
  },
  {
    "isco08": 5321,
    "isco88": 5132,
    "name": "Ayah, hospital"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Babysitter"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Bacteriologist"
  },
  {
    "isco08": 9321,
    "isco88": 9322,
    "name": "Bagger, hand"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Bailiff"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Baker"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Baker, biscuit"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Baker, bread"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Baker, pastry"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Balancer, scale"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Baller, thread and yarn"
  },
  {
    "isco08": 2653,
    "isco88": 2454,
    "name": "Ballerina"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Ballistician"
  },
  {
    "isco08": 2652,
    "isco88": 3473,
    "name": "Bandmaster"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Banker"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Banksman, mine"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Bankswoman, mine"
  },
  {
    "isco08": 5141,
    "isco88": 5141,
    "name": "Barber"
  },
  {
    "isco08": 5132,
    "isco88": 5123,
    "name": "Barista"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Baritone"
  },
  {
    "isco08": 5132,
    "isco88": 5123,
    "name": "Barkeeper"
  },
  {
    "isco08": 5132,
    "isco88": 5123,
    "name": "Barmaid"
  },
  {
    "isco08": 5132,
    "isco88": 5123,
    "name": "Barman"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Barrister"
  },
  {
    "isco08": 5132,
    "isco88": 5123,
    "name": "Bartender"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Bassoonist"
  },
  {
    "isco08": 9216,
    "isco88": 9213,
    "name": "Beachcomber"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Beater, aircraft panel"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Beater, game"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Beater, gold"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Beater, panel"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Beater, vehicle panel"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Beautician"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Beekeeper"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Behaviourist, animal"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Bellboy"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Bellgirl"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Bellhop"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Bell-ringer"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Bender, glass"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Bender, metal plate"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Bender, wood"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Beveller, glass"
  },
  {
    "isco08": 9624,
    "isco88": 9162,
    "name": "Bhishti"
  },
  {
    "isco08": 2622,
    "isco88": 2432,
    "name": "Bibliographer"
  },
  {
    "isco08": 9629,
    "isco88": 9120,
    "name": "Billposter"
  },
  {
    "isco08": 9629,
    "isco88": 9120,
    "name": "Billsticker"
  },
  {
    "isco08": 7323,
    "isco88": 7345,
    "name": "Binder, book"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Biochemist"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Biographer"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Biologist"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Biologist, marine"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Biologist, molecular"
  },
  {
    "isco08": 2120,
    "isco88": 2122,
    "name": "Biometrician"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Biophysicist"
  },
  {
    "isco08": 2120,
    "isco88": 2122,
    "name": "Biostatistician"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Biotechnologist"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Bishop"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Blacksmith"
  },
  {
    "isco08": 7542,
    "isco88": 7112,
    "name": "Blaster"
  },
  {
    "isco08": 7133,
    "isco88": 7143,
    "name": "Blaster sand, building exteriors"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Blaster, sand: stonecutting"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Blaster, shot, stonecutting"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Blaster, water: cleaning"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Bleacher, fibre: textile"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Blender, fibre: textile"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Blender, snuff"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Blender, tobacco"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Blocker, hat"
  },
  {
    "isco08": 7112,
    "isco88": 7122,
    "name": "Blocklayer"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Blocklayer,  wood"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Blogger"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Blower, glass"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Bluer, metal"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Boatbuilder, wood"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Boatman"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Boatswain"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Boatswain, navy"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Boatwoman"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Bodybuilder, muscles"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Bodybuilder, vehicle: metal"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Bodybuilder, vehicle: wooden"
  },
  {
    "isco08": 5414,
    "isco88": 5169,
    "name": "Bodyguard"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Boilermaker"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Boilersmith"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Bolter, roof: mining"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Bombardier"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Boner, fish"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Boner, meat"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Bonesetter"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Bonze"
  },
  {
    "isco08": 7323,
    "isco88": 7345,
    "name": "Bookbinder"
  },
  {
    "isco08": 3313,
    "isco88": 3434,
    "name": "Bookkeeper"
  },
  {
    "isco08": 4212,
    "isco88": 4213,
    "name": "Bookmaker"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Borer, glass"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Borer, metal"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Borer, well"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Borer, wood"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Boss, shift: mining"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Botanist"
  },
  {
    "isco08": 9321,
    "isco88": 9322,
    "name": "Bottler, hand"
  },
  {
    "isco08": 5414,
    "isco88": 9152,
    "name": "Bouncer"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Boxer"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Boy, bell"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Boy, errand"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Boy, messenger"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Boy, pizza: maker"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Boy, rickshaw"
  },
  {
    "isco08": 3435,
    "isco88": 3471,
    "name": "Boy, script"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Bracer, construction"
  },
  {
    "isco08": 8312,
    "isco88": 8312,
    "name": "Braker, railway"
  },
  {
    "isco08": 8312,
    "isco88": 8312,
    "name": "Braker, train"
  },
  {
    "isco08": 7212,
    "isco88": 7212,
    "name": "Brazier"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Breaker, horse"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Breeder, bird"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Breeder, cat"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Breeder, cattle"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Breeder, deer"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Breeder, dog"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Breeder, game bird"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Breeder, horse"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Breeder, laboratory: animal"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Breeder, lion"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Breeder, poultry"
  },
  {
    "isco08": 6121,
    "isco88": 6129,
    "name": "Breeder, reindeer"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Breeder, reptile"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Breeder, snail"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Breeder, stud"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Brewer, not operating machinery"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Brewer, operating machinery"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Brewer, traditional methods"
  },
  {
    "isco08": 7112,
    "isco88": 7112,
    "name": "Brickie"
  },
  {
    "isco08": 7112,
    "isco88": 7122,
    "name": "Bricklayer"
  },
  {
    "isco08": 7112,
    "isco88": 7122,
    "name": "Bricklayer, refractory"
  },
  {
    "isco08": 7112,
    "isco88": 7113,
    "name": "Brickmason"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Brigadier, army"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Briner, foodstuffs"
  },
  {
    "isco08": 3331,
    "isco88": 3422,
    "name": "Broker, cargo"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Broker, commodities"
  },
  {
    "isco08": 3331,
    "isco88": 3422,
    "name": "Broker, customs"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Broker, finance"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Broker, foreign exchange"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Broker, futures: commodities"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Broker, futures: financial"
  },
  {
    "isco08": 3321,
    "isco88": 3412,
    "name": "Broker, insurance"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Broker, investment"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Broker, lease"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Broker, mortgage"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Broker, securities"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Broker, shipping"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Broker, stocks and shares"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Broker, trade"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Brother"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Bucker, logging"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Budder-grafter, fruit tree"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Budder-grafter, shrubs"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Buffer, leather"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Buffer, metal"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Builder, armature"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Builder, barge: wooden"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Builder, boat: wood"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Builder, body: muslces"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Builder, body: vehicle (metal)"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Builder, body: vehicle (wooden)"
  },
  {
    "isco08": 8219,
    "isco88": 8290,
    "name": "Builder, box"
  },
  {
    "isco08": 7112,
    "isco88": 7122,
    "name": "Builder, chimney"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Builder, coach-body: wooden"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Builder, commutator"
  },
  {
    "isco08": 7111,
    "isco88": 7121,
    "name": "Builder, house"
  },
  {
    "isco08": 7111,
    "isco88": 7129,
    "name": "Builder, house: non-traditional materials"
  },
  {
    "isco08": 7111,
    "isco88": 7121,
    "name": "Builder, house: traditional materials"
  },
  {
    "isco08": 7111,
    "isco88": 7129,
    "name": "Builder, non-traditional materials"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Builder, organ"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Builder, plastic boat"
  },
  {
    "isco08": 1323,
    "isco88": 1223,
    "name": "Builder, project"
  },
  {
    "isco08": 7111,
    "isco88": 7121,
    "name": "Builder, traditional materials"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Builder, vehicle body: metal"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Builder, vehicle-body: wooden"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Builder, vehicle-frame: wooden"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Bulker, tobacco"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Burner, charcoal"
  },
  {
    "isco08": 7212,
    "isco88": 7212,
    "name": "Burner, lead"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Burnisher, ceramics"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Burnisher, footwears"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Burnisher, metal"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Bursar"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Butcher"
  },
  {
    "isco08": 5152,
    "isco88": 5121,
    "name": "Butler"
  },
  {
    "isco08": 3323,
    "isco88": 3416,
    "name": "Buyer"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Cabinet-maker"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Cabinet-maker, furniture"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Cabler, data"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Cabler, telecommunications"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Caddie, golf"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Cadet, officer: armed forces"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Calenderer, cloth"
  },
  {
    "isco08": 8157,
    "isco88": 8264,
    "name": "Calenderer, laundry"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Calenderer, pulp and paper"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Calibrator, precision instrument"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Calibrator, weights and measures"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Calligrapher"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Cameraman, motion picture"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Cameraman, photogravure"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Cameraman, video"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Cameraman, xerography: offset printing"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Camerawoman, motion picture"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Camerawoman, photogravure"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Camerawoman, video"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Camerawoman, xerography: offset printing"
  },
  {
    "isco08": 7319,
    "isco88": 7331,
    "name": "Candle-maker, handicraft"
  },
  {
    "isco08": 8131,
    "isco88": 8229,
    "name": "Candle-maker, machine"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Canner, fruit"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Canner, vegetable"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Canon"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Canvasser"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Canvasser, door-to-door"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Caponizer"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Captain, air force"
  },
  {
    "isco08": 3153,
    "isco88": 3143,
    "name": "Captain, aircraft"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Captain, army"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Captain, fishing: coastal waters"
  },
  {
    "isco08": 6223,
    "isco88": 6153,
    "name": "Captain, fishing: deep-sea"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Captain, group: air force"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Captain, navy"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Captain, night: supermarket"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Captain, port"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Captain, ship"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Captain, ship: inland waterways"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Captain, ship: sea"
  },
  {
    "isco08": 1312,
    "isco88": 1221,
    "name": "Captain, shore: fishing"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Captain, shore: shipping"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Carder, fibre: textile"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Cardiologist"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Carer, child"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Carer, home: aged or disabled persons"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Carer, respite"
  },
  {
    "isco08": 5153,
    "isco88": 9141,
    "name": "Caretaker, building"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Caricaturist"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Carpenter"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Carpenter, finish"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Carpenter-joiner"
  },
  {
    "isco08": 7318,
    "isco88": 7436,
    "name": "Carpet-maker"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Carrier, bricks"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Carrier, hod"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Carrier, post"
  },
  {
    "isco08": 9624,
    "isco88": 9162,
    "name": "Carrier, water"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Cartographer"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Cartoonist"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Cartwright"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Carver, stone"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Carver, wood"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Carver-setter, monument"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Caseworker, associate professional"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Caseworker, professional"
  },
  {
    "isco08": 4211,
    "isco88": 4211,
    "name": "Cashier, bank"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Cashier, booking-office"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Cashier, box-office"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Cashier, cash desk"
  },
  {
    "isco08": 4211,
    "isco88": 4211,
    "name": "Cashier, change-booth"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Cashier, check-out: self-service store"
  },
  {
    "isco08": 4211,
    "isco88": 4211,
    "name": "Cashier, currency: exchange"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Cashier, office"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Cashier, restaurant"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Cashier, service station"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Cashier, store"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Cashier, supermarket"
  },
  {
    "isco08": 3135,
    "isco88": 8122,
    "name": "Caster, central control"
  },
  {
    "isco08": 7114,
    "isco88": 7123,
    "name": "Caster, concrete: products"
  },
  {
    "isco08": 7321,
    "isco88": 7342,
    "name": "Caster, electrotype"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Caster, jewellery moulds"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Caster, metal"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Caster, pottery and porcelain"
  },
  {
    "isco08": 7321,
    "isco88": 7342,
    "name": "Caster, stereotype"
  },
  {
    "isco08": 2622,
    "isco88": 2432,
    "name": "Cataloguer"
  },
  {
    "isco08": 9622,
    "isco88": 9151,
    "name": "Cellarhand, hotel"
  },
  {
    "isco08": 9622,
    "isco88": 9151,
    "name": "Cellarhand, restaurant"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Cellarhand, wine production"
  },
  {
    "isco08": 9622,
    "isco88": 9151,
    "name": "Cellarman, hotel"
  },
  {
    "isco08": 9622,
    "isco88": 9151,
    "name": "Cellarman, restaurant"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Cellarman, wine production"
  },
  {
    "isco08": 9622,
    "isco88": 9151,
    "name": "Cellarwoman, hotel"
  },
  {
    "isco08": 9622,
    "isco88": 9151,
    "name": "Cellarwoman, restaurant"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Cellarwoman, wine production"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Cellist"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Cementer, footwear: uppers"
  },
  {
    "isco08": 3117,
    "isco88": 3117,
    "name": "Cementer, oil and gas well"
  },
  {
    "isco08": 2422,
    "isco88": 3449,
    "name": "Censor, film"
  },
  {
    "isco08": 2422,
    "isco88": 3449,
    "name": "Censor, government"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "CEO"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "CFO"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Chairperson, charity"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "Chairperson, employers'' organization"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Chairperson, enterprise"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Chairperson, environment protection organization"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Chairperson, human rights organization"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Chairperson, humanitarian organization"
  },
  {
    "isco08": 1114,
    "isco88": 1141,
    "name": "Chairperson, political party"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Chairperson, special-interest organization"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Chairperson, sports association"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "Chairperson, trade union"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Chairperson, wild life protection organization"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Chambermaid"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Chancellor, government"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Chancellor, university"
  },
  {
    "isco08": 4211,
    "isco88": 4211,
    "name": "Changer, money"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Channeller, footwear: soles"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Chaplain"
  },
  {
    "isco08": 8121,
    "isco88": 8121,
    "name": "Charger, furnace"
  },
  {
    "isco08": 9111,
    "isco88": 9131,
    "name": "Charworker, domestic"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Charworker, factory"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Charworker, hotel"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Charworker, office"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Charworker, restaurant"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Chauffeur, motor-car"
  },
  {
    "isco08": 3434,
    "isco88": 5122,
    "name": "Chef"
  },
  {
    "isco08": 3434,
    "isco88": 5122,
    "name": "Chef de cuisine"
  },
  {
    "isco08": 3434,
    "isco88": 5122,
    "name": "Chef, executive"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Chef, fast food"
  },
  {
    "isco08": 3434,
    "isco88": 5122,
    "name": "Chef, head"
  },
  {
    "isco08": 3434,
    "isco88": 5122,
    "name": "Chef, pastry"
  },
  {
    "isco08": 2113,
    "isco88": 2113,
    "name": "Chemist"
  },
  {
    "isco08": 2262,
    "isco88": 2224,
    "name": "Chemist, dispensing"
  },
  {
    "isco08": 2262,
    "isco88": 2224,
    "name": "Chemist, hospital"
  },
  {
    "isco08": 2113,
    "isco88": 2113,
    "name": "Chemist, industrial"
  },
  {
    "isco08": 2113,
    "isco88": 2113,
    "name": "Chemist, pharmaceutical"
  },
  {
    "isco08": 2113,
    "isco88": 2113,
    "name": "Chemist, research"
  },
  {
    "isco08": 2262,
    "isco88": 2224,
    "name": "Chemist, retail"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Chief executive"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Chief minister, government"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Chief whip"
  },
  {
    "isco08": 2612,
    "isco88": 2422,
    "name": "Chief, justice"
  },
  {
    "isco08": 1113,
    "isco88": 1130,
    "name": "Chief, village"
  },
  {
    "isco08": 7133,
    "isco88": 7143,
    "name": "Chimney-sweep"
  },
  {
    "isco08": 2269,
    "isco88": 5141,
    "name": "Chiropodist"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Chiropractor"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Choirmaster"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Chokerman"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Chokerwoman"
  },
  {
    "isco08": 2653,
    "isco88": 2454,
    "name": "Choreographer"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Chorus master"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Cinematographer"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "CIO"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Clarinettist"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Classer, fibre: textile"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Classer, hide"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Classer, pelt"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Classer, skin"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Classer, wool"
  },
  {
    "isco08": 8121,
    "isco88": 8121,
    "name": "Classifier, aluminum"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Cleaner, aircraft"
  },
  {
    "isco08": 7133,
    "isco88": 7143,
    "name": "Cleaner, building exteriors"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Cleaner, bus"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Cleaner, carpet"
  },
  {
    "isco08": 7133,
    "isco88": 7143,
    "name": "Cleaner, chimney flue"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Cleaner, cooling tower"
  },
  {
    "isco08": 9111,
    "isco88": 9131,
    "name": "Cleaner, domestic"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Cleaner, drain"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Cleaner, dry: carpet"
  },
  {
    "isco08": 9121,
    "isco88": 9133,
    "name": "Cleaner, dry: hand"
  },
  {
    "isco08": 8157,
    "isco88": 8264,
    "name": "Cleaner, dry: machine"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Cleaner, factory"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Cleaner, factory machines"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Cleaner, filter"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Cleaner, graffiti"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Cleaner, gutter"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Cleaner, hospital"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Cleaner, hotel"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Cleaner, metal"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Cleaner, office"
  },
  {
    "isco08": 9613,
    "isco88": 9162,
    "name": "Cleaner, park"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Cleaner, pool"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Cleaner, restaurant"
  },
  {
    "isco08": 9613,
    "isco88": 9162,
    "name": "Cleaner, street"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Cleaner, swimming pool"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Cleaner, train"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Cleaner, upholstery"
  },
  {
    "isco08": 9122,
    "isco88": 9142,
    "name": "Cleaner, vehicles"
  },
  {
    "isco08": 9123,
    "isco88": 9142,
    "name": "Cleaner, window"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Clearer, tree"
  },
  {
    "isco08": 4110,
    "isco88": 4100,
    "name": "Clerk"
  },
  {
    "isco08": 3112,
    "isco88": 3112,
    "name": "Clerk of works"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Clerk, accounting machine"
  },
  {
    "isco08": 4311,
    "isco88": 4121,
    "name": "Clerk, accounts"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Clerk, acquisitions: library"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, actuarial"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Clerk, adding machine"
  },
  {
    "isco08": 4419,
    "isco88": 4190,
    "name": "Clerk, addressing machine"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, adjustment"
  },
  {
    "isco08": 4419,
    "isco88": 4190,
    "name": "Clerk, advertising"
  },
  {
    "isco08": 4323,
    "isco88": 4133,
    "name": "Clerk, air transport operations"
  },
  {
    "isco08": 4226,
    "isco88": 4222,
    "name": "Clerk, appointments"
  },
  {
    "isco08": 4311,
    "isco88": 4121,
    "name": "Clerk, auction"
  },
  {
    "isco08": 4312,
    "isco88": 4121,
    "name": "Clerk, audit"
  },
  {
    "isco08": 4211,
    "isco88": 4211,
    "name": "Clerk, bank"
  },
  {
    "isco08": 4214,
    "isco88": 4215,
    "name": "Clerk, bills"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, bond"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Clerk, bookings: travel"
  },
  {
    "isco08": 4311,
    "isco88": 4121,
    "name": "Clerk, bookkeeping"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Clerk, bookkeeping machine"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Clerk, book-loan"
  },
  {
    "isco08": 4212,
    "isco88": 4211,
    "name": "Clerk, bookmaking"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, brokerage"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Clerk, calculating machine"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Clerk, call centre"
  },
  {
    "isco08": 4311,
    "isco88": 4121,
    "name": "Clerk, cash-accounting"
  },
  {
    "isco08": 4221,
    "isco88": 5111,
    "name": "Clerk, check-in: airport"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Clerk, classification: data processing"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Clerk, classification: library"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Clerk, classification: statistics"
  },
  {
    "isco08": 4419,
    "isco88": 4190,
    "name": "Clerk, classified advertising"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Clerk, coding"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Clerk, coding: clinical"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Clerk, coding: data-processing"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Clerk, coding: statistics"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, collateral"
  },
  {
    "isco08": 4419,
    "isco88": 4190,
    "name": "Clerk, compilation: directory"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Clerk, comptometer"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Clerk, computing machine"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, control: stock"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Clerk, conveyancing"
  },
  {
    "isco08": 4415,
    "isco88": 4141,
    "name": "Clerk, copying"
  },
  {
    "isco08": 4419,
    "isco88": 4190,
    "name": "Clerk, correspondence"
  },
  {
    "isco08": 4311,
    "isco88": 4121,
    "name": "Clerk, cost computing"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Clerk, court"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, credit"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Clerk, customer contact centre"
  },
  {
    "isco08": 4132,
    "isco88": 4113,
    "name": "Clerk, data entry"
  },
  {
    "isco08": 4132,
    "isco88": 4113,
    "name": "Clerk, data input"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, depository: furniture"
  },
  {
    "isco08": 4323,
    "isco88": 4133,
    "name": "Clerk, dispatch: air transport"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Clerk, dispatch: mail"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, dispatch: stock"
  },
  {
    "isco08": 4415,
    "isco88": 4141,
    "name": "Clerk, document duplication"
  },
  {
    "isco08": 4225,
    "isco88": 4222,
    "name": "Clerk, enquiry"
  },
  {
    "isco08": 4312,
    "isco88": 4121,
    "name": "Clerk, estimating"
  },
  {
    "isco08": 4415,
    "isco88": 4141,
    "name": "Clerk, filing"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, finance"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Clerk, finance: approving or assessing credit or loans"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Clerk, finance: processing credit applications or loans"
  },
  {
    "isco08": 4323,
    "isco88": 4133,
    "name": "Clerk, flight operations"
  },
  {
    "isco08": 4414,
    "isco88": 4144,
    "name": "Clerk, form filling: assistance"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Clerk, franking machine"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, freight"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, freight: dispatching"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, freight: inward"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Clerk, freight: receiving"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Clerk, freight: routing"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Clerk, freight: shipping"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Clerk, freight: traffic"
  },
  {
    "isco08": 4110,
    "isco88": 4100,
    "name": "Clerk, general: office"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, goods: inward"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Clerk, goods: railway"
  },
  {
    "isco08": 4229,
    "isco88": 4222,
    "name": "Clerk, hospital admissions"
  },
  {
    "isco08": 4224,
    "isco88": 4222,
    "name": "Clerk, hotel front desk"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Clerk, human resources"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Clerk, index"
  },
  {
    "isco08": 4225,
    "isco88": 4222,
    "name": "Clerk, information"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Clerk, information: call centre"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Clerk, information: customer contact centre"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Clerk, information: health"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Clerk, information: travel"
  },
  {
    "isco08": 4225,
    "isco88": 4222,
    "name": "Clerk, inquiries: counter"
  },
  {
    "isco08": 4312,
    "isco88": 3432,
    "name": "Clerk, insurance"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, inventory: stock control"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, investment"
  },
  {
    "isco08": 4311,
    "isco88": 4121,
    "name": "Clerk, invoice"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Clerk, invoicing machine"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Clerk, judge''s"
  },
  {
    "isco08": 4131,
    "isco88": 4111,
    "name": "Clerk, justowriting"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Clerk, law"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Clerk, leave"
  },
  {
    "isco08": 4311,
    "isco88": 4121,
    "name": "Clerk, ledger"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Clerk, library"
  },
  {
    "isco08": 4419,
    "isco88": 4190,
    "name": "Clerk, list: addresses"
  },
  {
    "isco08": 4419,
    "isco88": 4190,
    "name": "Clerk, list: mail"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Clerk, listing"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Clerk, loans: library"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Clerk, logistics"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Clerk, mail"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, mortgage"
  },
  {
    "isco08": 4110,
    "isco88": 4100,
    "name": "Clerk, office"
  },
  {
    "isco08": 4311,
    "isco88": 4121,
    "name": "Clerk, office cash"
  },
  {
    "isco08": 4322,
    "isco88": 4132,
    "name": "Clerk, order: materials"
  },
  {
    "isco08": 4132,
    "isco88": 4113,
    "name": "Clerk, payment entry"
  },
  {
    "isco08": 4313,
    "isco88": 4121,
    "name": "Clerk, payroll"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Clerk, personnel"
  },
  {
    "isco08": 4415,
    "isco88": 4141,
    "name": "Clerk, photocopying"
  },
  {
    "isco08": 4322,
    "isco88": 4132,
    "name": "Clerk, planning: materials"
  },
  {
    "isco08": 4211,
    "isco88": 4211,
    "name": "Clerk, post office: counter"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Clerk, posting machine"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Clerk, probate"
  },
  {
    "isco08": 4322,
    "isco88": 4132,
    "name": "Clerk, production"
  },
  {
    "isco08": 4322,
    "isco88": 4132,
    "name": "Clerk, production planning: coordination"
  },
  {
    "isco08": 4322,
    "isco88": 4132,
    "name": "Clerk, production planning: schedule"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Clerk, proofreading"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Clerk, proofreading"
  },
  {
    "isco08": 4419,
    "isco88": 4190,
    "name": "Clerk, publication"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, rating"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, receiving"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Clerk, records: medical"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Clerk, records: personnel"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, records: stock control"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Clerk, recruitment"
  },
  {
    "isco08": 4415,
    "isco88": 4141,
    "name": "Clerk, reproduction processes: office"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Clerk, reservations: travel"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Clerk, roster"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Clerk, rostering workers"
  },
  {
    "isco08": 4313,
    "isco88": 4121,
    "name": "Clerk, salaries"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Clerk, sales"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, scale"
  },
  {
    "isco08": 4322,
    "isco88": 4132,
    "name": "Clerk, schedule: materials"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Clerk, scripts"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, securities"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Clerk, sorting: mail"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Clerk, staff"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, statistical"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, stock"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Clerk, store: sales"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Clerk, store: stock"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, storeroom"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, supply"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, tally"
  },
  {
    "isco08": 4312,
    "isco88": 4122,
    "name": "Clerk, tax"
  },
  {
    "isco08": 4131,
    "isco88": 4112,
    "name": "Clerk, telefax"
  },
  {
    "isco08": 4131,
    "isco88": 4112,
    "name": "Clerk, telegraph"
  },
  {
    "isco08": 4131,
    "isco88": 4112,
    "name": "Clerk, teleprinter"
  },
  {
    "isco08": 4131,
    "isco88": 4112,
    "name": "Clerk, telex"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Clerk, ticket issuing: entertainment and sporting events"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Clerk, ticket issuing: travel"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Clerk, toll collection"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Clerk, tourism information"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Clerk, transport"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Clerk, travel"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Clerk, travel agency"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Clerk, travel desk"
  },
  {
    "isco08": 4131,
    "isco88": 4111,
    "name": "Clerk, typing"
  },
  {
    "isco08": 4313,
    "isco88": 4121,
    "name": "Clerk, wages"
  },
  {
    "isco08": 4229,
    "isco88": 4222,
    "name": "Clerk, ward"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, warehouse"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, weighbridge"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Clerk, weighing"
  },
  {
    "isco08": 4131,
    "isco88": 4112,
    "name": "Clerk, word processing"
  },
  {
    "isco08": 2112,
    "isco88": 2112,
    "name": "Climatologist"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Climber, high: logging"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Climber, logging"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Climber, tree"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Clipper, mine"
  },
  {
    "isco08": 4419,
    "isco88": 4190,
    "name": "Clipper, press"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Clown"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Coach, athletic"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Coach, call centre"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Coach, contact centre"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Coach, dance"
  },
  {
    "isco08": 2355,
    "isco88": 3340,
    "name": "Coach, dancesport"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Coach, debating"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Coach, drama"
  },
  {
    "isco08": 2424,
    "isco88": 2412,
    "name": "Coach, executive"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Coach, games"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Coach, mathematics: private tuition"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Coach, phone"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Coach, sports"
  },
  {
    "isco08": 2354,
    "isco88": 2359,
    "name": "Coach, vocal"
  },
  {
    "isco08": 9333,
    "isco88": 9162,
    "name": "Coalman"
  },
  {
    "isco08": 9333,
    "isco88": 9162,
    "name": "Coalwoman"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Coastguard"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Cobbler"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Coder, clerical"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Coder, clinical"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Coder, data-processing"
  },
  {
    "isco08": 4413,
    "isco88": 4143,
    "name": "Coder, statistics"
  },
  {
    "isco08": 7323,
    "isco88": 7345,
    "name": "Collator, bookbinding"
  },
  {
    "isco08": 4214,
    "isco88": 4215,
    "name": "Collector, account"
  },
  {
    "isco08": 4214,
    "isco88": 4215,
    "name": "Collector, bill and account"
  },
  {
    "isco08": 4214,
    "isco88": 4215,
    "name": "Collector, charity"
  },
  {
    "isco08": 9623,
    "isco88": 9153,
    "name": "Collector, coin machine"
  },
  {
    "isco08": 9623,
    "isco88": 9153,
    "name": "Collector, coin meter"
  },
  {
    "isco08": 4214,
    "isco88": 4215,
    "name": "Collector, debt"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Collector, egg"
  },
  {
    "isco08": 9624,
    "isco88": 9162,
    "name": "Collector, firewood"
  },
  {
    "isco08": 9611,
    "isco88": 9161,
    "name": "Collector, garbage"
  },
  {
    "isco08": 4214,
    "isco88": 4215,
    "name": "Collector, payment"
  },
  {
    "isco08": 9611,
    "isco88": 9161,
    "name": "Collector, recycling"
  },
  {
    "isco08": 9611,
    "isco88": 9161,
    "name": "Collector, refuse"
  },
  {
    "isco08": 4214,
    "isco88": 4215,
    "name": "Collector, rent"
  },
  {
    "isco08": 6340,
    "isco88": 6210,
    "name": "Collector, subsistence"
  },
  {
    "isco08": 3352,
    "isco88": 3442,
    "name": "Collector, tax"
  },
  {
    "isco08": 9629,
    "isco88": 9152,
    "name": "Collector, ticket"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Collector, toll"
  },
  {
    "isco08": 9623,
    "isco88": 9153,
    "name": "Collector, turnstile"
  },
  {
    "isco08": 9623,
    "isco88": 9153,
    "name": "Collector, vending-machine"
  },
  {
    "isco08": 9624,
    "isco88": 9162,
    "name": "Collector, water"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Colonel, army"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Columnist"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Comber, fibre: textile"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Comedian"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Comedian, stand-up"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Comic"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Comic, circus"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Commander, navy"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Commander, wing: air force"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Commando, army"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Commentator, extempore"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Commentator, news"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Commentator, sports"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Commissioner, civil service"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Commissioner, fire"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Commissioner, high: government"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Commissioner, inland revenue"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Commissioner, police"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Commodore, air"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Commodore, navy"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Communicator, technical"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Companion, aged care"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Companion, disabled"
  },
  {
    "isco08": 5162,
    "isco88": 5142,
    "name": "Companion, except health or aged care"
  },
  {
    "isco08": 5162,
    "isco88": 5142,
    "name": "Companion, lady''s"
  },
  {
    "isco08": 5162,
    "isco88": 5142,
    "name": "Companion, man''s"
  },
  {
    "isco08": 4419,
    "isco88": 4190,
    "name": "Compiler, directory"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Composer, music"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Compositor, printing"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Concher, chocolate"
  },
  {
    "isco08": 5153,
    "isco88": 9141,
    "name": "Concierge, building"
  },
  {
    "isco08": 5414,
    "isco88": 9152,
    "name": "Concierge, hotel"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Conciliator, labour relations"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Conciliator, workplace"
  },
  {
    "isco08": 7114,
    "isco88": 7123,
    "name": "Concreter"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Conditioner, tobacco leaves"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Conditioner, yarn"
  },
  {
    "isco08": 2652,
    "isco88": 3473,
    "name": "Conductor, band"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Conductor, bus"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Conductor, cable car"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Conductor, ferryboat"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Conductor, hovercraft"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Conductor, music"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Conductor, orchestra"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Conductor, pullman car"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Conductor, sleeping car"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Conductor, train"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Conductor, tram"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Conductor, trolley-bus"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Conductor, vocal group"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Coner, hat forms"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Confectioner"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Congressman"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Congresswoman"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Conjuror"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Conservationist, soil"
  },
  {
    "isco08": 2621,
    "isco88": 2431,
    "name": "Conservator"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Constable"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Constable, chief: police"
  },
  {
    "isco08": 3355,
    "isco88": 3450,
    "name": "Constable, detective"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Consul-general"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Consultant, accountancy"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Consultant, advertising"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Consultant, agricultural"
  },
  {
    "isco08": 2143,
    "isco88": 2149,
    "name": "Consultant, air pollution control"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Consultant, audit"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Consultant, beauty"
  },
  {
    "isco08": 2421,
    "isco88": 2419,
    "name": "Consultant, business"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Consultant, business: information technology"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Consultant, communications"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Consultant, computer systems: managing system"
  },
  {
    "isco08": 2356,
    "isco88": 2359,
    "name": "Consultant, computer training"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Consultant, crop"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Consultant, data mining"
  },
  {
    "isco08": 2265,
    "isco88": 3223,
    "name": "Consultant, dietetic"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Consultant, digital forensics"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Consultant, ecological"
  },
  {
    "isco08": 2631,
    "isco88": 2441,
    "name": "Consultant, economic development"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Consultant, education"
  },
  {
    "isco08": 4229,
    "isco88": 4222,
    "name": "Consultant, eligibility"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Consultant, employment"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Consultant, endocrinology"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Consultant, engineering, chemical"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Consultant, environmental"
  },
  {
    "isco08": 2263,
    "isco88": 3222,
    "name": "Consultant, environmental health"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Consultant, environmental management"
  },
  {
    "isco08": 2143,
    "isco88": 2149,
    "name": "Consultant, environmental remediation"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Consultant, events management"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Consultant, farm management"
  },
  {
    "isco08": 2412,
    "isco88": 2411,
    "name": "Consultant, financial"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Consultant, financial advice"
  },
  {
    "isco08": 3112,
    "isco88": 3151,
    "name": "Consultant, fire prevention"
  },
  {
    "isco08": 5141,
    "isco88": 5141,
    "name": "Consultant, hair care"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Consultant, health care planning"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Consultant, human resources"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Consultant, information systems: managing system"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Consultant, information technology: managing system"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Consultant, information technology: systems administration"
  },
  {
    "isco08": 2356,
    "isco88": 2359,
    "name": "Consultant, information technology: training"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Consultant, information technology: unix administration"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Consultant, internet: developing websites"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Consultant, internet: helpdesk"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Consultant, internet: programming"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Consultant, internet: support"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Consultant, investment: advising clients"
  },
  {
    "isco08": 2413,
    "isco88": 2419,
    "name": "Consultant, investment: financial analysis"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Consultant, it helpdesk"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Consultant, land management: environmental management"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Consultant, livestock"
  },
  {
    "isco08": 2421,
    "isco88": 2419,
    "name": "Consultant, management"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Consultant, market: research"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Consultant, marketing"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Consultant, medical: general practice"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Consultant, medical: specialist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Consultant, medical: specialist physician"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Consultant, natural resource management"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Consultant, nurse: clinical"
  },
  {
    "isco08": 2263,
    "isco88": 3152,
    "name": "Consultant, occupational health and safety"
  },
  {
    "isco08": 2263,
    "isco88": 3152,
    "name": "Consultant, occupational hygiene"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Consultant, party plan"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Consultant, pensions"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Consultant, personnel"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Consultant, property: investment"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Consultant, public relations"
  },
  {
    "isco08": 2263,
    "isco88": 3222,
    "name": "Consultant, radiation protection"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Consultant, recruitment"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Consultant, sales: automobile"
  },
  {
    "isco08": 5249,
    "isco88": 5220,
    "name": "Consultant, sales: car hire"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Consultant, sales: computer systems"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Consultant, sales: door-to-door"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Consultant, sales: engineering"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Consultant, sales: information technology"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Consultant, sales: manufacturing"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Consultant, sales: outbound calls"
  },
  {
    "isco08": 5249,
    "isco88": 5220,
    "name": "Consultant, sales: rental"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Consultant, sales: technical (except ICT)"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Consultant, sales: technical (ICT)"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Consultant, sales: telemarketing"
  },
  {
    "isco08": 2413,
    "isco88": 2419,
    "name": "Consultant, securities"
  },
  {
    "isco08": 5414,
    "isco88": 5169,
    "name": "Consultant, security"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Consultant, security: computer"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Consultant, security: data"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Consultant, security: ICT"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Consultant, security: policy"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Consultant, slimming"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Consultant, social policy"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Consultant, software support"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Consultant, soil"
  },
  {
    "isco08": 2424,
    "isco88": 2412,
    "name": "Consultant, staff development: training"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Consultant, superannuation: providing advice"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Consultant, support: information technology"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Consultant, systems: computers"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Consultant, technical: software support"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Consultant, telesales: cold calling"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Consultant, telesales: outbound calls"
  },
  {
    "isco08": 4221,
    "isco88": 3414,
    "name": "Consultant, travel"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Consultant, weight loss"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Contortionist"
  },
  {
    "isco08": 1323,
    "isco88": 1223,
    "name": "Contractor, building: project management"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Contractor, cleaning"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Contractor, gardening"
  },
  {
    "isco08": 3333,
    "isco88": 3423,
    "name": "Contractor, labour"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Contractor, landscaping"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Contractor, lawnmowing"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Contractor, mowing"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Contractor, spraying: pest or weed control"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Contralto"
  },
  {
    "isco08": 3154,
    "isco88": 3144,
    "name": "Controller, air traffic"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Controller, clerical: air transport service"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Controller, clerical: airline traffic"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Controller, clerical: mail"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Controller, clerical: postal service"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Controller, clerical: railway service"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Controller, clerical: train"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Controller, clerical: transport service"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Controller, credit: assessing credit worthiness of clients"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Controller, financial"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Controller, pest"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Controller, production: mining"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Controller, quality"
  },
  {
    "isco08": 3139,
    "isco88": 3123,
    "name": "Controller, robot: industrial"
  },
  {
    "isco08": 3341,
    "isco88": 4111,
    "name": "Controller, typist"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Controller, weed"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "COO"
  },
  {
    "isco08": 5120,
    "isco88": 5122,
    "name": "Cook"
  },
  {
    "isco08": 3434,
    "isco88": 5122,
    "name": "Cook, chief"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Cook, fast food"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Cook, fish and chips"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Cook, hamburgers"
  },
  {
    "isco08": 3434,
    "isco88": 5122,
    "name": "Cook, head"
  },
  {
    "isco08": 5120,
    "isco88": 5122,
    "name": "Cook, mess"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Cook, pizza"
  },
  {
    "isco08": 7514,
    "isco88": 5122,
    "name": "Cook, preserving"
  },
  {
    "isco08": 5120,
    "isco88": 5122,
    "name": "Cook, restaurant"
  },
  {
    "isco08": 5120,
    "isco88": 5122,
    "name": "Cook, ship"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Cook, short order"
  },
  {
    "isco08": 5120,
    "isco88": 5122,
    "name": "Cook, special diets"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Cook, take away"
  },
  {
    "isco08": 5120,
    "isco88": 5122,
    "name": "Cook, vegetable"
  },
  {
    "isco08": 5120,
    "isco88": 5122,
    "name": "Cook, work camp"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Cooper"
  },
  {
    "isco08": 3341,
    "isco88": 3439,
    "name": "Coordinator, administration: office administration or management"
  },
  {
    "isco08": 3122,
    "isco88": 8290,
    "name": "Coordinator, area: manufacturing"
  },
  {
    "isco08": 3123,
    "isco88": 1223,
    "name": "Coordinator, building: construction"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Coordinator, catchment: environment"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Coordinator, community aged care"
  },
  {
    "isco08": 1342,
    "isco88": 1319,
    "name": "Coordinator, community health care"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Coordinator, conference"
  },
  {
    "isco08": 3123,
    "isco88": 1223,
    "name": "Coordinator, construction site"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Coordinator, crewing"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Coordinator, curriculum"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Coordinator, environmental"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Coordinator, events"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Coordinator, function"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Coordinator, information services: managing computer system"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Coordinator, policy: government"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Coordinator, production: mining"
  },
  {
    "isco08": 3435,
    "isco88": 3471,
    "name": "Coordinator, program: broadcasting"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Coordinator, retirement village"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Coordinator, shift: mining"
  },
  {
    "isco08": 3123,
    "isco88": 1223,
    "name": "Coordinator, site: building"
  },
  {
    "isco08": 3123,
    "isco88": 1223,
    "name": "Coordinator, site: construction"
  },
  {
    "isco08": 2519,
    "isco88": 2139,
    "name": "Coordinator, software testing"
  },
  {
    "isco08": 3435,
    "isco88": 3471,
    "name": "Coordinator, stunt"
  },
  {
    "isco08": 2519,
    "isco88": 2139,
    "name": "Coordinator, test: software"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Coordinator, web: managing website"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Coordinator, wedding"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Coppersmith"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Copyist, jacquard design"
  },
  {
    "isco08": 2431,
    "isco88": 2451,
    "name": "Copywriter, advertising"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Copywriter, news media"
  },
  {
    "isco08": 2432,
    "isco88": 2451,
    "name": "Copywriter, publicity"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Copywriter, technical"
  },
  {
    "isco08": 7211,
    "isco88": 7211,
    "name": "Coremaker"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Cornetist"
  },
  {
    "isco08": 2619,
    "isco88": 2429,
    "name": "Coroner"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Corporal, air force"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Corporal, army"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Correspondent, media"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Cosmetologist"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Councillor, city"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Councillor, government"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Counsel, legal"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Counsellor, addictions"
  },
  {
    "isco08": 3259,
    "isco88": 3229,
    "name": "Counsellor, AIDS"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Counsellor, bereavement"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Counsellor, child and youth"
  },
  {
    "isco08": 2359,
    "isco88": 2359,
    "name": "Counsellor, college"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Counsellor, employment"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Counsellor, family"
  },
  {
    "isco08": 3259,
    "isco88": 3229,
    "name": "Counsellor, family planning"
  },
  {
    "isco08": 3259,
    "isco88": 3229,
    "name": "Counsellor, HIV"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Counsellor, marriage"
  },
  {
    "isco08": 2359,
    "isco88": 2359,
    "name": "Counsellor, school"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Counsellor, sexual assault"
  },
  {
    "isco08": 2359,
    "isco88": 2359,
    "name": "Counsellor, student"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Counsellor, tourism information"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Counsellor, travel"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Counsellor, visitor information"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Counsellor, vocational guidance"
  },
  {
    "isco08": 8312,
    "isco88": 8312,
    "name": "Coupler, railway yard"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Courier, bicycle"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Courier, diplomatic"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Courier, driving car"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Courier, driving van"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Courier, motorcycle"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Courier, on foot"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Cowboy"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Cowgirl"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Cowherd"
  },
  {
    "isco08": 6320,
    "isco88": 6210,
    "name": "Cowherd: subsistence farming"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Coxswain, lifeboat"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Coxswain, navy"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Coxswain, navy: chief petty officer"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Coxswain, navy: warrant officer"
  },
  {
    "isco08": 9321,
    "isco88": 9322,
    "name": "Crater, hand"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Creeler"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Crewman"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Crewman, armoured fighting vehicle"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Crewman, armoured personnel carrier"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Crewman, dredger"
  },
  {
    "isco08": 6223,
    "isco88": 6153,
    "name": "Crewman, drifter"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Crewman, tank"
  },
  {
    "isco08": 6223,
    "isco88": 6153,
    "name": "Crewman, trawler"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Crewman, whaling vessel"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Crewman, yacht"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Crewwoman"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Crewwoman, armoured fighting vehicle"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Crewwoman, armoured personnel carrier"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Crewwoman, dredger"
  },
  {
    "isco08": 6223,
    "isco88": 6153,
    "name": "Crewwoman, drifter"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Crewwoman, tank"
  },
  {
    "isco08": 6223,
    "isco88": 6153,
    "name": "Crewwoman, trawler"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Crewwoman, whaling vessel"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Crewwoman, yacht"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Cricketer"
  },
  {
    "isco08": 2632,
    "isco88": 2442,
    "name": "Criminologist"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Critic"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Critic, art"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Crocheter"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Cross-cutter, logging"
  },
  {
    "isco08": 4212,
    "isco88": 4213,
    "name": "Croupier"
  },
  {
    "isco08": 4212,
    "isco88": 4213,
    "name": "Croupier, gambling-table"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Cruiser, timber"
  },
  {
    "isco08": 2113,
    "isco88": 2113,
    "name": "Crystallographer"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Cultivator, algae"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Cultivator, mushroom"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Cultivator, pearl"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Curate"
  },
  {
    "isco08": 2621,
    "isco88": 2431,
    "name": "Curator, art gallery"
  },
  {
    "isco08": 2621,
    "isco88": 2431,
    "name": "Curator, museum"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Curer, bacon"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Curer, fish"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Curer, meat"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Currier, leather"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Cutter, crystal glass"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Cutter, fish"
  },
  {
    "isco08": 7212,
    "isco88": 7212,
    "name": "Cutter, flame"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Cutter, footwear"
  },
  {
    "isco08": 7531,
    "isco88": 7434,
    "name": "Cutter, fur"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Cutter, garment"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Cutter, glass"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Cutter, glove"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Cutter, granite"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Cutter, intaglio glass"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Cutter, jacquard card"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Cutter, lawn"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Cutter, leather"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Cutter, mattress"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Cutter, meat"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Cutter, optical glass"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Cutter, pattern"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Cutter, pole and pile"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Cutter, precious metal"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Cutter, railway tie"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Cutter, sail"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Cutter, sleeper"
  },
  {
    "isco08": 7322,
    "isco88": 7346,
    "name": "Cutter, stencil: silk-screen"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Cutter, stone"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Cutter, sugar cane"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Cutter, sugar confectionery"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Cutter, tailor''s"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Cutter, tent"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Cutter, timber: forestry"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Cutter, tobacco"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Cutter, umbrella"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Cutter, upholstery"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Cutter, wood: forest"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Cutter-finisher, stone"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Cutter-polisher, gems"
  },
  {
    "isco08": 8114,
    "isco88": 7313,
    "name": "Cutter-polisher, industrial diamonds"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Cutter-polisher, jewels"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Cutter-setter, mosaic"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Cutter-shaper, decorative glass"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Cyclist, except racing"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Cyclist, racing"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Cytologist"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Dairymaid"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Dairyman"
  },
  {
    "isco08": 2653,
    "isco88": 2454,
    "name": "Dancer"
  },
  {
    "isco08": 2653,
    "isco88": 2454,
    "name": "Dancer, ballet"
  },
  {
    "isco08": 2653,
    "isco88": 2454,
    "name": "Dancer, ballroom"
  },
  {
    "isco08": 2653,
    "isco88": 3473,
    "name": "Dancer, chorus"
  },
  {
    "isco08": 2653,
    "isco88": 3473,
    "name": "Dancer, night-club"
  },
  {
    "isco08": 2653,
    "isco88": 3473,
    "name": "Dancer, street"
  },
  {
    "isco08": 2653,
    "isco88": 3474,
    "name": "Dancer, strip-tease"
  },
  {
    "isco08": 2653,
    "isco88": 3473,
    "name": "Dancer, tap"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Dayfiller"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Deacon"
  },
  {
    "isco08": 3339,
    "isco88": 1314,
    "name": "Dealer, art"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Dealer, bond"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Dealer, car: managing and supervising staff"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Dealer, commodities"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Dealer, commodity futures"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Dealer, foreign exchange"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Dealer, futures: commodities"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Dealer, futures: financial"
  },
  {
    "isco08": 4212,
    "isco88": 4213,
    "name": "Dealer, gaming"
  },
  {
    "isco08": 3321,
    "isco88": 3412,
    "name": "Dealer, insurance"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Dealer, investment"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Dealer, livestock"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Dealer, scrap"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Dealer, securities"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Dealer, textiles"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Dean, university"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Debeaker, poultry"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Decorator, cake"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Decorator, ceramics"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Decorator, display"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Decorator, film set"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Decorator, interior"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Decorator, pottery"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Dehairer, hide"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Deliverer, bicycle"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Deliverer, driving car"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Deliverer, driving van"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Deliverer, hand"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Deliverer, leaflets"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Deliverer, motorcycle"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Deliverer, newspaper"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Deliverer, on foot"
  },
  {
    "isco08": 2120,
    "isco88": 2122,
    "name": "Demographer"
  },
  {
    "isco08": 3142,
    "isco88": 3213,
    "name": "Demonstrator, farm"
  },
  {
    "isco08": 5242,
    "isco88": 5220,
    "name": "Demonstrator, sales"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Dentist"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Denturist"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Deputy, mine"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Dermatologist"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Derrickman"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Derrickwoman"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Designer, aircraft"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Designer, animation"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Designer, armorial"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, clothing"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, commercial: products"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Designer, computer games"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Designer, computer software"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, costume"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Designer, decoration"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Designer, display"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, dress"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Designer, engine"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Designer, engine: electrical"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Designer, exhibition"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, fashion"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, furniture"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, garment"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Designer, graphic"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, industrial"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Designer, interior"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, jewellery"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Designer, motor"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Designer, motor: electrical"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Designer, multimedia"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, package"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Designer, poster"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, products"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Designer, publication"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Designer, scenery"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Designer, set"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Designer, software"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Designer, stage"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Designer, systems: computers"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Designer, systems: except computers"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Designer, systems: IT"
  },
  {
    "isco08": 2163,
    "isco88": 3471,
    "name": "Designer, textile"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Designer, typographical"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Designer, website"
  },
  {
    "isco08": 9122,
    "isco88": 9142,
    "name": "Detailer, aircraft"
  },
  {
    "isco08": 9122,
    "isco88": 9142,
    "name": "Detailer, boat"
  },
  {
    "isco08": 9122,
    "isco88": 9142,
    "name": "Detailer, car"
  },
  {
    "isco08": 9122,
    "isco88": 9142,
    "name": "Detailer, caravan"
  },
  {
    "isco08": 9122,
    "isco88": 9142,
    "name": "Detailer, vehicles"
  },
  {
    "isco08": 3355,
    "isco88": 3450,
    "name": "Detective, police"
  },
  {
    "isco08": 3411,
    "isco88": 3450,
    "name": "Detective, private"
  },
  {
    "isco08": 3411,
    "isco88": 3450,
    "name": "Detective, store"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Developer, applications: computing (except web)"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, applications: computing (internet)"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, applications: computing (web)"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, computer game"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Developer, curriculum"
  },
  {
    "isco08": 2521,
    "isco88": 2131,
    "name": "Developer, database"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, dhtml"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, film: black-and-white"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, film: colour"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, film: x-ray"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, flash"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, game: computer"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, html"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, interactive"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, internet"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, internet applications"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, internet multimedia"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, internet software"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, multimedia"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, negative: black-and-white"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, negative: colour"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, photograph: black-and-white"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, photograph: colour"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, photographic plate"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, positive: black-and-white"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, positive: colour"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Developer, print"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Developer, software"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, video game"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, web"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, web applications"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, web software"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, webpage"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Developer, website"
  },
  {
    "isco08": 9121,
    "isco88": 9133,
    "name": "Dhobi"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Diabetologist"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Diemaker"
  },
  {
    "isco08": 2265,
    "isco88": 3223,
    "name": "Dietician"
  },
  {
    "isco08": 2265,
    "isco88": 3223,
    "name": "Dietician, clinical"
  },
  {
    "isco08": 2265,
    "isco88": 3223,
    "name": "Dietician, food service"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Digger, grave: earthmoving equipment"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Digger, grave: hand-held tools"
  },
  {
    "isco08": 8113,
    "isco88": 7136,
    "name": "Digger, well"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Dipper, ceramics"
  },
  {
    "isco08": 8122,
    "isco88": 7324,
    "name": "Dipper, metal articles"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Dipper, sugar confectionery"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Dipper, tobacco"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Dipper, wood treatment"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Director, accounting"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Director, accounts"
  },
  {
    "isco08": 1219,
    "isco88": 1231,
    "name": "Director, administrative services"
  },
  {
    "isco08": 1222,
    "isco88": 1234,
    "name": "Director, advertising"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Director, after school care"
  },
  {
    "isco08": 2654,
    "isco88": 1229,
    "name": "Director, artistic"
  },
  {
    "isco08": 1346,
    "isco88": 1317,
    "name": "Director, bank"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Director, budgeting"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Director, business development: except ICT"
  },
  {
    "isco08": 2654,
    "isco88": 1229,
    "name": "Director, casting"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Director, childcare"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Director, childcare centre"
  },
  {
    "isco08": 1341,
    "isco88": 1229,
    "name": "Director, children''s services"
  },
  {
    "isco08": 1342,
    "isco88": 1319,
    "name": "Director, clinical"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Director, clinical trials"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Director, college"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Director, company"
  },
  {
    "isco08": 1213,
    "isco88": 1231,
    "name": "Director, compliance"
  },
  {
    "isco08": 1219,
    "isco88": 1231,
    "name": "Director, corporate services"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Director, cultural centre"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Director, day care centre: children"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Director, design service"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Director, documentary"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Director, executive"
  },
  {
    "isco08": 1219,
    "isco88": 1228,
    "name": "Director, facilities management"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Director, film"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Director, finance"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Director, franchise"
  },
  {
    "isco08": 5163,
    "isco88": 5143,
    "name": "Director, funeral"
  },
  {
    "isco08": 1342,
    "isco88": 1319,
    "name": "Director, health facility"
  },
  {
    "isco08": 1342,
    "isco88": 1229,
    "name": "Director, health service"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Director, home: aged care"
  },
  {
    "isco08": 1411,
    "isco88": 1315,
    "name": "Director, hotel"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Director, human resources"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Director, information systems"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Director, legal service"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Director, leisure centre"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Director, logistics"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Director, managing"
  },
  {
    "isco08": 1221,
    "isco88": 1233,
    "name": "Director, marketing"
  },
  {
    "isco08": 1342,
    "isco88": 1319,
    "name": "Director, medical"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Director, motion picture"
  },
  {
    "isco08": 2654,
    "isco88": 1229,
    "name": "Director, musical"
  },
  {
    "isco08": 1342,
    "isco88": 2230,
    "name": "Director, nursing"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Director, nursing home"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Director, personnel"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Director, photography"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Director, policy and planning"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Director, power station"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Director, product development"
  },
  {
    "isco08": 1222,
    "isco88": 1234,
    "name": "Director, public relations"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Director, radio"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Director, recruitment"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Director, regional"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Director, research"
  },
  {
    "isco08": 1221,
    "isco88": 1233,
    "name": "Director, sales"
  },
  {
    "isco08": 1345,
    "isco88": 1210,
    "name": "Director, school"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Director, stage"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Director, strategic planning"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Director, technical"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Director, technical: television or radio"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Director, television"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Director, theatrical"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Director, tour"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "Director-general, employers'' organization"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Director-general, environment protection organization"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Director-general, government administration"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Director-general, government department"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Director-general, human rights organization"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Director-general, humanitarian organization"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Director-general, intergovernmental organization"
  },
  {
    "isco08": 1114,
    "isco88": 1141,
    "name": "Director-general, political party"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Director-general, special-interest organization"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "Director-general, trade union"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Director-general, wild life protection organization"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Dishwasher, hand"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Dispatcher, clerical: aircraft"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Dispatcher, clerical: boat"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Dispatcher, clerical: bus"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Dispatcher, clerical: gas pipelines"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Dispatcher, clerical: oil pipelines"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Dispatcher, clerical: railway"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Dispatcher, clerical: train"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Dispatcher, clerical: transport service"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Dispatcher, clerical: truck"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Dispatcher, load: electrical (power station)"
  },
  {
    "isco08": 3254,
    "isco88": 3224,
    "name": "Dispenser, optical"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Distributor, free newspaper"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Distributor, leaflet"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Distributor, party plan"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Distributor, selling door-to-door"
  },
  {
    "isco08": 7541,
    "isco88": 6152,
    "name": "Diver, abalone"
  },
  {
    "isco08": 7541,
    "isco88": 7216,
    "name": "Diver, commercial"
  },
  {
    "isco08": 7541,
    "isco88": 6152,
    "name": "Diver, oyster"
  },
  {
    "isco08": 7541,
    "isco88": 6152,
    "name": "Diver, pearl"
  },
  {
    "isco08": 7541,
    "isco88": 7216,
    "name": "Diver, salvage"
  },
  {
    "isco08": 7541,
    "isco88": 6152,
    "name": "Diver, shell fish"
  },
  {
    "isco08": 7541,
    "isco88": 6152,
    "name": "Diver, sponge"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Diver, springboard or platform"
  },
  {
    "isco08": 6340,
    "isco88": 6210,
    "name": "Diver, subsistence"
  },
  {
    "isco08": 7541,
    "isco88": 7216,
    "name": "Diver, underwater"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "DJ"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Docent"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Docker"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Dockmaster, dry: dock"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Dockmaster, graving: dock"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, anaesthetics"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, cardiology"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Doctor, chinese medicine"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Doctor, chiropractic"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, dermatology"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Doctor, family"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Doctor, general practice"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, gynaecology"
  },
  {
    "isco08": 2230,
    "isco88": 3229,
    "name": "Doctor, homeopathy"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Doctor, medical: general"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, medical: specialist"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Doctor, naturopathy"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, neurology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, obstetrics"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, ophthalmology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, otolaryngology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, otorhinolaryngology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, pediatrics"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, psychiatry"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Doctor, radiology"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Doctor, saw"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Doctor, witch"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Doctor-therapist, district medical"
  },
  {
    "isco08": 2622,
    "isco88": 2432,
    "name": "Documentalist"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Doffer, cloth"
  },
  {
    "isco08": 5414,
    "isco88": 9152,
    "name": "Doorkeeper"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Drafter, parliamentary"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Dramatist"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, aeronautical"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, architectural"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, CAD"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, cartographical"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, civil"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, die"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, electrical"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, electronics"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, engineering"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, geological"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, heating and ventilation systems"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, jig and tool"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, lithographic"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, marine"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, mechanical"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, structural"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, technical"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Draughtsperson, topographical"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Drawer, fibre: optic"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Drawer, fibre: textile"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Drawer, prop: mine"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Drawer, prop: quarry"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Drawer, timber: mine"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Drawer, timber: quarry"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Drawer, wire"
  },
  {
    "isco08": 8152,
    "isco88": 7432,
    "name": "Drawer-in, textile weaving"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Dresser, fish"
  },
  {
    "isco08": 5141,
    "isco88": 5141,
    "name": "Dresser, hair"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Dresser, meat"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Dresser, pelt"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Dresser, poultry"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Dresser, stone"
  },
  {
    "isco08": 3435,
    "isco88": 3471,
    "name": "Dresser, theatrical"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Dresser, tripe"
  },
  {
    "isco08": 5141,
    "isco88": 5141,
    "name": "Dresser, wig"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Dresser, window"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Dressmaker"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Dressmaker, theatrical"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Drier, snuff"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Drier, tobacco"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Driller, developmental"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Driller, directional"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Driller, glass"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Driller, metal"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Driller, mining"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Driller, oil or gas well"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Driller, pottery"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Driller, precious metals"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Driller, stone"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, aircraft fueller"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Driver, ambulance"
  },
  {
    "isco08": 9332,
    "isco88": 9332,
    "name": "Driver, animal"
  },
  {
    "isco08": 9332,
    "isco88": 9332,
    "name": "Driver, animal train"
  },
  {
    "isco08": 9332,
    "isco88": 9332,
    "name": "Driver, animal-drawn vehicle"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, assistant: railway-engine"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, assistant: train"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Driver, bulldozer"
  },
  {
    "isco08": 8331,
    "isco88": 8323,
    "name": "Driver, bus"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Driver, cab"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Driver, cable railway"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Driver, cage: mine"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Driver, car"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Driver, car-delivery"
  },
  {
    "isco08": 8331,
    "isco88": 8323,
    "name": "Driver, coach"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, concrete mixer"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Driver, digger: trench digging"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Driver, dispatch"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, dumper truck"
  },
  {
    "isco08": 9332,
    "isco88": 9332,
    "name": "Driver, elephant"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, elevated train"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Driver, excavating machine"
  },
  {
    "isco08": 9332,
    "isco88": 9332,
    "name": "Driver, farm equipment: non-motorised"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Driver, forge: hammer"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Driver, funicular"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, garbage truck"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Driver, handtruck"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, heavy goods vehicle"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, locomotive"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, lorry"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Driver, lumber carrier"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Driver, mail van"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, metropolitan railway"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, monorail"
  },
  {
    "isco08": 8331,
    "isco88": 8323,
    "name": "Driver, motor bus"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Driver, motor car"
  },
  {
    "isco08": 8331,
    "isco88": 8323,
    "name": "Driver, motor coach"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Driver, motor cycle"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Driver, motor tricycle"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Driver, pedal vehicle"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Driver, postal van"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Driver, racing"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Driver, raft: logging"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, railway engine"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Driver, rickshaw: cycle"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Driver, rickshaw: foot"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Driver, rickshaw: motorized"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Driver, road grader and scraper"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Driver, road roller"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, road train"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, semi-trailer"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, shunting-engine"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Driver, steamroller"
  },
  {
    "isco08": 8331,
    "isco88": 8323,
    "name": "Driver, streetcar"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Driver, streetsweeper"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, subway"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, tanker"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Driver, tar-spreading machine"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Driver, taxi"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Driver, taxi: bike"
  },
  {
    "isco08": 8321,
    "isco88": 8322,
    "name": "Driver, taxi: motor-tricycle"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Driver, timber carrier"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Driver, tractor"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, trailer-truck"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, train"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, train: road"
  },
  {
    "isco08": 8331,
    "isco88": 8323,
    "name": "Driver, tram"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Driver, trench-digging machine"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Driver, tricycle: motorized"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Driver, tricycle: non-motorised"
  },
  {
    "isco08": 8331,
    "isco88": 8323,
    "name": "Driver, trolley-bus"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, truck"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, truck: dumper"
  },
  {
    "isco08": 8344,
    "isco88": 8334,
    "name": "Driver, truck: forklift"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Driver, truck: heavy"
  },
  {
    "isco08": 8311,
    "isco88": 8311,
    "name": "Driver, underground train"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Driver, van"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Drover"
  },
  {
    "isco08": 2262,
    "isco88": 2224,
    "name": "Druggist"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Drummer"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Dry-cleaner, carpet"
  },
  {
    "isco08": 9121,
    "isco88": 9133,
    "name": "Dry-cleaner, hand"
  },
  {
    "isco08": 8157,
    "isco88": 8264,
    "name": "Dry-cleaner, machine"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Dryer, asbestos"
  },
  {
    "isco08": 9121,
    "isco88": 9133,
    "name": "Dryer, laundry: hand"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Dryer, tobacco"
  },
  {
    "isco08": 9611,
    "isco88": 9161,
    "name": "Dustman"
  },
  {
    "isco08": 9611,
    "isco88": 9161,
    "name": "Dustwoman"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Dyer, leather"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Dyer, pelt"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Dyer, vat: leather"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Dyer, vat: pelt"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Dyer-stainer"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Dyer-stainer, leather"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Dyer-stainer, spray"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Ecologist"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Ecologist, plant"
  },
  {
    "isco08": 2631,
    "isco88": 2441,
    "name": "Econometrician"
  },
  {
    "isco08": 2631,
    "isco88": 2441,
    "name": "Economist"
  },
  {
    "isco08": 2631,
    "isco88": 2441,
    "name": "Economist, labour"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Editor"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Editor, book"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, city"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Editor, continuity"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, copy"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, fashion"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, features"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Editor, film"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, financial"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, foreign"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, newspapers"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, periodicals"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, political"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, press"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Editor, proofreading"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Editor, script"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Editor, sound"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, sports"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor, sub"
  },
  {
    "isco08": 2654,
    "isco88": 2455,
    "name": "Editor, video"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Editor-in-chief"
  },
  {
    "isco08": 2342,
    "isco88": 3320,
    "name": "Educator, early childhood"
  },
  {
    "isco08": 2222,
    "isco88": 2230,
    "name": "Educator, midwife"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Educator, museum"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Educator, nurse"
  },
  {
    "isco08": 1113,
    "isco88": 1130,
    "name": "Elder, tribal"
  },
  {
    "isco08": 7411,
    "isco88": 7137,
    "name": "Electrician"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Electrician, aircraft"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Electrician, automotive"
  },
  {
    "isco08": 7411,
    "isco88": 7137,
    "name": "Electrician, building"
  },
  {
    "isco08": 7411,
    "isco88": 7137,
    "name": "Electrician, building maintenance"
  },
  {
    "isco08": 7411,
    "isco88": 7137,
    "name": "Electrician, building repairs"
  },
  {
    "isco08": 7411,
    "isco88": 7137,
    "name": "Electrician, electrical installation: building"
  },
  {
    "isco08": 7411,
    "isco88": 7137,
    "name": "Electrician, electrical maintenance:  building"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Electrician, locomotive"
  },
  {
    "isco08": 7412,
    "isco88": 7137,
    "name": "Electrician, mine"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Electrician, motor vehicle"
  },
  {
    "isco08": 7411,
    "isco88": 7137,
    "name": "Electrician, neon-lighting"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Electrician, ship"
  },
  {
    "isco08": 7411,
    "isco88": 7137,
    "name": "Electrician, stage and studio"
  },
  {
    "isco08": 7411,
    "isco88": 7137,
    "name": "Electrician, theatre"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Electrician, tram"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Electrician, vehicle"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Electroplater"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Electrotherapist"
  },
  {
    "isco08": 7321,
    "isco88": 7342,
    "name": "Electrotyper"
  },
  {
    "isco08": 5163,
    "isco88": 5143,
    "name": "Embalmer"
  },
  {
    "isco08": 7323,
    "isco88": 7345,
    "name": "Embosser, book"
  },
  {
    "isco08": 7322,
    "isco88": 7346,
    "name": "Embosser, paper"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Embroiderer"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Embryologist"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Enameller, ceramics"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Enameller, glass"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Enameller, jewellery"
  },
  {
    "isco08": 8122,
    "isco88": 7324,
    "name": "Enameller, metal articles"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Endocrinologist"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Endodontist"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, aeronautical"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, aeronautics"
  },
  {
    "isco08": 2144,
    "isco88": 2144,
    "name": "Engineer, aerospace"
  },
  {
    "isco08": 2132,
    "isco88": 2149,
    "name": "Engineer, agricultural"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, agricultural machines"
  },
  {
    "isco08": 2143,
    "isco88": 2149,
    "name": "Engineer, air pollution control"
  },
  {
    "isco08": 3155,
    "isco88": 3145,
    "name": "Engineer, air traffic safety"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, air-conditioning"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Engineer, aircraft maintenance: airframe"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Engineer, aircraft maintenance: avionics"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Engineer, aircraft maintenance: engines"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, automotive"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, biomedical"
  },
  {
    "isco08": 2153,
    "isco88": 2144,
    "name": "Engineer, broadcast"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, building structure"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Engineer, business process: information technology"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, ceramics"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Engineer, chemical"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Engineer, chemical process"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Engineer, chemical: petroleum and natural gas"
  },
  {
    "isco08": 3151,
    "isco88": 3141,
    "name": "Engineer, chief: ship"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, civil"
  },
  {
    "isco08": 2512,
    "isco88": 2139,
    "name": "Engineer, computer: applications"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Engineer, computer: computer support"
  },
  {
    "isco08": 2152,
    "isco88": 2144,
    "name": "Engineer, computer: hardware"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Engineer, computer: software"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Engineer, computer: systems"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, construction"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, cost: evaluation"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, cryogenic"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Engineer, customer service: computer helpdesk"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Engineer, desktop support"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, diesel"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, dredging"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Engineer, electric power generation: except nuclear"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, electric power generation: nuclear"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Engineer, electric traction"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Engineer, electrical"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Engineer, electrical illumination"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Engineer, electromechanical"
  },
  {
    "isco08": 2152,
    "isco88": 2144,
    "name": "Engineer, electronics"
  },
  {
    "isco08": 2143,
    "isco88": 2149,
    "name": "Engineer, environmental"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, explosive ordnance"
  },
  {
    "isco08": 3153,
    "isco88": 3143,
    "name": "Engineer, flight"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, food processing"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Engineer, forest"
  },
  {
    "isco08": 2146,
    "isco88": 2147,
    "name": "Engineer, foundry"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, gas turbine"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Engineer, genetics"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, geotechnical"
  },
  {
    "isco08": 2152,
    "isco88": 2144,
    "name": "Engineer, hardware: computers"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, heating"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Engineer, high voltage"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, hydraulics"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, hydrology"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, industrial"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, industrial efficiency"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, industrial layout"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, industrial machinery and tools"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, industrial plant"
  },
  {
    "isco08": 2152,
    "isco88": 2144,
    "name": "Engineer, instrumentation"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, instruments: mechanical"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, internal: combustion engine"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Engineer, internet: developing websites"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Engineer, internet: helpdesk"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Engineer, internet: managing websites"
  },
  {
    "isco08": 2513,
    "isco88": 2131,
    "name": "Engineer, internet: programming"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, irrigation"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, jet engine"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, locomotive engine"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, lubrication"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, manufacturing"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, marine"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, marine salvage"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, materials"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, mechanical"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, mechatronics"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, methods"
  },
  {
    "isco08": 2146,
    "isco88": 2147,
    "name": "Engineer, mining"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, motors and engines: mechanical"
  },
  {
    "isco08": 2146,
    "isco88": 2147,
    "name": "Engineer, natural gas: extraction"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Engineer, natural gas: production and distribution"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, naval"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, naval: construction"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, nuclear power"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, nuclear power generation"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, optical"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Engineer, petrochemical"
  },
  {
    "isco08": 2146,
    "isco88": 2147,
    "name": "Engineer, petroleum and natural gas: extraction"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Engineer, petroleum refinery"
  },
  {
    "isco08": 2146,
    "isco88": 2147,
    "name": "Engineer, petroleum: extraction"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Engineer, pharmaceutical"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, planning: production"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Engineer, power distribution"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Engineer, power generation"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, process: manufacturing"
  },
  {
    "isco08": 2143,
    "isco88": 2149,
    "name": "Engineer, process: wastewater"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, production"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, public health"
  },
  {
    "isco08": 2153,
    "isco88": 2144,
    "name": "Engineer, radar"
  },
  {
    "isco08": 2153,
    "isco88": 2144,
    "name": "Engineer, radio"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Engineer, refinery process"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, refrigeration: mechanical"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, robotics"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, safety"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Engineer, sales: except ICT"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Engineer, sales: ICT"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, sanitary"
  },
  {
    "isco08": 2152,
    "isco88": 2144,
    "name": "Engineer, semiconductors"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Engineer, server"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Engineer, ship construction"
  },
  {
    "isco08": 3151,
    "isco88": 3141,
    "name": "Engineer, ship''s"
  },
  {
    "isco08": 2153,
    "isco88": 2144,
    "name": "Engineer, signal: systems"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Engineer, software"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, soil mechanics"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Engineer, stationary"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Engineer, structural"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Engineer, systems : computer"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Engineer, systems : electrical"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Engineer, systems: except computer and electrical"
  },
  {
    "isco08": 2153,
    "isco88": 2144,
    "name": "Engineer, telecommunications"
  },
  {
    "isco08": 2153,
    "isco88": 2144,
    "name": "Engineer, telegraph"
  },
  {
    "isco08": 2153,
    "isco88": 2144,
    "name": "Engineer, telephone"
  },
  {
    "isco08": 2153,
    "isco88": 2144,
    "name": "Engineer, television"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, time and motion study"
  },
  {
    "isco08": 2149,
    "isco88": 2141,
    "name": "Engineer, traffic"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Engineer, transmission: electric power"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Engineer, work study"
  },
  {
    "isco08": 7316,
    "isco88": 7323,
    "name": "Engraver, decorative"
  },
  {
    "isco08": 7316,
    "isco88": 7323,
    "name": "Engraver, glass"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Engraver, jewellery"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Engraver, linoleum block: printing"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Engraver, lithographic stone: printing"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Engraver, metal die: printing"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Engraver, metal plate: printing"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Engraver, metal roller: printing"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Engraver, music printing"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Engraver, pantograph"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Engraver, photogravure"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Engraver, rubber block: printing"
  },
  {
    "isco08": 7113,
    "isco88": 7113,
    "name": "Engraver, stone"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Engraver, wood block: printing"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Engraver-etcher, artistic"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Enlarger, photograph"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Entomologist"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Environmentalist"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Epidemiologist"
  },
  {
    "isco08": 2250,
    "isco88": 2223,
    "name": "Epidemiologist, veterinary"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Erector, billboard"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Erector, constructional steel"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Erector, metal airframe"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Erector, prefabricated buildings"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Erector, radio aerial"
  },
  {
    "isco08": 7127,
    "isco88": 7233,
    "name": "Erector, refrigeration and air conditioning equipment"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Erector, ship beam and frame"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Erector, structural metal"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Erector, television aerial"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Erector-installer, agricultural machinery"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Erector-installer, industrial machinery"
  },
  {
    "isco08": 5169,
    "isco88": 5149,
    "name": "Escort, social"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Escort, tour"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Essayist"
  },
  {
    "isco08": 3116,
    "isco88": 3116,
    "name": "Estimator, engineering: chemical"
  },
  {
    "isco08": 3112,
    "isco88": 3112,
    "name": "Estimator, engineering: civil"
  },
  {
    "isco08": 3113,
    "isco88": 3113,
    "name": "Estimator, engineering: electrical"
  },
  {
    "isco08": 3114,
    "isco88": 3114,
    "name": "Estimator, engineering: electronics"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Estimator, engineering: mechanical"
  },
  {
    "isco08": 7316,
    "isco88": 7323,
    "name": "Etcher, glass"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Etcher, printed circuit board"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Etcher, printing: metal engraving"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Etcher, printing: metal plate"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Etcher, printing: metal roller"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Etcher, printing: photogravure"
  },
  {
    "isco08": 2632,
    "isco88": 2442,
    "name": "Ethnologist"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Ethnomusicologist"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Etymologist"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Evangelist"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Eviscerator, animal"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Examiner, audit"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Examiner, bankruptcy"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Examiner, claims"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Examiner, cloth"
  },
  {
    "isco08": 5165,
    "isco88": 3340,
    "name": "Examiner, driving"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Examiner, fabrics"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Examiner, insolvency"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Examiner, open cut: mining"
  },
  {
    "isco08": 3352,
    "isco88": 3442,
    "name": "Examiner, tax"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Executive, account: advertising"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Executive, account: marketing"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Executive, account: public relations"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Executive, account: sales (except ICT, industrial, medical and pharmaceutical products)"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Executive, account: sales (industrial products)"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Executive, account: sales (information and communications technology)"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Executive, account: sales (medical products)"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Executive, account: sales (pharmaceuticals)"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Executive, chief"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Expeller, oil"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Expert, human resources"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Expert, outplacement"
  },
  {
    "isco08": 2263,
    "isco88": 3222,
    "name": "Expert, radiation protection"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Exterminator"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Eyeletter, footwear"
  },
  {
    "isco08": 2421,
    "isco88": 2419,
    "name": "Facilitator, quality"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, alfalfa"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Farmer, apiary"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, astrakhan"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Farmer, battery"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Farmer, beekeeping"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, cattle"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, cattle: market production"
  },
  {
    "isco08": 6320,
    "isco88": 6210,
    "name": "Farmer, cattle: subsistence"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, cereal"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, cereal: market production"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, cereal: subsistence farming"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Farmer, chicken"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, cocoa"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, coconut"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, coffee"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, copra"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, corn"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, corn: market production"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, corn: subsistence farming"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, cotton"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, cowherd: market production"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Farmer, crocodile"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, crop: field crops"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, crop: subsistence"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, dairy"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Farmer, duck"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Farmer, egg production"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, field crop"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, field crop (market production)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, field vegetable"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, field vegetable: (market production)"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, field: crop (subsistence farming)"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, field: vegetable (subsistence farming)"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Farmer, fish"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, flax"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, fruit"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, fur: domestic animals"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Farmer, fur: non-domesticated animals"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, goat"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, goat: market production"
  },
  {
    "isco08": 6320,
    "isco88": 6210,
    "name": "Farmer, goat: subsistence farming"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Farmer, goose"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, grain"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, grain: market production"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, grain: subsistence farming"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, groundnut"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, groundnut: market production"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, groundnut: subsistence farming"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, hop"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, horse: breeding"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, horse: raising"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, jute"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Farmer, kangaroo"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, livestock"
  },
  {
    "isco08": 6130,
    "isco88": 6130,
    "name": "Farmer, livestock and crops"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, livestock: market production"
  },
  {
    "isco08": 6320,
    "isco88": 6210,
    "name": "Farmer, livestock: subsistence farming"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, maize"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, maize: market production"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, maize: subsistence farming"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, milk"
  },
  {
    "isco08": 6114,
    "isco88": 6114,
    "name": "Farmer, mixed crop"
  },
  {
    "isco08": 6114,
    "isco88": 6114,
    "name": "Farmer, mixed crop: market production"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, mixed crop: subsistence farming"
  },
  {
    "isco08": 6130,
    "isco88": 6130,
    "name": "Farmer, mixed farming"
  },
  {
    "isco08": 6130,
    "isco88": 6130,
    "name": "Farmer, mixed: market production"
  },
  {
    "isco08": 6330,
    "isco88": 6210,
    "name": "Farmer, mixed: subsistence"
  },
  {
    "isco08": 6121,
    "isco88": 6124,
    "name": "Farmer, mixed-animal"
  },
  {
    "isco08": 6121,
    "isco88": 6124,
    "name": "Farmer, mixed-animal: market production"
  },
  {
    "isco08": 6320,
    "isco88": 6210,
    "name": "Farmer, mixed-animal: subsistence farming"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Farmer, non-domesticated animals"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, nut"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, orchard"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Farmer, ostrich"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Farmer, oyster"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, pelt: domesticated animals"
  },
  {
    "isco08": 6129,
    "isco88": 6121,
    "name": "Farmer, pelt: non-domesticated animals"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, pig"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, pig: market production"
  },
  {
    "isco08": 6320,
    "isco88": 6210,
    "name": "Farmer, pig: subsistence farming"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, potato"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, potato"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Farmer, poultry"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, ranch"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, rice"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, rice: market production"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, rice: subsistence farming"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, rubber"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Farmer, seafood"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Farmer, sericulture"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, sheep"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, sheep: market production"
  },
  {
    "isco08": 6320,
    "isco88": 6210,
    "name": "Farmer, sheep: subsistence farming"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, shrub crop"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Farmer, silk"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Farmer, silkworm raising"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, soya-bean"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Farmer, stud"
  },
  {
    "isco08": 6330,
    "isco88": 6210,
    "name": "Farmer, subsistence"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, sugar-beet"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, sugar-cane"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, tea"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, tobacco"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, tree crop"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Farmer, turkey"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, vegetable"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, vegetable: market production"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, vegetable: subsistence farming"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, vineyard"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Farmer, viniculture"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, wheat"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Farmer, wheat: market production"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Farmer, wheat: subsistence farming"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Farrier"
  },
  {
    "isco08": 2240,
    "isco88": 3221,
    "name": "Feldscher"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Feller, logging"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Feller, tree"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Feller-bucker, tree"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Fellmonger"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Fettler"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Fighter"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Fighter, fire"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Filer, library"
  },
  {
    "isco08": 8183,
    "isco88": 8290,
    "name": "Filler, bottle"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Filler, day"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Filler, evening"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Filler, night"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Filler, shelf"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Filler, stock"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Filleter, fish"
  },
  {
    "isco08": 7323,
    "isco88": 7345,
    "name": "Finisher, book"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Finisher, cast metal articles"
  },
  {
    "isco08": 7114,
    "isco88": 7123,
    "name": "Finisher, cement"
  },
  {
    "isco08": 7114,
    "isco88": 7123,
    "name": "Finisher, concrete"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Finisher, die"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Finisher, footwear"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Finisher, glass"
  },
  {
    "isco08": 8219,
    "isco88": 8286,
    "name": "Finisher, luggage"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Finisher, metal"
  },
  {
    "isco08": 7549,
    "isco88": 7322,
    "name": "Finisher, optical lens"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Finisher, paper"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Finisher, pelt"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Finisher, photo-engraving: printing plates"
  },
  {
    "isco08": 7323,
    "isco88": 7345,
    "name": "Finisher, print"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Finisher, stone"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Finisher, wooden furniture"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Firefighter"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Firefighter, aircraft accidents"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Firefighter, forest"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Fireman"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Fireman, aircraft accidents"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Fireman, boiler plant"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Fireman, fighting fires"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Fireman, forest"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Fireman, locomotive boiler"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Fireman, ship''s boiler"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Firewoman"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Firewoman, aircraft accidents"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Firewoman, boiler plant"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Firewoman, fighting fires"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Firewoman, forest"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Firewoman, locomotive boiler"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Firewoman, ship''s boiler"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Fisher, coastal waters"
  },
  {
    "isco08": 6223,
    "isco88": 6153,
    "name": "Fisher, deep-sea"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Fisher, inland waters"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Fisher, seal"
  },
  {
    "isco08": 6340,
    "isco88": 6210,
    "name": "Fisher, subsistence"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Fisherman, coastal waters"
  },
  {
    "isco08": 6223,
    "isco88": 6153,
    "name": "Fisherman, deep-sea"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Fisherman, inland waters"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Fisherman, seal"
  },
  {
    "isco08": 6340,
    "isco88": 6210,
    "name": "Fisherman, subsistence"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Fisherwoman, coastal waters"
  },
  {
    "isco08": 6223,
    "isco88": 6153,
    "name": "Fisherwoman, deep-sea"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Fisherwoman, inland waters"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Fisherwoman, seal"
  },
  {
    "isco08": 6340,
    "isco88": 6210,
    "name": "Fisherwoman, subsistence"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Fishmonger"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, agricultural machinery"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, aircraft pipe"
  },
  {
    "isco08": 3214,
    "isco88": 3226,
    "name": "Fitter, artificial limb"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Fitter, bench: trucks"
  },
  {
    "isco08": 7422,
    "isco88": 7242,
    "name": "Fitter, computer equipment"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Fitter, diesel: road transport"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, duct"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Fitter, dynamo"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, earth-moving equipment"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Fitter, electrical"
  },
  {
    "isco08": 7421,
    "isco88": 7242,
    "name": "Fitter, electronics"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, engine: agricultural and industrial machinery"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Fitter, engine: aircraft"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, engine: marine"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Fitter, engine: motor vehicle"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, engine: steam"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Fitter, footwear"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, gas"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, gas pipe"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Fitter, generator: electrical"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, industrial machinery"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, machine-tool"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, marine pipe"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, metalworking machinery"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, mining machinery"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, office machinery"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, pipe"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, plant maintenance"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Fitter, plate-glass"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, printing machinery"
  },
  {
    "isco08": 3214,
    "isco88": 3226,
    "name": "Fitter, prosthesis"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, sewerage pipe"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Fitter, shop"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, stationary: engine"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, steam pipe"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, textile machinery"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, train engine"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, tube: aircraft"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, turbine"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Fitter, tyre"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, ventilation pipe"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fitter, water supply pipe"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Fitter, woodworking machinery"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Fitter-assembler, airframe"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Fixer, duct"
  },
  {
    "isco08": 8152,
    "isco88": 7432,
    "name": "Fixer, loom"
  },
  {
    "isco08": 7123,
    "isco88": 7133,
    "name": "Fixer, plasterboard"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Fixer, prefabricated buildings"
  },
  {
    "isco08": 7121,
    "isco88": 7131,
    "name": "Fixer, roof"
  },
  {
    "isco08": 7212,
    "isco88": 7212,
    "name": "Flamecutter"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Flautist"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Flavourer, tobacco"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Flayer"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Flenser, whale"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Flesher, hide"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Flesher, pelt"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Flesher-dehairer, hide"
  },
  {
    "isco08": 6113,
    "isco88": 2213,
    "name": "Floriculturist"
  },
  {
    "isco08": 7549,
    "isco88": 5220,
    "name": "Florist, arranging flowers"
  },
  {
    "isco08": 5221,
    "isco88": 1314,
    "name": "Florist, operating a shop"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Folder, footwear: uppers"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Footballer"
  },
  {
    "isco08": 2112,
    "isco88": 2112,
    "name": "Forecaster, weather"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Forester"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Forger, drop"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Forge-smith"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Former, metal"
  },
  {
    "isco08": 5161,
    "isco88": 5152,
    "name": "Fortune-teller"
  },
  {
    "isco08": 7323,
    "isco88": 7345,
    "name": "Forwarder, bookbinding"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Framer"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Freighthandler"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Friar"
  },
  {
    "isco08": 7541,
    "isco88": 7216,
    "name": "Frogman"
  },
  {
    "isco08": 7541,
    "isco88": 7216,
    "name": "Frogman, salvage"
  },
  {
    "isco08": 7541,
    "isco88": 7216,
    "name": "Frogwoman"
  },
  {
    "isco08": 7541,
    "isco88": 7216,
    "name": "Frogwoman, salvage"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Froster, glass sandblasting"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Fueller, aircraft"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Fumigator"
  },
  {
    "isco08": 7531,
    "isco88": 7434,
    "name": "Furrier"
  },
  {
    "isco08": 2633,
    "isco88": 2443,
    "name": "Futurologist"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Gambler"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Gamekeeper"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Gamewarden"
  },
  {
    "isco08": 5413,
    "isco88": 5163,
    "name": "Gaoler"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Gardener"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Gardener, landscape"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Gardener, market"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Gardener, subsistence"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Gasfitter"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Gastroenterologist"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Gatherer, glass"
  },
  {
    "isco08": 9216,
    "isco88": 9213,
    "name": "Gatherer, seaweed"
  },
  {
    "isco08": 9216,
    "isco88": 9213,
    "name": "Gatherer, shellfish"
  },
  {
    "isco08": 6340,
    "isco88": 6210,
    "name": "Gatherer, subsistence"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Gemmologist"
  },
  {
    "isco08": 2633,
    "isco88": 2443,
    "name": "Genealogist"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "General, army"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Geneticist"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Geneticist, cell"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Geneticist, molecular"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Geochemist"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Geodesist"
  },
  {
    "isco08": 2632,
    "isco88": 2442,
    "name": "Geographer"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Geohydrologist"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Geologist"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Geologist, engineering"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Geomagnetician"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Geomorphologist"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Geophysicist"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Geoscientist"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Geotechnologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Geriatrician"
  },
  {
    "isco08": 7323,
    "isco88": 7345,
    "name": "Gilder, edge: bookbinding"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Girl, errand"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Girl, messenger"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Girl, pizza: maker"
  },
  {
    "isco08": 3435,
    "isco88": 3471,
    "name": "Girl, script"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Glaciologist"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Glazier"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Glazier, roofing"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Glazier, stained-glass"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Glazier, vehicle"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Goalkeeper"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Goatherd"
  },
  {
    "isco08": 6320,
    "isco88": 6210,
    "name": "Goatherd: subsistence farming"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Goldsmith"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Golfer"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Governess, children"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Governor, Commonwealth"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Governor, prison"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Governor, State"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Governor-General"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Grader, fibre: textile"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Grader, food"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Grader, footwear: soles"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Grader, fruit"
  },
  {
    "isco08": 7531,
    "isco88": 7434,
    "name": "Grader, fur"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Grader, hide"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Grader, meat"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Grader, oil"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Grader, pelt"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Grader, products"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Grader, skin"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Grader, stone"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Grader, textile"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Grader, tobacco"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Grader, vegetable"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Grader, wood"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grafter, fruit tree"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grafter, shrubs"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Grainer, photogravure: printing plates"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Graphologist"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Grazier"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Greenkeeper"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Grinder, chocolate"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Grinder, glass"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Grinder, glass edge"
  },
  {
    "isco08": 7549,
    "isco88": 7322,
    "name": "Grinder, glass lens"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Grinder, machine tool"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Grinder, metal"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Grinder, slate"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Grinder, snuff"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Grinder, stone"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Grinder, textile carding machine"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Grinder, tool"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Grip"
  },
  {
    "isco08": 5221,
    "isco88": 1314,
    "name": "Grocer"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Groom, horse"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Groom, stud"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Groundsman"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Groundswoman"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, bulbs: nursery"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, carnation"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Grower, cereal"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grower, cocoa"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grower, coconut"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grower, coffee"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Grower, cotton"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Grower, crop: field crops"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Grower, field: crop"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Grower, field: vegetable"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, flower"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grower, grape"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, horticultural"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, market: gardening"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, mushroom"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, nursery"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, osier"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Grower, potato"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, reed"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Grower, rice"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, rose"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grower, rubber"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, seeds: nursery"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grower, shrub crop"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Grower, soya-bean"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, spices: nursery"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Grower, sugar-beet"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Grower, sugar-cane"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grower, tea"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grower, tree crop"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, tulip"
  },
  {
    "isco08": 6310,
    "isco88": 6210,
    "name": "Grower, vegetable: subsistence"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Grower, vegetables: nursery"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grower, vine"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Grower, wine"
  },
  {
    "isco08": 5414,
    "isco88": 9152,
    "name": "Guard, art gallery"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Guard, beach"
  },
  {
    "isco08": 5414,
    "isco88": 5169,
    "name": "Guard, body"
  },
  {
    "isco08": 3351,
    "isco88": 3441,
    "name": "Guard, border"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Guard, car"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Guard, crossing"
  },
  {
    "isco08": 5414,
    "isco88": 9152,
    "name": "Guard, museum"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Guard, police force"
  },
  {
    "isco08": 5413,
    "isco88": 5163,
    "name": "Guard, prison"
  },
  {
    "isco08": 5414,
    "isco88": 5169,
    "name": "Guard, security"
  },
  {
    "isco08": 8312,
    "isco88": 8312,
    "name": "Guard, train: freight"
  },
  {
    "isco08": 8312,
    "isco88": 8312,
    "name": "Guard, train: goods"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Guard, train: passengers"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, art gallery"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, discovery"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, industrial establishment"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, museum"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, nature park"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Guide, outdoor adventure"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, safari"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, sightseeing"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, theme park"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, tour"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, tourist"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Guide, travel"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Guitarist"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Gunner"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Gunsmith"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Gymnast, remedial"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Gymnast, sport"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Gynaecologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Haematologist, clinical"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Hafiz"
  },
  {
    "isco08": 5141,
    "isco88": 5141,
    "name": "Hairdresser"
  },
  {
    "isco08": 5141,
    "isco88": 5141,
    "name": "Hairstylist"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Hammersmith"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Hammersmith, precious-metal articles"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Hand, cable-ship"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Hand, cannery"
  },
  {
    "isco08": 9622,
    "isco88": 9151,
    "name": "Hand, cellar: hotel"
  },
  {
    "isco08": 9622,
    "isco88": 9151,
    "name": "Hand, cellar: restaurant"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Hand, cellar: wine production"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Hand, deck"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Hand, factory"
  },
  {
    "isco08": 9213,
    "isco88": 9211,
    "name": "Hand, farm"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Hand, farm: citrus fruit"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Hand, farm: cotton picking"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Hand, farm: dairy"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Hand, farm: field crops"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Hand, farm: fruit picking"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Hand, farm: fur-bearing animals"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Hand, farm: livestock"
  },
  {
    "isco08": 9213,
    "isco88": 9211,
    "name": "Hand, farm: livestock and crops"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Hand, farm: milch"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Hand, farm: milking"
  },
  {
    "isco08": 9213,
    "isco88": 9211,
    "name": "Hand, farm: mixed farming (livestock and crops)"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Hand, farm: orchard"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Hand, farm: silk worms"
  },
  {
    "isco08": 6130,
    "isco88": 6130,
    "name": "Hand, farm: skilled (mixed livestock and crops)"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Hand, farm: tea plucking"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Hand, ferry"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Hand, garden"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Hand, harvest"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Hand, harvest: field crops"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Hand, harvest: orchard"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Hand, kitchen"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Hand, nursery: horticulture"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Hand, pizza"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Hand, plant nursery"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Hand, ranch"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Hand, shuttle"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Hand, stable"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Hand, table: bread"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Hand, table: flour confectionery"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Hand, tug"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Handler, baggage"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Handler, food: fast food"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Handler, freight"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Handler, material: manufacturing"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Handler, pottery"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Handler, stock: retail"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Handler, stock: warehouse"
  },
  {
    "isco08": 9622,
    "isco88": 9162,
    "name": "Handyman"
  },
  {
    "isco08": 9622,
    "isco88": 9162,
    "name": "Handyperson"
  },
  {
    "isco08": 9622,
    "isco88": 9162,
    "name": "Handywoman"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Hanger, wallpaper"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Harpist"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Harpooner, whale"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Hatcher, fish"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Hatcher-breeder, poultry"
  },
  {
    "isco08": 7531,
    "isco88": 7434,
    "name": "Hatter"
  },
  {
    "isco08": 9520,
    "isco88": 9112,
    "name": "Hawker, except food"
  },
  {
    "isco08": 5212,
    "isco88": 9111,
    "name": "Hawker, food"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Head of State"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Head, chancery"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Head, college faculty"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Head, department: college"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Head, department: government"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Head, department: university"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Head, faculty"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Head, government department"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Head, permanent: government department"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Head, school"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Head, university faculty"
  },
  {
    "isco08": 1113,
    "isco88": 1130,
    "name": "Head, village"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Headhunter"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Headmaster"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Headmistress"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Head-teacher"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Healer, drugless treatment"
  },
  {
    "isco08": 3413,
    "isco88": 3242,
    "name": "Healer, faith"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Healer, herbal"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Healer, village"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Heater, billet"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Helminthologist"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Helper, aged care"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Helper, companion"
  },
  {
    "isco08": 9111,
    "isco88": 9131,
    "name": "Helper, domestic"
  },
  {
    "isco08": 9213,
    "isco88": 9211,
    "name": "Helper, farm"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Helper, home: caring for aged or infirm"
  },
  {
    "isco08": 9412,
    "isco88": 9131,
    "name": "Helper, kitchen: domestic"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Helper, kitchen: non-domestic"
  },
  {
    "isco08": 5312,
    "isco88": 5131,
    "name": "Helper, pre-school"
  },
  {
    "isco08": 5312,
    "isco88": 5131,
    "name": "Helper, teacher''s"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Herbalist"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Herbalist, chinese medicine"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Herpetologist"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Histologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Histopathologist"
  },
  {
    "isco08": 2633,
    "isco88": 2443,
    "name": "Historian"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Hod-carrier"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Hoddie"
  },
  {
    "isco08": 2230,
    "isco88": 3229,
    "name": "Homeopath"
  },
  {
    "isco08": 5169,
    "isco88": 5149,
    "name": "Hooker, providing sexual services"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Hooker, sponge"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Horse-breaker"
  },
  {
    "isco08": 6113,
    "isco88": 2213,
    "name": "Horticulturist"
  },
  {
    "isco08": 5169,
    "isco88": 5149,
    "name": "Host, club"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Host, party plan"
  },
  {
    "isco08": 2656,
    "isco88": 3472,
    "name": "Host, talk show"
  },
  {
    "isco08": 5111,
    "isco88": 5111,
    "name": "Hostess, air"
  },
  {
    "isco08": 5169,
    "isco88": 5149,
    "name": "Hostess, club"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Hostess, party plan"
  },
  {
    "isco08": 2656,
    "isco88": 3472,
    "name": "Hostess, talk show"
  },
  {
    "isco08": 9111,
    "isco88": 9131,
    "name": "Houseboy"
  },
  {
    "isco08": 7111,
    "isco88": 7121,
    "name": "Housebuilder"
  },
  {
    "isco08": 7111,
    "isco88": 7129,
    "name": "Housebuilder, non-traditional materials"
  },
  {
    "isco08": 7111,
    "isco88": 7121,
    "name": "Housebuilder, traditional materials"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Housefather, associate professional"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Housefather, professional"
  },
  {
    "isco08": 5152,
    "isco88": 5121,
    "name": "Housekeeper, domestic"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Housekeeper, executive"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Housekeeper, hotel"
  },
  {
    "isco08": 9111,
    "isco88": 9131,
    "name": "Housemaid"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Housemaster, associate professional: approved school"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Housemaster, professional: approved school"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Housemistress, associate professional: approved school"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Housemistress, professional: approved school"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Housemother, associate professional"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Housemother, professional"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Hunter"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Hunter, head"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Hunter, seal"
  },
  {
    "isco08": 6340,
    "isco88": 6210,
    "name": "Hunter, subsistence"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Hunter, whale"
  },
  {
    "isco08": 6340,
    "isco88": 6210,
    "name": "Hunter-collector"
  },
  {
    "isco08": 6340,
    "isco88": 6210,
    "name": "Hunter-gatherer"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Hydrobiologist"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Hydroblaster, cleaning"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Hydroblaster, graffiti removal"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Hydrodynamicist"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Hydrogeologist"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Hydrologist"
  },
  {
    "isco08": 2112,
    "isco88": 2112,
    "name": "Hydrometeorologist"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Hydrometrist"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Hydrotherapist"
  },
  {
    "isco08": 3251,
    "isco88": 3225,
    "name": "Hygienist, dental"
  },
  {
    "isco08": 2263,
    "isco88": 3152,
    "name": "Hygienist, occupational"
  },
  {
    "isco08": 3251,
    "isco88": 3225,
    "name": "Hygienist, oral"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Hypnotherapist"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Hypnotist"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Ichthyologist"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Illusionist"
  },
  {
    "isco08": 2166,
    "isco88": 3471,
    "name": "Illustrator"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Illustrator, engineering"
  },
  {
    "isco08": 3118,
    "isco88": 3118,
    "name": "Illustrator, technical"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Imam"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Immunologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Immunologist, clinical"
  },
  {
    "isco08": 2659,
    "isco88": 2455,
    "name": "Impersonator"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Imposer, printing"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Impregnator, wood"
  },
  {
    "isco08": 2654,
    "isco88": 1229,
    "name": "Impresario"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Indexer"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Infantryman, army"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Infantrywoman, army"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Inlayer, marquetry"
  },
  {
    "isco08": 1411,
    "isco88": 1315,
    "name": "Innkeeper"
  },
  {
    "isco08": 3240,
    "isco88": 3227,
    "name": "Inseminator, artificial"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Inspector, agricultural"
  },
  {
    "isco08": 3351,
    "isco88": 3441,
    "name": "Inspector, border"
  },
  {
    "isco08": 3112,
    "isco88": 3151,
    "name": "Inspector, building"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Inspector, civil service"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Inspector, claims"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Inspector, clerical: railway transport (service)"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Inspector, clerical: road transport (service)"
  },
  {
    "isco08": 3351,
    "isco88": 3441,
    "name": "Inspector, customs"
  },
  {
    "isco08": 3355,
    "isco88": 3450,
    "name": "Inspector, detective"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Inspector, electrical products"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Inspector, electronic products"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Inspector, fabrics"
  },
  {
    "isco08": 3112,
    "isco88": 3151,
    "name": "Inspector, fire"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Inspector, fisheries"
  },
  {
    "isco08": 3257,
    "isco88": 3222,
    "name": "Inspector, food sanitation and safety"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Inspector, forestry"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Inspector, government: administration"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, health"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Inspector, insurance: claims"
  },
  {
    "isco08": 3354,
    "isco88": 3444,
    "name": "Inspector, licensing"
  },
  {
    "isco08": 3257,
    "isco88": 3222,
    "name": "Inspector, meat"
  },
  {
    "isco08": 3117,
    "isco88": 3152,
    "name": "Inspector, mine"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, occupational health and safety"
  },
  {
    "isco08": 3353,
    "isco88": 3443,
    "name": "Inspector, pensions"
  },
  {
    "isco08": 3355,
    "isco88": 3450,
    "name": "Inspector, police"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, pollution"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Inspector, prices"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, product safety"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Inspector, products (except food and drinks)"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Inspector, quality"
  },
  {
    "isco08": 3113,
    "isco88": 3152,
    "name": "Inspector, quality: electrical (products)"
  },
  {
    "isco08": 3114,
    "isco88": 3152,
    "name": "Inspector, quality: electronic products"
  },
  {
    "isco08": 3115,
    "isco88": 3152,
    "name": "Inspector, quality: mechanical products"
  },
  {
    "isco08": 2421,
    "isco88": 3152,
    "name": "Inspector, quality: services"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, safety and health"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, safety and health: child care"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, safety and health: consumer (protection)"
  },
  {
    "isco08": 3113,
    "isco88": 3152,
    "name": "Inspector, safety and health: electricity"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, safety and health: establishments"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, safety and health: factories"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, safety and health: industrial (waste-processing)"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, safety and health: labour"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, safety and health: pollution"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, safety and health: shops"
  },
  {
    "isco08": 3115,
    "isco88": 3152,
    "name": "Inspector, safety and health: vehicles"
  },
  {
    "isco08": 3257,
    "isco88": 3152,
    "name": "Inspector, safety and health: working conditions"
  },
  {
    "isco08": 3117,
    "isco88": 3152,
    "name": "Inspector, safety: mines"
  },
  {
    "isco08": 3257,
    "isco88": 3222,
    "name": "Inspector, sanitary"
  },
  {
    "isco08": 2351,
    "isco88": 2352,
    "name": "Inspector, school"
  },
  {
    "isco08": 3352,
    "isco88": 3442,
    "name": "Inspector, taxation"
  },
  {
    "isco08": 5112,
    "isco88": 5112,
    "name": "Inspector, ticket: public transport"
  },
  {
    "isco08": 3115,
    "isco88": 3152,
    "name": "Inspector, vehicle"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Inspector, wage"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Inspector, weights and measures"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Inspector-general, police"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Installer, computer hardware"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Installer, door"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Installer, drain"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Installer, duct"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Installer, engine"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Installer, glazing"
  },
  {
    "isco08": 7124,
    "isco88": 7134,
    "name": "Installer, insulation"
  },
  {
    "isco08": 7124,
    "isco88": 7134,
    "name": "Installer, lagging"
  },
  {
    "isco08": 7123,
    "isco88": 7133,
    "name": "Installer, plasterboard"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Installer, pool"
  },
  {
    "isco08": 7127,
    "isco88": 7233,
    "name": "Installer, refrigeration and air conditioning equipment"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Installer, septic tank"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Installer, software"
  },
  {
    "isco08": 7124,
    "isco88": 7134,
    "name": "Installer, sound-proofing"
  },
  {
    "isco08": 7422,
    "isco88": 7244,
    "name": "Installer, telegraph"
  },
  {
    "isco08": 7422,
    "isco88": 7244,
    "name": "Installer, telephone"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Installer, window: frame"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Installer, window: glazing"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Installer, windscreen"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Instructor, aerobics"
  },
  {
    "isco08": 2320,
    "isco88": 2320,
    "name": "Instructor, automotive technology"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Instructor, billiards"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Instructor, bridge"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Instructor, chess"
  },
  {
    "isco08": 2320,
    "isco88": 2320,
    "name": "Instructor, cosmetology"
  },
  {
    "isco08": 2355,
    "isco88": 3340,
    "name": "Instructor, dance"
  },
  {
    "isco08": 5165,
    "isco88": 3340,
    "name": "Instructor, driving"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Instructor, fitness"
  },
  {
    "isco08": 3153,
    "isco88": 3340,
    "name": "Instructor, flying"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Instructor, horse riding"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Instructor, life skills"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Instructor, recreation"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Instructor, sailing"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Instructor, ski"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Instructor, sports"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Instructor, swimming"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Instructor, underwater diving"
  },
  {
    "isco08": 2320,
    "isco88": 2320,
    "name": "Instructor, vocational education"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Instrumentalist"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Intern, medical"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Intern, medical: in specialist training"
  },
  {
    "isco08": 2262,
    "isco88": 2224,
    "name": "Intern, pharmacy"
  },
  {
    "isco08": 2250,
    "isco88": 2223,
    "name": "Intern, veterinary"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Interpreter"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Interpreter, historical"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Interpreter, science"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Interpreter, sign language"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Intertype operator"
  },
  {
    "isco08": 4229,
    "isco88": 4222,
    "name": "Interviewer, eligibility"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Interviewer, employment"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Interviewer, market research"
  },
  {
    "isco08": 2642,
    "isco88": 3472,
    "name": "Interviewer, media"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Interviewer, public opinion"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Interviewer, survey"
  },
  {
    "isco08": 3119,
    "isco88": 3151,
    "name": "Investigator, fire"
  },
  {
    "isco08": 3355,
    "isco88": 3450,
    "name": "Investigator, police"
  },
  {
    "isco08": 3411,
    "isco88": 3450,
    "name": "Investigator, private"
  },
  {
    "isco08": 5312,
    "isco88": 5131,
    "name": "Invigilator"
  },
  {
    "isco08": 9121,
    "isco88": 9133,
    "name": "Ironer, hand"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Jack, steeple"
  },
  {
    "isco08": 5153,
    "isco88": 9141,
    "name": "Janitor"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Jeweller"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Jiggerer, pottery and porcelain"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Jigmaker"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Jobber, stock"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Jockey"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Jockey, disc"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Jogger, web press"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Joiner"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Jointer, cable: data"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Jointer, cable: electric"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Jointer, cable: telecommunications"
  },
  {
    "isco08": 7422,
    "isco88": 7245,
    "name": "Jointer, cable: telegraph"
  },
  {
    "isco08": 7422,
    "isco88": 7245,
    "name": "Jointer, cable: telephone"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Jointer, pipe-laying"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Jollier, pottery and porcelain"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Journalist"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Journalist, photo"
  },
  {
    "isco08": 2612,
    "isco88": 2422,
    "name": "Judge"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Judge, sports"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Juggler"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Jumper, show"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Jurisconsult"
  },
  {
    "isco08": 2619,
    "isco88": 2429,
    "name": "Jurist, except lawyer or judge"
  },
  {
    "isco08": 2612,
    "isco88": 2429,
    "name": "Jurist, judge"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Jurist, lawyer"
  },
  {
    "isco08": 2612,
    "isco88": 2429,
    "name": "Justice"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Justice of the Peace"
  },
  {
    "isco08": 2612,
    "isco88": 2422,
    "name": "Justice, chief"
  },
  {
    "isco08": 4131,
    "isco88": 4111,
    "name": "Justowriter"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Keeper, animal reserve"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Keeper, aviary"
  },
  {
    "isco08": 5414,
    "isco88": 9152,
    "name": "Keeper, door"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Keeper, goal"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Keeper, green"
  },
  {
    "isco08": 5152,
    "isco88": 5121,
    "name": "Keeper, house: domestic"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Keeper, house: hotel"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Keeper, kennel"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Keeper, lighthouse"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Keeper, lock: canal or port"
  },
  {
    "isco08": 5221,
    "isco88": 1314,
    "name": "Keeper, shop"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Keeper, zoo"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Khatib"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Kinesiologist"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Kitchenhand"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Knacker"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Knitter"
  },
  {
    "isco08": 9321,
    "isco88": 9322,
    "name": "Labeller, hand"
  },
  {
    "isco08": 9216,
    "isco88": 9213,
    "name": "Labourer, aquaculture"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Labourer, builder''s"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Labourer, cattle station"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Labourer, cemetery: gardening"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Labourer, construction: building work"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, construction: civil engineering"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, construction: dams"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, construction: roads"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Labourer, council: gardening"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Labourer, demolition"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, digging: ditch"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, digging: grave"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, digging: trench"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, earthmoving"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Labourer, factory"
  },
  {
    "isco08": 9213,
    "isco88": 9211,
    "name": "Labourer, farm"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Labourer, farm: cotton"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Labourer, farm: dairy"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Labourer, farm: field crops"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Labourer, farm: livestock"
  },
  {
    "isco08": 9213,
    "isco88": 9211,
    "name": "Labourer, farm: livestock and crops"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Labourer, farm: potato digging"
  },
  {
    "isco08": 9216,
    "isco88": 9213,
    "name": "Labourer, fish farm"
  },
  {
    "isco08": 9216,
    "isco88": 9213,
    "name": "Labourer, fishery"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Labourer, forestry"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Labourer, garden"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Labourer, harvesting"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Labourer, horticultural"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, maintenance"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, maintenance: dams"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, maintenance: roads"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Labourer, manufacturing"
  },
  {
    "isco08": 9311,
    "isco88": 9311,
    "name": "Labourer, mining"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Labourer, nursery"
  },
  {
    "isco08": 9622,
    "isco88": 9162,
    "name": "Labourer, odd-job"
  },
  {
    "isco08": 9311,
    "isco88": 9311,
    "name": "Labourer, quarry"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Labourer, ranch"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Labourer, recycling"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Labourer, rice farm"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, tube well"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Labourer, water well"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Labourer, wine production"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Lacer, jacquard card"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Lad, stable"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Ladler, glass"
  },
  {
    "isco08": 8121,
    "isco88": 7211,
    "name": "Ladler, metal"
  },
  {
    "isco08": 7124,
    "isco88": 7134,
    "name": "Lagger"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Lapidary"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Lapper, fibre: textile"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Lapper, ribbon"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Lapper, sliver"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Laryngologist"
  },
  {
    "isco08": 9212,
    "isco88": 9211,
    "name": "Lass, stable"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Laster, footwear"
  },
  {
    "isco08": 9121,
    "isco88": 9133,
    "name": "Launderer, hand"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Lawnmower"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Lawyer"
  },
  {
    "isco08": 7112,
    "isco88": 7122,
    "name": "Layer, block"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Layer, block: wood"
  },
  {
    "isco08": 7112,
    "isco88": 7122,
    "name": "Layer, brick"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Layer, carpet"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Layer, composition tile"
  },
  {
    "isco08": 7126,
    "isco88": 7129,
    "name": "Layer, drain"
  },
  {
    "isco08": 7112,
    "isco88": 7122,
    "name": "Layer, firebrick"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Layer, floor"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Layer, parquetry"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Layer, pipe"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Layer, tile"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Layer, underground cable"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Layer, wood block"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Layer-jointer, mains pipes"
  },
  {
    "isco08": 7322,
    "isco88": 7341,
    "name": "Layer-on, printing press"
  },
  {
    "isco08": 2652,
    "isco88": 3473,
    "name": "Leader, band"
  },
  {
    "isco08": 1114,
    "isco88": 1141,
    "name": "Leader, political party"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Leader, program: recreation"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Leader, squadron: air force"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Leader, team: call centre"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Leader, team: contact centre"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "Leader, trade union"
  },
  {
    "isco08": 2310,
    "isco88": 2310,
    "name": "Lecturer, college: higher education"
  },
  {
    "isco08": 2320,
    "isco88": 2310,
    "name": "Lecturer, college: vocational education"
  },
  {
    "isco08": 2310,
    "isco88": 2310,
    "name": "Lecturer, higher education"
  },
  {
    "isco08": 2310,
    "isco88": 2310,
    "name": "Lecturer, university"
  },
  {
    "isco08": 2320,
    "isco88": 2310,
    "name": "Lecturer, vocational education"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Legislator"
  },
  {
    "isco08": 4213,
    "isco88": 4214,
    "name": "Lender, money"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Lepidopterist"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Letterer, sign-writing"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Lexicographer"
  },
  {
    "isco08": 2622,
    "isco88": 2432,
    "name": "Librarian"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Librarian, chief"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Licensee, childcare centre"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Lieutenant colonel, army"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Lieutenant commander, navy"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Lieutenant general, army"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Lieutenant, army"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Lieutenant, flight: air force"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Lieutenant, navy"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Lieutenant, second: army"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Lifeboatman"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Lifeboatwoman"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Lifeguard"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Lifesaver, surf"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Lighterman"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Lighterwoman"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Lighthouse-man"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Lighthouse-woman"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Lightshipman"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Lightshipwoman"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Limnologist"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Linguist"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Linotyper"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Liquidator, company"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Liquidator, financial"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Litigator"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Loader, aircraft"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Loader, boat"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Loader, furniture"
  },
  {
    "isco08": 9611,
    "isco88": 9161,
    "name": "Loader, garbage truck"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Loader, manufacturing"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Loader, railway vehicles"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Loader, road vehicles"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Loader, ship"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Lobbyist"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Lock-keeper, canal or port"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Locksmith"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Loftsman, structural metal"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Loftswoman, structural metal"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Logger"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Longshoreman"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Longshorewoman"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Lopper, tree"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Lumberjack"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Lyricist"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Machinist, CNC"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Machinist, metal"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Machinist, plastic products"
  },
  {
    "isco08": 8153,
    "isco88": 8263,
    "name": "Machinist, sewing"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Machinist, wood products"
  },
  {
    "isco08": 2631,
    "isco88": 2441,
    "name": "Macroeconomist"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Magician"
  },
  {
    "isco08": 2612,
    "isco88": 2422,
    "name": "Magistrate"
  },
  {
    "isco08": 9332,
    "isco88": 9332,
    "name": "Mahout"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Maid, chamber"
  },
  {
    "isco08": 9111,
    "isco88": 9131,
    "name": "Maid, domestic"
  },
  {
    "isco08": 5162,
    "isco88": 5142,
    "name": "Maid, lady''s"
  },
  {
    "isco08": 9112,
    "isco88": 9133,
    "name": "Maid, linen"
  },
  {
    "isco08": 9111,
    "isco88": 9131,
    "name": "Maid, parlour: domestic"
  },
  {
    "isco08": 5162,
    "isco88": 5142,
    "name": "Maid, personal"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Mailman"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Mailwoman"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Maitre d''hotel"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Major general, army"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Major, army"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Major, Sergeant"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, accordion"
  },
  {
    "isco08": 7318,
    "isco88": 7436,
    "name": "Maker, artificial flower"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Maker, artificial limb"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Maker, awning"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, barometer"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, barrel"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Maker, basket"
  },
  {
    "isco08": 7534,
    "isco88": 7437,
    "name": "Maker, bedding"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Maker, biscuit"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Maker, blouse"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Maker, boiler"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Maker, brace: orthopaedic"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Maker, braid"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Maker, braille plate"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Maker, broom"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Maker, brush"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Maker, burger"
  },
  {
    "isco08": 7513,
    "isco88": 7413,
    "name": "Maker, butter"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, cabinet"
  },
  {
    "isco08": 7319,
    "isco88": 7331,
    "name": "Maker, candle, handicraft"
  },
  {
    "isco08": 8131,
    "isco88": 8229,
    "name": "Maker, candle: machine"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Maker, cap"
  },
  {
    "isco08": 7318,
    "isco88": 7436,
    "name": "Maker, carpet"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, cask"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, chair"
  },
  {
    "isco08": 7513,
    "isco88": 7413,
    "name": "Maker, cheese"
  },
  {
    "isco08": 8160,
    "isco88": 7412,
    "name": "Maker, chewing-gum"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Maker, chocolate"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Maker, chutney"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Maker, cigar"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Maker, cigarette"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, clock"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, clock case"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, clog"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, coffin"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Maker, confectionery"
  },
  {
    "isco08": 7211,
    "isco88": 7211,
    "name": "Maker, core"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Maker, corset"
  },
  {
    "isco08": 7513,
    "isco88": 7413,
    "name": "Maker, dairy products"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Maker, dentures"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Maker, die"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, drum"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Maker, fast food"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Maker, fishing net"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Maker, footwear"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Maker, footwear: raffia"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Maker, fruit juice"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Maker, furniture: basketry"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, furniture: cane"
  },
  {
    "isco08": 7534,
    "isco88": 7437,
    "name": "Maker, furniture: soft furnishing"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Maker, furniture: wicker"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Maker, gauge"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Maker, gown"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Maker, hamburger"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Maker, harness"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Maker, hat"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Maker, horse collar"
  },
  {
    "isco08": 7513,
    "isco88": 7413,
    "name": "Maker, ice-cream"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, instrument case"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, instrument: dental"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, instrument: meteorological"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, instrument: nautical"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, instrument: optical"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, instrument: precision"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, instrument: scientific"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, instrument: stringed"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, instrument: surgical"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, instrument: woodwind"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Maker, jam"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Maker, jewellery"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Maker, jig"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Maker, jig-gauge"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, key: piano"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, ladder: wood"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Maker, leather goods"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Maker, lingerie"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Maker, log-raft"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Maker, map"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Maker, mast and spar: wood"
  },
  {
    "isco08": 7534,
    "isco88": 7437,
    "name": "Maker, mattress"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, model: wooden"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Maker, net"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Maker, noodle"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, organ"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Maker, orthopaedic: appliance"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Maker, orthopaedic: footwear"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Maker, panel: saddlery"
  },
  {
    "isco08": 7317,
    "isco88": 7422,
    "name": "Maker, paper"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Maker, pastry"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Maker, pattern"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, photographic equipment"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Maker, photogravure: printing plate"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, piano"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, piano accordion"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, piano case"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Maker, pickle"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, picture frame"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Maker, pie"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, pipe: smoking (wood)"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Maker, pizza"
  },
  {
    "isco08": 7321,
    "isco88": 7342,
    "name": "Maker, plate: printing"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Maker, pottery and porcelain mould"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Maker, pottery spout"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Maker, precious-metal chain"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Maker, precious-metal leaf"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, precision instrument"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Maker, press tool"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Maker, prosthesis"
  },
  {
    "isco08": 7534,
    "isco88": 7437,
    "name": "Maker, quilt"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Maker, saddle"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Maker, safety net"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Maker, sail, tent and awning"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Maker, sausage"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Maker, screen"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Maker, shirt"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Maker, snuff"
  },
  {
    "isco08": 7534,
    "isco88": 7437,
    "name": "Maker, soft furnishing"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, sound-board: piano"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Maker, sponge cake"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Maker, sports equipment: footwear"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, sports equipment: wood"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Maker, stencil: printing plate"
  },
  {
    "isco08": 7322,
    "isco88": 7346,
    "name": "Maker, stencil: silk-screen"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Maker, sugar: traditional methods"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Maker, surgical footwear"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Maker, surgical: appliance"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Maker, tank: wooden"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Maker, tap-die"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Maker, tapestry"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Maker, template"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Maker, tent"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Maker, tobacco cake"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Maker, tobacco plug"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Maker, tool"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Maker, toy: dolls"
  },
  {
    "isco08": 7319,
    "isco88": 7223,
    "name": "Maker, toy: metal"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Maker, toy: soft toys"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Maker, toy: stuffed toys"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Maker, toy: wooden"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Maker, tyre"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Maker, umbrella"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Maker, vegetable juice"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, violin"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Maker, watch"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Maker, whip"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Maker, wig"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Maker, wine"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Maker, xylophone"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Maker, yeast"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Maker-up, photo-typesetting"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Maker-up, printing"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Maltster"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Mammalogist"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Mammographer"
  },
  {
    "isco08": 3258,
    "isco88": 5132,
    "name": "Man, ambulance"
  },
  {
    "isco08": 9622,
    "isco88": 9162,
    "name": "Man, odd-job"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Man, stunt"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Manager, account: advertising"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Manager, account: computer technology"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Manager, account: ICT"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Manager, account: marketing"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Manager, account: organizing conferences or events"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Manager, account: public relations"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Manager, account: sales (except ICT, industrial, medical and pharmaceutical products)"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Manager, account: sales (industrial products)"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Manager, account: sales (information and communications technology)"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Manager, account: sales (medical products)"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Manager, account: sales (pharmaceuticals)"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Manager, accounting"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Manager, accounts"
  },
  {
    "isco08": 1219,
    "isco88": 1231,
    "name": "Manager, administrative services"
  },
  {
    "isco08": 1222,
    "isco88": 1234,
    "name": "Manager, advertising"
  },
  {
    "isco08": 1343,
    "isco88": 1229,
    "name": "Manager, aged care"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Manager, aged care facility"
  },
  {
    "isco08": 1311,
    "isco88": 1221,
    "name": "Manager, agricultural production"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, air ramp"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, air safety"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, airport operations"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, amusement centre"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, amusement park"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, application development"
  },
  {
    "isco08": 1312,
    "isco88": 1311,
    "name": "Manager, aquaculture"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, archives"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, art gallery"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Manager, auditing firm"
  },
  {
    "isco08": 1346,
    "isco88": 1317,
    "name": "Manager, bank"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, billiards hall"
  },
  {
    "isco08": 1411,
    "isco88": 1315,
    "name": "Manager, boarding house"
  },
  {
    "isco08": 1346,
    "isco88": 1317,
    "name": "Manager, branch: bank"
  },
  {
    "isco08": 1346,
    "isco88": 1317,
    "name": "Manager, branch: building society"
  },
  {
    "isco08": 1346,
    "isco88": 1317,
    "name": "Manager, branch: credit union"
  },
  {
    "isco08": 1346,
    "isco88": 1317,
    "name": "Manager, branch: financial institution"
  },
  {
    "isco08": 1346,
    "isco88": 1317,
    "name": "Manager, branch: insurance company"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Manager, budgeting"
  },
  {
    "isco08": 3123,
    "isco88": 1223,
    "name": "Manager, building site"
  },
  {
    "isco08": 1346,
    "isco88": 1317,
    "name": "Manager, building society"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, bus station"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Manager, business development: ICT"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, business planning"
  },
  {
    "isco08": 1412,
    "isco88": 1315,
    "name": "Manager, caf�"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Manager, call centre team"
  },
  {
    "isco08": 1439,
    "isco88": 1315,
    "name": "Manager, camp site"
  },
  {
    "isco08": 1412,
    "isco88": 1315,
    "name": "Manager, canteen"
  },
  {
    "isco08": 1439,
    "isco88": 1315,
    "name": "Manager, caravan park"
  },
  {
    "isco08": 1343,
    "isco88": 1229,
    "name": "Manager, care: aged care facility"
  },
  {
    "isco08": 1343,
    "isco88": 1229,
    "name": "Manager, care: nursing home"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Manager, care: out of school hours"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, casino"
  },
  {
    "isco08": 1412,
    "isco88": 1225,
    "name": "Manager, catering"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Manager, centre: aged care"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Manager, centre: childcare"
  },
  {
    "isco08": 1344,
    "isco88": 1319,
    "name": "Manager, centre: welfare services"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, chain store"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, charity shop"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Manager, child care centre"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Manager, childcare"
  },
  {
    "isco08": 1341,
    "isco88": 1229,
    "name": "Manager, children''s services"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, cinema"
  },
  {
    "isco08": 1219,
    "isco88": 1317,
    "name": "Manager, cleaning service"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Manager, clinical trials"
  },
  {
    "isco08": 1221,
    "isco88": 1233,
    "name": "Manager, commercial"
  },
  {
    "isco08": 1222,
    "isco88": 1234,
    "name": "Manager, communications: public relations"
  },
  {
    "isco08": 1330,
    "isco88": 1226,
    "name": "Manager, communications: technology"
  },
  {
    "isco08": 1344,
    "isco88": 1319,
    "name": "Manager, community centre"
  },
  {
    "isco08": 1213,
    "isco88": 1231,
    "name": "Manager, compliance"
  },
  {
    "isco08": 1330,
    "isco88": 1317,
    "name": "Manager, computer services company"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, computer services department"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, computer systems"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Manager, computer systems: systems administration"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Manager, conference"
  },
  {
    "isco08": 1439,
    "isco88": 1319,
    "name": "Manager, conference centre"
  },
  {
    "isco08": 1323,
    "isco88": 1313,
    "name": "Manager, construction"
  },
  {
    "isco08": 1439,
    "isco88": 1319,
    "name": "Manager, contact centre"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Manager, contact centre team"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, corporate planning"
  },
  {
    "isco08": 1219,
    "isco88": 1231,
    "name": "Manager, corporate services"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, correctional services"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, corrective services"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Manager, cottage: aged care"
  },
  {
    "isco08": 1344,
    "isco88": 1319,
    "name": "Manager, cottage: welfare services"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, courier service"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Manager, cr�che"
  },
  {
    "isco08": 1346,
    "isco88": 1317,
    "name": "Manager, credit union"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, cultural centre"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Manager, dance studio: instructing"
  },
  {
    "isco08": 2621,
    "isco88": 2431,
    "name": "Manager, data"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, data operations"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, data processing"
  },
  {
    "isco08": 2521,
    "isco88": 2131,
    "name": "Manager, database"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Manager, day care centre: children"
  },
  {
    "isco08": 1323,
    "isco88": 1313,
    "name": "Manager, demolition"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, department store"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Manager, department: accounting"
  },
  {
    "isco08": 1219,
    "isco88": 1231,
    "name": "Manager, department: administration"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Manager, department: budgeting"
  },
  {
    "isco08": 1219,
    "isco88": 1227,
    "name": "Manager, department: business services"
  },
  {
    "isco08": 1219,
    "isco88": 1228,
    "name": "Manager, department: cleaning"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, department: cultural activities"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Manager, department: education"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, department: employee relations"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Manager, department: finance"
  },
  {
    "isco08": 1411,
    "isco88": 1225,
    "name": "Manager, department: hotel"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, department: industrial relations"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, department: industrial relations"
  },
  {
    "isco08": 1221,
    "isco88": 1233,
    "name": "Manager, department: marketing"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, department: personnel"
  },
  {
    "isco08": 1439,
    "isco88": 1229,
    "name": "Manager, department: production and operations (travel agency)"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, department: recreation"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, department: recruitment"
  },
  {
    "isco08": 1420,
    "isco88": 1224,
    "name": "Manager, department: retail trade"
  },
  {
    "isco08": 1221,
    "isco88": 1233,
    "name": "Manager, department: sales"
  },
  {
    "isco08": 1221,
    "isco88": 1233,
    "name": "Manager, department: sales promotion"
  },
  {
    "isco08": 1420,
    "isco88": 1224,
    "name": "Manager, department: shop"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, department: sporting activities"
  },
  {
    "isco08": 1420,
    "isco88": 1224,
    "name": "Manager, department: supermarket"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, department: transportation"
  },
  {
    "isco08": 1420,
    "isco88": 1224,
    "name": "Manager, department: wholesale trade"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, department: workplace relations"
  },
  {
    "isco08": 2519,
    "isco88": 2139,
    "name": "Manager, deployment: information and communication technology (ICT)"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, design service service"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, design service service"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, discount store"
  },
  {
    "isco08": 1324,
    "isco88": 1235,
    "name": "Manager, distribution"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Manager, e-commerce: managing website"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, emergency services"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, employee relations"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Manager, events"
  },
  {
    "isco08": 1221,
    "isco88": 1233,
    "name": "Manager, exports"
  },
  {
    "isco08": 1219,
    "isco88": 1228,
    "name": "Manager, facilities"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Manager, facility: aged care"
  },
  {
    "isco08": 1344,
    "isco88": 1319,
    "name": "Manager, facility: welfare services"
  },
  {
    "isco08": 1344,
    "isco88": 1229,
    "name": "Manager, family services"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Manager, finance"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, fire services"
  },
  {
    "isco08": 6221,
    "isco88": 1311,
    "name": "Manager, fish farm"
  },
  {
    "isco08": 1312,
    "isco88": 1311,
    "name": "Manager, fish hatchery"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, fisheries: conservation"
  },
  {
    "isco08": 1312,
    "isco88": 1311,
    "name": "Manager, fisheries: fishing operations"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, fisheries: policy"
  },
  {
    "isco08": 1312,
    "isco88": 1311,
    "name": "Manager, fisheries: production"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, flight operations"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, flight safety"
  },
  {
    "isco08": 3435,
    "isco88": 1229,
    "name": "Manager, floor: broadcasting"
  },
  {
    "isco08": 1311,
    "isco88": 1221,
    "name": "Manager, forestry"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Manager, front office: hospital or school"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Manager, functions"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, garden centre"
  },
  {
    "isco08": 1219,
    "isco88": 1317,
    "name": "Manager, general: business services"
  },
  {
    "isco08": 1439,
    "isco88": 1315,
    "name": "Manager, general: camping site"
  },
  {
    "isco08": 1439,
    "isco88": 1315,
    "name": "Manager, general: caravan park"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, general: chain store"
  },
  {
    "isco08": 1219,
    "isco88": 1318,
    "name": "Manager, general: cleaning"
  },
  {
    "isco08": 1323,
    "isco88": 1313,
    "name": "Manager, general: construction"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, general: discount store"
  },
  {
    "isco08": 1345,
    "isco88": 1319,
    "name": "Manager, general: education"
  },
  {
    "isco08": 1312,
    "isco88": 1311,
    "name": "Manager, general: fishing"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, general: mail-order store"
  },
  {
    "isco08": 1321,
    "isco88": 1312,
    "name": "Manager, general: manufacturing"
  },
  {
    "isco08": 1322,
    "isco88": 1312,
    "name": "Manager, general: operation (mining)"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, general: self-service store"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, general: shop"
  },
  {
    "isco08": 1324,
    "isco88": 1316,
    "name": "Manager, general: storage"
  },
  {
    "isco08": 1324,
    "isco88": 1316,
    "name": "Manager, general: transport"
  },
  {
    "isco08": 1439,
    "isco88": 1319,
    "name": "Manager, general: travel agency"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, general: wholesale trade"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, grocery"
  },
  {
    "isco08": 1411,
    "isco88": 1315,
    "name": "Manager, guest-house"
  },
  {
    "isco08": 1342,
    "isco88": 1319,
    "name": "Manager, health facility"
  },
  {
    "isco08": 1342,
    "isco88": 1229,
    "name": "Manager, health service"
  },
  {
    "isco08": 1411,
    "isco88": 1315,
    "name": "Manager, hostel"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Manager, hostel: aged care"
  },
  {
    "isco08": 1344,
    "isco88": 1319,
    "name": "Manager, hostel: welfare services"
  },
  {
    "isco08": 1411,
    "isco88": 1315,
    "name": "Manager, hotel"
  },
  {
    "isco08": 1344,
    "isco88": 1229,
    "name": "Manager, housing services"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, human resources"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, ICT development"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, imports"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, imports and exports"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, industrial relations"
  },
  {
    "isco08": 2621,
    "isco88": 2431,
    "name": "Manager, information"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Manager, information systems: systems administration"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, information technology"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Manager, information technology: systems administration"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Manager, information: health"
  },
  {
    "isco08": 1439,
    "isco88": 1319,
    "name": "Manager, information: tourist"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Manager, information: website management"
  },
  {
    "isco08": 1411,
    "isco88": 1315,
    "name": "Manager, inn"
  },
  {
    "isco08": 1346,
    "isco88": 1317,
    "name": "Manager, insurance agency"
  },
  {
    "isco08": 1330,
    "isco88": 1317,
    "name": "Manager, internet service provider"
  },
  {
    "isco08": 1330,
    "isco88": 1317,
    "name": "Manager, internet service provider"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, internet: department"
  },
  {
    "isco08": 1330,
    "isco88": 1317,
    "name": "Manager, internet: managing business"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Manager, internet: managing website"
  },
  {
    "isco08": 1330,
    "isco88": 1317,
    "name": "Manager, ISP"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, IT"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Manager, kindergarten"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, laboratory"
  },
  {
    "isco08": 3342,
    "isco88": 3431,
    "name": "Manager, legal practice"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, legal service"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, leisure centre"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, library"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Manager, lodge: aged care"
  },
  {
    "isco08": 1344,
    "isco88": 1319,
    "name": "Manager, lodge: welfare services"
  },
  {
    "isco08": 1411,
    "isco88": 1315,
    "name": "Manager, lodging-house"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, logistics"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, mail operations"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, mail-order store"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, manufacturing"
  },
  {
    "isco08": 1221,
    "isco88": 1233,
    "name": "Manager, marketing"
  },
  {
    "isco08": 3344,
    "isco88": 3431,
    "name": "Manager, medical practice"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, metallurgy"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, metropolitan railway station"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, mine"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, mining"
  },
  {
    "isco08": 1411,
    "isco88": 1315,
    "name": "Manager, motel"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, museum"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, network"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Manager, nursery: childcare"
  },
  {
    "isco08": 1343,
    "isco88": 1319,
    "name": "Manager, nursing home"
  },
  {
    "isco08": 3341,
    "isco88": 3439,
    "name": "Manager, office"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, offshore installation: oil or gas"
  },
  {
    "isco08": 1311,
    "isco88": 1221,
    "name": "Manager, operations: agriculture"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, operations: computer systems"
  },
  {
    "isco08": 1312,
    "isco88": 1311,
    "name": "Manager, operations: fishing"
  },
  {
    "isco08": 1311,
    "isco88": 1221,
    "name": "Manager, operations: forestry"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, operations: manufacturing"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, operations: mining"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, personnel"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, planning: policy"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, planning: strategic"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, plant: mining"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, plant: power generation"
  },
  {
    "isco08": 1311,
    "isco88": 1221,
    "name": "Manager, plantation"
  },
  {
    "isco08": 1341,
    "isco88": 1319,
    "name": "Manager, playgroup"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, policy and planning"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, policy development"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, pool hall"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, postal service"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, power station"
  },
  {
    "isco08": 3342,
    "isco88": 3431,
    "name": "Manager, practice: legal"
  },
  {
    "isco08": 3344,
    "isco88": 3431,
    "name": "Manager, practice: medical"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, processing: mining"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Manager, product development"
  },
  {
    "isco08": 1321,
    "isco88": 1312,
    "name": "Manager, production and operations: manufacturing"
  },
  {
    "isco08": 1311,
    "isco88": 1221,
    "name": "Manager, production: agriculture"
  },
  {
    "isco08": 1312,
    "isco88": 1311,
    "name": "Manager, production: aquaculture"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, production: chemicals"
  },
  {
    "isco08": 1312,
    "isco88": 1311,
    "name": "Manager, production: fishing"
  },
  {
    "isco08": 1311,
    "isco88": 1221,
    "name": "Manager, production: forestry"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, production: gas supply"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, production: mine"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, production: oil and gas extraction"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, production: oil refinery"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, production: petroleum refinery"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, production: power generation"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, production: quarry"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, production: waste management"
  },
  {
    "isco08": 1321,
    "isco88": 1222,
    "name": "Manager, production: water supply and treatment"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Manager, programme: research"
  },
  {
    "isco08": 1323,
    "isco88": 1223,
    "name": "Manager, project: civil engineering"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Manager, project: clinical trials"
  },
  {
    "isco08": 1323,
    "isco88": 1223,
    "name": "Manager, project: construction"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, project: information technology"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Manager, project: research"
  },
  {
    "isco08": 3334,
    "isco88": 3413,
    "name": "Manager, property"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, public policy"
  },
  {
    "isco08": 1222,
    "isco88": 1234,
    "name": "Manager, public relations"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Manager, publishing"
  },
  {
    "isco08": 1324,
    "isco88": 1235,
    "name": "Manager, purchasing"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, quarry"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, railway station"
  },
  {
    "isco08": 1311,
    "isco88": 1221,
    "name": "Manager, ranch"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Manager, reception: weddings"
  },
  {
    "isco08": 2621,
    "isco88": 2431,
    "name": "Manager, records"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Manager, records: health"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, recruitment"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Manager, regional"
  },
  {
    "isco08": 2519,
    "isco88": 2139,
    "name": "Manager, release: projects (ICT)"
  },
  {
    "isco08": 2519,
    "isco88": 2139,
    "name": "Manager, release: systems (ICT)"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Manager, research"
  },
  {
    "isco08": 1223,
    "isco88": 1237,
    "name": "Manager, research and development"
  },
  {
    "isco08": 1343,
    "isco88": 1229,
    "name": "Manager, residential care: nursing home"
  },
  {
    "isco08": 1412,
    "isco88": 1315,
    "name": "Manager, restaurant"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, retail"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, riding school"
  },
  {
    "isco08": 1221,
    "isco88": 1233,
    "name": "Manager, sales"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Manager, sales team: call centre"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Manager, sales: call centre"
  },
  {
    "isco08": 1412,
    "isco88": 1315,
    "name": "Manager, self-service restaurant"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, self-service store"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, shop"
  },
  {
    "isco08": 1439,
    "isco88": 1319,
    "name": "Manager, shopping centre"
  },
  {
    "isco08": 3123,
    "isco88": 1223,
    "name": "Manager, site: building"
  },
  {
    "isco08": 3123,
    "isco88": 1223,
    "name": "Manager, site: construction"
  },
  {
    "isco08": 1412,
    "isco88": 1315,
    "name": "Manager, snack-bar"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, snooker hall"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, social administration"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, social planning"
  },
  {
    "isco08": 1344,
    "isco88": 1229,
    "name": "Manager, social services"
  },
  {
    "isco08": 1344,
    "isco88": 1229,
    "name": "Manager, social welfare"
  },
  {
    "isco08": 1344,
    "isco88": 1229,
    "name": "Manager, social work"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, sports centre"
  },
  {
    "isco08": 3435,
    "isco88": 1229,
    "name": "Manager, stage"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, station, service"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, storage"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, store: retail"
  },
  {
    "isco08": 1213,
    "isco88": 1229,
    "name": "Manager, strategic planning"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Manager, supermarket"
  },
  {
    "isco08": 1324,
    "isco88": 1235,
    "name": "Manager, supplies"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, supply and distribution"
  },
  {
    "isco08": 1324,
    "isco88": 1235,
    "name": "Manager, supply chain"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, swimming pool"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Manager, systems development"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Manager, team: call centre"
  },
  {
    "isco08": 1330,
    "isco88": 1317,
    "name": "Manager, telecommunications services"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, theatre"
  },
  {
    "isco08": 1431,
    "isco88": 1319,
    "name": "Manager, theme park"
  },
  {
    "isco08": 5113,
    "isco88": 5113,
    "name": "Manager, tour"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, traffic"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, transport"
  },
  {
    "isco08": 1324,
    "isco88": 1316,
    "name": "Manager, transport company"
  },
  {
    "isco08": 1439,
    "isco88": 1319,
    "name": "Manager, travel agency"
  },
  {
    "isco08": 1312,
    "isco88": 1311,
    "name": "Manager, trawler"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Manager, under: mine"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Manager, urban transit system"
  },
  {
    "isco08": 1324,
    "isco88": 1235,
    "name": "Manager, warehouse"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Manager, website"
  },
  {
    "isco08": 1344,
    "isco88": 1319,
    "name": "Manager, welfare centre"
  },
  {
    "isco08": 1344,
    "isco88": 1229,
    "name": "Manager, welfare services"
  },
  {
    "isco08": 1212,
    "isco88": 1232,
    "name": "Manager, workplace relations"
  },
  {
    "isco08": 1322,
    "isco88": 1222,
    "name": "Manager, works: mining"
  },
  {
    "isco08": 1411,
    "isco88": 1315,
    "name": "Manager, youth hostel"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Managing-director"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Manicurist"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Manipulator, rolling-mill"
  },
  {
    "isco08": 5241,
    "isco88": 5210,
    "name": "Mannequin"
  },
  {
    "isco08": 5162,
    "isco88": 5142,
    "name": "Manservant"
  },
  {
    "isco08": 1321,
    "isco88": 1312,
    "name": "Manufacturer"
  },
  {
    "isco08": 7323,
    "isco88": 7345,
    "name": "Marbler, edge: bookbinding"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Marker, garment"
  },
  {
    "isco08": 7316,
    "isco88": 7323,
    "name": "Marker, glass engraving"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Marker, metal"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Marker, sheet metal"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Marker, structural metal"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Marker, timber"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Marker, tree"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Marker, woodworking"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Marketer, telemarketing"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Marketer, telesales"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Marshal, air"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Marshal, air chief"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Marshal, field"
  },
  {
    "isco08": 7112,
    "isco88": 7113,
    "name": "Mason, brick"
  },
  {
    "isco08": 7112,
    "isco88": 7122,
    "name": "Mason, construction"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Mason, monumental"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Mason, stone"
  },
  {
    "isco08": 7123,
    "isco88": 7133,
    "name": "Mason, stucco"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Masseur"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Masseuse"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Master, float"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Master, head"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Master, high school"
  },
  {
    "isco08": 2341,
    "isco88": 2331,
    "name": "Master, primary education"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Master, property: broadcasting"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Master, railway station"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Master, ship: inland waterways"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Master, ship: sea"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Master, station: railway"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Master, wardrobe"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Master, web"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Master: secondary education"
  },
  {
    "isco08": 7531,
    "isco88": 7434,
    "name": "Matcher, fur"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Mate, bricklayer''s"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Mate, builder''s"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Mate, carpenter''s"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Mate, chief: ship"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Mate, first"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Mate, second"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Mate, ship"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Mate, third"
  },
  {
    "isco08": 2120,
    "isco88": 2121,
    "name": "Mathematician"
  },
  {
    "isco08": 1342,
    "isco88": 2230,
    "name": "Matron, hospital"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Matron, housekeeping"
  },
  {
    "isco08": 1343,
    "isco88": 2230,
    "name": "Matron, nursing home facility"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Maulana"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Mayor"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Mechanic,  wheelchair: motorized"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Mechanic, accounting-machine"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, agricultural machinery"
  },
  {
    "isco08": 7127,
    "isco88": 7233,
    "name": "Mechanic, air conditioning equipment"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Mechanic, aircraft"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Mechanic, airframe"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Mechanic, airframe and power plant"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Mechanic, audio-visual equipment"
  },
  {
    "isco08": 7421,
    "isco88": 7242,
    "name": "Mechanic, automated teller machines"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, automobile"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, automobile transmission"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Mechanic, avionics"
  },
  {
    "isco08": 7234,
    "isco88": 7231,
    "name": "Mechanic, bicycle"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, bus"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Mechanic, business machine: electronic"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Mechanic, calculating machine: electronic"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Mechanic, computer"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, construction machinery"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Mechanic, dental"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, diesel: motor vehicle"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, earth-moving equipment"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Mechanic, electrical"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Mechanic, electronics"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Mechanic, engine: aircraft"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, engine: diesel (except motor vehicle)"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, engine: motor vehicle"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, engine: steam"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, farm machinery"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, garage"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Mechanic, helicopter"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, industrial machinery"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Mechanic, jet engine"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Mechanic, lift"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, machine tool"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, mining machinery"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, motor truck"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, motor vehicle"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, motorcycle"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, motorized tricycle"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Mechanic, office machine: electronic"
  },
  {
    "isco08": 7234,
    "isco88": 7231,
    "name": "Mechanic, perambulator"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, plant maintenance"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Mechanic, pneudraulic systems: aircraft"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Mechanic, powerplant: aircraft"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, printing machinery"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Mechanic, radio"
  },
  {
    "isco08": 7127,
    "isco88": 7233,
    "name": "Mechanic, refrigeration"
  },
  {
    "isco08": 7234,
    "isco88": 7231,
    "name": "Mechanic, rickshaw: cycle"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, rickshaw: motorized"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Mechanic, rocket engine component"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, ship"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, small engine"
  },
  {
    "isco08": 7422,
    "isco88": 7244,
    "name": "Mechanic, telegraph"
  },
  {
    "isco08": 7422,
    "isco88": 7244,
    "name": "Mechanic, telephone"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Mechanic, television"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, textile machinery"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, tractor"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, truck"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechanic, tuk-tuk"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, turbine"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, typewriter"
  },
  {
    "isco08": 7234,
    "isco88": 7231,
    "name": "Mechanic, wheelchair"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Mechanic, wheelchair: electric"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Mechanic, woodworking machinery"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Mechatronician"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Mediator, workplace"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Member, board"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Member, house of assembly"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Member, legilslative assembly"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Member, legilslative council"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Member, local government"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Member, parliament"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Member, team: fast food (cooking)"
  },
  {
    "isco08": 3323,
    "isco88": 3416,
    "name": "Merchandiser, buying"
  },
  {
    "isco08": 5242,
    "isco88": 5220,
    "name": "Merchandiser, demonstrating"
  },
  {
    "isco08": 3323,
    "isco88": 3416,
    "name": "Merchandiser, purchasing"
  },
  {
    "isco08": 5242,
    "isco88": 5220,
    "name": "Merchandiser, sales"
  },
  {
    "isco08": 3432,
    "isco88": 3471,
    "name": "Merchandiser, visual"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Merchant, retail trade"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Merchant, scrap"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Merchant, wholesale trade"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Messenger"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Messenger, bicycle"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Messenger, driving car"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Messenger, driving van"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Messenger, motorcycle"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Messenger, office"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Messenger, on foot"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Messenger, telegraph"
  },
  {
    "isco08": 2146,
    "isco88": 2147,
    "name": "Metallurgist"
  },
  {
    "isco08": 2146,
    "isco88": 2147,
    "name": "Metallurgist, extractive"
  },
  {
    "isco08": 2146,
    "isco88": 2147,
    "name": "Metallurgist-assayer"
  },
  {
    "isco08": 2112,
    "isco88": 2112,
    "name": "Meteorologist"
  },
  {
    "isco08": 9623,
    "isco88": 9153,
    "name": "Meter-reader"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Mezzo-soprano"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Microbiologist"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Micropalaeontologist"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Microphotographer"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Midshipman"
  },
  {
    "isco08": 3222,
    "isco88": 3232,
    "name": "Midwife, assistant"
  },
  {
    "isco08": 3222,
    "isco88": 3232,
    "name": "Midwife, associate professional"
  },
  {
    "isco08": 3222,
    "isco88": 3232,
    "name": "Midwife, lay"
  },
  {
    "isco08": 2222,
    "isco88": 2230,
    "name": "Midwife, professional"
  },
  {
    "isco08": 3222,
    "isco88": 3232,
    "name": "Midwife, traditional"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Milker"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Milkmaid"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Milliner"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Millwright"
  },
  {
    "isco08": 2655,
    "isco88": 2455,
    "name": "Mime, artist"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Mimeographer"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Miner"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Miner, coal"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Miner, data"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Miner, diamond"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Miner, gold"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Miner, hydraulic: placer mining"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Miner, surface"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Miner, underground"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Mineralogist"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Minister, government"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Minister, religion"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Missionary"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Mistress, head"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Mistress, high school"
  },
  {
    "isco08": 2341,
    "isco88": 2331,
    "name": "Mistress, primary education"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Mistress, wardrobe"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Mistress: secondary education"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Mixer, bread dough"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Mixer, chocolate"
  },
  {
    "isco08": 7114,
    "isco88": 7123,
    "name": "Mixer, concrete"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Mixer, flour confectionery"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Mixer, paint"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Mixer, pie paste"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Mixer, snuff"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Mixer, sound"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Mixer, sugar confectionery"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Mixer, tobacco"
  },
  {
    "isco08": 5241,
    "isco88": 5210,
    "name": "Model, advertising"
  },
  {
    "isco08": 5241,
    "isco88": 5210,
    "name": "Model, artist''s"
  },
  {
    "isco08": 5241,
    "isco88": 5210,
    "name": "Model, clothing display"
  },
  {
    "isco08": 5241,
    "isco88": 5210,
    "name": "Model, fashion"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Modeller, pottery and porcelain"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Modeller, sculpture"
  },
  {
    "isco08": 4213,
    "isco88": 4214,
    "name": "Money-lender"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Monk"
  },
  {
    "isco08": 7542,
    "isco88": 7112,
    "name": "Monkey, powder"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Monotyper"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Monsignor"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Morphologist"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Mortarman, army"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Mortarwoman, army"
  },
  {
    "isco08": 5163,
    "isco88": 5143,
    "name": "Mortician"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Mother, superior"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Motorcyclist"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Motorcyclist: racing"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Moulder, abrasive wheel"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Moulder, brick and tile"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Moulder, chocolate"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Moulder, cigar"
  },
  {
    "isco08": 7321,
    "isco88": 7342,
    "name": "Moulder, electrotype"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Moulder, glass"
  },
  {
    "isco08": 7549,
    "isco88": 7322,
    "name": "Moulder, glass lens"
  },
  {
    "isco08": 7211,
    "isco88": 7211,
    "name": "Moulder, metal casting"
  },
  {
    "isco08": 7549,
    "isco88": 7322,
    "name": "Moulder, optical lens"
  },
  {
    "isco08": 8143,
    "isco88": 8253,
    "name": "Moulder, papier mach�"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Moulder, plastic"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Moulder, rubber"
  },
  {
    "isco08": 7321,
    "isco88": 7342,
    "name": "Moulder, stereotype"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Mounter, jewellery"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Mounter, photo-engraving: printing plates"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Mounter, photogravure: printing"
  },
  {
    "isco08": 7321,
    "isco88": 7342,
    "name": "Mounter, plate: screen printing"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Mover, furniture"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Mower, lawn"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Muezzin"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Mufti"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Mullah"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Musician"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Musician, instrumental"
  },
  {
    "isco08": 2652,
    "isco88": 3473,
    "name": "Musician, night-club"
  },
  {
    "isco08": 2652,
    "isco88": 3473,
    "name": "Musician, street"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Musicologist"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Mycologist"
  },
  {
    "isco08": 1,
    "isco88": 3117,
    "name": "n"
  },
  {
    "isco08": 7531,
    "isco88": 7434,
    "name": "Nailer, fur"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Nanny"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Naturopath"
  },
  {
    "isco08": 3153,
    "isco88": 3143,
    "name": "Navigator, flight"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Navigator, ship"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Navvy"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Neonatologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Nephrologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Neurologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Neuropathologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Neurosurgeon"
  },
  {
    "isco08": 5221,
    "isco88": 1314,
    "name": "Newsagent"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Nightfiller"
  },
  {
    "isco08": 5414,
    "isco88": 9152,
    "name": "Nightwatchman"
  },
  {
    "isco08": 5414,
    "isco88": 9152,
    "name": "Nightwatchwoman"
  },
  {
    "isco08": 8122,
    "isco88": 8123,
    "name": "Nitrider"
  },
  {
    "isco08": 2619,
    "isco88": 2429,
    "name": "Notary"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Novelist"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Number, gun: army"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Number, missile: army"
  },
  {
    "isco08": 5161,
    "isco88": 5152,
    "name": "Numerologist"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Nun"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, anaesthetics"
  },
  {
    "isco08": 3221,
    "isco88": 3231,
    "name": "Nurse, assistant"
  },
  {
    "isco08": 3221,
    "isco88": 3231,
    "name": "Nurse, associate professional"
  },
  {
    "isco08": 3222,
    "isco88": 3232,
    "name": "Nurse, associate professional: maternity"
  },
  {
    "isco08": 3222,
    "isco88": 3232,
    "name": "Nurse, associate professional: obstetrics"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, charge"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, clinical"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, consultant: clinical"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, district"
  },
  {
    "isco08": 3221,
    "isco88": 3231,
    "name": "Nurse, enrolled"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, industrial"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, operating theatre"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, orthopaedic"
  },
  {
    "isco08": 3221,
    "isco88": 3231,
    "name": "Nurse, practical"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, professional"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, professional: obstetrics"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, professional: occupational health"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, professional: paediatric"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, professional: psychiatric"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, public health"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, registered"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Nurse, specialist"
  },
  {
    "isco08": 3240,
    "isco88": 3227,
    "name": "Nurse, veterinary"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Nursemaid"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Nurseryman"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Nurserywoman"
  },
  {
    "isco08": 2265,
    "isco88": 3223,
    "name": "Nutritionist"
  },
  {
    "isco08": 2265,
    "isco88": 3223,
    "name": "Nutritionist, public health"
  },
  {
    "isco08": 2265,
    "isco88": 3223,
    "name": "Nutritionist, sports"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Oboist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Obstetrician"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Oceanographer, geological"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Oceanographer, geophysical"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Oenologist"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, acceptance: financial institution"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Officer, activities: organising conferences or events"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Officer, agricultural extension"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Officer, air force"
  },
  {
    "isco08": 3258,
    "isco88": 5132,
    "name": "Officer, ambulance"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Officer, animal control"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Officer, army"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Officer, audit"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, bank lending"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, bank: loans or lending"
  },
  {
    "isco08": 3354,
    "isco88": 3444,
    "name": "Officer, building permit: licensing"
  },
  {
    "isco08": 3354,
    "isco88": 3444,
    "name": "Officer, business permit: licensing"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Officer, cadet: armed forces"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, catchment management"
  },
  {
    "isco08": 1342,
    "isco88": 1229,
    "name": "Officer, chief clinical"
  },
  {
    "isco08": 1213,
    "isco88": 1231,
    "name": "Officer, chief compliance"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Officer, chief executive"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Officer, chief financial"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Officer, chief information"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Officer, chief operating"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Officer, chief petty: navy"
  },
  {
    "isco08": 1342,
    "isco88": 1229,
    "name": "Officer, chief public health"
  },
  {
    "isco08": 1330,
    "isco88": 1236,
    "name": "Officer, chief technology"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Officer, civil defence"
  },
  {
    "isco08": 1342,
    "isco88": 1229,
    "name": "Officer, clinical: chief"
  },
  {
    "isco08": 2240,
    "isco88": 3221,
    "name": "Officer, clinical: paramedical"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, computer services: helpdesk"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, computer support"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Officer, computer systems: managing system"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, conservation"
  },
  {
    "isco08": 5413,
    "isco88": 5163,
    "name": "Officer, corrective services: guard"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, credit: bank, building society or credit union"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Officer, crewing"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Officer, customer service: call centre"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, customer service: computer support"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Officer, customer service: directory assistance"
  },
  {
    "isco08": 3351,
    "isco88": 3441,
    "name": "Officer, customs"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, desktop applications support"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, desktop support"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Officer, district: social welfare"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, environmental"
  },
  {
    "isco08": 2263,
    "isco88": 3222,
    "name": "Officer, environmental health"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, environmental management"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, environmental protection"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, environmental rehabilitation"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, environmental waste"
  },
  {
    "isco08": 3352,
    "isco88": 3442,
    "name": "Officer, excise"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Officer, field: interviewing"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Officer, field: market research"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, finance: approving, assessing or processing loans"
  },
  {
    "isco08": 2132,
    "isco88": 2211,
    "name": "Officer, fisheries management"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, flora and fauna management"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Officer, flying: military"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, helpdesk: IT"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, home loans"
  },
  {
    "isco08": 3351,
    "isco88": 3441,
    "name": "Officer, immigration"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Officer, immigration: chief"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Officer, industrial relations"
  },
  {
    "isco08": 2622,
    "isco88": 2432,
    "name": "Officer, information"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Officer, intelligence"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, internet: helpdesk"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, internet: support"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, IT support"
  },
  {
    "isco08": 3333,
    "isco88": 3423,
    "name": "Officer, job: placement"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Officer, legal"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, lending services: bank, building society or credit union"
  },
  {
    "isco08": 3354,
    "isco88": 3444,
    "name": "Officer, licensing"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, loans"
  },
  {
    "isco08": 4411,
    "isco88": 4141,
    "name": "Officer, loans: library"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Officer, medical: general"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Officer, medical: specialist"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Officer, mining technical"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, mortgage"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, natural resource management"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, natural resource: ecology"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Officer, naval: military"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, network support"
  },
  {
    "isco08": 1342,
    "isco88": 2230,
    "name": "Officer, nursing: principal"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Officer, occupational guidance"
  },
  {
    "isco08": 2263,
    "isco88": 3152,
    "name": "Officer, occupational health and safety"
  },
  {
    "isco08": 2263,
    "isco88": 3152,
    "name": "Officer, occupational hygiene"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Officer, parliamentary: research"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Officer, parole"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Officer, parole: associate professional"
  },
  {
    "isco08": 3351,
    "isco88": 3441,
    "name": "Officer, passport: checking"
  },
  {
    "isco08": 3354,
    "isco88": 3444,
    "name": "Officer, passport: issuing"
  },
  {
    "isco08": 3353,
    "isco88": 3443,
    "name": "Officer, pensions"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Officer, personnel"
  },
  {
    "isco08": 2263,
    "isco88": 2412,
    "name": "Officer, personnel: safety"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Officer, pest management"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Officer, petty: navy"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Officer, pilot: air force"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Officer, police"
  },
  {
    "isco08": 3355,
    "isco88": 3450,
    "name": "Officer, police: detective"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Officer, police: harbour"
  },
  {
    "isco08": 3355,
    "isco88": 3450,
    "name": "Officer, police: inspector"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Officer, police: patrol"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Officer, police: river"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Officer, police: sergeant"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Officer, police: traffic"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Officer, postal"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Officer, press liaison"
  },
  {
    "isco08": 1342,
    "isco88": 2230,
    "name": "Officer, principal nursing"
  },
  {
    "isco08": 5413,
    "isco88": 5163,
    "name": "Officer, prison: guard"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Officer, probation"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Officer, probation: associate professional"
  },
  {
    "isco08": 3323,
    "isco88": 3416,
    "name": "Officer, procurement"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Officer, protocol"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Officer, public affairs"
  },
  {
    "isco08": 2263,
    "isco88": 3222,
    "name": "Officer, public health"
  },
  {
    "isco08": 1342,
    "isco88": 1229,
    "name": "Officer, public health: chief"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Officer, public information"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Officer, public policy"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Officer, public relations"
  },
  {
    "isco08": 3323,
    "isco88": 3416,
    "name": "Officer, purchasing"
  },
  {
    "isco08": 2263,
    "isco88": 3222,
    "name": "Officer, radiation protection"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Officer, recruitment"
  },
  {
    "isco08": 3433,
    "isco88": 3439,
    "name": "Officer, reference: library"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, rehabilitation: environmental rehabilitation"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Officer, resident medical: in specialist training"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Officer, resident medical: specializing in general practice"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, revegetation"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Officer, rostering"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, securities: loans or lending"
  },
  {
    "isco08": 5414,
    "isco88": 5169,
    "name": "Officer, security: guard"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Officer, security: policy"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Officer, senior: defence forces"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Officer, settlements: loans or financial settlements"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Officer, ship: deck"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Officer, ship: navigation"
  },
  {
    "isco08": 3522,
    "isco88": 3132,
    "name": "Officer, ship: radio"
  },
  {
    "isco08": 3353,
    "isco88": 3443,
    "name": "Officer, social benefits"
  },
  {
    "isco08": 3353,
    "isco88": 3443,
    "name": "Officer, social security: claims"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, soil conservation"
  },
  {
    "isco08": 2424,
    "isco88": 2412,
    "name": "Officer, staff development"
  },
  {
    "isco08": 3323,
    "isco88": 3416,
    "name": "Officer, supply"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Officer, support: IT"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Officer, support: network administration"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Officer, systems support: systems administration"
  },
  {
    "isco08": 3352,
    "isco88": 3442,
    "name": "Officer, tax"
  },
  {
    "isco08": 3142,
    "isco88": 3213,
    "name": "Officer, technical: field crop"
  },
  {
    "isco08": 3142,
    "isco88": 3213,
    "name": "Officer, technical: horticulture"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Officer, technical: mining"
  },
  {
    "isco08": 3142,
    "isco88": 3213,
    "name": "Officer, technical: poultry"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Officer, technology: systems administration"
  },
  {
    "isco08": 4221,
    "isco88": 4221,
    "name": "Officer, tourism information"
  },
  {
    "isco08": 2424,
    "isco88": 2412,
    "name": "Officer, training"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, tree management"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, vegetation management"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Officer, warrant"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, water quality"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, waterways management"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, waterways program"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Officer, waterways: policy development"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Officer, web development"
  },
  {
    "isco08": 3333,
    "isco88": 3423,
    "name": "Officer, youth: employment"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Official, consular"
  },
  {
    "isco08": 3359,
    "isco88": 3439,
    "name": "Official, electoral"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "Official, senior: employers'' organization"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Official, senior: humanitarian organization"
  },
  {
    "isco08": 1114,
    "isco88": 1141,
    "name": "Official, senior: political party"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Official, senior: special-interest organization"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "Official, senior: trade union"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Official, sports"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Oiler and greaser"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Oiler and greaser, ship"
  },
  {
    "isco08": 6112,
    "isco88": 2213,
    "name": "Olericulturist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Oncologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Oncologist, radiation"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Onsetter, mine"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Opener, fibre: textile"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Operator, accounting machine"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Operator, adding machine"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Operator, agricultural machinery"
  },
  {
    "isco08": 3154,
    "isco88": 3144,
    "name": "Operator, air-traffic control equipment"
  },
  {
    "isco08": 4223,
    "isco88": 4223,
    "name": "Operator, answering service"
  },
  {
    "isco08": 3139,
    "isco88": 8171,
    "name": "Operator, assembly-line: automated"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, audio equipment: radio"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, audio equipment: television"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Operator, audiometric equipment"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, audiovisual"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, autoclave: chemical and related processes"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, autoclave: fruit and vegetables"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, autoclave: meat and fish"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, autoclave: oils and fats"
  },
  {
    "isco08": 3139,
    "isco88": 8171,
    "name": "Operator, automated assembly line"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Operator, baler: farm"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Operator, barge"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, barker"
  },
  {
    "isco08": 8171,
    "isco88": 8142,
    "name": "Operator, beater: paper pulp"
  },
  {
    "isco08": 5152,
    "isco88": 5121,
    "name": "Operator, bed and breakfast"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, bleacher: chemicals"
  },
  {
    "isco08": 8171,
    "isco88": 8142,
    "name": "Operator, bleacher: paper"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, blender: petroleum and natural gas refining"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, boat: derrick"
  },
  {
    "isco08": 8111,
    "isco88": 8111,
    "name": "Operator, bogger"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Operator, boiler plant: steam"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, boiler: chemical and related processes"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Operator, boiler: locomotive"
  },
  {
    "isco08": 8171,
    "isco88": 8142,
    "name": "Operator, boiler: paper pulp"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Operator, boiler: ships''"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Operator, bookkeeping machine"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Operator, boring equipment: wells"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, breaker: gyratory"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, bridge"
  },
  {
    "isco08": 3521,
    "isco88": 3132,
    "name": "Operator, broadcasting equipment"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, bulldozer"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, burner: charcoal production"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, burner: chemical and related processes"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, burner: coke production"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, cable car"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, cable railway"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, cage: mine"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, calciner: chemical and related processes"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Operator, calculating machine"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Operator, calender: pulp and paper"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, calender: rubber"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, calender: textiles"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Operator, call centre"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Operator, call centre: cold calling"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Operator, call centre: conducting surveys"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Operator, call centre: outbound calls"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, camera: motion picture"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Operator, camera: printing"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Operator, camera: still photography"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, camera: television"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, camera: video"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Operator, carbonation equipment: metal"
  },
  {
    "isco08": 8160,
    "isco88": 8276,
    "name": "Operator, carbonation equipment: sugar refining"
  },
  {
    "isco08": 3133,
    "isco88": 8152,
    "name": "Operator, cement production plant"
  },
  {
    "isco08": 8131,
    "isco88": 8153,
    "name": "Operator, centrifugal separator: chemical and related processes"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, chair-lift"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Operator, checkout"
  },
  {
    "isco08": 3133,
    "isco88": 8152,
    "name": "Operator, chemical and related processing plant"
  },
  {
    "isco08": 3133,
    "isco88": 8153,
    "name": "Operator, chemical filtering and separating equipment"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, chemical processing plant: electric cells"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, chemical processing plant: radioactive materials"
  },
  {
    "isco08": 3133,
    "isco88": 8154,
    "name": "Operator, chemical still and reactor"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, chipper: wood"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, cleaning equipment: carpets"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, cleaning equipment: cloth"
  },
  {
    "isco08": 8157,
    "isco88": 8264,
    "name": "Operator, cleaning equipment: laundry"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, cleaning equipment: metal"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, cleaning equipment: textiles"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, coke production plant"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Operator, collator"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Operator, combiner: agricultural"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Operator, combiner: paper production"
  },
  {
    "isco08": 8131,
    "isco88": 8155,
    "name": "Operator, compounder: petroleum and natural gas refining"
  },
  {
    "isco08": 3133,
    "isco88": 8163,
    "name": "Operator, compressor: air"
  },
  {
    "isco08": 3133,
    "isco88": 8163,
    "name": "Operator, compressor: gas"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Operator, comptometer"
  },
  {
    "isco08": 3511,
    "isco88": 3122,
    "name": "Operator, computer"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Operator, computer helpdesk"
  },
  {
    "isco08": 3511,
    "isco88": 3122,
    "name": "Operator, computer printer: high-speed"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, concrete-mixing plant"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, cone: mine"
  },
  {
    "isco08": 8111,
    "isco88": 8111,
    "name": "Operator, continuous miner"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, control: rolling mill"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, control-panel: blast furnace"
  },
  {
    "isco08": 3133,
    "isco88": 8159,
    "name": "Operator, control-panel: chemical plant"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, control-panel: coal gas production"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, control-panel: incinerator"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, control-panel: metal production"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, control-panel: nuclear reactor"
  },
  {
    "isco08": 3139,
    "isco88": 8143,
    "name": "Operator, control-panel: paper-making"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, control-panel: petroleum and natural gas refinery"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, control-panel: power (production)"
  },
  {
    "isco08": 3139,
    "isco88": 8142,
    "name": "Operator, control-panel: pulp production"
  },
  {
    "isco08": 3521,
    "isco88": 3132,
    "name": "Operator, control-panel: radio"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, control-panel: smelting"
  },
  {
    "isco08": 3521,
    "isco88": 3132,
    "name": "Operator, control-panel: television"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, control-panel: water treatment"
  },
  {
    "isco08": 8131,
    "isco88": 8154,
    "name": "Operator, converter: chemical processes (except petroleum and natural gas)"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, conveyer"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, cooking equipment: chemical and related processes"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, cooking equipment: malt"
  },
  {
    "isco08": 3133,
    "isco88": 8163,
    "name": "Operator, cooling plant"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, crane"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, crusher: mineral or stone processing"
  },
  {
    "isco08": 8160,
    "isco88": 8276,
    "name": "Operator, crystallising equipment: sugar refining"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, cut-off saw"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, cut-off: log"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Operator, cutter: printing"
  },
  {
    "isco08": 4132,
    "isco88": 4113,
    "name": "Operator, data entry"
  },
  {
    "isco08": 8131,
    "isco88": 8153,
    "name": "Operator, dehydrator: oilfield"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Operator, derrick"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, desilting basin"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Operator, desktop publishing"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, die-press: pottery and porcelain"
  },
  {
    "isco08": 8160,
    "isco88": 8276,
    "name": "Operator, diffuser: beet sugar"
  },
  {
    "isco08": 8171,
    "isco88": 8142,
    "name": "Operator, digester: paper pulp"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, digger: trench digging"
  },
  {
    "isco08": 4222,
    "isco88": 4222,
    "name": "Operator, directory assistance"
  },
  {
    "isco08": 8131,
    "isco88": 8154,
    "name": "Operator, distiller: batch (chemical processes except petroleum and natural gas)"
  },
  {
    "isco08": 8131,
    "isco88": 8154,
    "name": "Operator, distiller: continuous (chemical processes except petroleum and natural gas)"
  },
  {
    "isco08": 8131,
    "isco88": 8155,
    "name": "Operator, distiller: petroleum and natural gas refining"
  },
  {
    "isco08": 8131,
    "isco88": 8154,
    "name": "Operator, distiller: turpentine"
  },
  {
    "isco08": 8131,
    "isco88": 8221,
    "name": "Operator, distilling equipment: perfume"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, distribution control"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, donkey engine"
  },
  {
    "isco08": 8111,
    "isco88": 8111,
    "name": "Operator, dragline: mining"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, drawbridge"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, dredge"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, drier: chemical and related processes"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Operator, drilling equipment: wells"
  },
  {
    "isco08": 8113,
    "isco88": 8332,
    "name": "Operator, drilling plant"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Operator, drilling rig"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, dubbing equipment"
  },
  {
    "isco08": 8113,
    "isco88": 8332,
    "name": "Operator, earth-boring machinery: construction"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, earthmoving equipment"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, electric power plant"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Operator, electrocardiographic equipment"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Operator, electroencephalographic equipment"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, elevator: material-handling"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, evaporation equipment: food essences"
  },
  {
    "isco08": 8131,
    "isco88": 8154,
    "name": "Operator, evaporator: chemical processes (except petroleum and natural gas)"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, evaporator: petroleum and natural gas"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, excavator"
  },
  {
    "isco08": 8131,
    "isco88": 8153,
    "name": "Operator, expeller: chemical and related materials"
  },
  {
    "isco08": 8131,
    "isco88": 8153,
    "name": "Operator, extractor: chemical and related materials"
  },
  {
    "isco08": 8131,
    "isco88": 8154,
    "name": "Operator, extractor: wood distillation"
  },
  {
    "isco08": 8121,
    "isco88": 8124,
    "name": "Operator, extrusion press"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, feeder: printing"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, fermentation equipment: spirits"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, fertiliser plant"
  },
  {
    "isco08": 3133,
    "isco88": 8163,
    "name": "Operator, filter: chemical and related processes"
  },
  {
    "isco08": 8131,
    "isco88": 8153,
    "name": "Operator, filter: rotary drum"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, filter: water"
  },
  {
    "isco08": 8131,
    "isco88": 8153,
    "name": "Operator, filter-press: chemical and related materials"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Operator, foil stamp"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, foil-winding machine"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Operator, folder: printing"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Operator, forestry machinery"
  },
  {
    "isco08": 8344,
    "isco88": 8334,
    "name": "Operator, forklift"
  },
  {
    "isco08": 3133,
    "isco88": 8163,
    "name": "Operator, freezer"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, front-end loader"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, fulling-mill: textiles"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, funicular"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, furnace: annealing (glass)"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Operator, furnace: annealing (metal)"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, furnace: blast"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Operator, furnace: case-hardening (metal)"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, furnace: chemical and related processes"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, furnace: converting (non-ferrous metal)"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, furnace: converting (steel)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, furnace: glass production"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Operator, furnace: hardening (metal)"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Operator, furnace: heat-treating (metal)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, furnace: lehr"
  },
  {
    "isco08": 3135,
    "isco88": 8122,
    "name": "Operator, furnace: melting (metal)"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, furnace: metal smelting (blast furnace)"
  },
  {
    "isco08": 8121,
    "isco88": 8121,
    "name": "Operator, furnace: puddling"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, furnace: refining (non-ferrous metal)"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, furnace: refining (steel)"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, furnace: refuse disposal"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, furnace: reheating (metal)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, furnace: smelting (glass)"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, furnace: smelting (metal)"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, furnace: steel refining (electric-arc furnace)"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, furnace: steel refining (open-hearth furnace)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, furnace: tempering (glass)"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, gas plant"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, gas plant: electric power generation"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Operator, gatherer: printing"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, generating station"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, generator: electric power"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, geo-thermal power plant"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, germination equipment: malting (spirits)"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, grader and scraper: construction"
  },
  {
    "isco08": 8131,
    "isco88": 8221,
    "name": "Operator, granulation equipment: pharmaceutical and toiletry products"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, gravitation equipment: mine"
  },
  {
    "isco08": 8171,
    "isco88": 8142,
    "name": "Operator, grinder: pulp and paper"
  },
  {
    "isco08": 8160,
    "isco88": 8276,
    "name": "Operator, grinding equipment: sugar-cane"
  },
  {
    "isco08": 5152,
    "isco88": 5121,
    "name": "Operator, guest house"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Operator, harvester"
  },
  {
    "isco08": 3133,
    "isco88": 8152,
    "name": "Operator, heat treating plant: chemical"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Operator, heat treating: metal"
  },
  {
    "isco08": 3133,
    "isco88": 8163,
    "name": "Operator, heating plant"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Operator, helpdesk: IT"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Operator, helpdesk: software"
  },
  {
    "isco08": 3511,
    "isco88": 3122,
    "name": "Operator, high-speed printer (computer)"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, hoist"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, hydroelectric power plant"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, hydrogenation equipment: oils and fats"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, incinerator: refuse disposal"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Operator, incubator: farm"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Operator, internet helpdesk"
  },
  {
    "isco08": 4132,
    "isco88": 4114,
    "name": "Operator, invoicing machine"
  },
  {
    "isco08": 8111,
    "isco88": 8111,
    "name": "Operator, jumbo"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, kettle: chemical and related processes"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: biscuit (pottery and porcelain)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: biscuit (tile)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: brick"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, kiln: cement production"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, kiln: charcoal production"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, kiln: chemical and related processes"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, kiln: coke (retort kiln)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: dry (brick and tile)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: dry (pottery and porcelain)"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Operator, kiln: dry (wood)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: float-glass bath"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, kiln: frit"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: glost (pottery and porcelain)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: glost (tile)"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Operator, kiln: lumber"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, kiln: malting (spirits)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: oven (brick and tile)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: oven (pottery and porcelain)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: porcelain"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: pottery"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: retort (brick and tile)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, kiln: tile"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, ladle: glass"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, ladle: pouring (metal)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, lathe: capstan (metal working)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, lathe: centre (metal working)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, lathe: cutting (veneer)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, lathe: cutting (wood)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, lathe: engine (metal working)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, lathe: metalworking"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, lathe: stoneworking"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, lathe: turret (metal working)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, lathe: veneer"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, lathe: woodworking"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, letterpress: cylinder"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, letterpress: platen"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, letterpress: rotary"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, liquefaction plant: gases"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, liquid waste process"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, lock: canal or port"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Operator, logging plant"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, loom: carpet weaving"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, loom: jacquard"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, loom: lace production"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine tool"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: abrasive-coatings production"
  },
  {
    "isco08": 8131,
    "isco88": 8222,
    "name": "Operator, machine: ammunition products"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: armature production"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: artificial stone products"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: asbestos-cement products"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Operator, machine: assembly line (vehicles)"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Operator, machine: assembly-line (aircraft)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: automatic transfer (components)"
  },
  {
    "isco08": 8160,
    "isco88": 8274,
    "name": "Operator, machine: bakery products"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: bending (glass)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: bending (metal)"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: bending (wood)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: blanching (edible nuts)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: bleaching (fabric)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: bleaching (textiles)"
  },
  {
    "isco08": 8131,
    "isco88": 8151,
    "name": "Operator, machine: blending (chemical and related processes)"
  },
  {
    "isco08": 8160,
    "isco88": 8277,
    "name": "Operator, machine: blending (coffee)"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, machine: blending (spirits)"
  },
  {
    "isco08": 8160,
    "isco88": 8277,
    "name": "Operator, machine: blending (tea)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: blending (textile fibres)"
  },
  {
    "isco08": 8160,
    "isco88": 8279,
    "name": "Operator, machine: blending (tobacco)"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, machine: blending (wine)"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: blocking (hats)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: blowing (glass)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: blowing (plastic bottle)"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: bluing (metal)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: boiler production"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Operator, machine: bookbinding"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: boring (metal)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, machine: boring (wood)"
  },
  {
    "isco08": 8183,
    "isco88": 8290,
    "name": "Operator, machine: bottling"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: braid making"
  },
  {
    "isco08": 8183,
    "isco88": 8290,
    "name": "Operator, machine: branding"
  },
  {
    "isco08": 8160,
    "isco88": 8274,
    "name": "Operator, machine: bread production"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, machine: brewing (spirits)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: buffing (metal)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: buffing (plastics)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: burnishing (metal)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: cable (production)"
  },
  {
    "isco08": 8343,
    "isco88": 8290,
    "name": "Operator, machine: cable installation"
  },
  {
    "isco08": 8131,
    "isco88": 8229,
    "name": "Operator, machine: candle production"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: canning (fish)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: canning (fruit)"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: canning (meat)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: canning (vegetables)"
  },
  {
    "isco08": 8183,
    "isco88": 8290,
    "name": "Operator, machine: capping"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Operator, machine: cardboard production"
  },
  {
    "isco08": 8143,
    "isco88": 8253,
    "name": "Operator, machine: cardboard products"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: carpet production"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: carving (plastics)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: carving (stone products)"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: carving (wood)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: cast-concrete products"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, machine: casting (metal)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: casting (plastic products)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: casting (pottery and porcelain)"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, machine: casting (printing type)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: cast-stone products"
  },
  {
    "isco08": 8142,
    "isco88": 8253,
    "name": "Operator, machine: cellophane bag production"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: cement products"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, machine: centrifugal casting (cylindrical metal products)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: ceramics production"
  },
  {
    "isco08": 8160,
    "isco88": 8274,
    "name": "Operator, machine: cereal products"
  },
  {
    "isco08": 8111,
    "isco88": 8111,
    "name": "Operator, machine: channelling (mine)"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, machine: charcoal production"
  },
  {
    "isco08": 8172,
    "isco88": 8142,
    "name": "Operator, machine: chipping (wood)"
  },
  {
    "isco08": 8131,
    "isco88": 8229,
    "name": "Operator, machine: chlorine gas production"
  },
  {
    "isco08": 8160,
    "isco88": 8274,
    "name": "Operator, machine: chocolate production"
  },
  {
    "isco08": 8160,
    "isco88": 8274,
    "name": "Operator, machine: chocolate products"
  },
  {
    "isco08": 8160,
    "isco88": 8279,
    "name": "Operator, machine: cigar production"
  },
  {
    "isco08": 8160,
    "isco88": 8279,
    "name": "Operator, machine: cigarette production"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, machine: clay slips production"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: clock (production)"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: cloth production"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, machine: coal gas production"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: coating (metal)"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Operator, machine: coating (paper)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: coating (rubber)"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: coating (wire)"
  },
  {
    "isco08": 8160,
    "isco88": 8277,
    "name": "Operator, machine: cocoa-bean processing"
  },
  {
    "isco08": 8160,
    "isco88": 8277,
    "name": "Operator, machine: coffee-bean processing"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, machine: coke production"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: combing (fibres)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: commutator (production)"
  },
  {
    "isco08": 8131,
    "isco88": 8151,
    "name": "Operator, machine: compounding (chemical and related processes)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: compounding (rubber)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: compression moulding (plastics)"
  },
  {
    "isco08": 8160,
    "isco88": 8274,
    "name": "Operator, machine: conching (chocolate)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: concrete production"
  },
  {
    "isco08": 8160,
    "isco88": 8274,
    "name": "Operator, machine: confectionery production"
  },
  {
    "isco08": 8160,
    "isco88": 8276,
    "name": "Operator, machine: continuous refining (sugar)"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, machine: continuous rod casting (non-ferrous metal)"
  },
  {
    "isco08": 7211,
    "isco88": 8211,
    "name": "Operator, machine: core-blowing"
  },
  {
    "isco08": 7211,
    "isco88": 8211,
    "name": "Operator, machine: coremaking (metal)"
  },
  {
    "isco08": 7211,
    "isco88": 8211,
    "name": "Operator, machine: coremaking (tube)"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: crocheting"
  },
  {
    "isco08": 8131,
    "isco88": 8151,
    "name": "Operator, machine: crushing (chemical and related processes)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: crushing (coal)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: crushing (mineral ore)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: crushing (rock)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: crushing (stone)"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: curing (meat)"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: cutting (garments)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: cutting (glass)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: cutting (industrial diamonds)"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: cutting (leather)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: cutting (metal)"
  },
  {
    "isco08": 8111,
    "isco88": 8111,
    "name": "Operator, machine: cutting (mine)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: cutting (mosiac)"
  },
  {
    "isco08": 8143,
    "isco88": 8253,
    "name": "Operator, machine: cutting (paper-boxes)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: cutting (plastics)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: cutting (stone products)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: cutting (stone)"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: cutting (textiles)"
  },
  {
    "isco08": 8160,
    "isco88": 8279,
    "name": "Operator, machine: cutting (tobacco leaf)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, machine: cutting (veneer)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, machine: cutting (wood)"
  },
  {
    "isco08": 8160,
    "isco88": 8272,
    "name": "Operator, machine: dairy products"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: degreasing (metal)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: degumming (silk)"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: dehairing (hide)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: dehydrating (foodstuffs)"
  },
  {
    "isco08": 8131,
    "isco88": 8221,
    "name": "Operator, machine: detergent production"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: developing (motion picture film)"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: developing (photography)"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, machine: die casting (non-ferrous metal)"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: dipping (metal)"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, machine: distilling (spirits)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: doubling (thread and yarn)"
  },
  {
    "isco08": 8342,
    "isco88": 8290,
    "name": "Operator, machine: drain installation"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: drawing (glass)"
  },
  {
    "isco08": 8121,
    "isco88": 8124,
    "name": "Operator, machine: drawing (metal)"
  },
  {
    "isco08": 8121,
    "isco88": 8124,
    "name": "Operator, machine: drawing (seamless pipe)"
  },
  {
    "isco08": 8121,
    "isco88": 8124,
    "name": "Operator, machine: drawing (seamless tube)"
  },
  {
    "isco08": 8121,
    "isco88": 8124,
    "name": "Operator, machine: drawing (wire)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: drawing-frame (textile fibres)"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: drawing-in (textile weaving)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: drilling (glass)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: drilling (metal)"
  },
  {
    "isco08": 8111,
    "isco88": 8111,
    "name": "Operator, machine: drilling (mine)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: drilling (plastics)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: drilling (pottery)"
  },
  {
    "isco08": 8111,
    "isco88": 8111,
    "name": "Operator, machine: drilling (quarry)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: drilling (stone)"
  },
  {
    "isco08": 7523,
    "isco88": 8141,
    "name": "Operator, machine: drilling (wood)"
  },
  {
    "isco08": 8157,
    "isco88": 8264,
    "name": "Operator, machine: dry-cleaning"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: drying (foodstuffs)"
  },
  {
    "isco08": 8157,
    "isco88": 8264,
    "name": "Operator, machine: drying (laundry)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: drying (textiles)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: dyeing (fabric)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: dyeing (garments)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: dyeing (textile fibres)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: dyeing (textile)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: dyeing (yarn)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: edible nut processing"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: edible oil production"
  },
  {
    "isco08": 8343,
    "isco88": 8290,
    "name": "Operator, machine: electrical line installation"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: electroplating (metal)"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Operator, machine: embossing (books)"
  },
  {
    "isco08": 8143,
    "isco88": 8253,
    "name": "Operator, machine: embossing (paper)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: embossing (rubber)"
  },
  {
    "isco08": 8153,
    "isco88": 8262,
    "name": "Operator, machine: embroidery"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: engraving (glass)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: engraving (metal)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: engraving (stone)"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: engraving (wood)"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: enlarging (photography)"
  },
  {
    "isco08": 8143,
    "isco88": 8253,
    "name": "Operator, machine: envelope and paper bag production"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: etching (glass)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: etching (metal)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: etching (plastics)"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: etching (wood)"
  },
  {
    "isco08": 8131,
    "isco88": 8222,
    "name": "Operator, machine: explosive production"
  },
  {
    "isco08": 8121,
    "isco88": 8124,
    "name": "Operator, machine: extruding (metal)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: extruding (rubber)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: extrusion (plastic)"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, machine: fertiliser production"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: fibre preparing"
  },
  {
    "isco08": 8183,
    "isco88": 8290,
    "name": "Operator, machine: filling (containers)"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: film developing"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: film paper production"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: finishing (cast metal articles)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: finishing (concrete)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: finishing (glass)"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: finishing (metal)"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: finishing (pelt)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: finishing (plastics)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: finishing (stone)"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: finishing (wood)"
  },
  {
    "isco08": 8131,
    "isco88": 8222,
    "name": "Operator, machine: fireworks production"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: fish processing"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: fish products"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: flamecutting (metal)"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: fleshing (hide)"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: fleshing (pelt)"
  },
  {
    "isco08": 8143,
    "isco88": 8253,
    "name": "Operator, machine: folding (paper boxes)"
  },
  {
    "isco08": 8156,
    "isco88": 8266,
    "name": "Operator, machine: footwear production"
  },
  {
    "isco08": 8156,
    "isco88": 8266,
    "name": "Operator, machine: footwear production (orthopaedic)"
  },
  {
    "isco08": 8156,
    "isco88": 8266,
    "name": "Operator, machine: footwear production (raffia)"
  },
  {
    "isco08": 8156,
    "isco88": 8266,
    "name": "Operator, machine: footwear production (sports)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: forging (metal)"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: forming (felt hoods)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: forming (metal)"
  },
  {
    "isco08": 8160,
    "isco88": 8272,
    "name": "Operator, machine: freezing (dairy products)"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: freezing (fish)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: freezing (fruit)"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: freezing (meat)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: freezing (vegetables)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: fruit juice production"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: fruit processing"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: fur preparing"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: furniture production"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: galvanising (metal)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: glass bottle production"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: glass production"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: glass products"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: glass rod production"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: glass tube production"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, machine: glass-fibre production"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, machine: glaze production"
  },
  {
    "isco08": 8160,
    "isco88": 8273,
    "name": "Operator, machine: grain processing"
  },
  {
    "isco08": 8131,
    "isco88": 8151,
    "name": "Operator, machine: grinding (chemical and related processes)"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, machine: grinding (clay)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: grinding (glass)"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, machine: grinding (glaze)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: grinding (machine-tool)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: grinding (metal)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: grinding (plastics)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: grinding (stone)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: grinding (tool)"
  },
  {
    "isco08": 8131,
    "isco88": 8229,
    "name": "Operator, machine: halogen gas production"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: hat making"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: hide processing"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Operator, machine: high pressure cleaning"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: honing (metal)"
  },
  {
    "isco08": 8160,
    "isco88": 8273,
    "name": "Operator, machine: hulling (grain)"
  },
  {
    "isco08": 8160,
    "isco88": 8273,
    "name": "Operator, machine: husking (grain)"
  },
  {
    "isco08": 8131,
    "isco88": 8229,
    "name": "Operator, machine: hydrogen gas production"
  },
  {
    "isco08": 3133,
    "isco88": 8163,
    "name": "Operator, machine: ice production"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: industrial-diamond production"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: injection moulding (plastics)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: jewellery (production)"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: knitting"
  },
  {
    "isco08": 8183,
    "isco88": 8290,
    "name": "Operator, machine: labelling"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: lace production"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: laminating (metal)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: laminating (plastics)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: lapping (metal)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: lapping (ribbon)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: lapping (sliver)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: lapping (textile fibres)"
  },
  {
    "isco08": 8157,
    "isco88": 8264,
    "name": "Operator, machine: laundering"
  },
  {
    "isco08": 8157,
    "isco88": 8264,
    "name": "Operator, machine: laundry"
  },
  {
    "isco08": 8121,
    "isco88": 8229,
    "name": "Operator, machine: lead production"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: leather preparing"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: leather sewing"
  },
  {
    "isco08": 8143,
    "isco88": 8253,
    "name": "Operator, machine: lining (cardboard)"
  },
  {
    "isco08": 8131,
    "isco88": 8229,
    "name": "Operator, machine: linoleum production"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, machine: liqueur production"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: machine tool"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: magnetic ore processing"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, machine: malting (spirits)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: margarine processing"
  },
  {
    "isco08": 8183,
    "isco88": 8290,
    "name": "Operator, machine: marking (goods)"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: marking (wood)"
  },
  {
    "isco08": 8131,
    "isco88": 8222,
    "name": "Operator, machine: match production"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: mattress production"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: meat processing"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: meat products"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, machine: metal processing"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: metal products"
  },
  {
    "isco08": 8160,
    "isco88": 8272,
    "name": "Operator, machine: milk powder production"
  },
  {
    "isco08": 8160,
    "isco88": 8272,
    "name": "Operator, machine: milk processing"
  },
  {
    "isco08": 8131,
    "isco88": 8151,
    "name": "Operator, machine: milling (chemical and related processes)"
  },
  {
    "isco08": 8160,
    "isco88": 8273,
    "name": "Operator, machine: milling (grain)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: milling (metal)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: milling (minerals)"
  },
  {
    "isco08": 8160,
    "isco88": 8273,
    "name": "Operator, machine: milling (mustard seeds)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: milling (oil-seed)"
  },
  {
    "isco08": 8160,
    "isco88": 8273,
    "name": "Operator, machine: milling (rice)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: milling (rubber)"
  },
  {
    "isco08": 8160,
    "isco88": 8273,
    "name": "Operator, machine: milling (spices)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: milling (stone)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, machine: milling (wood)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: mineral processing"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: mineral products"
  },
  {
    "isco08": 8111,
    "isco88": 8111,
    "name": "Operator, machine: mining (continuous)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: minting (metal)"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, machine: mixing (abrasives)"
  },
  {
    "isco08": 8131,
    "isco88": 8151,
    "name": "Operator, machine: mixing (chemical and related processes)"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, machine: mixing (clay)"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: mixing (fur fibre)"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, machine: mixing (glass)"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, machine: mixing (glaze)"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Operator, machine: mixing (metal)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: moulding (glass)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: moulding (metal)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: moulding (plastics)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: moulding (rubber)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: moulding (tyres)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: needle production"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: net production"
  },
  {
    "isco08": 8160,
    "isco88": 8274,
    "name": "Operator, machine: noodle production"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: nut production (metal)"
  },
  {
    "isco08": 8183,
    "isco88": 8290,
    "name": "Operator, machine: packing"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: painting (ceramics)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: painting (glass)"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: painting (metal)"
  },
  {
    "isco08": 7521,
    "isco88": 8240,
    "name": "Operator, machine: painting (wood)"
  },
  {
    "isco08": 8143,
    "isco88": 8253,
    "name": "Operator, machine: paper box production"
  },
  {
    "isco08": 8143,
    "isco88": 8253,
    "name": "Operator, machine: paper products"
  },
  {
    "isco08": 8143,
    "isco88": 8253,
    "name": "Operator, machine: paperboard products"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Operator, machine: papermaking"
  },
  {
    "isco08": 8160,
    "isco88": 8274,
    "name": "Operator, machine: pasta production"
  },
  {
    "isco08": 8160,
    "isco88": 8272,
    "name": "Operator, machine: pasteurising (dairy products)"
  },
  {
    "isco08": 8160,
    "isco88": 8272,
    "name": "Operator, machine: pasteurising (milk)"
  },
  {
    "isco08": 8160,
    "isco88": 8274,
    "name": "Operator, machine: pastry production"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: pattern-making (fur)"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: pattern-making (leather)"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: pattern-making (textile)"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: pelt processing"
  },
  {
    "isco08": 8189,
    "isco88": 8290,
    "name": "Operator, machine: pencil production"
  },
  {
    "isco08": 8131,
    "isco88": 8221,
    "name": "Operator, machine: pharmaceutical products"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: photographic film"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: photographic film developing"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: photographic film production"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: photographic paper production"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: photographic plate production"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: photographic products"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, machine: photo-typesetting"
  },
  {
    "isco08": 8342,
    "isco88": 8290,
    "name": "Operator, machine: pipe installation"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: pipe production (metal)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: planing (metal)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: planing (stone)"
  },
  {
    "isco08": 7523,
    "isco88": 8141,
    "name": "Operator, machine: planing (wood)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: plastic cable making"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: plastic products"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: plastics production"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: plating (glass)"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: plating (metal)"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: plating (wire)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, machine: plywood core laying"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: polishing (glass lens)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: polishing (glass)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: polishing (industrial diamond)"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: polishing (metal)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: polishing (plate-glass)"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: polishing (stone)"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: polishing (wood)"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, machine: polythene bag production"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: pottery and porcelain production"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, machine: pouring (metal)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: precision grinding (metal)"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: preserving (fish)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: preserving (fruit)"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: preserving (meat)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: preserving (vegetables)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: pressing (glass)"
  },
  {
    "isco08": 8157,
    "isco88": 8264,
    "name": "Operator, machine: pressing (laundry)"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, machine: printing"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: printing (black and white photography)"
  },
  {
    "isco08": 8132,
    "isco88": 8224,
    "name": "Operator, machine: printing (colour photography)"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, machine: printing (textiles)"
  },
  {
    "isco08": 8171,
    "isco88": 8142,
    "name": "Operator, machine: pulping (wood)"
  },
  {
    "isco08": 8131,
    "isco88": 8151,
    "name": "Operator, machine: pulverising (chemical and related processes)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: pulverising (minerals)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: reaming (metal)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: rebuilding (tyres)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: reeling (thread and yarn)"
  },
  {
    "isco08": 8121,
    "isco88": 8223,
    "name": "Operator, machine: refining (metal)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: refining (oils and fats)"
  },
  {
    "isco08": 8160,
    "isco88": 8276,
    "name": "Operator, machine: refining (sugar)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: rivet production"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: riveting"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: rolling (plate-glass)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: roving-frame (textile fibres)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: rubber processing"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: rubber products"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: rubber stamp production"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: sawing (metal)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: sawing (stone)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, machine: sawing (wood)"
  },
  {
    "isco08": 8183,
    "isco88": 8290,
    "name": "Operator, machine: sealing"
  },
  {
    "isco08": 7521,
    "isco88": 8141,
    "name": "Operator, machine: seasoning (wood)"
  },
  {
    "isco08": 8153,
    "isco88": 8263,
    "name": "Operator, machine: sewing"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: shaping (metal)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, machine: shaping (wood)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: sharpening (metal)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, machine: shaving (wood)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: shearing (metal)"
  },
  {
    "isco08": 8156,
    "isco88": 8266,
    "name": "Operator, machine: shoe production"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: shotblasting (metal)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: shrinking (textiles)"
  },
  {
    "isco08": 8189,
    "isco88": 8290,
    "name": "Operator, machine: silicon chip production"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: silk weighting"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: skeining (thread and yarn)"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, machine: soft-drinks production"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: spinning (metal)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: spinning (synthetic fibre)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: spinning (thread and yarn)"
  },
  {
    "isco08": 8189,
    "isco88": 8290,
    "name": "Operator, machine: splicing (cable and rope)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: splitting (stone)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: spooling (thread and yarn)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: sports equipment (metal)"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: sports equipment (wood)"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, machine: spraying (metal)"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: staining (leather)"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: sterilising (fish)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: sterilising (fruit)"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: sterilising (meat)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: sterilising (vegetables)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: stone cutting or processing"
  },
  {
    "isco08": 8114,
    "isco88": 8212,
    "name": "Operator, machine: stone products"
  },
  {
    "isco08": 8160,
    "isco88": 8279,
    "name": "Operator, machine: stripping (tobacco-leaf)"
  },
  {
    "isco08": 8160,
    "isco88": 8276,
    "name": "Operator, machine: sugar production"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, machine: synthetic-fibre production"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: tanning"
  },
  {
    "isco08": 8160,
    "isco88": 8277,
    "name": "Operator, machine: tea-leaf processing"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, machine: tempering (glass)"
  },
  {
    "isco08": 8121,
    "isco88": 8123,
    "name": "Operator, machine: tempering (metal)"
  },
  {
    "isco08": 7521,
    "isco88": 8141,
    "name": "Operator, machine: tempering (wood)"
  },
  {
    "isco08": 8159,
    "isco88": 8269,
    "name": "Operator, machine: tent making"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: textile fibre preparing"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: threading (loom)"
  },
  {
    "isco08": 8160,
    "isco88": 8279,
    "name": "Operator, machine: tobacco processing"
  },
  {
    "isco08": 8160,
    "isco88": 8279,
    "name": "Operator, machine: tobacco products"
  },
  {
    "isco08": 8131,
    "isco88": 8221,
    "name": "Operator, machine: toiletry products"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: tool production"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: toy production (metal)"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: toy production (wood)"
  },
  {
    "isco08": 7521,
    "isco88": 8141,
    "name": "Operator, machine: treating (wood)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: twining (thread and yarn)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: twisting (thread and yarn)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: tyre production"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: vegetable juice production"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: vegetable processing"
  },
  {
    "isco08": 8211,
    "isco88": 8281,
    "name": "Operator, machine: vehicle assembly"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, machine: vinegar making"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: vulcanising (rubber goods)"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Operator, machine: vulcanising (tyres)"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: warping beam (textile weaving)"
  },
  {
    "isco08": 8183,
    "isco88": 8278,
    "name": "Operator, machine: washing (bottles)"
  },
  {
    "isco08": 8160,
    "isco88": 8271,
    "name": "Operator, machine: washing (carcasses)"
  },
  {
    "isco08": 8131,
    "isco88": 8229,
    "name": "Operator, machine: washing (chemical and related materials)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: washing (cloth)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: washing (fruit)"
  },
  {
    "isco08": 8155,
    "isco88": 8265,
    "name": "Operator, machine: washing (hide)"
  },
  {
    "isco08": 8157,
    "isco88": 8264,
    "name": "Operator, machine: washing (laundry)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, machine: washing (minerals)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: washing (textile fibres)"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, machine: washing (vegetables)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: washing (yarn)"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: watch production"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Operator, machine: water blasting"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: waterproofing (cloth)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: waterproofing (fabric)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, machine: waterproofing (textiles)"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: weaving"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: weaving (carpets)"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: weaving (fabrics)"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: weaving (jacquard)"
  },
  {
    "isco08": 8152,
    "isco88": 8262,
    "name": "Operator, machine: weaving (laces)"
  },
  {
    "isco08": 7212,
    "isco88": 8211,
    "name": "Operator, machine: welding (metal)"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Operator, machine: winding (armature)"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Operator, machine: winding (coil)"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Operator, machine: winding (filament)"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Operator, machine: winding (rotor coil)"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Operator, machine: winding (stator coil)"
  },
  {
    "isco08": 8151,
    "isco88": 8261,
    "name": "Operator, machine: winding (thread and yarn)"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Operator, machine: winding (transformer coil)"
  },
  {
    "isco08": 7212,
    "isco88": 8211,
    "name": "Operator, machine: wire goods production"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, machine: wiring (electric)"
  },
  {
    "isco08": 8171,
    "isco88": 8142,
    "name": "Operator, machine: wood grinding (pulpmaking)"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, machine: wood processing"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: wood products"
  },
  {
    "isco08": 7523,
    "isco88": 8240,
    "name": "Operator, machine: woodworking"
  },
  {
    "isco08": 8183,
    "isco88": 8290,
    "name": "Operator, machine: wrapping"
  },
  {
    "isco08": 8342,
    "isco88": 8290,
    "name": "Operator, marking equipment: roads"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Operator, medical radiography equipment"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Operator, medical ultrasound"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Operator, medical x-ray equipment"
  },
  {
    "isco08": 8343,
    "isco88": 8290,
    "name": "Operator, merry-go-round"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, microphone"
  },
  {
    "isco08": 8131,
    "isco88": 8151,
    "name": "Operator, mill: chemical and related processes"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, mineral-processing plant"
  },
  {
    "isco08": 8111,
    "isco88": 8111,
    "name": "Operator, mining plant"
  },
  {
    "isco08": 3522,
    "isco88": 3132,
    "name": "Operator, morse code"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Operator, motorised farm equipment"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Operator, motorised forestry equipment"
  },
  {
    "isco08": 8131,
    "isco88": 8221,
    "name": "Operator, moulding equipment: toiletries"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Operator, multibinder"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, natural gas plant: electric power generating"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, nuclear power plant"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, oven: chemical and related processes"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, oven: coke production"
  },
  {
    "isco08": 3139,
    "isco88": 8142,
    "name": "Operator, panel board: pulp and paper"
  },
  {
    "isco08": 3139,
    "isco88": 8143,
    "name": "Operator, panelboard: paper-making"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Operator, papermaking plant"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, paraffin plant"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, paving machinery: bituminous"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, paving machinery: concrete"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Operator, perfect binder"
  },
  {
    "isco08": 3511,
    "isco88": 3122,
    "name": "Operator, peripheral equipment: computer"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, petroleum process"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, pile-driver"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, planer: sawmill"
  },
  {
    "isco08": 8121,
    "isco88": 8124,
    "name": "Operator, plant: metal extrusion"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, pot room: aluminium"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, pot: aluminium"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, potline: aluminium"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, power system"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, power-shear"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Operator, power-tong"
  },
  {
    "isco08": 8189,
    "isco88": 8290,
    "name": "Operator, press: baling"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: digital"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, press: edible oils"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, press: extruding (clay)"
  },
  {
    "isco08": 8121,
    "isco88": 8124,
    "name": "Operator, press: extruding (metal)"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, press: filtering (clay)"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: flexographic"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Operator, press: forging"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, press: fruit"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: gravure"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Operator, press: hardboard"
  },
  {
    "isco08": 8142,
    "isco88": 8232,
    "name": "Operator, press: laminated (plastics)"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: large sheet-fed"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: lithographic"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, press: metal (except forging)"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Operator, press: metal (forging)"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: offset"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: photogravure"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: platen"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, press: plywood"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: printing"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, press: punching (metal)"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: rotary"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: rotogravure"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: screen printing"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: small"
  },
  {
    "isco08": 7223,
    "isco88": 8211,
    "name": "Operator, press: stamping (metal)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, press: steam (textiles)"
  },
  {
    "isco08": 8154,
    "isco88": 8264,
    "name": "Operator, press: textile"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, press: veneer"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, press: waferboard"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: wallpaper"
  },
  {
    "isco08": 7322,
    "isco88": 8251,
    "name": "Operator, press: web"
  },
  {
    "isco08": 3521,
    "isco88": 3132,
    "name": "Operator, public address equipment"
  },
  {
    "isco08": 8181,
    "isco88": 8139,
    "name": "Operator, pug-mill: clay"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Operator, pulling equipment: oil and gas wells"
  },
  {
    "isco08": 3139,
    "isco88": 8142,
    "name": "Operator, pulping control"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, pumping-station"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, pumping-station: petroleum and natural gas"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, pumping-station: water and sewerage"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, purification plant: water"
  },
  {
    "isco08": 3522,
    "isco88": 3132,
    "name": "Operator, radio equipment: flight"
  },
  {
    "isco08": 3522,
    "isco88": 3132,
    "name": "Operator, radio equipment: land-based"
  },
  {
    "isco08": 3522,
    "isco88": 3132,
    "name": "Operator, radio equipment: sea-based"
  },
  {
    "isco08": 3133,
    "isco88": 8154,
    "name": "Operator, reactor: chemical"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, reactor: nuclear-power"
  },
  {
    "isco08": 8131,
    "isco88": 8154,
    "name": "Operator, reactor-converter: chemical processes (except petroleum and natural gas)"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, recording equipment"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, rectifier: electric current"
  },
  {
    "isco08": 3139,
    "isco88": 8142,
    "name": "Operator, refinery: paper pulp"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, refinery: petroleum and natural gas"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, refrigeration system"
  },
  {
    "isco08": 8171,
    "isco88": 8142,
    "name": "Operator, repulper"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, reservoir: water"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, retort: chemical and related processes"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Operator, retort: coal gas"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, road surface laying machine"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, road-roller"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, roasting equipment: chemical and related processes"
  },
  {
    "isco08": 8160,
    "isco88": 8277,
    "name": "Operator, roasting equipment: cocoa-bean"
  },
  {
    "isco08": 8160,
    "isco88": 8277,
    "name": "Operator, roasting equipment: coffee"
  },
  {
    "isco08": 3139,
    "isco88": 8172,
    "name": "Operator, robot: industrial"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, roller coaster"
  },
  {
    "isco08": 8160,
    "isco88": 8273,
    "name": "Operator, rolling-mill: grain"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, rolling-mill: non-ferrous metal"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, rolling-mill: seamless pipe and tube"
  },
  {
    "isco08": 8160,
    "isco88": 8273,
    "name": "Operator, rolling-mill: spices"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, rolling-mill: steel (cold-rolling)"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, rolling-mill: steel (continuous)"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Operator, rolling-mill: steel (hot-rolling)"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, ropeway: aerial"
  },
  {
    "isco08": 8141,
    "isco88": 8159,
    "name": "Operator, rubber processing plant"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Operator, saddle stitch: bookbinding"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Operator, sandblasting equipment (metal)"
  },
  {
    "isco08": 8181,
    "isco88": 8131,
    "name": "Operator, sandblasting equipment: glass"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, saw: circular"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, sawmill"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Operator, scanning equipment: medical"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Operator, scanning equipment: optical"
  },
  {
    "isco08": 8131,
    "isco88": 8153,
    "name": "Operator, screener: chemical and related materials"
  },
  {
    "isco08": 8171,
    "isco88": 8142,
    "name": "Operator, screener: paper pulp"
  },
  {
    "isco08": 3133,
    "isco88": 8153,
    "name": "Operator, separator: chemical"
  },
  {
    "isco08": 5230,
    "isco88": 4211,
    "name": "Operator, service station console"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Operator, set-up: woodworking machine"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, sewage plant"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Operator, sheeter: pulp and paper"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, shovel: mechanical"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Operator, shuttle car: mine"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Operator, shuttle car: quarry"
  },
  {
    "isco08": 8131,
    "isco88": 8153,
    "name": "Operator, sifting equipment: chemical and related materials"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, ski-lift"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, sluice: dock"
  },
  {
    "isco08": 8121,
    "isco88": 8121,
    "name": "Operator, slurry equipment: metal"
  },
  {
    "isco08": 3135,
    "isco88": 8121,
    "name": "Operator, smelter"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, snow groomer"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, solar power plant"
  },
  {
    "isco08": 8131,
    "isco88": 8152,
    "name": "Operator, spray-drier: chemical and related processes"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, spreader: asphalt"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, spreader: concrete paving (construction)"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, spreader: stone (construction)"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, spreader: tar"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Operator, steam engine"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, steam power plant"
  },
  {
    "isco08": 3133,
    "isco88": 8154,
    "name": "Operator, still: batch (chemical processes except petroleum and natural gas)"
  },
  {
    "isco08": 3133,
    "isco88": 8154,
    "name": "Operator, still: chemical"
  },
  {
    "isco08": 3133,
    "isco88": 8154,
    "name": "Operator, still: continuous (chemical processes except petroleum and natural gas)"
  },
  {
    "isco08": 8131,
    "isco88": 8221,
    "name": "Operator, still: perfume"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, still: petroleum and natural gas refining"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, still: spirits"
  },
  {
    "isco08": 8131,
    "isco88": 8154,
    "name": "Operator, still: turpentine"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, still-pump: petroleum and natural gas refining"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Operator, stone-processing plant"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, streetsweeper"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, studio equipment: radio"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Operator, studio equipment: television"
  },
  {
    "isco08": 8171,
    "isco88": 8143,
    "name": "Operator, supercalender"
  },
  {
    "isco08": 8312,
    "isco88": 8312,
    "name": "Operator, switch: railway"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, switchboard: electrical power station"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, switchboard: power station generator"
  },
  {
    "isco08": 4223,
    "isco88": 4223,
    "name": "Operator, switchboard: telephone"
  },
  {
    "isco08": 3133,
    "isco88": 8159,
    "name": "Operator, synthetic-fibre production plant"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, tamping machinery: construction"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Operator, tank: timber treating"
  },
  {
    "isco08": 3522,
    "isco88": 3132,
    "name": "Operator, telecommunications: equipment"
  },
  {
    "isco08": 3522,
    "isco88": 3132,
    "name": "Operator, telegraphic equipment"
  },
  {
    "isco08": 4223,
    "isco88": 4223,
    "name": "Operator, telephone"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Operator, telephone: canvassing"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Operator, telephone: market research"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Operator, telephone: surveying"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Operator, telephone: telemarketing"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Operator, thresher"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, tidal power plant"
  },
  {
    "isco08": 3339,
    "isco88": 3414,
    "name": "Operator, tour"
  },
  {
    "isco08": 3521,
    "isco88": 3132,
    "name": "Operator, transmitting equipment: radio"
  },
  {
    "isco08": 3521,
    "isco88": 3132,
    "name": "Operator, transmitting equipment: television"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, treater: desulphurisation (petroleum and natural gas refining)"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, treater: petroleum and natural gas refining"
  },
  {
    "isco08": 3139,
    "isco88": 8159,
    "name": "Operator, treater: radioactive waste"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, treater: water"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Operator, treating equipment: crude oil"
  },
  {
    "isco08": 8341,
    "isco88": 8331,
    "name": "Operator, tree faller"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, trimmer: sawmill"
  },
  {
    "isco08": 8344,
    "isco88": 8334,
    "name": "Operator, truck: forklift"
  },
  {
    "isco08": 8344,
    "isco88": 8334,
    "name": "Operator, truck: lifting"
  },
  {
    "isco08": 8342,
    "isco88": 8332,
    "name": "Operator, tunnelling machinery: construction"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, turbine: electricity generation"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, turbine: power station"
  },
  {
    "isco08": 8121,
    "isco88": 8121,
    "name": "Operator, uranium classifier"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, vacuum oven: foodstuffs"
  },
  {
    "isco08": 8131,
    "isco88": 8154,
    "name": "Operator, vacuum pan: chemical and related processes (except petroleum and natural gas)"
  },
  {
    "isco08": 8160,
    "isco88": 8272,
    "name": "Operator, vacuum pan: condensed milk"
  },
  {
    "isco08": 8160,
    "isco88": 8275,
    "name": "Operator, vacuum pan: food essences"
  },
  {
    "isco08": 8160,
    "isco88": 8279,
    "name": "Operator, vacuum-conditioner: tobacco processing"
  },
  {
    "isco08": 3133,
    "isco88": 8163,
    "name": "Operator, ventilation equipment"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, wastewater"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, water purification plant"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Operator, water treatment plant"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Operator, weighbridge"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Operator, winch"
  },
  {
    "isco08": 3131,
    "isco88": 8161,
    "name": "Operator, wind-energy plant: electric power generation"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Operator, winemaking plant"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Operator, wood-processing plant"
  },
  {
    "isco08": 4131,
    "isco88": 4112,
    "name": "Operator, word processing"
  },
  {
    "isco08": 8121,
    "isco88": 8124,
    "name": "Operator, zinc cell"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Ophthalmologist"
  },
  {
    "isco08": 3254,
    "isco88": 3224,
    "name": "Optician, contact lens"
  },
  {
    "isco08": 3254,
    "isco88": 3224,
    "name": "Optician, dispensing"
  },
  {
    "isco08": 2267,
    "isco88": 3224,
    "name": "Optician, ophthalmic"
  },
  {
    "isco08": 2267,
    "isco88": 3224,
    "name": "Optometrist"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Orchardist"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Orchestrator"
  },
  {
    "isco08": 5329,
    "isco88": 5132,
    "name": "Orderly, hospital"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Organist"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Organizer, conference and event"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Organizer, exhibition"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Organizer, function"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Organizer, women''s welfare"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Ornithologist"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Orthodontist"
  },
  {
    "isco08": 2266,
    "isco88": 3229,
    "name": "Orthoepist"
  },
  {
    "isco08": 2266,
    "isco88": 3229,
    "name": "Orthophonist"
  },
  {
    "isco08": 2267,
    "isco88": 3224,
    "name": "Orthoptist"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Orthotist"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Osteopath"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Otolaryngologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Otologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Otorhinolaryngologist"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Overman, mine"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Overseer, mine"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Overwoman, mine"
  },
  {
    "isco08": 9321,
    "isco88": 9322,
    "name": "Packer, hand"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Packer, nightfill"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Packer, shelf"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Paediatrician"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Paedodontist"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Painter, artistic"
  },
  {
    "isco08": 7132,
    "isco88": 7142,
    "name": "Painter, automobile"
  },
  {
    "isco08": 3435,
    "isco88": 3471,
    "name": "Painter, body"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter, brush: construction"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Painter, brush: except construction"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter, building"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter, construction"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Painter, decorative"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Painter, decorative: ceramics"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Painter, decorative: glass"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Painter, decorative: sign"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter, house"
  },
  {
    "isco08": 7132,
    "isco88": 7142,
    "name": "Painter, manufactured articles"
  },
  {
    "isco08": 7132,
    "isco88": 7142,
    "name": "Painter, metal"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Painter, miniatures"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter, motion picture set"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter, outside: construction"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Painter, portrait"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter, ship''s hull"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter, stage scenery"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter, structural steel"
  },
  {
    "isco08": 7132,
    "isco88": 7142,
    "name": "Painter, vehicle"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter-decorator, buildings"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter-decorator, wallcarpeting"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter-decorator, wallcovering"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Painter-decorator, wallpapering"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Palaeontologist"
  },
  {
    "isco08": 5161,
    "isco88": 5152,
    "name": "Palmist"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Panelbeater"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Paperhanger"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Paralegal"
  },
  {
    "isco08": 3342,
    "isco88": 3431,
    "name": "Paralegal, secretarial tasks"
  },
  {
    "isco08": 2240,
    "isco88": 3221,
    "name": "Paramedic, advanced care"
  },
  {
    "isco08": 3258,
    "isco88": 5132,
    "name": "Paramedic, ambulance"
  },
  {
    "isco08": 3258,
    "isco88": 5132,
    "name": "Paramedic, emergency"
  },
  {
    "isco08": 2240,
    "isco88": 3221,
    "name": "Paramedic, primary care"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Paraplanner, financial"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Parasitologist"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Paratrooper"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Parliamentarian"
  },
  {
    "isco08": 5169,
    "isco88": 5149,
    "name": "Partner, dancing"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Partner, law"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Pastor"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Pastoralist"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Pastry-cook"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Pathologist"
  },
  {
    "isco08": 2250,
    "isco88": 2212,
    "name": "Pathologist, animal"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Pathologist, clinical"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Pathologist, forensic"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Pathologist, histopathology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Pathologist, medical"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Pathologist, neuropathology"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Pathologist, oral"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Pathologist, plant"
  },
  {
    "isco08": 2632,
    "isco88": 2442,
    "name": "Pathologist, social"
  },
  {
    "isco08": 2266,
    "isco88": 3229,
    "name": "Pathologist, speech"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Pathologist, surgical"
  },
  {
    "isco08": 2250,
    "isco88": 2212,
    "name": "Pathologist, veterinary"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Patrolman, beach"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Patrolman, forest: fire"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Patrolman, police"
  },
  {
    "isco08": 5414,
    "isco88": 5169,
    "name": "Patrolman, security"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Patrolwoman, beach"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Patrolwoman, forest: fire"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Patrolwoman, police"
  },
  {
    "isco08": 5414,
    "isco88": 5169,
    "name": "Patrolwoman, security"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Patternmaker, caps"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Patternmaker, footwear"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Patternmaker, fur"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Patternmaker, garment"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Patternmaker, gloves"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Patternmaker, hats"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Patternmaker, mattresses"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Patternmaker, metal"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Patternmaker, sails"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Patternmaker, tents"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Patternmaker, umbrellas"
  },
  {
    "isco08": 7532,
    "isco88": 7435,
    "name": "Patternmaker, upholstery"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Patternmaker, wood"
  },
  {
    "isco08": 7112,
    "isco88": 7122,
    "name": "Paviour"
  },
  {
    "isco08": 4213,
    "isco88": 4214,
    "name": "Pawnbroker"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Paymaster-general, government"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Pediatrician"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Pedicurist"
  },
  {
    "isco08": 9520,
    "isco88": 9112,
    "name": "Pedlar"
  },
  {
    "isco08": 5212,
    "isco88": 9111,
    "name": "Pedlar, food"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Pedodontist"
  },
  {
    "isco08": 2632,
    "isco88": 2442,
    "name": "Penologist"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Percussionist"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Periodontist"
  },
  {
    "isco08": 9622,
    "isco88": 9162,
    "name": "Person, odd-job"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Petrologist"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Pewtersmith"
  },
  {
    "isco08": 2262,
    "isco88": 2224,
    "name": "Pharmacist"
  },
  {
    "isco08": 2262,
    "isco88": 2224,
    "name": "Pharmacist, hospital"
  },
  {
    "isco08": 2262,
    "isco88": 2113,
    "name": "Pharmacist, industrial"
  },
  {
    "isco08": 2262,
    "isco88": 2224,
    "name": "Pharmacist, retail"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Pharmacologist"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Philologist"
  },
  {
    "isco08": 2633,
    "isco88": 2443,
    "name": "Philosopher"
  },
  {
    "isco08": 5329,
    "isco88": 5132,
    "name": "Phlebotomist"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Phonologist"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Photo-composer, printing"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Photo-engraver"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Photogrammetrist"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, advertising"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, aerial"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, architecture"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, commercial"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, fashion"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, industrial"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, medical"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, microphotography"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, news"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Photographer, photogravure"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, police"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, portrait"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, press"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photographer, scientific"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Photogravurist"
  },
  {
    "isco08": 3431,
    "isco88": 3131,
    "name": "Photojournalist"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Photolithographer"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Phototypesetter, printing"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Physician, general medicine"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Physician, primary health care"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Physician, specialist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Physician, specialist: internal medicine"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Physician, specialist: nuclear medicine"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Physician, sports"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Physicist"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Physicist, clinical"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Physicist, medical"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Physicist, nuclear"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Physiologist"
  },
  {
    "isco08": 2264,
    "isco88": 3226,
    "name": "Physiotherapist"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Pianist"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Picker, cotton"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Picker, fibre: textile"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Picker, fruit"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Picker, recycling"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Picker, vegetable"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Picker, waste"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Pickler, fish"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Pickler, fruit"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Pickler, meat"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Pickler, pelt"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Pickler, vegetables"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Piler, mine"
  },
  {
    "isco08": 3153,
    "isco88": 3143,
    "name": "Pilot, aircraft"
  },
  {
    "isco08": 3153,
    "isco88": 3340,
    "name": "Pilot, check"
  },
  {
    "isco08": 3153,
    "isco88": 3143,
    "name": "Pilot, helicopter"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Pilot, hovercraft"
  },
  {
    "isco08": 3153,
    "isco88": 3143,
    "name": "Pilot, seaplane"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Pilot, ship"
  },
  {
    "isco08": 3153,
    "isco88": 3143,
    "name": "Pilot, test"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Pipefitter"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Pisciculturist"
  },
  {
    "isco08": 7114,
    "isco88": 7123,
    "name": "Placer, concrete"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Planer, stone"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Planner, call centre workforce"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Planner, conference"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Planner, contact centre workforce"
  },
  {
    "isco08": 2412,
    "isco88": 2419,
    "name": "Planner, estate"
  },
  {
    "isco08": 2412,
    "isco88": 2411,
    "name": "Planner, financial"
  },
  {
    "isco08": 2164,
    "isco88": 2141,
    "name": "Planner, land"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Planner, social"
  },
  {
    "isco08": 2164,
    "isco88": 2141,
    "name": "Planner, town"
  },
  {
    "isco08": 2164,
    "isco88": 2141,
    "name": "Planner, traffic"
  },
  {
    "isco08": 2164,
    "isco88": 2141,
    "name": "Planner, urban"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Planner, wedding"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Planner, workforce: contact centre"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Planter, cane"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Planter, copra"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Planter, cotton"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Planter, forestry"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Planter, sugar-cane"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Planter, tea"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Planter, tobacco"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Planter, tree"
  },
  {
    "isco08": 7123,
    "isco88": 7133,
    "name": "Plasterer"
  },
  {
    "isco08": 7123,
    "isco88": 7133,
    "name": "Plasterer, dry wall"
  },
  {
    "isco08": 7123,
    "isco88": 7133,
    "name": "Plasterer, fibrous"
  },
  {
    "isco08": 7123,
    "isco88": 7133,
    "name": "Plasterer, ornamental"
  },
  {
    "isco08": 7123,
    "isco88": 7133,
    "name": "Plasterer, plasterboard"
  },
  {
    "isco08": 7123,
    "isco88": 7133,
    "name": "Plasterer, solid"
  },
  {
    "isco08": 7123,
    "isco88": 7133,
    "name": "Plasterer, stucco"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Plater, ship"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Player, cards"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Player, chess"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Player, hockey"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Player, musical instrument"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Player, poker"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Player, sports"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Player, tennis"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Playwright"
  },
  {
    "isco08": 9211,
    "isco88": 9211,
    "name": "Plucker, tea"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Plucker-trimmer, pelt"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Plumber"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Plumber-jointer, electric cable"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Pneumologist"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Podiatrist"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Poet"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Policeman"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Policewoman"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Polisher, footwear"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Polisher, gem"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Polisher, glass"
  },
  {
    "isco08": 7549,
    "isco88": 7322,
    "name": "Polisher, glass: lenses"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Polisher, granite"
  },
  {
    "isco08": 8114,
    "isco88": 7313,
    "name": "Polisher, industrial diamonds"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Polisher, jewellery"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Polisher, jewels"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Polisher, leather"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Polisher, marble"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Polisher, metal"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Polisher, shoes"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Polisher, slate"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Polisher, stone: hand or hand-powered tools"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Politician"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Pomologist"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Poojari"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Porter, cold-storage"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Porter, fish"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Porter, food market"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Porter, fruit"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Porter, goods-loading"
  },
  {
    "isco08": 9621,
    "isco88": 9152,
    "name": "Porter, hotel"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Porter, kitchen"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Porter, luggage"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Porter, meat"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Porter, shop"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Porter, warehouse"
  },
  {
    "isco08": 9629,
    "isco88": 9120,
    "name": "Poster, bill"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Postie"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Postman"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Postmaster"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Postmaster-general, government"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Post-runner"
  },
  {
    "isco08": 4412,
    "isco88": 4142,
    "name": "Postwoman"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Potter"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Potter, nursery"
  },
  {
    "isco08": 8121,
    "isco88": 8121,
    "name": "Pourer, ladle"
  },
  {
    "isco08": 7542,
    "isco88": 7112,
    "name": "Powderman"
  },
  {
    "isco08": 7542,
    "isco88": 7112,
    "name": "Powderwoman"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Practitioner, acupuncture"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Practitioner, ayuverdic"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Practitioner, chinese medicine"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Practitioner, clinical nurse"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Practitioner, dental"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Practitioner, general"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Practitioner, herbal medicine: chinese"
  },
  {
    "isco08": 2230,
    "isco88": 3229,
    "name": "Practitioner, homeopathic"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Practitioner, insolvency"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Practitioner, medical"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Practitioner, medical: family"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Practitioner, medical: specialist (public health)"
  },
  {
    "isco08": 2222,
    "isco88": 2230,
    "name": "Practitioner, midwife"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Practitioner, nurse"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Practitioner, tcm"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Practitioner, unani"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Preacher, lay"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Precipitator, gold"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Precipitator, silver"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Premier"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Preparer, fibre: textile"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Preparer, footwear"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Preparer, structural: metal"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Preserver, fruit"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Preserver, fruit juice"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Preserver, sauces and condiments"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Preserver, vegetable"
  },
  {
    "isco08": 7514,
    "isco88": 7414,
    "name": "Preserver, vegetable juice"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "President, company"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "President, employers'' organization"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "President, enterprise"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "President, government"
  },
  {
    "isco08": 1114,
    "isco88": 1141,
    "name": "President, political party"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "President, trade union"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Presser, chocolate production"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Presser, cigar"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Presser, clay extruding"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Presser, footwear: soles"
  },
  {
    "isco08": 9121,
    "isco88": 9133,
    "name": "Presser, hand"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Presser, noodle extruding"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Presser, pottery and porcelain"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Press-operator, plywood"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Prestidigitator"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Priest"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Prime minister"
  },
  {
    "isco08": 1345,
    "isco88": 1210,
    "name": "Principal, college"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Principal, school"
  },
  {
    "isco08": 7322,
    "isco88": 7341,
    "name": "Printer"
  },
  {
    "isco08": 7322,
    "isco88": 7346,
    "name": "Printer, block"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Printer, film: photographic"
  },
  {
    "isco08": 7322,
    "isco88": 7341,
    "name": "Printer, job"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Printer, pantograph"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Printer, photograph"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Printer, projection"
  },
  {
    "isco08": 7322,
    "isco88": 7346,
    "name": "Printer, screen"
  },
  {
    "isco08": 7322,
    "isco88": 7346,
    "name": "Printer, silk-screen"
  },
  {
    "isco08": 7322,
    "isco88": 7346,
    "name": "Printer, textile"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Prior"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Processor, loans"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Processor, photographic"
  },
  {
    "isco08": 4131,
    "isco88": 4112,
    "name": "Processor, word"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Producer, animals"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Producer, conference"
  },
  {
    "isco08": 3332,
    "isco88": 3439,
    "name": "Producer, events"
  },
  {
    "isco08": 2654,
    "isco88": 1229,
    "name": "Producer, motion: picture"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Producer, news: TV/radio"
  },
  {
    "isco08": 2654,
    "isco88": 1229,
    "name": "Producer, radio"
  },
  {
    "isco08": 2654,
    "isco88": 1229,
    "name": "Producer, record"
  },
  {
    "isco08": 2654,
    "isco88": 1229,
    "name": "Producer, stage"
  },
  {
    "isco08": 2654,
    "isco88": 1229,
    "name": "Producer, television"
  },
  {
    "isco08": 2654,
    "isco88": 1229,
    "name": "Producer, theatre"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Professional, counselling"
  },
  {
    "isco08": 2310,
    "isco88": 2310,
    "name": "Professor, college"
  },
  {
    "isco08": 2310,
    "isco88": 2310,
    "name": "Professor, university"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, animation"
  },
  {
    "isco08": 2514,
    "isco88": 2132,
    "name": "Programmer, applications"
  },
  {
    "isco08": 2523,
    "isco88": 2132,
    "name": "Programmer, communications"
  },
  {
    "isco08": 2514,
    "isco88": 2132,
    "name": "Programmer, computer"
  },
  {
    "isco08": 2519,
    "isco88": 2132,
    "name": "Programmer, computer: applications testing"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, computer: games"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, computer: internet"
  },
  {
    "isco08": 2519,
    "isco88": 2132,
    "name": "Programmer, computer: testing (software)"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, computer: web"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, computer: website"
  },
  {
    "isco08": 2521,
    "isco88": 2132,
    "name": "Programmer, database"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, dhtml"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, html"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, internet"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, internet applications"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, multimedia"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, web"
  },
  {
    "isco08": 2513,
    "isco88": 2132,
    "name": "Programmer, website"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Programmer, workforce"
  },
  {
    "isco08": 2512,
    "isco88": 2131,
    "name": "Programmer-analyst"
  },
  {
    "isco08": 3521,
    "isco88": 3132,
    "name": "Projectionist, cinema"
  },
  {
    "isco08": 3253,
    "isco88": 3221,
    "name": "Promoter, community health"
  },
  {
    "isco08": 3339,
    "isco88": 3429,
    "name": "Promoter, sports"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Prompter"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Proofer, photogravure"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Proof-presser"
  },
  {
    "isco08": 4413,
    "isco88": 2451,
    "name": "Proofreader"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Prosecutor"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Prosthetist"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Prosthetist, dental"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Prosthodontist"
  },
  {
    "isco08": 5169,
    "isco88": 5149,
    "name": "Prostitute"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Prover, photo-engraving"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Prover, photogravure"
  },
  {
    "isco08": 1330,
    "isco88": 1317,
    "name": "Provider, internet service"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Provider, personal care"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Pruner, forestry"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Pruner, fruit trees"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Pruner, shrub: crops"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Pruner, shrub: garden maintenace"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Pruner, tree: forestry"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Pruner, tree: garden maintenace"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Pruner-trimmer, forestry"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Psychiatrist"
  },
  {
    "isco08": 2634,
    "isco88": 2445,
    "name": "Psychoanalyst"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Psychoeducator"
  },
  {
    "isco08": 2634,
    "isco88": 2445,
    "name": "Psychologist"
  },
  {
    "isco08": 2634,
    "isco88": 2445,
    "name": "Psychologist, clinical"
  },
  {
    "isco08": 2634,
    "isco88": 2445,
    "name": "Psychologist, educational"
  },
  {
    "isco08": 2634,
    "isco88": 2445,
    "name": "Psychologist, organizational"
  },
  {
    "isco08": 2634,
    "isco88": 2445,
    "name": "Psychologist, sports"
  },
  {
    "isco08": 2634,
    "isco88": 2445,
    "name": "Psychometrist"
  },
  {
    "isco08": 2634,
    "isco88": 2445,
    "name": "Psychotherapist"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Publicist"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Publisher"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Publisher, desk-top: print media"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Publisher, desk-top: web"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Publisher, electronic: internet"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Publisher, web"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Puller, pelt"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Puller, rickshaw"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Puppeteer"
  },
  {
    "isco08": 3323,
    "isco88": 3416,
    "name": "Purchaser, merchandise"
  },
  {
    "isco08": 5111,
    "isco88": 5111,
    "name": "Purser, aircraft"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Purser, chief: ship"
  },
  {
    "isco08": 5111,
    "isco88": 5111,
    "name": "Purser, flight"
  },
  {
    "isco08": 2411,
    "isco88": 1231,
    "name": "Purser, ship"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Qari"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Quarrier"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Rabbi"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Racer, automobile"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Racer, bicycle"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Racer, motor cycle"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Radiographer"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Radiographer, medical: diagnostic"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Radiologist"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Raiser, cattle"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Raiser, laboratory: animal"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Raiser, ostrich"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Raiser, pig"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Raiser, sheep"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Raiser, silkworm"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Rancher"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Ranger, forest: cultivating trees"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Ranger, park: environmental protection"
  },
  {
    "isco08": 9623,
    "isco88": 9153,
    "name": "Reader, meter"
  },
  {
    "isco08": 4413,
    "isco88": 2451,
    "name": "Reader, proof"
  },
  {
    "isco08": 2310,
    "isco88": 2310,
    "name": "Reader, university"
  },
  {
    "isco08": 3334,
    "isco88": 3413,
    "name": "Realtor"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Rear-admiral"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Receiver, bankruptcy"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Receiver, official"
  },
  {
    "isco08": 4226,
    "isco88": 4222,
    "name": "Receptionist"
  },
  {
    "isco08": 4226,
    "isco88": 4222,
    "name": "Receptionist, dental"
  },
  {
    "isco08": 4224,
    "isco88": 4222,
    "name": "Receptionist, hotel"
  },
  {
    "isco08": 4226,
    "isco88": 4222,
    "name": "Receptionist, medical office"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Recruit, defence forces"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Rector, college"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Rector, religion"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Rector, university"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Recycler"
  },
  {
    "isco08": 2619,
    "isco88": 2429,
    "name": "Referee, appeals (social security claims)"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Referee, sports"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Refiller, filling shelf, fridge or freezer"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Refiner, chocolate"
  },
  {
    "isco08": 8121,
    "isco88": 8223,
    "name": "Refiner, lead"
  },
  {
    "isco08": 8121,
    "isco88": 8223,
    "name": "Refiner, metal"
  },
  {
    "isco08": 8121,
    "isco88": 8223,
    "name": "Refiner, steel"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Reflexologist"
  },
  {
    "isco08": 8332,
    "isco88": 8324,
    "name": "Refueller, aircraft"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, anaesthetics"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, cardiology"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Registrar, company"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Registrar, court"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, dermatology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, endocrinology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, gastroenterology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, geriatrics"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, gynaecology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, intensive care"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, internal medicine"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Registrar, medical: general medicine"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, medical: specialist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, neurology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, obstetrics"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, oncology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, ophthalmology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, otorhinolaryngology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, pediatrics"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, psychiatry"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Registrar, radiology"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Registrar-general, government"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Regulator, tone: musical instruments"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Removalist, graffiti"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Remover, furniture"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Remover, graffiti"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Remover, household goods"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Repairer,  wheelchair: motorized"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Repairer, audio-visual equipment"
  },
  {
    "isco08": 7234,
    "isco88": 7231,
    "name": "Repairer, bicycle"
  },
  {
    "isco08": 7111,
    "isco88": 7129,
    "name": "Repairer, building"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Repairer, camera"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Repairer, chimney"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Repairer, clock"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Repairer, construction machinery"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Repairer, electrical equipment"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Repairer, electronics equipment"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Repairer, engine: aircraft"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Repairer, fabrics"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Repairer, farm machinery"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Repairer, footwear"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Repairer, instrument: brass"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Repairer, instrument: dental"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Repairer, instrument: musical"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Repairer, instrument: optical"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Repairer, instrument: percussion"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Repairer, instrument: precision"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Repairer, instrument: scientific"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Repairer, instrument: stringed"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Repairer, instrument: surgical"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Repairer, instrument: wind"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Repairer, jewellery"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Repairer, mechatronics"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Repairer, mining machinery"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Repairer, moped"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Repairer, motor vehicle"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Repairer, orthopaedic appliance"
  },
  {
    "isco08": 7234,
    "isco88": 7231,
    "name": "Repairer, pedal cycle"
  },
  {
    "isco08": 7234,
    "isco88": 7231,
    "name": "Repairer, perambulator"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Repairer, photographic equipment"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Repairer, prosthesis"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Repairer, radio"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Repairer, saw"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Repairer, saw"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Repairer, stationary engine"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Repairer, surgical: appliance"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Repairer, telecommunications equipment"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Repairer, television"
  },
  {
    "isco08": 7233,
    "isco88": 7233,
    "name": "Repairer, train engine"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Repairer, tuk-tuk"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Repairer, tyre"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Repairer, watch"
  },
  {
    "isco08": 7234,
    "isco88": 7231,
    "name": "Repairer, wheelchair"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Repairer, wheelchair: electric"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Repairer, windscreen"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Replenisher, shelf"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Replenisher, stock"
  },
  {
    "isco08": 3343,
    "isco88": 3431,
    "name": "Reporter, administrative: verbatim"
  },
  {
    "isco08": 3343,
    "isco88": 3431,
    "name": "Reporter, court"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Reporter, crime"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Reporter, fashion"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Reporter, journalism"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Reporter, media"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Reporter, news: TV/radio"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Reporter, newspaper"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Reporter, sports"
  },
  {
    "isco08": 2656,
    "isco88": 3472,
    "name": "Reporter, traffic"
  },
  {
    "isco08": 3343,
    "isco88": 3431,
    "name": "Reporter, verbatim"
  },
  {
    "isco08": 2656,
    "isco88": 3472,
    "name": "Reporter, weather"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Representative, automobile leasing"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Representative, diplomatic"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Representative, embassy"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Representative, insurance: assessor"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Representative, insurance: claims"
  },
  {
    "isco08": 3321,
    "isco88": 3412,
    "name": "Representative, insurance: sales"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Representative, internet helpdesk"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Representative, internet support"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Representative, legislative"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Representative, sales"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Representative, sales: automobile"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Representative, sales: communications technology"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Representative, sales: computer systems"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Representative, sales: door-to-door"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Representative, sales: engineering"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Representative, sales: ICT"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Representative, sales: industrial products"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Representative, sales: information technology"
  },
  {
    "isco08": 3321,
    "isco88": 3412,
    "name": "Representative, sales: insurance"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Representative, sales: manufacturing"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Representative, sales: medical and pharmaceutical products"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Representative, sales: technical (except ICT)"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Representative, sales: technical (ICT)"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Representative, technical: computer support"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Representative, telephone: canvassing for donations"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Researcher, biomedical"
  },
  {
    "isco08": 2113,
    "isco88": 2113,
    "name": "Researcher, chemical"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Researcher, clinical"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Researcher, developing or analysing government policy"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Researcher, environmental"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Researcher, health: policy"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Researcher, interviewing: market research"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Researcher, interviewing: surveys"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Researcher, market"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Researcher, market: cold calling"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Researcher, market: interviewing or conducting surveys"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Researcher, market: telephone"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Researcher, medical"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Researcher, midwifery"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Researcher, nursing"
  },
  {
    "isco08": 2633,
    "isco88": 2443,
    "name": "Researcher, peace"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Researcher, physics"
  },
  {
    "isco08": 2633,
    "isco88": 2443,
    "name": "Researcher, political"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Researcher, reviewing policy"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Researcher, salinity"
  },
  {
    "isco08": 2632,
    "isco88": 2442,
    "name": "Researcher, social"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Researcher, telephone market"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Researcher, water quality"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Researcher, water resources"
  },
  {
    "isco08": 2211,
    "isco88": 2221,
    "name": "Resident, medical: general medicine"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Resident, medical: specialist"
  },
  {
    "isco08": 1412,
    "isco88": 1315,
    "name": "Restaurateur"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Restorer, aircraft"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Restorer, picture"
  },
  {
    "isco08": 5221,
    "isco88": 1314,
    "name": "Retailer"
  },
  {
    "isco08": 5221,
    "isco88": 1314,
    "name": "Retailer, internet"
  },
  {
    "isco08": 5221,
    "isco88": 1314,
    "name": "Retailer, online"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Retoucher, photogravure"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Retoucher, printing plates"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Rheologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Rheumatologist"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Rhinologist"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Rider, bicycle"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Rider, bicycle: racing"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Rider, dispatch"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Rider, horse: sport"
  },
  {
    "isco08": 8321,
    "isco88": 8321,
    "name": "Rider, motor cycle"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Rider, motor cycle: racing"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Rider, timber"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Rider, tricycle"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Rifleman"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Riflewoman"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Rigger"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Rigger, aircraft"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Rigger, hoisting equipment"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Rigger, oil and gas well"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Rigger, railway cable"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Rigger, scaffolding"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Rigger, ship"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Rigger, ski-lift"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Rigger, theatrical"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Rigger, tower"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Ringer, bell"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Riveter"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Riveter, pneumatic"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Robber, timber: mine"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Roller, cigar"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Roller, precious metal"
  },
  {
    "isco08": 8121,
    "isco88": 8122,
    "name": "Roller, steel"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Roller, sugar confectionery"
  },
  {
    "isco08": 7121,
    "isco88": 7131,
    "name": "Roofer"
  },
  {
    "isco08": 7121,
    "isco88": 7131,
    "name": "Roofer, asphalt"
  },
  {
    "isco08": 7121,
    "isco88": 7131,
    "name": "Roofer, composite materials"
  },
  {
    "isco08": 7121,
    "isco88": 7131,
    "name": "Roofer, metal"
  },
  {
    "isco08": 7121,
    "isco88": 7131,
    "name": "Roofer, slate"
  },
  {
    "isco08": 7121,
    "isco88": 7131,
    "name": "Roofer, tile"
  },
  {
    "isco08": 7121,
    "isco88": 7131,
    "name": "Roofer, wood-shingle"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Rounder, footwear"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Rover, fibre: textile"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Runner, messages"
  },
  {
    "isco08": 9621,
    "isco88": 9151,
    "name": "Runner, post"
  },
  {
    "isco08": 5153,
    "isco88": 9141,
    "name": "Sacristan"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Saddler"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Sailor"
  },
  {
    "isco08": 3339,
    "isco88": 3429,
    "name": "Salesperson, advertising"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Salesperson, automobile"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Salesperson, bond"
  },
  {
    "isco08": 3339,
    "isco88": 3429,
    "name": "Salesperson, business services"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Salesperson, call centre"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Salesperson, canvassing on telephone"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Salesperson, car"
  },
  {
    "isco08": 5249,
    "isco88": 5220,
    "name": "Salesperson, car hire"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Salesperson, commercial"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Salesperson, communications technology"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Salesperson, computer systems"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Salesperson, customer contact centre"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Salesperson, direct: door-to-door"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Salesperson, door-to-door"
  },
  {
    "isco08": 2433,
    "isco88": 3415,
    "name": "Salesperson, engineering"
  },
  {
    "isco08": 2434,
    "isco88": 3415,
    "name": "Salesperson, information technology"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Salesperson, internet"
  },
  {
    "isco08": 5211,
    "isco88": 5230,
    "name": "Salesperson, kiosk"
  },
  {
    "isco08": 5246,
    "isco88": 5220,
    "name": "Salesperson, kiosk: food service"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Salesperson, manufacturing"
  },
  {
    "isco08": 5211,
    "isco88": 5230,
    "name": "Salesperson, market"
  },
  {
    "isco08": 5246,
    "isco88": 5220,
    "name": "Salesperson, market: food service"
  },
  {
    "isco08": 5243,
    "isco88": 9113,
    "name": "Salesperson, party plan"
  },
  {
    "isco08": 3334,
    "isco88": 3413,
    "name": "Salesperson, property"
  },
  {
    "isco08": 3334,
    "isco88": 3413,
    "name": "Salesperson, real estate"
  },
  {
    "isco08": 5249,
    "isco88": 5220,
    "name": "Salesperson, rental"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Salesperson, retail establishment"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Salesperson, securities"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Salesperson, shop"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Salesperson, telemarketing"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Salesperson, telephone"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Salesperson, travelling"
  },
  {
    "isco08": 5249,
    "isco88": 5220,
    "name": "Salesperson, video rental"
  },
  {
    "isco08": 5223,
    "isco88": 5220,
    "name": "Salesperson, wholesale establishment"
  },
  {
    "isco08": 8160,
    "isco88": 8272,
    "name": "Salter, cheese"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Salter, fish"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Salter, meat"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Salvageman, fire"
  },
  {
    "isco08": 5411,
    "isco88": 5161,
    "name": "Salvagewoman, fire"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Salvationist"
  },
  {
    "isco08": 3117,
    "isco88": 7111,
    "name": "Sampler, coal"
  },
  {
    "isco08": 8113,
    "isco88": 7111,
    "name": "Sampler, core"
  },
  {
    "isco08": 3117,
    "isco88": 7111,
    "name": "Sampler, mine"
  },
  {
    "isco08": 3117,
    "isco88": 7111,
    "name": "Sampler, ore"
  },
  {
    "isco08": 3117,
    "isco88": 7111,
    "name": "Sampler, quarry"
  },
  {
    "isco08": 3117,
    "isco88": 7111,
    "name": "Sampler, underground"
  },
  {
    "isco08": 7133,
    "isco88": 7143,
    "name": "Sandblaster, building exteriors"
  },
  {
    "isco08": 7316,
    "isco88": 7323,
    "name": "Sandblaster, glass decorating"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Sandblaster, stonecutting"
  },
  {
    "isco08": 3257,
    "isco88": 3222,
    "name": "Sanitarian"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Sapper, army"
  },
  {
    "isco08": 3434,
    "isco88": 5122,
    "name": "Saucier"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Sawyer, edge"
  },
  {
    "isco08": 8114,
    "isco88": 7313,
    "name": "Sawyer, industrial diamonds"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Sawyer, precision woodworking"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Sawyer, sawmill"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Sawyer, stone"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Sawyer, wood"
  },
  {
    "isco08": 8172,
    "isco88": 8141,
    "name": "Sawyer, wood processing plant"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Saxophonist"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Scaffolder"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Scaler, log"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Scavenger"
  },
  {
    "isco08": 4416,
    "isco88": 4190,
    "name": "Scheduler, crew"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Schoolmaster, high school"
  },
  {
    "isco08": 2341,
    "isco88": 2331,
    "name": "Schoolmaster, primary education"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Schoolmaster: secondary education"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Schoolmistress, high school"
  },
  {
    "isco08": 2341,
    "isco88": 2331,
    "name": "Schoolmistress, primary education"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Schoolmistress: secondary education"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Scientist, agricultural"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Scientist, air quality"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Scientist, clinical"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Scientist, computer"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Scientist, computer modelling: salinity"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Scientist, conservation"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Scientist, crop research"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Scientist, data mining"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Scientist, environmental"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Scientist, environmental research"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Scientist, food"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Scientist, forestry"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Scientist, health"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Scientist, horticultural"
  },
  {
    "isco08": 2622,
    "isco88": 2432,
    "name": "Scientist, information"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Scientist, medical"
  },
  {
    "isco08": 2633,
    "isco88": 2443,
    "name": "Scientist, political"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Scientist, salinity"
  },
  {
    "isco08": 2632,
    "isco88": 2442,
    "name": "Scientist, social"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Scientist, soil"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Scientist, water quality"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Scientist, water resources"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Scourer, wool"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Screener, snuff"
  },
  {
    "isco08": 4414,
    "isco88": 4144,
    "name": "Scribe"
  },
  {
    "isco08": 2651,
    "isco88": 2452,
    "name": "Sculptor"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Seaman, able"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Seaman, navy"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Seaman, ordinary"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Seamstress"
  },
  {
    "isco08": 3411,
    "isco88": 3432,
    "name": "Searcher, title"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Seasoner, wood"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Seawoman, able"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Seawoman, ordinary"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Seawomen, navy"
  },
  {
    "isco08": 4120,
    "isco88": 4115,
    "name": "Secretary"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Secretary of state"
  },
  {
    "isco08": 3343,
    "isco88": 3431,
    "name": "Secretary, administrative"
  },
  {
    "isco08": 3343,
    "isco88": 3431,
    "name": "Secretary, committee"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Secretary, company"
  },
  {
    "isco08": 3342,
    "isco88": 4115,
    "name": "Secretary, conveyancing"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Secretary, dental"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Secretary, doctor''s"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Secretary, embassy"
  },
  {
    "isco08": 3343,
    "isco88": 3431,
    "name": "Secretary, executive"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Secretary, government: senior official"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Secretary, hospital ward"
  },
  {
    "isco08": 3342,
    "isco88": 4115,
    "name": "Secretary, legal"
  },
  {
    "isco08": 3342,
    "isco88": 4115,
    "name": "Secretary, litigation"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Secretary, medical"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Secretary, medical insurance billing"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Secretary, medical laboratory"
  },
  {
    "isco08": 3342,
    "isco88": 4115,
    "name": "Secretary, paralegal"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Secretary, pathology"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Secretary, patient care"
  },
  {
    "isco08": 2432,
    "isco88": 2419,
    "name": "Secretary, press"
  },
  {
    "isco08": 4120,
    "isco88": 4115,
    "name": "Secretary, stenography"
  },
  {
    "isco08": 4120,
    "isco88": 4115,
    "name": "Secretary, typing"
  },
  {
    "isco08": 4120,
    "isco88": 4115,
    "name": "Secretary, word processing"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "Secretary-general, employers'' organization"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Secretary-general, environment protection organization"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Secretary-general, government administration"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Secretary-general, human rights organization"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Secretary-general, humanitarian organization"
  },
  {
    "isco08": 1114,
    "isco88": 1141,
    "name": "Secretary-general, political party"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Secretary-general, special-interest organization"
  },
  {
    "isco08": 1114,
    "isco88": 1142,
    "name": "Secretary-general, trade union"
  },
  {
    "isco08": 1114,
    "isco88": 1143,
    "name": "Secretary-general, wild life protection organization"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Seismologist"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Seller, Ebay"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Semasiologist"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Senator"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Sergeant, army"
  },
  {
    "isco08": 3355,
    "isco88": 3450,
    "name": "Sergeant, detective"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Sergeant, flight"
  },
  {
    "isco08": 5412,
    "isco88": 5162,
    "name": "Sergeant, police"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Sergeant-major"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Sericulturist"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Serviceperson, defence forces"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Serviceperson, filter"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Serviceperson, swimming pool: cleaning"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Servicer, audio-visual equipment"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Servicer, communications technology"
  },
  {
    "isco08": 7412,
    "isco88": 7241,
    "name": "Servicer, electrical equipment"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Servicer, electronic equipment"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Servicer, radio"
  },
  {
    "isco08": 7422,
    "isco88": 7244,
    "name": "Servicer, telegraph"
  },
  {
    "isco08": 7422,
    "isco88": 7244,
    "name": "Servicer, telephone"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Servicer, television"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Setter, artistic: glass"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Setter, bone"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Setter, gem"
  },
  {
    "isco08": 7125,
    "isco88": 7135,
    "name": "Setter, glass: buildings"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Setter, jewels"
  },
  {
    "isco08": 8152,
    "isco88": 7432,
    "name": "Setter, knitting-machine"
  },
  {
    "isco08": 8152,
    "isco88": 7432,
    "name": "Setter, loom"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter, machine tool"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Setter, marble"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter, metalworking machine"
  },
  {
    "isco08": 7322,
    "isco88": 7341,
    "name": "Setter, printing machine"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Setter, tile"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Setter, woodworking machine"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, boring machine: metal working"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Setter-operator, carving machine: woodworking"
  },
  {
    "isco08": 7322,
    "isco88": 7341,
    "name": "Setter-operator, casting machine: printing type"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, cutting machine: metal working"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, die-sinking machine: metal working"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, drilling machine: metal working"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, extruding machine: metal working"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Setter-operator, fret-saw: woodworking"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, grinding machine: metal working"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, honing machine: metal working"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Setter-operator, jigsaw: woodworking"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, lapping machine: metal working"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Setter-operator, lathe: glass"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, lathe: metal working"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Setter-operator, lathe: stone"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Setter-operator, lathe: woodworking"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, machine tool"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, metalworking machine"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, milling machine: metal working"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, numerical control machine: metal working"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, planing machine: metal working"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Setter-operator, planing machine: woodworking"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, precision-grinding machine: metal working"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, reaming machine: metal working"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, routing machine: metal working"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Setter-operator, routing machine: woodworking"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Setter-operator, shaping machine: metal working"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Setter-operator, shaping machine: woodworking"
  },
  {
    "isco08": 7212,
    "isco88": 7212,
    "name": "Setter-operator, soldering: jewellery"
  },
  {
    "isco08": 7212,
    "isco88": 7212,
    "name": "Setter-operator, soldering: metal"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Setter-operator, woodworking machine"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer"
  },
  {
    "isco08": 7323,
    "isco88": 7345,
    "name": "Sewer, bookbinding"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer, footwear"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer, fur"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer, garments"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer, hat"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer, leather"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer, mattress"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer, sail"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer, tent"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer, textile"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Sewer, upholstery"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Sexer, chicken"
  },
  {
    "isco08": 5153,
    "isco88": 9141,
    "name": "Sexton"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Shactor"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Sharebroker"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Sharpener, cutting instruments"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Sharpener, itinerant"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Sharpener, knife"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Sharpener, saw"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Sharpener, tool"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Shaver, fur"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Shearer, sheep"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Shepherd"
  },
  {
    "isco08": 6320,
    "isco88": 6210,
    "name": "Shepherd: subsistence farming"
  },
  {
    "isco08": 8122,
    "isco88": 8223,
    "name": "Sherardiser"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Shiner, shoes"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Shipbroker"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Shipwright, metal"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Shipwright, wood"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Shoe-black"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Shoemaker"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Shoemaker, orthopaedic"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Shoe-polisher"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Shoe-shiner"
  },
  {
    "isco08": 3117,
    "isco88": 3117,
    "name": "Shooter, oil and gas wells"
  },
  {
    "isco08": 7115,
    "isco88": 7124,
    "name": "Shopfitter"
  },
  {
    "isco08": 5221,
    "isco88": 1314,
    "name": "Shopkeeper"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Shorer, construction"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Shotblaster, stonecutting"
  },
  {
    "isco08": 7542,
    "isco88": 7112,
    "name": "Shotfirer"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Shoveller, civil engineering"
  },
  {
    "isco08": 8121,
    "isco88": 8121,
    "name": "Shredder, scrap metal"
  },
  {
    "isco08": 8312,
    "isco88": 8312,
    "name": "Shunter, railway"
  },
  {
    "isco08": 7114,
    "isco88": 7123,
    "name": "Shutterer, concrete: moulding"
  },
  {
    "isco08": 8312,
    "isco88": 8312,
    "name": "Signaller, railway"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Signpainter"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Signwriter"
  },
  {
    "isco08": 7315,
    "isco88": 7324,
    "name": "Silverer, glass"
  },
  {
    "isco08": 7315,
    "isco88": 7324,
    "name": "Silverer, mirror"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Silversmith"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Silviculturist"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Singer"
  },
  {
    "isco08": 2652,
    "isco88": 3473,
    "name": "Singer, nightclub"
  },
  {
    "isco08": 2652,
    "isco88": 3473,
    "name": "Singer, street"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Sinker, bore"
  },
  {
    "isco08": 8113,
    "isco88": 7136,
    "name": "Sinker, well"
  },
  {
    "isco08": 3221,
    "isco88": 3231,
    "name": "Sister, nursing: associate professional"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Sister, nursing: professional"
  },
  {
    "isco08": 2221,
    "isco88": 2230,
    "name": "Sister, operating theatre"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Sister, religious"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Sitter, baby"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Skier"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Skinner, animal"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Skipper, coastal fishery"
  },
  {
    "isco08": 6223,
    "isco88": 6153,
    "name": "Skipper, trawler"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Skipper, yacht"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Skiver, footwear"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Slaughterer"
  },
  {
    "isco08": 7549,
    "isco88": 7322,
    "name": "Slicer, optical glass"
  },
  {
    "isco08": 7549,
    "isco88": 7322,
    "name": "Slitter, optical glass"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Sluiceman, dock"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Sluicewoman, dock"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Smith, agricultural implement"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Smith, anvil"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Smith, black"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Smith, bulldozer"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Smith, forge"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Smith, gold"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Smith, gun"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Smith, hammer"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Smith, hammer: precious-metal articles"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Smith, lock"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Smith, pewter"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Smith, silver"
  },
  {
    "isco08": 2632,
    "isco88": 2442,
    "name": "Sociologist"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Socker, footwear"
  },
  {
    "isco08": 7212,
    "isco88": 7212,
    "name": "Solderer"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Soldier"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Soldier, infantry"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Soldier, recruit"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Soldier, sergeant major"
  },
  {
    "isco08": "0210",
    "isco88": "0110",
    "name": "Soldier, warrant officer"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Soldier: captain"
  },
  {
    "isco08": 2611,
    "isco88": 2429,
    "name": "Solicitor"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Sommelier"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Sonographer"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Soprano"
  },
  {
    "isco08": 9329,
    "isco88": 9321,
    "name": "Sorter, bottle"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Sorter, cigar"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Sorter, footwear"
  },
  {
    "isco08": 7531,
    "isco88": 7434,
    "name": "Sorter, fur"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Sorter, garbage"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Sorter, recycling"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Sorter, refuse"
  },
  {
    "isco08": 3434,
    "isco88": 5122,
    "name": "Sous-chef"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Speaker"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Specialist, advertising"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Specialist, audio-visual: teaching aids"
  },
  {
    "isco08": 2421,
    "isco88": 2419,
    "name": "Specialist, business efficiency"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Specialist, chinese medicine"
  },
  {
    "isco08": 2132,
    "isco88": 2213,
    "name": "Specialist, crop"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Specialist, data mining"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Specialist, digital forensics"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Specialist, education: methods"
  },
  {
    "isco08": 4229,
    "isco88": 4222,
    "name": "Specialist, eligibility"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Specialist, emergency medicine"
  },
  {
    "isco08": 2143,
    "isco88": 2149,
    "name": "Specialist, environmental remediation"
  },
  {
    "isco08": 3112,
    "isco88": 3151,
    "name": "Specialist, fire prevention"
  },
  {
    "isco08": 5141,
    "isco88": 5141,
    "name": "Specialist, hair care"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Specialist, insolvency"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Specialist, intensive care"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Specialist, internal medicine"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Specialist, marketing"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Specialist, medical"
  },
  {
    "isco08": 2513,
    "isco88": 2139,
    "name": "Specialist, multimedia"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Specialist, network: computing (managing system)"
  },
  {
    "isco08": 2423,
    "isco88": 2412,
    "name": "Specialist, personnel"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Specialist, preventive medicine"
  },
  {
    "isco08": 2431,
    "isco88": 2419,
    "name": "Specialist, sales: promotion (methods)"
  },
  {
    "isco08": 5414,
    "isco88": 5169,
    "name": "Specialist, security (except computer)"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Specialist, security: computer"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Specialist, security: data"
  },
  {
    "isco08": 2529,
    "isco88": 2139,
    "name": "Specialist, security: ICT"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Specialist, teaching: aids"
  },
  {
    "isco08": 2351,
    "isco88": 2351,
    "name": "Specialist, visual: teaching aids"
  },
  {
    "isco08": 2424,
    "isco88": 2412,
    "name": "Specialist, workforce development"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Spinner, metal"
  },
  {
    "isco08": 7313,
    "isco88": 7313,
    "name": "Spinner, precious metal"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Spinner, sheet-metal"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Spinner, thread and yarn"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Spinner-squeezer, cable"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Spinner-squeezer, wire"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Splicer, cable and rope"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Splitter, carcass"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Splitter, footwear"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Splitter, hide"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Splitter, stone"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Sportsman"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Sportswoman"
  },
  {
    "isco08": 9121,
    "isco88": 9133,
    "name": "Spotter, dry-cleaning"
  },
  {
    "isco08": 3153,
    "isco88": 3143,
    "name": "Sprayer, crop: aerial"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Sprayer, crops (except aerial)"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Sprayer, herbicide"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Sprayer, insecticide"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Sprayer, malaria control"
  },
  {
    "isco08": 7132,
    "isco88": 7142,
    "name": "Sprayer, metal"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Sprayer, pesticide"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Sprayer, weed"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Spray-painter, construction"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Spray-painter, decorative painting"
  },
  {
    "isco08": 7132,
    "isco88": 7142,
    "name": "Spray-painter, manufactured articles"
  },
  {
    "isco08": 9313,
    "isco88": 9313,
    "name": "Stacker, building construction"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Stacker, manufacturing"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Stacker, shelf"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Stacker, timber: forestry"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Stagehand"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Stainer, footwear"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Stainer, leather"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Stainer, wooden furniture"
  },
  {
    "isco08": 5211,
    "isco88": 5230,
    "name": "Stallholder, market"
  },
  {
    "isco08": 7322,
    "isco88": 7346,
    "name": "Stamper, heraldic printing"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Stamper, rubber: ceramics"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Stationmaster, railway"
  },
  {
    "isco08": 2120,
    "isco88": 2122,
    "name": "Statistician"
  },
  {
    "isco08": 8160,
    "isco88": 8278,
    "name": "Steeper, malting"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Steeplejack"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Stemmer, tobacco"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Stenciller, ceramics decoration"
  },
  {
    "isco08": 7322,
    "isco88": 7346,
    "name": "Stenciller, silk-screen"
  },
  {
    "isco08": 4131,
    "isco88": 4111,
    "name": "Stenographer"
  },
  {
    "isco08": 3342,
    "isco88": 4115,
    "name": "Stenographer, legal"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Stenographer, medical"
  },
  {
    "isco08": 4131,
    "isco88": 4111,
    "name": "Stenographer, typing"
  },
  {
    "isco08": 7321,
    "isco88": 7342,
    "name": "Stereotyper"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Stevedore"
  },
  {
    "isco08": 5111,
    "isco88": 5111,
    "name": "Steward, cabin"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Steward, chief: hotel"
  },
  {
    "isco08": 5111,
    "isco88": 5110,
    "name": "Steward, chief: ship"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Steward, hotel"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Steward, house"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Steward, kitchen"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Steward, mess"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Steward, ship: dining saloon"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Steward, ship: mess"
  },
  {
    "isco08": 5111,
    "isco88": 5111,
    "name": "Steward, ship''s"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Steward, wine"
  },
  {
    "isco08": 5111,
    "isco88": 5111,
    "name": "Stewardess, cabin"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Stewardess, chief: hotel"
  },
  {
    "isco08": 5111,
    "isco88": 5110,
    "name": "Stewardess, chief: ship"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Stewardess, hotel"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Stewardess, house"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Stewardess, kitchen"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Stewardess, mess"
  },
  {
    "isco08": 5111,
    "isco88": 5111,
    "name": "Stewardess, ship"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Stewardess, ship: dining saloon"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Stewardess, ship: mess"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Stewardess, wine"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Sticker, animal"
  },
  {
    "isco08": 9629,
    "isco88": 9120,
    "name": "Sticker, bill"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Sticker-up, pottery"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Stockbroker"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Stocker, shelf"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Stockman, beef cattle"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Stockman, livestock"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Stockman, sheep"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Stockwoman, beef cattle"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Stockwoman, livestock"
  },
  {
    "isco08": 6121,
    "isco88": 9211,
    "name": "Stockwoman, sheep"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Stoker, ship"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Stomatologist"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Stonecutter"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Stonehand, printing"
  },
  {
    "isco08": 7113,
    "isco88": 7122,
    "name": "Stonemason"
  },
  {
    "isco08": 7113,
    "isco88": 7113,
    "name": "Stoneworker"
  },
  {
    "isco08": 4321,
    "isco88": 4131,
    "name": "Storekeeper"
  },
  {
    "isco08": 2655,
    "isco88": 2455,
    "name": "Storyteller"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Stover, tobacco"
  },
  {
    "isco08": 2422,
    "isco88": 2419,
    "name": "Strategist"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Stratigrapher"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Stretcher, leather"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Stretcher, pelt"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Striker, blacksmith''s"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Stringer, piano"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Stripper, blubber"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Stripper, bobbin"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Stripper, cork bark"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Stripper, gut"
  },
  {
    "isco08": 2653,
    "isco88": 3473,
    "name": "Stripper, nightclub"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Stripper, tobacco"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Stump-grubber"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Stunner, animal"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Stuntman"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Stuntwoman"
  },
  {
    "isco08": 5141,
    "isco88": 5141,
    "name": "Stylist, hair"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Sub-editor"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Sublieutenant, navy"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Submariner, navy"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Subtitler"
  },
  {
    "isco08": 5153,
    "isco88": 9141,
    "name": "Superintendent, building"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Superintendent, clerical: barge"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Superintendent, clerical: cargo"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Superintendent, clerical: ferry"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Superintendent, clerical: quay"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Superintendent, clerical: railway (depot)"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Superintendent, clerical: road transport (depot)"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Superintendent, clerical: road transport (traffic)"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Superintendent, clerical: water transport (terminal)"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Superintendent, clerical: wharf"
  },
  {
    "isco08": 3123,
    "isco88": 1223,
    "name": "Superintendent, construction"
  },
  {
    "isco08": 3152,
    "isco88": 3142,
    "name": "Superintendent, marine: deck"
  },
  {
    "isco08": 3151,
    "isco88": 3141,
    "name": "Superintendent, marine: technical"
  },
  {
    "isco08": 1349,
    "isco88": 1229,
    "name": "Superintendent, police"
  },
  {
    "isco08": 1324,
    "isco88": 1226,
    "name": "Superintendent, rail operations"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Superior, mother"
  },
  {
    "isco08": 2132,
    "isco88": 3213,
    "name": "Supervisor, agricultural extension"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Supervisor, aircraft maintenance"
  },
  {
    "isco08": 3122,
    "isco88": 8280,
    "name": "Supervisor, assembly"
  },
  {
    "isco08": 3122,
    "isco88": 8282,
    "name": "Supervisor, assembly: electrical products"
  },
  {
    "isco08": 3122,
    "isco88": 8283,
    "name": "Supervisor, assembly: electronic products"
  },
  {
    "isco08": 3122,
    "isco88": 8281,
    "name": "Supervisor, assembly: mechanical products"
  },
  {
    "isco08": 3122,
    "isco88": 8284,
    "name": "Supervisor, assembly: metal products"
  },
  {
    "isco08": 3122,
    "isco88": 8286,
    "name": "Supervisor, assembly: paperboard products"
  },
  {
    "isco08": 3122,
    "isco88": 8284,
    "name": "Supervisor, assembly: plastic products"
  },
  {
    "isco08": 3122,
    "isco88": 8284,
    "name": "Supervisor, assembly: rubber products"
  },
  {
    "isco08": 3122,
    "isco88": 8286,
    "name": "Supervisor, assembly: textile products"
  },
  {
    "isco08": 3122,
    "isco88": 8285,
    "name": "Supervisor, assembly: wood products"
  },
  {
    "isco08": 3122,
    "isco88": 8171,
    "name": "Supervisor, automated assembly line"
  },
  {
    "isco08": 3123,
    "isco88": 7129,
    "name": "Supervisor, building construction"
  },
  {
    "isco08": 3123,
    "isco88": 7129,
    "name": "Supervisor, building operations"
  },
  {
    "isco08": 3123,
    "isco88": 7129,
    "name": "Supervisor, building project"
  },
  {
    "isco08": 3123,
    "isco88": 7129,
    "name": "Supervisor, building site"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Supervisor, call centre"
  },
  {
    "isco08": 5222,
    "isco88": 4211,
    "name": "Supervisor, checkout"
  },
  {
    "isco08": 3341,
    "isco88": 3439,
    "name": "Supervisor, clerical"
  },
  {
    "isco08": 3123,
    "isco88": 7129,
    "name": "Supervisor, construction"
  },
  {
    "isco08": 3123,
    "isco88": 7129,
    "name": "Supervisor, construction site"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Supervisor, contact centre"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Supervisor, credit: assessing credit or finance"
  },
  {
    "isco08": 3341,
    "isco88": 4113,
    "name": "Supervisor, data entry"
  },
  {
    "isco08": 3341,
    "isco88": 4141,
    "name": "Supervisor, filing clerks"
  },
  {
    "isco08": 3122,
    "isco88": 8290,
    "name": "Supervisor, finishing"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Supervisor, housekeeping: hotel"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Supervisor, market research: interviewing"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Supervisor, medical records unit"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Supervisor, mine"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Supervisor, mining"
  },
  {
    "isco08": 3341,
    "isco88": 4190,
    "name": "Supervisor, personnel clerks"
  },
  {
    "isco08": 3122,
    "isco88": 8170,
    "name": "Supervisor, production: manufacturing"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Supervisor, production: mining"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Supervisor, quarry"
  },
  {
    "isco08": 5222,
    "isco88": 5220,
    "name": "Supervisor, sales assistants"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Supervisor, shift: mining"
  },
  {
    "isco08": 5222,
    "isco88": 5220,
    "name": "Supervisor, shop"
  },
  {
    "isco08": 3123,
    "isco88": 7129,
    "name": "Supervisor, site: construction"
  },
  {
    "isco08": 5222,
    "isco88": 5220,
    "name": "Supervisor, supermarket"
  },
  {
    "isco08": 3341,
    "isco88": 4222,
    "name": "Supervisor, switchboard"
  },
  {
    "isco08": 3341,
    "isco88": 4111,
    "name": "Supervisor, typist"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Supervisor, underground: mine"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Supervisor, women''s shelter"
  },
  {
    "isco08": 3341,
    "isco88": 4112,
    "name": "Supervisor, word processing"
  },
  {
    "isco08": 3123,
    "isco88": 7129,
    "name": "Supervisor, works: building or construction"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Support, computer"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Support, internet"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Support, IT"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Surgeon"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Surgeon, cardiology"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Surgeon, cardiothoracic"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Surgeon, dental"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Surgeon, maxillofacial"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Surgeon, medical"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Surgeon, neurosurgery"
  },
  {
    "isco08": 2261,
    "isco88": 2222,
    "name": "Surgeon, oral"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Surgeon, orthopaedic"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Surgeon, osteopathic"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Surgeon, plastic"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Surgeon, thoracic"
  },
  {
    "isco08": 2250,
    "isco88": 2223,
    "name": "Surgeon, veterinary"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Surveyor, aerial"
  },
  {
    "isco08": 3112,
    "isco88": 3151,
    "name": "Surveyor, building"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Surveyor, cadastral"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Surveyor, electrical"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Surveyor, geodesic"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Surveyor, hydrographic"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Surveyor, land"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Surveyor, marine"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Surveyor, market research"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Surveyor, mine"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Surveyor, photogrammetric"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Surveyor, photographic"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Surveyor, quantity"
  },
  {
    "isco08": 4227,
    "isco88": 4190,
    "name": "Surveyor, telephone"
  },
  {
    "isco08": 2165,
    "isco88": 2148,
    "name": "Surveyor, topographic"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Swamper, logging"
  },
  {
    "isco08": 7133,
    "isco88": 7143,
    "name": "Sweep, chimney"
  },
  {
    "isco08": 9112,
    "isco88": 9132,
    "name": "Sweeper, floor"
  },
  {
    "isco08": 9613,
    "isco88": 9162,
    "name": "Sweeper, park"
  },
  {
    "isco08": 9613,
    "isco88": 9162,
    "name": "Sweeper, street"
  },
  {
    "isco08": 9613,
    "isco88": 9162,
    "name": "Sweeper, yard"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Tailor"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Tailor, alteration"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Tailor, bespoke"
  },
  {
    "isco08": 7531,
    "isco88": 7434,
    "name": "Tailor, fur"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Tailor, garment: made-to-measure"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Tailor, garment: ready-to-wear"
  },
  {
    "isco08": 7531,
    "isco88": 7433,
    "name": "Tailor, theatrical"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Taker-off, footwear finishing"
  },
  {
    "isco08": 7322,
    "isco88": 7341,
    "name": "Taker-off, printing press"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Talapoin"
  },
  {
    "isco08": 7535,
    "isco88": 7441,
    "name": "Tanner"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Tapper, maple: syrup"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Tapper, pine: resin"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Tapper, rubber"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Tapper, toddy"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Taster, coffee"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Taster, food"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Taster, juice"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Taster, liquor"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Taster, tea"
  },
  {
    "isco08": 7515,
    "isco88": 7415,
    "name": "Taster, wine"
  },
  {
    "isco08": 3435,
    "isco88": 3471,
    "name": "Tattooist"
  },
  {
    "isco08": 3433,
    "isco88": 3211,
    "name": "Taxidermist"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Taxonomist"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Teacher, bridge"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Teacher, college: secondary education"
  },
  {
    "isco08": 2320,
    "isco88": 2320,
    "name": "Teacher, college: vocational (education)"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Teacher, dance school"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Teacher, dance: private tuition"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Teacher, drama: private tuition"
  },
  {
    "isco08": 2353,
    "isco88": 2359,
    "name": "Teacher, EFL"
  },
  {
    "isco08": 2353,
    "isco88": 2359,
    "name": "Teacher, English as a second language"
  },
  {
    "isco08": 2353,
    "isco88": 2359,
    "name": "Teacher, ESL"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, for the blind"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, for the deaf"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, for the dumb"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, for the mentally handicapped"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, for the physically handicapped"
  },
  {
    "isco08": 2354,
    "isco88": 2359,
    "name": "Teacher, guitar: private tuition"
  },
  {
    "isco08": 1345,
    "isco88": 1229,
    "name": "Teacher, head"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Teacher, high school"
  },
  {
    "isco08": 2353,
    "isco88": 2359,
    "name": "Teacher, intensive language"
  },
  {
    "isco08": 2342,
    "isco88": 2332,
    "name": "Teacher, kindergarten"
  },
  {
    "isco08": 2342,
    "isco88": 3320,
    "name": "Teacher, kindergarten: associate professional"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, learning support"
  },
  {
    "isco08": 2353,
    "isco88": 2359,
    "name": "Teacher, migrant education"
  },
  {
    "isco08": 2354,
    "isco88": 2359,
    "name": "Teacher, music: private tuition"
  },
  {
    "isco08": 2342,
    "isco88": 2332,
    "name": "Teacher, nursery"
  },
  {
    "isco08": 2342,
    "isco88": 3320,
    "name": "Teacher, nursery: associate professional"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, of gifted children"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, of the hearing impaired"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, of the sight impaired"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Teacher, painting: private tuition"
  },
  {
    "isco08": 2354,
    "isco88": 2359,
    "name": "Teacher, piano: private tuition"
  },
  {
    "isco08": 2353,
    "isco88": 2359,
    "name": "Teacher, practical language"
  },
  {
    "isco08": 2342,
    "isco88": 2332,
    "name": "Teacher, pre-primary education"
  },
  {
    "isco08": 2342,
    "isco88": 3320,
    "name": "Teacher, pre-primary education: associate professional"
  },
  {
    "isco08": 2342,
    "isco88": 3320,
    "name": "Teacher, pre-school"
  },
  {
    "isco08": 2341,
    "isco88": 2331,
    "name": "Teacher, primary education"
  },
  {
    "isco08": 2341,
    "isco88": 2331,
    "name": "Teacher, primary education: associate professional"
  },
  {
    "isco08": 2341,
    "isco88": 2331,
    "name": "Teacher, primary school"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, remedial"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Teacher, sculpture: private tuition"
  },
  {
    "isco08": 2353,
    "isco88": 2359,
    "name": "Teacher, second language"
  },
  {
    "isco08": 2330,
    "isco88": 2320,
    "name": "Teacher, secondary school"
  },
  {
    "isco08": 2354,
    "isco88": 2359,
    "name": "Teacher, singing: private tuition"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, special education"
  },
  {
    "isco08": 2352,
    "isco88": 2340,
    "name": "Teacher, special education: learning disabilities"
  },
  {
    "isco08": 2310,
    "isco88": 2310,
    "name": "Teacher, university"
  },
  {
    "isco08": 2354,
    "isco88": 2359,
    "name": "Teacher, violin: private tuition"
  },
  {
    "isco08": 2320,
    "isco88": 2320,
    "name": "Teacher, vocational education"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Teaser, textiles"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Technician, acupuncture"
  },
  {
    "isco08": 3142,
    "isco88": 3212,
    "name": "Technician, agronomy"
  },
  {
    "isco08": 3155,
    "isco88": 3145,
    "name": "Technician, air traffic safety"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Technician, aircraft service"
  },
  {
    "isco08": 3259,
    "isco88": 3229,
    "name": "Technician, anaesthesia�"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, anatomy"
  },
  {
    "isco08": 3142,
    "isco88": 3213,
    "name": "Technician, aquaculture"
  },
  {
    "isco08": 3143,
    "isco88": 3212,
    "name": "Technician, arboriculture"
  },
  {
    "isco08": 3111,
    "isco88": 3111,
    "name": "Technician, astronomy"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, audiometric equipment"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Technician, automotive brakes systems service"
  },
  {
    "isco08": 7232,
    "isco88": 7232,
    "name": "Technician, aviation maintenance"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Technician, avionics"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Technician, ayurvedic"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, bacteriology"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, biochemistry"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, biology"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, biophysics"
  },
  {
    "isco08": 3212,
    "isco88": 3211,
    "name": "Technician, blood-bank"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, botany"
  },
  {
    "isco08": 3521,
    "isco88": 3132,
    "name": "Technician, broadcasting"
  },
  {
    "isco08": 2240,
    "isco88": 3221,
    "name": "Technician, caesarean section"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Technician, carpet cleaning"
  },
  {
    "isco08": 3133,
    "isco88": 3116,
    "name": "Technician, chemical process"
  },
  {
    "isco08": 3111,
    "isco88": 3111,
    "name": "Technician, chemistry"
  },
  {
    "isco08": 7422,
    "isco88": 7244,
    "name": "Technician, communications: telecommunications"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Technician, computer support"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Technician, computer: hardware"
  },
  {
    "isco08": 3513,
    "isco88": 3121,
    "name": "Technician, computer: network"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Technician, computer: user support"
  },
  {
    "isco08": 3142,
    "isco88": 3212,
    "name": "Technician, crop research"
  },
  {
    "isco08": 3433,
    "isco88": 3471,
    "name": "Technician, curatorial"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Technician, customer service support: computing"
  },
  {
    "isco08": 3212,
    "isco88": 3211,
    "name": "Technician, cytology"
  },
  {
    "isco08": 3142,
    "isco88": 3213,
    "name": "Technician, dairy"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Technician, darkroom"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Technician, dental"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Technician, disease registry"
  },
  {
    "isco08": 3213,
    "isco88": 3228,
    "name": "Technician, dispensing"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Technician, drain"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, ecology"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, electrocardiographic equipment"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, electroencephalographic equipment"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Technician, electronic pre-press"
  },
  {
    "isco08": 3258,
    "isco88": 5132,
    "name": "Technician, emergency medical"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Technician, end user: computing"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: aeronautics"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: agricultural (machinery)"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: air-conditioning"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: automotive"
  },
  {
    "isco08": 3116,
    "isco88": 3116,
    "name": "Technician, engineering: chemical"
  },
  {
    "isco08": 3116,
    "isco88": 3116,
    "name": "Technician, engineering: chemical process"
  },
  {
    "isco08": 3112,
    "isco88": 3112,
    "name": "Technician, engineering: civil"
  },
  {
    "isco08": 3114,
    "isco88": 3114,
    "name": "Technician, engineering: computer hardware design"
  },
  {
    "isco08": 3112,
    "isco88": 3112,
    "name": "Technician, engineering: construction"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: diesel (engines)"
  },
  {
    "isco08": 3113,
    "isco88": 3113,
    "name": "Technician, engineering: electric illumination"
  },
  {
    "isco08": 3113,
    "isco88": 3113,
    "name": "Technician, engineering: electric power transmission"
  },
  {
    "isco08": 3113,
    "isco88": 3113,
    "name": "Technician, engineering: electrical"
  },
  {
    "isco08": 3114,
    "isco88": 3114,
    "name": "Technician, engineering: electronics"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: gas (turbines)"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: heating"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: industrial (machinery and tools)"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, engineering: industrial efficiency"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, engineering: industrial layout"
  },
  {
    "isco08": 3114,
    "isco88": 3114,
    "name": "Technician, engineering: instrumentation"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: internal combustion"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: jet engine"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: locomotive (engines)"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: lubrication"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: marine"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: mechanical"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: mechatronics"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, engineering: methods"
  },
  {
    "isco08": 3117,
    "isco88": 3117,
    "name": "Technician, engineering: mining"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: motor"
  },
  {
    "isco08": 3116,
    "isco88": 3116,
    "name": "Technician, engineering: natural gas (production and distribution)"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: naval"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: nuclear power"
  },
  {
    "isco08": 3116,
    "isco88": 3116,
    "name": "Technician, engineering: petroleum"
  },
  {
    "isco08": 3117,
    "isco88": 3117,
    "name": "Technician, engineering: petroleum and natural gas extraction"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, engineering: planning"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, engineering: production"
  },
  {
    "isco08": 3522,
    "isco88": 3114,
    "name": "Technician, engineering: radar"
  },
  {
    "isco08": 3522,
    "isco88": 3114,
    "name": "Technician, engineering: radio"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: refrigeration"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, engineering: safety"
  },
  {
    "isco08": 3114,
    "isco88": 3114,
    "name": "Technician, engineering: semiconductors"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, engineering: ship (construction)"
  },
  {
    "isco08": 3522,
    "isco88": 3114,
    "name": "Technician, engineering: signal systems"
  },
  {
    "isco08": 3511,
    "isco88": 3121,
    "name": "Technician, engineering: systems (computers)"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, engineering: systems (except computers)"
  },
  {
    "isco08": 3522,
    "isco88": 3114,
    "name": "Technician, engineering: telecommunications"
  },
  {
    "isco08": 3522,
    "isco88": 3114,
    "name": "Technician, engineering: telegraph"
  },
  {
    "isco08": 3522,
    "isco88": 3114,
    "name": "Technician, engineering: telephone"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, engineering: time and motion study"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, engineering: value"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, engineering: work study"
  },
  {
    "isco08": 3142,
    "isco88": 3213,
    "name": "Technician, field crop"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, fisheries"
  },
  {
    "isco08": 3142,
    "isco88": 3213,
    "name": "Technician, floriculture"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, forensic science"
  },
  {
    "isco08": 3143,
    "isco88": 3212,
    "name": "Technician, forest survey"
  },
  {
    "isco08": 3143,
    "isco88": 3212,
    "name": "Technician, forestry"
  },
  {
    "isco08": 3433,
    "isco88": 3471,
    "name": "Technician, gallery"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, genetics"
  },
  {
    "isco08": 3111,
    "isco88": 3111,
    "name": "Technician, geology"
  },
  {
    "isco08": 3111,
    "isco88": 3111,
    "name": "Technician, geophysics"
  },
  {
    "isco08": 3112,
    "isco88": 3151,
    "name": "Technician, geotechnical"
  },
  {
    "isco08": 3212,
    "isco88": 3211,
    "name": "Technician, haematology"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Technician, hardware: computers"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Technician, health information"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Technician, hearing aid"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Technician, helpdesk: computing"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, herbarium"
  },
  {
    "isco08": 3212,
    "isco88": 3211,
    "name": "Technician, histology"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Technician, homeopathy"
  },
  {
    "isco08": 3142,
    "isco88": 3212,
    "name": "Technician, horticultural"
  },
  {
    "isco08": 8131,
    "isco88": 8159,
    "name": "Technician, hot cell"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Technician, hydrotherapy"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Technician, internet helpdesk"
  },
  {
    "isco08": 3433,
    "isco88": 3439,
    "name": "Technician, library"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, life science"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Technician, lighting"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, magnetic resonance imaging"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, mammography"
  },
  {
    "isco08": 3115,
    "isco88": 3115,
    "name": "Technician, mechatronics: engineering"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Technician, mechatronics: servicing motor vehicles"
  },
  {
    "isco08": 3212,
    "isco88": 3211,
    "name": "Technician, medical laboratory"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, medical radiography equipment"
  },
  {
    "isco08": 3252,
    "isco88": 4143,
    "name": "Technician, medical records"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, medical science"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, medical ultrasound"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, medical x-ray equipment"
  },
  {
    "isco08": 3117,
    "isco88": 3117,
    "name": "Technician, metallurgical"
  },
  {
    "isco08": 3117,
    "isco88": 3117,
    "name": "Technician, metallurgy"
  },
  {
    "isco08": 3111,
    "isco88": 3111,
    "name": "Technician, meteorology"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Technician, motor vehicle engine and fuel systems service"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Technician, motor vehicle mechatronics service"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Technician, motor vehicle service"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, MRI"
  },
  {
    "isco08": 3433,
    "isco88": 3471,
    "name": "Technician, museum"
  },
  {
    "isco08": 3513,
    "isco88": 3121,
    "name": "Technician, network support"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, nuclear medicine"
  },
  {
    "isco08": 3111,
    "isco88": 3111,
    "name": "Technician, oceanography"
  },
  {
    "isco08": 3142,
    "isco88": 3212,
    "name": "Technician, olericulture"
  },
  {
    "isco08": 3214,
    "isco88": 3226,
    "name": "Technician, orthopaedic"
  },
  {
    "isco08": 3214,
    "isco88": 7311,
    "name": "Technician, orthotic"
  },
  {
    "isco08": 3212,
    "isco88": 3211,
    "name": "Technician, pathology"
  },
  {
    "isco08": 3212,
    "isco88": 3211,
    "name": "Technician, pathology laboratory"
  },
  {
    "isco08": 7544,
    "isco88": 7143,
    "name": "Technician, pest control"
  },
  {
    "isco08": 3213,
    "isco88": 3228,
    "name": "Technician, pharmaceutical"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, pharmacology"
  },
  {
    "isco08": 3213,
    "isco88": 3228,
    "name": "Technician, pharmacy"
  },
  {
    "isco08": 7421,
    "isco88": 7243,
    "name": "Technician, photocopy machine"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Technician, physical rehabilitation"
  },
  {
    "isco08": 3111,
    "isco88": 3111,
    "name": "Technician, physics"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, physiology"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Technician, physiotherapy"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, plant breeding"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, polysomnography"
  },
  {
    "isco08": 3142,
    "isco88": 3212,
    "name": "Technician, pomology"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Technician, pool: cleaning"
  },
  {
    "isco08": 3142,
    "isco88": 3213,
    "name": "Technician, poultry"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Technician, process control: coal gas production"
  },
  {
    "isco08": 3214,
    "isco88": 3226,
    "name": "Technician, prosthetic"
  },
  {
    "isco08": 3139,
    "isco88": 8142,
    "name": "Technician, pulping"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, quantity: surveying"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, radiation therapy"
  },
  {
    "isco08": 3134,
    "isco88": 8155,
    "name": "Technician, refinery process"
  },
  {
    "isco08": 3259,
    "isco88": 3229,
    "name": "Technician, respiratory therapy"
  },
  {
    "isco08": 3119,
    "isco88": 3123,
    "name": "Technician, robotics"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technician, scanning equipment: medical"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, serology"
  },
  {
    "isco08": 3143,
    "isco88": 3212,
    "name": "Technician, silviculture"
  },
  {
    "isco08": 3512,
    "isco88": 3121,
    "name": "Technician, software"
  },
  {
    "isco08": 3142,
    "isco88": 3212,
    "name": "Technician, soil science"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Technician, sound: studio (radio)"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Technician, sound: studio (television)"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Technician, sound-effects"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Technician, sound-testing"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Technician, special effects"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Technician, stage"
  },
  {
    "isco08": 2240,
    "isco88": 3221,
    "name": "Technician, surgical"
  },
  {
    "isco08": 3112,
    "isco88": 3112,
    "name": "Technician, surveying"
  },
  {
    "isco08": 9129,
    "isco88": 9132,
    "name": "Technician, swimming pool: cleaning"
  },
  {
    "isco08": 3513,
    "isco88": 3121,
    "name": "Technician, system: computer"
  },
  {
    "isco08": 7422,
    "isco88": 7244,
    "name": "Technician, telecommunications"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Technician, theatre"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, time and motion study"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, tissue culture"
  },
  {
    "isco08": 3240,
    "isco88": 3227,
    "name": "Technician, veterinary"
  },
  {
    "isco08": 3521,
    "isco88": 3131,
    "name": "Technician, video"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Technician, website"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, wildlife"
  },
  {
    "isco08": 3119,
    "isco88": 3119,
    "name": "Technician, work study"
  },
  {
    "isco08": 3141,
    "isco88": 3211,
    "name": "Technician, zoology"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, brewing"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Technologist, building: materials"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technologist, cat scan"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Technologist, cement"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Technologist, ceramics"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, chemical process"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technologist, computer aided tomography"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technologist, ct scan"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, engineering: chemical"
  },
  {
    "isco08": 2142,
    "isco88": 2142,
    "name": "Technologist, engineering: civil"
  },
  {
    "isco08": 2151,
    "isco88": 2143,
    "name": "Technologist, engineering: electrical"
  },
  {
    "isco08": 2152,
    "isco88": 2144,
    "name": "Technologist, engineering: electronics"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Technologist, engineering: mechanical"
  },
  {
    "isco08": 2153,
    "isco88": 2144,
    "name": "Technologist, engineering: telecommunications"
  },
  {
    "isco08": 2146,
    "isco88": 2147,
    "name": "Technologist, extractive"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, fibre"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, food and drink"
  },
  {
    "isco08": 3143,
    "isco88": 3212,
    "name": "Technologist, forestry"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, fuel"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Technologist, glass"
  },
  {
    "isco08": 2511,
    "isco88": 2131,
    "name": "Technologist, information: business analysis"
  },
  {
    "isco08": 2522,
    "isco88": 2131,
    "name": "Technologist, information: systems administration"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Technologist, leather"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technologist, magnetic resonance imaging"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technologist, medical imaging"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technologist, MRI"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technologist, neurodiagnostic"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technologist, nuclear medicine"
  },
  {
    "isco08": 2141,
    "isco88": 2149,
    "name": "Technologist, packaging"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, paint"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, paper"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, plastics"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, polymer"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technologist, polysomnography"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Technologist, printing"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Technologist, radiation therapy"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, rubber"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Technologist, textiles"
  },
  {
    "isco08": 2145,
    "isco88": 2146,
    "name": "Technologist, tyre"
  },
  {
    "isco08": 2144,
    "isco88": 2145,
    "name": "Technologist, welding"
  },
  {
    "isco08": 2149,
    "isco88": 2149,
    "name": "Technologist, wood"
  },
  {
    "isco08": 3522,
    "isco88": 3132,
    "name": "Telegrapher"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Telemarketer"
  },
  {
    "isco08": 4223,
    "isco88": 4223,
    "name": "Telephonist"
  },
  {
    "isco08": 4131,
    "isco88": 4112,
    "name": "Teletypist"
  },
  {
    "isco08": 4211,
    "isco88": 4211,
    "name": "Teller, bank"
  },
  {
    "isco08": 5161,
    "isco88": 5152,
    "name": "Teller, fortune"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Temperer, chocolate"
  },
  {
    "isco08": 8182,
    "isco88": 8162,
    "name": "Tender, boiler"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Tender, jig"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Tender, lighthouse"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Tender, poultry"
  },
  {
    "isco08": 8343,
    "isco88": 8333,
    "name": "Tender, skip"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Tender, veneer dryer"
  },
  {
    "isco08": 3132,
    "isco88": 8163,
    "name": "Tender, water dam"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Tenoner"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Tenor"
  },
  {
    "isco08": 5165,
    "isco88": 3340,
    "name": "Tester, driving"
  },
  {
    "isco08": 3117,
    "isco88": 7111,
    "name": "Tester, hardness"
  },
  {
    "isco08": 3142,
    "isco88": 3213,
    "name": "Tester, herd"
  },
  {
    "isco08": 2519,
    "isco88": 2139,
    "name": "Tester, software"
  },
  {
    "isco08": 2519,
    "isco88": 2139,
    "name": "Tester, systems"
  },
  {
    "isco08": 3153,
    "isco88": 3143,
    "name": "Test-pilot, aircraft"
  },
  {
    "isco08": 7121,
    "isco88": 7131,
    "name": "Thatcher"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Theologian"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Therapist, acupressure"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Therapist, arts"
  },
  {
    "isco08": 5142,
    "isco88": 5141,
    "name": "Therapist, beauty"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Therapist, blind"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Therapist, dance"
  },
  {
    "isco08": 3251,
    "isco88": 3225,
    "name": "Therapist, dental"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Therapist, drama"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Therapist, family"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Therapist, hydrotherapy"
  },
  {
    "isco08": 2266,
    "isco88": 3229,
    "name": "Therapist, language"
  },
  {
    "isco08": 2264,
    "isco88": 3226,
    "name": "Therapist, manipulative"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Therapist, marriage"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Therapist, massage"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Therapist, medical radiation"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Therapist, movement"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Therapist, music"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Therapist, nuclear medicine"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Therapist, occupational"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Therapist, orientation of the blind"
  },
  {
    "isco08": 2264,
    "isco88": 3226,
    "name": "Therapist, physical"
  },
  {
    "isco08": 2264,
    "isco88": 3226,
    "name": "Therapist, physical: geriatric"
  },
  {
    "isco08": 2264,
    "isco88": 3226,
    "name": "Therapist, physical: orthopaedic"
  },
  {
    "isco08": 2264,
    "isco88": 3226,
    "name": "Therapist, physical: paediatric"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Therapist, poetry"
  },
  {
    "isco08": 2634,
    "isco88": 2445,
    "name": "Therapist, psychological"
  },
  {
    "isco08": 2269,
    "isco88": 3226,
    "name": "Therapist, recreational"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Therapist, relationship"
  },
  {
    "isco08": 3230,
    "isco88": 3241,
    "name": "Therapist, scraping and cupping"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Therapist, sex"
  },
  {
    "isco08": 3255,
    "isco88": 3226,
    "name": "Therapist, shiatsu"
  },
  {
    "isco08": 2266,
    "isco88": 3229,
    "name": "Therapist, speech"
  },
  {
    "isco08": 2230,
    "isco88": 3241,
    "name": "Therapist, unani"
  },
  {
    "isco08": 2111,
    "isco88": 2111,
    "name": "Thermodynamicist"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Threader, loom"
  },
  {
    "isco08": 8152,
    "isco88": 7432,
    "name": "Threader, loom: machine"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Thrower, pottery and porcelain"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Tiler"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Tiler, floor"
  },
  {
    "isco08": 7121,
    "isco88": 7131,
    "name": "Tiler, roof"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Tiler, wall"
  },
  {
    "isco08": 9520,
    "isco88": 9112,
    "name": "Tinker"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Tinsmith"
  },
  {
    "isco08": 7222,
    "isco88": 7222,
    "name": "Toolmaker"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Toolpusher"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Toolsmith"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Topper, logging"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Toucher-up, ceramics decoration"
  },
  {
    "isco08": 8113,
    "isco88": 8113,
    "name": "Tourpusher"
  },
  {
    "isco08": 2131,
    "isco88": 2212,
    "name": "Toxicologist"
  },
  {
    "isco08": 2133,
    "isco88": 2211,
    "name": "Toxicologist, environmental"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Toymaker, dolls"
  },
  {
    "isco08": 7319,
    "isco88": 7223,
    "name": "Toymaker, metal"
  },
  {
    "isco08": 7533,
    "isco88": 7436,
    "name": "Toymaker, soft toys"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Toymaker, wooden"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Tracer, ceramics decoration"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Trackman, railway"
  },
  {
    "isco08": 9312,
    "isco88": 9312,
    "name": "Trackwoman, railway"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Trader, bond"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Trader, commodities"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Trader, derivatives"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Trader, Ebay"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Trader, financial"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Trader, foreign exchange"
  },
  {
    "isco08": 3324,
    "isco88": 3421,
    "name": "Trader, futures: commodities"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Trader, futures: financial"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Trader, securities"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Trader, stock"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Trainer, aerobics"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Trainer, boxing"
  },
  {
    "isco08": 2356,
    "isco88": 2359,
    "name": "Trainer, computer"
  },
  {
    "isco08": 9411,
    "isco88": 5122,
    "name": "Trainer, crew: fast food"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Trainer, dog"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Trainer, fitness"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Trainer, golf"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Trainer, horse"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Trainer, horse-breaking"
  },
  {
    "isco08": 2356,
    "isco88": 2359,
    "name": "Trainer, information technology"
  },
  {
    "isco08": 2356,
    "isco88": 2359,
    "name": "Trainer, internet"
  },
  {
    "isco08": 2356,
    "isco88": 2359,
    "name": "Trainer, IT"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Trainer, martial arts"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Trainer, personal"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Trainer, physical"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Trainer, racehorse"
  },
  {
    "isco08": 2356,
    "isco88": 2359,
    "name": "Trainer, software"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Trainer, sports"
  },
  {
    "isco08": 2424,
    "isco88": 2412,
    "name": "Trainer, staff development"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Trainer, wild animals"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Trainer, wrestling"
  },
  {
    "isco08": 3423,
    "isco88": 3475,
    "name": "Trainer, yoga"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Transcriber, music"
  },
  {
    "isco08": 3344,
    "isco88": 4115,
    "name": "Transcriptionist, medical"
  },
  {
    "isco08": 7316,
    "isco88": 7324,
    "name": "Transferrer, ceramics decoration"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Transferrer, lithographic"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Transferrer, photo-mechanical: printing plates"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Translator"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Translator-reviser"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Trapper, fur"
  },
  {
    "isco08": 6340,
    "isco88": 6210,
    "name": "Trapper, subsistence"
  },
  {
    "isco08": 6224,
    "isco88": 6154,
    "name": "Trapper-hunter, fur"
  },
  {
    "isco08": 3322,
    "isco88": 3415,
    "name": "Traveller, commercial"
  },
  {
    "isco08": 1211,
    "isco88": 1231,
    "name": "Treasurer, company"
  },
  {
    "isco08": 3117,
    "isco88": 3117,
    "name": "Treater, well acidising"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Treater, wood"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Treelopper"
  },
  {
    "isco08": 3259,
    "isco88": 5141,
    "name": "Trichologist"
  },
  {
    "isco08": 9331,
    "isco88": 9331,
    "name": "Tricyclist"
  },
  {
    "isco08": 7536,
    "isco88": 7442,
    "name": "Trimmer, footwear finishing"
  },
  {
    "isco08": 7531,
    "isco88": 7434,
    "name": "Trimmer, fur"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Trimmer, meat"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Trimmer, tree: forestry"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Trimmer, tree: garden maintenance"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Trombonist"
  },
  {
    "isco08": "0310",
    "isco88": "0110",
    "name": "Trooper"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Trumpeter"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Trustee, bankruptcy"
  },
  {
    "isco08": 2411,
    "isco88": 2411,
    "name": "Trustee, insolvency"
  },
  {
    "isco08": 7112,
    "isco88": 7122,
    "name": "Tuckpointer"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Tufter, carpet weaving"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Tumbler"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Tuner, accordion"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Tuner, musical instrument"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Tuner, organ"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Tuner, piano"
  },
  {
    "isco08": 7231,
    "isco88": 7231,
    "name": "Tuner, vehicle engine"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Tuner, wood"
  },
  {
    "isco08": 7223,
    "isco88": 7223,
    "name": "Turner, metal"
  },
  {
    "isco08": 7314,
    "isco88": 7321,
    "name": "Turner, pottery and porcelain"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Turner, wood"
  },
  {
    "isco08": 7321,
    "isco88": 7343,
    "name": "Tuscher, lithographic"
  },
  {
    "isco08": 2353,
    "isco88": 2359,
    "name": "Tutor, after school: languages"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, after school: mathematics"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Tutor, art: private tuition"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, calligraphy"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, chemistry: private tuition"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, coaching college"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Tutor, dance: private tuition"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Tutor, drama: private tuition"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, dressmaking: private tuition"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, elocution: private tuition"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, handicrafts: private tuition"
  },
  {
    "isco08": 2353,
    "isco88": 2359,
    "name": "Tutor, language: private tuition"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, literacy and numeracy: private tuition"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, literacy: private tuition"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, maths: private tuition"
  },
  {
    "isco08": 2354,
    "isco88": 2359,
    "name": "Tutor, music: private tuition"
  },
  {
    "isco08": 2355,
    "isco88": 2359,
    "name": "Tutor, painting: private tuition"
  },
  {
    "isco08": 2359,
    "isco88": 3340,
    "name": "Tutor, private tuition"
  },
  {
    "isco08": 2354,
    "isco88": 2359,
    "name": "Tutor, private tuition: music"
  },
  {
    "isco08": 2354,
    "isco88": 2359,
    "name": "Tutor, private tuition: singing"
  },
  {
    "isco08": 2310,
    "isco88": 2310,
    "name": "Tutor, university"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Tympanist"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Typesetter"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Typesetter, linotype"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Typesetter, photo-type"
  },
  {
    "isco08": 4131,
    "isco88": 4111,
    "name": "Typist"
  },
  {
    "isco08": 4131,
    "isco88": 4111,
    "name": "Typist, shorthand"
  },
  {
    "isco08": 7321,
    "isco88": 7341,
    "name": "Typographer"
  },
  {
    "isco08": 3211,
    "isco88": 3133,
    "name": "Ultrasonographer"
  },
  {
    "isco08": 3422,
    "isco88": 3475,
    "name": "Umpire, sports"
  },
  {
    "isco08": 3121,
    "isco88": 7111,
    "name": "Under-manager, mine"
  },
  {
    "isco08": 1112,
    "isco88": 1120,
    "name": "Under-secretary, government"
  },
  {
    "isco08": 5163,
    "isco88": 5143,
    "name": "Undertaker"
  },
  {
    "isco08": 3321,
    "isco88": 3412,
    "name": "Underwriter, insurance"
  },
  {
    "isco08": 3311,
    "isco88": 3411,
    "name": "Underwriter, investments"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Underwriter, loans"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Underwriter, mortgages"
  },
  {
    "isco08": 9333,
    "isco88": 9333,
    "name": "Unloader, freight"
  },
  {
    "isco08": 7534,
    "isco88": 7437,
    "name": "Upholsterer"
  },
  {
    "isco08": 7534,
    "isco88": 7437,
    "name": "Upholsterer, furniture"
  },
  {
    "isco08": 7534,
    "isco88": 7437,
    "name": "Upholsterer, orthopaedic"
  },
  {
    "isco08": 7534,
    "isco88": 7437,
    "name": "Upholsterer, vehicle"
  },
  {
    "isco08": 2212,
    "isco88": 2221,
    "name": "Urologist"
  },
  {
    "isco08": 9622,
    "isco88": 9162,
    "name": "Useful, hotel"
  },
  {
    "isco08": 9629,
    "isco88": 9152,
    "name": "Usher"
  },
  {
    "isco08": 3240,
    "isco88": 3227,
    "name": "Vaccinator, veterinary"
  },
  {
    "isco08": 8322,
    "isco88": 8322,
    "name": "Valet, parking"
  },
  {
    "isco08": 5162,
    "isco88": 5142,
    "name": "Valet, personal"
  },
  {
    "isco08": 3315,
    "isco88": 3417,
    "name": "Valuer"
  },
  {
    "isco08": 4131,
    "isco88": 4111,
    "name": "Varitypist"
  },
  {
    "isco08": 7132,
    "isco88": 7142,
    "name": "Varnisher"
  },
  {
    "isco08": 7132,
    "isco88": 7142,
    "name": "Varnisher, manufactured articles"
  },
  {
    "isco08": 7132,
    "isco88": 7142,
    "name": "Varnisher, metal"
  },
  {
    "isco08": 7132,
    "isco88": 7142,
    "name": "Varnisher, vehicle"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Varnisher, wooden furniture"
  },
  {
    "isco08": 5212,
    "isco88": 9111,
    "name": "Vendor, fresh-water: street"
  },
  {
    "isco08": 5211,
    "isco88": 5230,
    "name": "Vendor, market"
  },
  {
    "isco08": 9520,
    "isco88": 9112,
    "name": "Vendor, newspaper"
  },
  {
    "isco08": 5212,
    "isco88": 9111,
    "name": "Vendor, refreshments: street"
  },
  {
    "isco08": 5212,
    "isco88": 9111,
    "name": "Vendor, street: drinks"
  },
  {
    "isco08": 5212,
    "isco88": 9111,
    "name": "Vendor, street: food"
  },
  {
    "isco08": 9520,
    "isco88": 9112,
    "name": "Vendor, street: non-food products"
  },
  {
    "isco08": 9629,
    "isco88": 9112,
    "name": "Vendor, theatre programme"
  },
  {
    "isco08": 2659,
    "isco88": 3474,
    "name": "Ventriloquist"
  },
  {
    "isco08": 5153,
    "isco88": 9141,
    "name": "Verger"
  },
  {
    "isco08": 2250,
    "isco88": 2223,
    "name": "Veterinarian"
  },
  {
    "isco08": 2636,
    "isco88": 2460,
    "name": "Vicar"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Vice-admiral"
  },
  {
    "isco08": 1120,
    "isco88": 1210,
    "name": "Vice-chancellor, university"
  },
  {
    "isco08": "0110",
    "isco88": "0110",
    "name": "Vice-marshal, air"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Viniculturist"
  },
  {
    "isco08": 2652,
    "isco88": 2453,
    "name": "Violinist"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Viticulturist"
  },
  {
    "isco08": 7312,
    "isco88": 7312,
    "name": "Voicer, organ"
  },
  {
    "isco08": 2114,
    "isco88": 2114,
    "name": "Volcanologist"
  },
  {
    "isco08": 8141,
    "isco88": 8231,
    "name": "Vulcanizer"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Waiter"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Waiter, head"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Waiter, wine"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Waitress"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Waitress, head"
  },
  {
    "isco08": 5131,
    "isco88": 5123,
    "name": "Waitress, wine"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Walker-on"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Warden, bird sanctuary"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Warden, camp"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Warden, community centre: associate professional"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Warden, community centre: professional"
  },
  {
    "isco08": 5151,
    "isco88": 5121,
    "name": "Warden, dormitory"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Warden, game"
  },
  {
    "isco08": 5413,
    "isco88": 5163,
    "name": "Warden, prison"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Warden, probation home: associate professional"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Warden, probation home: professional"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Warden, traffic"
  },
  {
    "isco08": 5419,
    "isco88": 5169,
    "name": "Warden, wild life"
  },
  {
    "isco08": 5413,
    "isco88": 5163,
    "name": "Warder, prison"
  },
  {
    "isco08": 5329,
    "isco88": 5132,
    "name": "Wardsman"
  },
  {
    "isco08": 5329,
    "isco88": 5132,
    "name": "Wardswoman"
  },
  {
    "isco08": 9122,
    "isco88": 9142,
    "name": "Washer, car"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Washer, coal"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Washer, dishes"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Washer, hand: carcass"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Washer, hand: cloth"
  },
  {
    "isco08": 9412,
    "isco88": 9132,
    "name": "Washer, hand: dishes"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Washer, hand: fibre"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Washer, hand: hide"
  },
  {
    "isco08": 9121,
    "isco88": 9133,
    "name": "Washer, hand: laundry"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Washer, hand: manufacturing process"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Washer, hand: street (car windows)"
  },
  {
    "isco08": 9122,
    "isco88": 9142,
    "name": "Washer, hand: vehicle"
  },
  {
    "isco08": 9329,
    "isco88": 9322,
    "name": "Washer, hand: yarn"
  },
  {
    "isco08": 9123,
    "isco88": 9142,
    "name": "Washer, window"
  },
  {
    "isco08": 9510,
    "isco88": 9120,
    "name": "Washer, window: car (street)"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Wastepicker"
  },
  {
    "isco08": 7311,
    "isco88": 7311,
    "name": "Watchmaker"
  },
  {
    "isco08": 5414,
    "isco88": 9152,
    "name": "Watchman"
  },
  {
    "isco08": 5414,
    "isco88": 9152,
    "name": "Watchwoman"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Waterman"
  },
  {
    "isco08": 8350,
    "isco88": 8340,
    "name": "Waterwoman"
  },
  {
    "isco08": 7316,
    "isco88": 7323,
    "name": "Waxer, glass sandblasting"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Weaver, basket"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Weaver, carpet"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Weaver, cloth"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Weaver, jacquard"
  },
  {
    "isco08": 7317,
    "isco88": 7424,
    "name": "Weaver, straw"
  },
  {
    "isco08": 7318,
    "isco88": 7432,
    "name": "Weaver, tapestry"
  },
  {
    "isco08": 3514,
    "isco88": 3121,
    "name": "Webmaster"
  },
  {
    "isco08": 7212,
    "isco88": 7212,
    "name": "Welder"
  },
  {
    "isco08": 7541,
    "isco88": 7216,
    "name": "Welder, underwater"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Wharfinger"
  },
  {
    "isco08": 7224,
    "isco88": 7224,
    "name": "Wheel-grinder, metal"
  },
  {
    "isco08": 7522,
    "isco88": 7422,
    "name": "Wheelwright"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Whip, chief"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Whip, government"
  },
  {
    "isco08": 1111,
    "isco88": 1110,
    "name": "Whip, opposition"
  },
  {
    "isco08": 7131,
    "isco88": 7141,
    "name": "Whitewasher"
  },
  {
    "isco08": 1420,
    "isco88": 1314,
    "name": "Wholesaler"
  },
  {
    "isco08": 7318,
    "isco88": 7431,
    "name": "Willeyer"
  },
  {
    "isco08": 9329,
    "isco88": 9321,
    "name": "Winder, armature: hand"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Winder, armature: operating  machine"
  },
  {
    "isco08": 9329,
    "isco88": 9321,
    "name": "Winder, coil: hand"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Winder, coil: operating  machine"
  },
  {
    "isco08": 9329,
    "isco88": 9321,
    "name": "Winder, filament: hand"
  },
  {
    "isco08": 8212,
    "isco88": 8283,
    "name": "Winder, filament: operating  machine"
  },
  {
    "isco08": 9329,
    "isco88": 9321,
    "name": "Winder, rotor coil: hand"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Winder, rotor coil: operating  machine"
  },
  {
    "isco08": 9329,
    "isco88": 9321,
    "name": "Winder, stator coil: hand"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Winder, stator coil: operating  machine"
  },
  {
    "isco08": 9329,
    "isco88": 9321,
    "name": "Winder, transformer coil: hand"
  },
  {
    "isco08": 8212,
    "isco88": 8282,
    "name": "Winder, transformer coil: operating  machine"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Winegrower"
  },
  {
    "isco08": 8160,
    "isco88": 8277,
    "name": "Winnower, cocoa-bean"
  },
  {
    "isco08": 3258,
    "isco88": 5132,
    "name": "Woman, ambulance"
  },
  {
    "isco08": 9622,
    "isco88": 9162,
    "name": "Woman, odd-job"
  },
  {
    "isco08": 3435,
    "isco88": 3474,
    "name": "Woman, stunt"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Woodcutter, forest"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Woodman"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Woodwoman"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Woodworker, dovetailing"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Woodworker, dowelling"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Woodworker, morticing"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Woodworker, sanding"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Woodworker, tenoning"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Woodworker, treating"
  },
  {
    "isco08": 7543,
    "isco88": 3152,
    "name": "Woolclasser"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Worker,  skilled: afforestation"
  },
  {
    "isco08": 3258,
    "isco88": 5132,
    "name": "Worker, ambulance"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Worker, apiary: skilled"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Worker, beekeeping: skilled"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Worker, cable: bridge"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Worker, cable: data"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Worker, cable: electric power (overhead cables)"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Worker, cable: electric power (underground cables)"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Worker, cable: electric traction (overhead cables)"
  },
  {
    "isco08": 7215,
    "isco88": 7215,
    "name": "Worker, cable: suspension bridge"
  },
  {
    "isco08": 7422,
    "isco88": 7243,
    "name": "Worker, cable: telecommunications"
  },
  {
    "isco08": 7422,
    "isco88": 7245,
    "name": "Worker, cable: telegraph"
  },
  {
    "isco08": 7422,
    "isco88": 7245,
    "name": "Worker, cable: telephone"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Worker, child care"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Worker, community development"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Worker, community services"
  },
  {
    "isco08": 3253,
    "isco88": 3221,
    "name": "Worker, community: health"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Worker, crisis intervention"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Worker, cyanide: separation equipment"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Worker, darkroom: film developing"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Worker, darkroom: photograph enlarging"
  },
  {
    "isco08": 8132,
    "isco88": 7344,
    "name": "Worker, darkroom: photograph printing"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Worker, delinquency: associate professional"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Worker, delinquency: professional"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Worker, demolition: skilled"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Worker, disability services"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Worker, drop hammer"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Worker, family day care"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Worker, family services"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Worker, farm: skilled (cattle)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (cocoa)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (coffee)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (cotton)"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Worker, farm: skilled (dairy)"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Worker, farm: skilled (domestic fur-bearing animals)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (field crops)"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Worker, farm: skilled (fish)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (flax)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (fruit)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (groundnut)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (grove)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (hops)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (irrigation)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (jute)"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Worker, farm: skilled (livestock)"
  },
  {
    "isco08": 6114,
    "isco88": 6114,
    "name": "Worker, farm: skilled (mixed crops)"
  },
  {
    "isco08": 6130,
    "isco88": 6130,
    "name": "Worker, farm: skilled (mixed livestock and crops)"
  },
  {
    "isco08": 6121,
    "isco88": 6124,
    "name": "Worker, farm: skilled (mixed-animal husbandry)"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Worker, farm: skilled (mushroom)"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Worker, farm: skilled (non-domesticated fur-bearing animals)"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Worker, farm: skilled (nursery)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (orchard)"
  },
  {
    "isco08": 6129,
    "isco88": 6129,
    "name": "Worker, farm: skilled (ostrich)"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Worker, farm: skilled (oyster)"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Worker, farm: skilled (pig)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (potato)"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Worker, farm: skilled (poultry)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (rice)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (rubber)"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Worker, farm: skilled (seafood)"
  },
  {
    "isco08": 6121,
    "isco88": 6121,
    "name": "Worker, farm: skilled (sheep)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (shrub crop)"
  },
  {
    "isco08": 6330,
    "isco88": 6210,
    "name": "Worker, farm: skilled (subsistence farming)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (sugar-beet)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (sugar-cane)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (tea)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (tobacco)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (tree crop)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (vegetables)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, farm: skilled (vineyard)"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, farm: skilled (wheat)"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Worker, fishery: skilled (coastal waters)"
  },
  {
    "isco08": 6223,
    "isco88": 6153,
    "name": "Worker, fishery: skilled (deep-sea)"
  },
  {
    "isco08": 6222,
    "isco88": 6152,
    "name": "Worker, fishery: skilled (inland)"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Worker, fishery: skilled (pisciculture)"
  },
  {
    "isco08": 8112,
    "isco88": 8112,
    "name": "Worker, flotation: mineral processing"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Worker, forestry: skilled"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Worker, forestry: skilled (charcoal burning (traditional techniques))"
  },
  {
    "isco08": 6210,
    "isco88": 6141,
    "name": "Worker, forestry: skilled (wood distillation (traditional techniques))"
  },
  {
    "isco08": 7221,
    "isco88": 7221,
    "name": "Worker, forging press"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Worker, garden"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Worker, garden maintenance"
  },
  {
    "isco08": 7315,
    "isco88": 7322,
    "name": "Worker, glass"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Worker, greenhouse: skilled"
  },
  {
    "isco08": 7317,
    "isco88": 7331,
    "name": "Worker, handicraft: basketry"
  },
  {
    "isco08": 7319,
    "isco88": 7331,
    "name": "Worker, handicraft: candle making"
  },
  {
    "isco08": 7318,
    "isco88": 7332,
    "name": "Worker, handicraft: carpets"
  },
  {
    "isco08": 7318,
    "isco88": 7332,
    "name": "Worker, handicraft: garment knitting"
  },
  {
    "isco08": 7318,
    "isco88": 7332,
    "name": "Worker, handicraft: garments"
  },
  {
    "isco08": 7318,
    "isco88": 7332,
    "name": "Worker, handicraft: leather"
  },
  {
    "isco08": 7318,
    "isco88": 7332,
    "name": "Worker, handicraft: leather accessories"
  },
  {
    "isco08": 7317,
    "isco88": 7331,
    "name": "Worker, handicraft: paper articles"
  },
  {
    "isco08": 7317,
    "isco88": 7331,
    "name": "Worker, handicraft: reed weaving"
  },
  {
    "isco08": 7319,
    "isco88": 7331,
    "name": "Worker, handicraft: stone articles"
  },
  {
    "isco08": 7317,
    "isco88": 7331,
    "name": "Worker, handicraft: straw articles"
  },
  {
    "isco08": 7318,
    "isco88": 7332,
    "name": "Worker, handicraft: textile weaving"
  },
  {
    "isco08": 7318,
    "isco88": 7332,
    "name": "Worker, handicraft: textiles"
  },
  {
    "isco08": 7317,
    "isco88": 7331,
    "name": "Worker, handicraft: wooden articles"
  },
  {
    "isco08": 6221,
    "isco88": 6151,
    "name": "Worker, hatchery: skilled (fish)"
  },
  {
    "isco08": 6122,
    "isco88": 6122,
    "name": "Worker, hatchery: skilled (poultry)"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Worker, home care"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Worker, home support"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Worker, horticultural: skilled"
  },
  {
    "isco08": 7124,
    "isco88": 7134,
    "name": "Worker, insulation"
  },
  {
    "isco08": 7124,
    "isco88": 7134,
    "name": "Worker, insulation: acoustic"
  },
  {
    "isco08": 7124,
    "isco88": 7134,
    "name": "Worker, insulation: boiler and pipe"
  },
  {
    "isco08": 7124,
    "isco88": 7134,
    "name": "Worker, insulation: building"
  },
  {
    "isco08": 7124,
    "isco88": 7134,
    "name": "Worker, insulation: refrigeration and air conditioning equipment"
  },
  {
    "isco08": 7124,
    "isco88": 7134,
    "name": "Worker, insulation: sound-proofing"
  },
  {
    "isco08": 7114,
    "isco88": 7123,
    "name": "Worker, iron: concrete (reinforcement)"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Worker, iron: structural"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, irrigation: skilled"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Worker, kennel"
  },
  {
    "isco08": 5164,
    "isco88": 6121,
    "name": "Worker, kennel: skilled"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Worker, laboratory: skilled (animals)"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Worker, lay"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Worker, line: electric power"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Worker, line: electric traction"
  },
  {
    "isco08": 7422,
    "isco88": 7245,
    "name": "Worker, line: telecommunications"
  },
  {
    "isco08": 7422,
    "isco88": 7245,
    "name": "Worker, line: telegraph"
  },
  {
    "isco08": 7422,
    "isco88": 7245,
    "name": "Worker, line: telephone"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Worker, maintenance: building"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Worker, maintenance: gardening"
  },
  {
    "isco08": 6113,
    "isco88": 6113,
    "name": "Worker, market gardening: skilled"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Worker, mental health support"
  },
  {
    "isco08": 9334,
    "isco88": 9333,
    "name": "Worker, nightfill"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Worker, nursery: horticulture"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Worker, offal"
  },
  {
    "isco08": 5311,
    "isco88": 5131,
    "name": "Worker, out of school hours care"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Worker, oven: biscuits"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Worker, oven: bread"
  },
  {
    "isco08": 7512,
    "isco88": 7412,
    "name": "Worker, oven: flour (confectionery)"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Worker, parish"
  },
  {
    "isco08": 7122,
    "isco88": 7132,
    "name": "Worker, parquetry"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Worker, personal care: home"
  },
  {
    "isco08": 7126,
    "isco88": 7136,
    "name": "Worker, pipeline"
  },
  {
    "isco08": 9214,
    "isco88": 9211,
    "name": "Worker, plant nursery"
  },
  {
    "isco08": 6111,
    "isco88": 6111,
    "name": "Worker, plantation: skilled (cotton)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, plantation: skilled (rubber)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, plantation: skilled (shrub crop)"
  },
  {
    "isco08": 6112,
    "isco88": 6112,
    "name": "Worker, plantation: skilled (tea)"
  },
  {
    "isco08": 9612,
    "isco88": 9161,
    "name": "Worker, recycling"
  },
  {
    "isco08": 3413,
    "isco88": 3480,
    "name": "Worker, religious"
  },
  {
    "isco08": 5322,
    "isco88": 5133,
    "name": "Worker, respite care"
  },
  {
    "isco08": 6123,
    "isco88": 6123,
    "name": "Worker, sericultural: skilled"
  },
  {
    "isco08": 5169,
    "isco88": 5149,
    "name": "Worker, sex: providing sexual services"
  },
  {
    "isco08": 5244,
    "isco88": 9113,
    "name": "Worker, sex: telephone or internet"
  },
  {
    "isco08": 7213,
    "isco88": 7213,
    "name": "Worker, sheet-metal"
  },
  {
    "isco08": 7323,
    "isco88": 8252,
    "name": "Worker, small machine bindery"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Worker, smokehouse: fish"
  },
  {
    "isco08": 7511,
    "isco88": 7411,
    "name": "Worker, smokehouse: meat"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Worker, social"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Worker, social: associate professional"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Worker, social: probation"
  },
  {
    "isco08": 7113,
    "isco88": 7113,
    "name": "Worker, stonework: layout"
  },
  {
    "isco08": 7214,
    "isco88": 7214,
    "name": "Worker, structural steel: workshop"
  },
  {
    "isco08": 7114,
    "isco88": 7123,
    "name": "Worker, terrazzo"
  },
  {
    "isco08": 9215,
    "isco88": 9212,
    "name": "Worker, timber: forestry"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Worker, timbering: mine"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Worker, timbering: quarry"
  },
  {
    "isco08": 8111,
    "isco88": 7111,
    "name": "Worker, timbering: underground"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Worker, tobacco: conditioning"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Worker, tobacco: cutting"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Worker, tobacco: drying"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Worker, tobacco: leaf stemming"
  },
  {
    "isco08": 7516,
    "isco88": 7416,
    "name": "Worker, tobacco: leaf stripping"
  },
  {
    "isco08": 7541,
    "isco88": 7216,
    "name": "Worker, underwater"
  },
  {
    "isco08": 3253,
    "isco88": 3221,
    "name": "Worker, village health"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Worker, welfare support"
  },
  {
    "isco08": 2635,
    "isco88": 2446,
    "name": "Worker, welfare: professional"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Worker, wire: electric power (overhead wires)"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Worker, wire: electric power (underground wires)"
  },
  {
    "isco08": 7413,
    "isco88": 7245,
    "name": "Worker, wire: electric traction (overhead wires)"
  },
  {
    "isco08": 7422,
    "isco88": 7245,
    "name": "Worker, wire: telegraph"
  },
  {
    "isco08": 7422,
    "isco88": 7245,
    "name": "Worker, wire: telephone"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Worker, wood: dovetailing"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Worker, wood: dowelling"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Worker, wood: incising"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Worker, wood: morticing"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Worker, wood: sanding"
  },
  {
    "isco08": 7523,
    "isco88": 7423,
    "name": "Worker, wood: tenoning"
  },
  {
    "isco08": 7521,
    "isco88": 7421,
    "name": "Worker, wood: treating"
  },
  {
    "isco08": 3412,
    "isco88": 3460,
    "name": "Worker, youth services"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Worker, zoo: skilled"
  },
  {
    "isco08": 9321,
    "isco88": 9322,
    "name": "Wrapper, hand"
  },
  {
    "isco08": 7119,
    "isco88": 7129,
    "name": "Wrecker, building"
  },
  {
    "isco08": 3421,
    "isco88": 3475,
    "name": "Wrestler"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, continuity"
  },
  {
    "isco08": 2431,
    "isco88": 2451,
    "name": "Writer, copy: advertising"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Writer, copy: news media"
  },
  {
    "isco08": 2432,
    "isco88": 2451,
    "name": "Writer, copy: public relations"
  },
  {
    "isco08": 2432,
    "isco88": 2451,
    "name": "Writer, copy: publicity"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, copy: technical"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, creative"
  },
  {
    "isco08": 2643,
    "isco88": 2444,
    "name": "Writer, dictionary"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, documentation"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, drama"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Writer, feature"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, handbook"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, interactive media"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Writer, loan"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, lyric"
  },
  {
    "isco08": 3312,
    "isco88": 3419,
    "name": "Writer, mortgage"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Writer, newspaper"
  },
  {
    "isco08": 4414,
    "isco88": 4144,
    "name": "Writer, public"
  },
  {
    "isco08": 2432,
    "isco88": 2451,
    "name": "Writer, publicity"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, scenario"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, script"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, short story"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, song"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, speech"
  },
  {
    "isco08": 2642,
    "isco88": 2451,
    "name": "Writer, sports"
  },
  {
    "isco08": 2641,
    "isco88": 2451,
    "name": "Writer, technical"
  },
  {
    "isco08": 4323,
    "isco88": 4131,
    "name": "Yardmaster, railway"
  },
  {
    "isco08": 5164,
    "isco88": 6129,
    "name": "Zookeeper"
  },
  {
    "isco08": 2131,
    "isco88": 2211,
    "name": "Zoologist"
  }
  
]'::json)
)

insert into occupations (isco08, isco88, name)
select p.isco08, p.isco88, p.name
from occupation_json l
  cross join lateral json_populate_recordset(null::occupations, doc) as p;

-- +goose Down
-- SQL in this section is executed when the migration is rolled back.

DROP TABLE IF EXISTS occupations;