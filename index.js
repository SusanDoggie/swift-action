const core = require("@actions/core");
const exec = require("@actions/exec");

const action = core.getInput("action");

exec.exec(`${__dirname}/dist/${action}.sh`).catch(err => { core.setFailed(err.message); });
