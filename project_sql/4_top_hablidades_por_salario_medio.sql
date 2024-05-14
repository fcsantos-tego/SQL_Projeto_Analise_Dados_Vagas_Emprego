/*
Pergunta: Quais são as habilidades mais requisitadas levando em consideração o salário médio?
- Avalie o salário médio associado a cada habilidade para vagas de analistas de dados/bi
- Nesta análise, focarei em vagas com salários divulgados, independentemente da localização
- Por que? Essa análise revelará como habilidades diferentes impactam o nível salarial
  para analistas de dados/bi e ajudará a identificar as habilidades mais recompensadoras
  do ponto de vista financeiro
*/

SELECT
    skills AS habilidades,
    ROUND(AVG(salary_year_avg), 2) AS salario_medio
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    salary_year_avg IS NOT NULL
    AND (job_title_short = 'Data Analyst'
    OR job_title_short = 'Business Analyst')
GROUP BY
    skills
ORDER BY
    salario_medio DESC
LIMIT 25;

/*
Ao ordenar as habilidades requisitadas pelo mercado para as vagas de analista de dados/bi de acordo
com o salário médio associado a elas, identificamos um ranking bem diferente daquele
que visualizamos ao classificar as habilidades pela sua demanda.
Isso ocorre porque, quanto maior o nível de especialização necessário para dominar uma habilidade,
seja ela de um nicho de mercado ou não, maior tende a ser o salário associado a ela.

[
  {
    "habilidades": "svn",
    "salario_medio": "246585.50"
  },
  {
    "habilidades": "solidity",
    "salario_medio": "179000.00"
  },
  {
    "habilidades": "couchbase",
    "salario_medio": "160515.00"
  },
  {
    "habilidades": "datarobot",
    "salario_medio": "155485.50"
  },
  {
    "habilidades": "golang",
    "salario_medio": "155000.00"
  },
  {
    "habilidades": "dplyr",
    "salario_medio": "147633.33"
  },
  {
    "habilidades": "vmware",
    "salario_medio": "147500.00"
  },
  {
    "habilidades": "twilio",
    "salario_medio": "138500.00"
  },
  {
    "habilidades": "mxnet",
    "salario_medio": "136000.00"
  },
  {
    "habilidades": "puppet",
    "salario_medio": "129820.00"
  },
  {
    "habilidades": "keras",
    "salario_medio": "127013.33"
  },
  {
    "habilidades": "kafka",
    "salario_medio": "126034.92"
  },
  {
    "habilidades": "pytorch",
    "salario_medio": "124588.00"
  },
  {
    "habilidades": "hugging face",
    "salario_medio": "123950.00"
  },
  {
    "habilidades": "gitlab",
    "salario_medio": "123553.56"
  },
  {
    "habilidades": "perl",
    "salario_medio": "122519.76"
  },
  {
    "habilidades": "tensorflow",
    "salario_medio": "120612.00"
  },
  {
    "habilidades": "phoenix",
    "salario_medio": "119921.28"
  },
  {
    "habilidades": "airflow",
    "salario_medio": "117869.55"
  },
  {
    "habilidades": "electron",
    "salario_medio": "117783.33"
  },
  {
    "habilidades": "terraform",
    "salario_medio": "117550.38"
  },
  {
    "habilidades": "cassandra",
    "salario_medio": "116880.65"
  },
  {
    "habilidades": "scala",
    "salario_medio": "114366.76"
  },
  {
    "habilidades": "mongodb",
    "salario_medio": "114131.05"
  },
  {
    "habilidades": "pyspark",
    "salario_medio": "113882.71"
  }
]
*/
