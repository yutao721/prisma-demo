/*
  Warnings:

  - The primary key for the `timeperiod` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[year,quarter]` on the table `TimePeriod` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE `timeperiod` DROP PRIMARY KEY;

-- CreateIndex
CREATE UNIQUE INDEX `TimePeriod_year_quarter_key` ON `TimePeriod`(`year`, `quarter`);
