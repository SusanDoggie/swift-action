const core = require("@actions/core");
const exec = require("@actions/exec");

function env_variable(name) {
  const val = core.getInput(name);
  return (val ? val : process.env[name] || '').trim();
}

const action = core.getInput("action");
const configuration = env_variable("configuration");
const use_xcodebuild = env_variable("use_xcodebuild");

if (configuration) {
  core.exportVariable('CONFIGURATION', configuration);
}

if (use_xcodebuild == 'true') {
  
  core.exportVariable('USE_XCODEBUILD', 'true');
  
  const sdk = env_variable("sdk");
  const destination = env_variable("destination");
  const enable_codecov = env_variable("enable_codecov");
  
  if (sdk) { core.exportVariable('SDK', sdk); }
  if (destination) { core.exportVariable('DESTINATION', destination); }
  if (enable_codecov) { core.exportVariable('ENABLE_CODECOV', enable_codecov); }
  
}

exec.exec(`${__dirname}/dist/${action}.sh`).catch(err => { core.setFailed(err.message); });
