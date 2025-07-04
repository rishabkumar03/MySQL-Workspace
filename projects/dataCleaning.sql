-- DATA CLEANING PROJECT

USE world_layoffs;

SELECT *
FROM layoffs; 

-- 1. Remove Duplication
-- 2. Standardize the Data
-- 3. Null Values or Blank Values
-- 4. Remove any columns OR ROWS

CREATE TABLE layoff_staging
LIKE layoffs;

SELECT *
FROM layoff_staging;

INSERT INTO layoff_staging
SELECT *
FROM layoffs;

SELECT *, 
ROW_NUMBER() OVER(
    PARTITION BY company, `location`, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
) AS row_num
FROM layoff_staging;

WITH duplicate_cte AS (
    SELECT *, ROW_NUMBER() OVER(
        PARTITION BY company, `location`, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
    ) AS row_num
    FROM layoff_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM layoff_staging
WHERE company = 'Casper';

WITH duplicate_cte AS (
    SELECT *, ROW_NUMBER() OVER(
        PARTITION BY company, `location`, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
    ) AS row_num
    FROM layoff_staging
)
DELETE 
FROM duplicate_cte
WHERE row_num > 1;

CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoff_staging2;

INSERT INTO layoff_staging2
SELECT *,
ROW_NUMBER() OVER(
    PARTITION BY company, `location`, industry, total_laid_off, `date`, stage, country, funds_raised_millions
) AS row_num
FROM layoff_staging;

SELECT *
FROM layoff_staging2;

DELETE 
FROM layoff_staging2
WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 0;

-- STANDARDIZING DATA

SELECT company, TRIM(company)
FROM layoff_staging2;

UPDATE layoff_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoff_staging2;

SELECT *
FROM layoff_staging2;

UPDATE layoff_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country 
FROM layoff_staging2
ORDER BY 1;

SELECT *
FROM layoff_staging2
WHERE country LIKE 'United States%';

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoff_staging2
ORDER BY 1;

UPDATE layoff_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT `date`
STR_TO_DATE(`date`, '%d/%m/%Y')
FROM layoff_staging2;
 
ALTER TABLE layoff_staging2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoff_staging2
WHERE total_laid_off IS NULL;

SELECT *
FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoff_staging2
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM layoff_staging2
WHERE company = 'Airbnb';

SELECT T1.industry, T2.industry
FROM layoff_staging2 T1
JOIN layoff_staging2 T2
    ON T1.company = T2.company
    AND T1.location = T2.location
WHERE (T1.industry IS NULL OR T1.industry = '')
AND T2.industry IS NOT NULL;

UPDATE layoff_staging2
SET industry = NULL
WHERE industry = ''; 

UPDATE layoff_staging2 T1
JOIN layoff_staging2 T2
    ON T1.company = T2.company
SET T1.industry = T2.industry
WHERE T1.industry IS NULL
AND T2.industry IS NOT NULL; 

SELECT *
FROM layoff_staging2
WHERE company LIKE 'Ball%';

SELECT *
FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoff_staging2;

ALTER TABLE layoff_staging2
DROP COLUMN row_num;