/*
Pergunta: Quais são as vagas de Analista de BI/Dados que pagam os maiores salários?
- Identificar as 10 vagas que pagam os maiores salários para Analista de BI/Dados que estão disponíveis remotamente
- Focar em vagas com salários divulgados
- Por que? Destacar as oportunidades com os maiores salários, fornecerá insights sobre quais habilidades devo focar em desenvolver
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
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
LIMIT 10;