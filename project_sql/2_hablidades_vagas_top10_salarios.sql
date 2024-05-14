/*
Pergunta: Quais habilidades são requisitadas para as vagas que pagam os maiores salários?
- Utilizar o top 10 de vagas com maiores salários da query número 1
- Caso nem todas as vagas encontradas possuam informações sobre habilidades, aumentar o número limite da query para trabalhar com 10 vagas no total
- Adicionar as habilidades requisitadas para as vagas encontradas
- Por que? Isso irá fornecer uma visão detalhada sobre as habilidades demandadas pelas vagas com maiores remunerações
*/

WITH top_salario_vagas AS (

    SELECT
        job_id AS id_vaga,
        job_title AS titulo_vaga,
        salary_year_avg AS salario_anual,
        name AS empresa
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
        AND (job_title_short = 'Data Analyst'
        OR job_title_short = 'Business Analyst')
    ORDER BY
        salary_year_avg DESC
    LIMIT 14
)

SELECT
    top_salario_vagas.*,
    skills_dim.skills AS habilidades
FROM top_salario_vagas
INNER JOIN skills_job_dim ON top_salario_vagas.id_vaga = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salario_anual DESC;

/*
As habilidades mais demandadas em 2023 com base nas vagas analisadas foram SQL e Python,
mencionadas em 9 vagas. Em seguida, Tableau é a 3 habilidade mais requisitada, aparecendo em 7 vagas.
Excel e R também são bastante requisitados, mencionados em 4 das vagas. Outras habilidades como Snowflake,
AWS, Azure, Power BI e Jira também são relevantes, mas apareceram em menor frequência.

[
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "sql"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "python"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "r"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "azure"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "databricks"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "aws"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "pandas"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "pyspark"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "jupyter"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "excel"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "tableau"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "power bi"
  },
  {
    "id_vaga": 552322,
    "titulo_vaga": "Associate Director- Data Insights",
    "salario_anual": "255829.5",
    "empresa": "AT&T",
    "habilidades": "powerpoint"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "salario_anual": "232423.0",
    "empresa": "Pinterest Job Advertisements",
    "habilidades": "sql"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "salario_anual": "232423.0",
    "empresa": "Pinterest Job Advertisements",
    "habilidades": "python"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "salario_anual": "232423.0",
    "empresa": "Pinterest Job Advertisements",
    "habilidades": "r"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "salario_anual": "232423.0",
    "empresa": "Pinterest Job Advertisements",
    "habilidades": "hadoop"
  },
  {
    "id_vaga": 99305,
    "titulo_vaga": "Data Analyst, Marketing",
    "salario_anual": "232423.0",
    "empresa": "Pinterest Job Advertisements",
    "habilidades": "tableau"
  },
  {
    "id_vaga": 502610,
    "titulo_vaga": "Lead Business Intelligence Engineer",
    "salario_anual": "220000.0",
    "empresa": "Noom",
    "habilidades": "sql"
  },
  {
    "id_vaga": 502610,
    "titulo_vaga": "Lead Business Intelligence Engineer",
    "salario_anual": "220000.0",
    "empresa": "Noom",
    "habilidades": "python"
  },
  {
    "id_vaga": 502610,
    "titulo_vaga": "Lead Business Intelligence Engineer",
    "salario_anual": "220000.0",
    "empresa": "Noom",
    "habilidades": "excel"
  },
  {
    "id_vaga": 502610,
    "titulo_vaga": "Lead Business Intelligence Engineer",
    "salario_anual": "220000.0",
    "empresa": "Noom",
    "habilidades": "tableau"
  },
  {
    "id_vaga": 502610,
    "titulo_vaga": "Lead Business Intelligence Engineer",
    "salario_anual": "220000.0",
    "empresa": "Noom",
    "habilidades": "looker"
  },
  {
    "id_vaga": 502610,
    "titulo_vaga": "Lead Business Intelligence Engineer",
    "salario_anual": "220000.0",
    "empresa": "Noom",
    "habilidades": "chef"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "salario_anual": "217000.0",
    "empresa": "Uclahealthcareers",
    "habilidades": "sql"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "salario_anual": "217000.0",
    "empresa": "Uclahealthcareers",
    "habilidades": "crystal"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "salario_anual": "217000.0",
    "empresa": "Uclahealthcareers",
    "habilidades": "oracle"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "salario_anual": "217000.0",
    "empresa": "Uclahealthcareers",
    "habilidades": "tableau"
  },
  {
    "id_vaga": 1021647,
    "titulo_vaga": "Data Analyst (Hybrid/Remote)",
    "salario_anual": "217000.0",
    "empresa": "Uclahealthcareers",
    "habilidades": "flow"
  },
  {
    "id_vaga": 112859,
    "titulo_vaga": "Manager II, Applied Science - Marketplace Dynamics",
    "salario_anual": "214500.0",
    "empresa": "Uber",
    "habilidades": "python"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_anual": "205000.0",
    "empresa": "SmartAsset",
    "habilidades": "sql"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_anual": "205000.0",
    "empresa": "SmartAsset",
    "habilidades": "python"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_anual": "205000.0",
    "empresa": "SmartAsset",
    "habilidades": "go"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_anual": "205000.0",
    "empresa": "SmartAsset",
    "habilidades": "snowflake"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_anual": "205000.0",
    "empresa": "SmartAsset",
    "habilidades": "pandas"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_anual": "205000.0",
    "empresa": "SmartAsset",
    "habilidades": "numpy"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_anual": "205000.0",
    "empresa": "SmartAsset",
    "habilidades": "excel"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_anual": "205000.0",
    "empresa": "SmartAsset",
    "habilidades": "tableau"
  },
  {
    "id_vaga": 168310,
    "titulo_vaga": "Principal Data Analyst (Remote)",
    "salario_anual": "205000.0",
    "empresa": "SmartAsset",
    "habilidades": "gitlab"
  },
  {
    "id_vaga": 17458,
    "titulo_vaga": "Senior Economy Designer",
    "salario_anual": "190000.0",
    "empresa": "Harnham",
    "habilidades": "sql"
  },
  {
    "id_vaga": 17458,
    "titulo_vaga": "Senior Economy Designer",
    "salario_anual": "190000.0",
    "empresa": "Harnham",
    "habilidades": "python"
  },
  {
    "id_vaga": 17458,
    "titulo_vaga": "Senior Economy Designer",
    "salario_anual": "190000.0",
    "empresa": "Harnham",
    "habilidades": "r"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "sql"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "python"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "azure"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "aws"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "oracle"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "snowflake"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "tableau"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "power bi"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "sap"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "jenkins"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "bitbucket"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "atlassian"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "jira"
  },
  {
    "id_vaga": 731368,
    "titulo_vaga": "Director, Data Analyst - HYBRID",
    "salario_anual": "189309.0",
    "empresa": "Inclusively",
    "habilidades": "confluence"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_anual": "189000.0",
    "empresa": "Motional",
    "habilidades": "sql"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_anual": "189000.0",
    "empresa": "Motional",
    "habilidades": "python"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_anual": "189000.0",
    "empresa": "Motional",
    "habilidades": "r"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_anual": "189000.0",
    "empresa": "Motional",
    "habilidades": "git"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_anual": "189000.0",
    "empresa": "Motional",
    "habilidades": "bitbucket"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_anual": "189000.0",
    "empresa": "Motional",
    "habilidades": "atlassian"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_anual": "189000.0",
    "empresa": "Motional",
    "habilidades": "jira"
  },
  {
    "id_vaga": 310660,
    "titulo_vaga": "Principal Data Analyst, AV Performance Analysis",
    "salario_anual": "189000.0",
    "empresa": "Motional",
    "habilidades": "confluence"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_anual": "186000.0",
    "empresa": "SmartAsset",
    "habilidades": "sql"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_anual": "186000.0",
    "empresa": "SmartAsset",
    "habilidades": "python"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_anual": "186000.0",
    "empresa": "SmartAsset",
    "habilidades": "go"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_anual": "186000.0",
    "empresa": "SmartAsset",
    "habilidades": "snowflake"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_anual": "186000.0",
    "empresa": "SmartAsset",
    "habilidades": "pandas"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_anual": "186000.0",
    "empresa": "SmartAsset",
    "habilidades": "numpy"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_anual": "186000.0",
    "empresa": "SmartAsset",
    "habilidades": "excel"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_anual": "186000.0",
    "empresa": "SmartAsset",
    "habilidades": "tableau"
  },
  {
    "id_vaga": 1749593,
    "titulo_vaga": "Principal Data Analyst",
    "salario_anual": "186000.0",
    "empresa": "SmartAsset",
    "habilidades": "gitlab"
  }
]
*/