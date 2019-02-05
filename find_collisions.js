// https://stackoverflow.com/a/2117523

const reduce = require("stream-reduce");
const split = require("split");

process.stdin
  .pipe(split(undefined, undefined, { trailing: false }))
  .pipe(reduce((acc, data) => {
    if(!/^\w{8}-\w{4}-4\w{3}-\w{4}-\w{12}$/.test(data)){
      console.log(`Invalid UUIDv4: <${data}>`);
    }
    return {
      previous: data,
      collisions: {
        ...acc.collisions,
        ...(data === acc.previous ? {[data]: (acc.collisions[data] || 1) + 1} : {})
      }
    };
  }, {})).on('data', data => {
    for ( const key in data.collisions ) {
      console.log(data.collisions[key], key);
    }
  });

