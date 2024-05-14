/*
Pergunta: Quais são as habilidades mais demandadas para analistas de dados/BI?
- Juntar as postagens de emprego com uma junção interna semelhante à query 2
- Identificar as 5 habilidades mais demandadas para analistas de dados/BI
- Nesta análise, focarei em todas as vagas da tabela job_postings_fact
- Por que? Avaliar as 5 habilidades com a maior demanda no mercado de trabalho, oferecendo insights
  sobre as habilidades mais valiosas para quem está buscando emprego na área
*/

SELECT
    skills AS habilidades,
    COUNT(skills_job_dim.job_id) AS demanda_total
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    OR job_title_short = 'Business Analyst'
GROUP BY
    skills
ORDER BY
    demanda_total DESC
LIMIT 5;

/*
Ao levar em consideração todas as vagas registradas na tabela job_postings_fact,
podemos verificar quais foram as habilidades mais demandadas pelo mercado para analistas de dados/BI
em 2023 através dos dados abaixo:

[
  {
    "habilidades": "sql",
    "demanda_total": "110000"
  },
  {
    "habilidades": "excel",
    "demanda_total": "84165"
  },
  {
    "habilidades": "python",
    "demanda_total": "65423"
  },
  {
    "habilidades": "tableau",
    "demanda_total": "55878"
  },
  {
    "habilidades": "power bi",
    "demanda_total": "48719"
  }
]

*/
