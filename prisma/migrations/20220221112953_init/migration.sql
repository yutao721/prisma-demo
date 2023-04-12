/*
  Warnings:

  - You are about to drop the column `comments` on the `post` table. All the data in the column will be lost.
  - You are about to drop the column `likes` on the `post` table. All the data in the column will be lost.
  - You are about to drop the column `views` on the `post` table. All the data in the column will be lost.
  - You are about to drop the column `profileViews` on the `user` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `user` table. All the data in the column will be lost.
  - You are about to drop the `_categorytopost` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `category` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `extendedprofile` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `updatedAt` to the `Post` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `_categorytopost` DROP FOREIGN KEY `_categorytopost_ibfk_1`;

-- DropForeignKey
ALTER TABLE `_categorytopost` DROP FOREIGN KEY `_categorytopost_ibfk_2`;

-- DropForeignKey
ALTER TABLE `extendedprofile` DROP FOREIGN KEY `ExtendedProfile_userId_fkey`;

-- AlterTable
ALTER TABLE `post` DROP COLUMN `comments`,
    DROP COLUMN `likes`,
    DROP COLUMN `views`,
    ADD COLUMN `content` VARCHAR(191) NULL,
    ADD COLUMN `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL,
    MODIFY `title` VARCHAR(255) NOT NULL,
    MODIFY `published` BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE `user` DROP COLUMN `profileViews`,
    DROP COLUMN `role`;

-- DropTable
DROP TABLE `_categorytopost`;

-- DropTable
DROP TABLE `category`;

-- DropTable
DROP TABLE `extendedprofile`;

-- CreateTable
CREATE TABLE `Profile` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bio` VARCHAR(191) NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `Profile_userId_key`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Profile` ADD CONSTRAINT `Profile_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
