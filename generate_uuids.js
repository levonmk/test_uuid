// https://stackoverflow.com/a/2117523

const generateUuid = require(process.argv[2]).uuid;

const batchSize = process.argv[3] || 1000;

const batchNum = process.argv[4] || 0

for (let i=0; i<batchSize; i++){
  console.log(generateUuid(), Date.now(), batchNum, i);
}

