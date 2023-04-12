import { prisma } from "./utils";

export function getAll() {
  return prisma.user.findMany();
}

// 创建单个记录
export async function createOne({
  name,
  email
}: {
  name: string
  email: string
}) {
  return prisma.user.create({
    data: {
      email: email,
      name: name,
    }
  })
}

// 创建多个个记录
export async function createMany(user: any) {
  return prisma.user.createMany({
    data: user,
    skipDuplicates: true
  })
}


// 按 ID 或唯一标识符获取记录
export async function findUnique({ id }: { id: number }) {
  id = +id;
  return prisma.user.findUnique({
    where: {
      id: id,
    },
  })
}

