import { prisma } from "./utils";

// 按复合 ID 或复合唯一标识符获取记录
export async function findUniqueByTimePeriod() {
  return prisma.timePeriod.findUnique({
    where: {
      year_quarter: {
        quarter: 4,
        year: 2020,
      },
    },
  })
} 