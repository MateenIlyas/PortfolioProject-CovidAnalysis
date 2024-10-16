-- Data Cleaning

-- First up creating a schema "world_layoffs"
-- Download layoffs.csv from "https://www.kaggle.com/datasets/swaptr/layoffs-2022"
-- Import that csv file

SELECT *
FROM world_layoffs.layoffs;

-- Step 1: Create a separate staging or working table where the computations will be performed instead of the original table
-- Step 2: Removing Duplicates
-- Step 3: Standardize the alphabets, numbers or characters in the data
-- Step 4: Removing all Nulls or blanks
-- Step 5: Eliminating the unnecessary columns to reduce data size


-- Performing the Step 1: Creating a separate table

-- Created a separate table `layoffs_staging` exactly like the `layoffs` table
CREATE TABLE layoffs_staging
LIKE layoffs;

-- Displaying the empty `layoffs_staging` table to confirm whether it was created or not
SELECT *
FROM world_layoffs.layoffs_staging;

-- Pick all records from `layoffs` table and Insert them into corresponding columns of the `layoffs_staging` table
INSERT layoffs_staging
SELECT *
FROM world_layoffs.layoffs;

