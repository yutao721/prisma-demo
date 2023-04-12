## Prisma ORM

### 修改数据库 schema

1. 编辑 [`prisma/schema.prisma`](prisma/schema.prisma).
2. 执行 `npx prisma migrate dev --name init`

### 同步其他人的 schema 修改

1. 执行 `npx prisma generate`

### 快速查看数据库内容

1. 执行 `npx prisma studio`
