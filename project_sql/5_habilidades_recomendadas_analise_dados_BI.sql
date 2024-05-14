/*
Pergunta: Quais são as habilidades mais recomendadas para se aprender (maior demanda e recompensa financeira)?
- Identifique as habilidades com alta demanda associadas a altos níveis de salário médio para vagas de analista de dados/BI
- Nesta análise, focarei em posições de trabalho remoto que possuem salários divulgados
- Por que? Essa análise ajudará a identificar as habilidades que oferecem segurança no emprego (alta demanda) e benefícios financeiros (altos salários),
  oferecendo insights estratégicos para auxiliar no desenvolvimento de carreira em análise de dados/BI
*/

SELECT
    skills_dim.skill_id AS habilidade_id,
    skills_dim.skills AS habilidades,
    COUNT(skills_job_dim.job_id) AS demanda_total,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salario_medio
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
    AND (job_title_short = 'Data Analyst'
    OR job_title_short = 'Business Analyst')
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    demanda_total DESC,
    salario_medio DESC
LIMIT 25;

SELECT
    skills_dim.skill_id AS habilidade_id,
    skills_dim.skills AS habilidades,
    COUNT(skills_job_dim.job_id) AS demanda_total,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS salario_medio
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
    AND (job_title_short = 'Data Analyst'
    OR job_title_short = 'Business Analyst')
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    salario_medio DESC,
    demanda_total DESC
LIMIT 25;

/* Nas queries acima, temos dois pontos de vista sobre um mesmo conjunto de dados: um no qual estamos
dando mais prioridade à demanda total no mercado de análise de dados/BI, enquanto que no outro,
a prioridade é a remuneração média associada às habilidades demandadas pelo mercado.
Ao avaliar as habilidades mais demandadas, estamos dando prioridade à facilidade de se inserir no mercado;
já ao consultar as habilidades que possuem um nível mais alto de salário médio, conseguimos obter insights
sobre quais habilidades são mais vantajosas para se especializar após dominar as habilidades mais comumente
requisitadas, possibilitando o acesso a vagas que oferecem uma remuneração maior.

Query ordenada a partir da demanda:
[
  {
    "habilidade_id": 0,
    "habilidades": "sql",
    "demanda_total": "440",
    "salario_medio": "97417"
  },
  {
    "habilidade_id": 181,
    "habilidades": "excel",
    "demanda_total": "287",
    "salario_medio": "88027"
  },
  {
    "habilidade_id": 182,
    "habilidades": "tableau",
    "demanda_total": "257",
    "salario_medio": "99807"
  },
  {
    "habilidade_id": 1,
    "habilidades": "python",
    "demanda_total": "256",
    "salario_medio": "102578"
  },
  {
    "habilidade_id": 5,
    "habilidades": "r",
    "demanda_total": "156",
    "salario_medio": "101223"
  },
  {
    "habilidade_id": 183,
    "habilidades": "power bi",
    "demanda_total": "122",
    "salario_medio": "96744"
  },
  {
    "habilidade_id": 186,
    "habilidades": "sas",
    "demanda_total": "70",
    "salario_medio": "98908"
  },
  {
    "habilidade_id": 7,
    "habilidades": "sas",
    "demanda_total": "70",
    "salario_medio": "98908"
  },
  {
    "habilidade_id": 196,
    "habilidades": "powerpoint",
    "demanda_total": "63",
    "salario_medio": "89661"
  },
  {
    "habilidade_id": 185,
    "habilidades": "looker",
    "demanda_total": "54",
    "salario_medio": "106259"
  },
  {
    "habilidade_id": 188,
    "habilidades": "word",
    "demanda_total": "52",
    "salario_medio": "84012"
  },
  {
    "habilidade_id": 79,
    "habilidades": "oracle",
    "demanda_total": "43",
    "salario_medio": "103877"
  },
  {
    "habilidade_id": 80,
    "habilidades": "snowflake",
    "demanda_total": "38",
    "salario_medio": "112989"
  },
  {
    "habilidade_id": 61,
    "habilidades": "sql server",
    "demanda_total": "37",
    "salario_medio": "97405"
  },
  {
    "habilidade_id": 192,
    "habilidades": "sheets",
    "demanda_total": "37",
    "salario_medio": "85873"
  },
  {
    "habilidade_id": 74,
    "habilidades": "azure",
    "demanda_total": "35",
    "salario_medio": "110804"
  },
  {
    "habilidade_id": 215,
    "habilidades": "flow",
    "demanda_total": "35",
    "salario_medio": "93568"
  },
  {
    "habilidade_id": 76,
    "habilidades": "aws",
    "demanda_total": "32",
    "salario_medio": "108317"
  },
  {
    "habilidade_id": 8,
    "habilidades": "go",
    "demanda_total": "30",
    "salario_medio": "111121"
  },
  {
    "habilidade_id": 9,
    "habilidades": "javascript",
    "demanda_total": "27",
    "salario_medio": "90881"
  },
  {
    "habilidade_id": 199,
    "habilidades": "spss",
    "demanda_total": "26",
    "salario_medio": "90235"
  },
  {
    "habilidade_id": 97,
    "habilidades": "hadoop",
    "demanda_total": "25",
    "salario_medio": "111849"
  },
  {
    "habilidade_id": 22,
    "habilidades": "vba",
    "demanda_total": "24",
    "salario_medio": "88783"
  },
  {
    "habilidade_id": 233,
    "habilidades": "jira",
    "demanda_total": "22",
    "salario_medio": "103403"
  },
  {
    "habilidade_id": 4,
    "habilidades": "java",
    "demanda_total": "21",
    "salario_medio": "102258"
  }
]

Query ordenada a partir da remuneração:
[
  {
    "habilidade_id": 75,
    "habilidades": "databricks",
    "demanda_total": "11",
    "salario_medio": "139006"
  },
  {
    "habilidade_id": 80,
    "habilidades": "snowflake",
    "demanda_total": "38",
    "salario_medio": "112989"
  },
  {
    "habilidade_id": 97,
    "habilidades": "hadoop",
    "demanda_total": "25",
    "salario_medio": "111849"
  },
  {
    "habilidade_id": 8,
    "habilidades": "go",
    "demanda_total": "30",
    "salario_medio": "111121"
  },
  {
    "habilidade_id": 77,
    "habilidades": "bigquery",
    "demanda_total": "16",
    "salario_medio": "110813"
  },
  {
    "habilidade_id": 74,
    "habilidades": "azure",
    "demanda_total": "35",
    "salario_medio": "110804"
  },
  {
    "habilidade_id": 234,
    "habilidades": "confluence",
    "demanda_total": "14",
    "salario_medio": "108415"
  },
  {
    "habilidade_id": 76,
    "habilidades": "aws",
    "demanda_total": "32",
    "salario_medio": "108317"
  },
  {
    "habilidade_id": 194,
    "habilidades": "ssis",
    "demanda_total": "12",
    "salario_medio": "106683"
  },
  {
    "habilidade_id": 185,
    "habilidades": "looker",
    "demanda_total": "54",
    "salario_medio": "106259"
  },
  {
    "habilidade_id": 79,
    "habilidades": "oracle",
    "demanda_total": "43",
    "salario_medio": "103877"
  },
  {
    "habilidade_id": 233,
    "habilidades": "jira",
    "demanda_total": "22",
    "salario_medio": "103403"
  },
  {
    "habilidade_id": 2,
    "habilidades": "nosql",
    "demanda_total": "15",
    "salario_medio": "102624"
  },
  {
    "habilidade_id": 1,
    "habilidades": "python",
    "demanda_total": "256",
    "salario_medio": "102578"
  },
  {
    "habilidade_id": 184,
    "habilidades": "dax",
    "demanda_total": "11",
    "salario_medio": "102500"
  },
  {
    "habilidade_id": 4,
    "habilidades": "java",
    "demanda_total": "21",
    "salario_medio": "102258"
  },
  {
    "habilidade_id": 5,
    "habilidades": "r",
    "demanda_total": "156",
    "salario_medio": "101223"
  },
  {
    "habilidade_id": 187,
    "habilidades": "qlik",
    "demanda_total": "15",
    "salario_medio": "101037"
  },
  {
    "habilidade_id": 197,
    "habilidades": "ssrs",
    "demanda_total": "15",
    "salario_medio": "99993"
  },
  {
    "habilidade_id": 182,
    "habilidades": "tableau",
    "demanda_total": "257",
    "salario_medio": "99807"
  },
  {
    "habilidade_id": 78,
    "habilidades": "redshift",
    "demanda_total": "17",
    "salario_medio": "99558"
  },
  {
    "habilidade_id": 7,
    "habilidades": "sas",
    "demanda_total": "70",
    "salario_medio": "98908"
  },
  {
    "habilidade_id": 186,
    "habilidades": "sas",
    "demanda_total": "70",
    "salario_medio": "98908"
  },
  {
    "habilidade_id": 13,
    "habilidades": "c++",
    "demanda_total": "12",
    "salario_medio": "97795"
  },
  {
    "habilidade_id": 204,
    "habilidades": "visio",
    "demanda_total": "12",
    "salario_medio": "97576"
  }
]
*/
