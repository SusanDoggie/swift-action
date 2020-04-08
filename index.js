const core = require("@actions/core");
const exec = require("@actions/exec");

const action = core.getInput("action");

const use_xcodebuild = core.getInput("use_xcodebuild");

if (use_xcodebuild) {
  
  const sdk = core.getInput("sdk");
  const destination = core.getInput("destination");
  const enable_codecov = core.getInput("enable_codecov");
  
  core.exportVariable('SDK', sdk);
  core.exportVariable('DESTINATION', destination);
  core.exportVariable('ENABLE_CODECOV', enable_codecov);
  
}

exec.exec(`${__dirname}/dist/${action}.sh`).catch(err => { core.setFailed(err.message); });
