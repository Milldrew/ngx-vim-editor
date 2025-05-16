FROM mcr.microsoft.com/playwright:v1.50.0-noble
WORKDIR /app
COPY package.json package-lock.json .
COPY ./ ./
RUN rm -rf ./nest-workspace/public
RUN cd ./angular-workspace ; npm i ; (npx ng build || exit 0);
RUN cd ./nest-workspace && npm i
RUN cd ./playwright-tests/ && npm i && npx playwright install chromium;

# nestjs process http://localhost:3000
EXPOSE 3000
# plawright test report http://localhost:9323
EXPOSE 9323

CMD ["sh"]
