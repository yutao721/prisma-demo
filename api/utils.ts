import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient({
  log: [
    { emit: 'event', level: 'query' },
  ]
});

prisma.$use(async (params, next) => {
  console.log('This is middleware!')
  // Modify or interrogate params here

  return next(params)
})

if (process.env.NODE_ENV === 'development') {
  prisma.$on('query', (e) => {
    console.log(e.query, e.params);
  });
}