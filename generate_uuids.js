// https://stackoverflow.com/a/2117523

const batchSize = process.argv[3] || 1000;

const generateUuid = require(process.argv[2]).uuid;

for (let i=0; i<batchSize; i++){
  console.log(generateUuid());
}

