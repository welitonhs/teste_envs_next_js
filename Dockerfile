FROM node:lts as dependencies
WORKDIR /frontend-v3
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# FROM node:lts as builder
# ENV NEXT_PUBLIC_TESTE=$NEXT_PUBLIC_TESTE

WORKDIR /frontend-v3
COPY . .
COPY --from=dependencies /frontend-v3/node_modules ./node_modules
RUN yarn build

FROM node:lts as runner
ENV NODE_ENV production
WORKDIR /frontend-v3

COPY --from=builder /frontend-v3/next.config.js ./
COPY --from=builder /frontend-v3/public ./public
COPY --from=builder /frontend-v3/.next ./.next
COPY --from=builder /frontend-v3/node_modules ./node_modules
COPY --from=builder /frontend-v3/package.json ./package.json

EXPOSE 3000
CMD ["yarn", "start"]
