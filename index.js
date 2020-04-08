const core = require("@actions/core");
const exec = require("@actions/exec");

const action = core.getInput("action");

exec.exec(`/${action}.sh`);
