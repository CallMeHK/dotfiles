const execSync = require('child_process').execSync;

const dir = process.env.DIRECTION || 'right'
const run = cmd => execSync(cmd).toString();

const fc_monitor = run('bspc query -M -m .focused --names').trim()

const fc_desktop = run('bspc query -D -d focused --names')
const o_desktop = run('bspc query -D -m last -d .active --names')

const desktops = [Number(fc_desktop), Number(o_desktop)]
desktops.sort(function(a, b) {
  return a - b;
})

// console.log(fc_monitor, fc_desktop, o_desktop, desktops)

const test_dt = (a,b) => desktops.includes(a) && desktops.includes(b)

const workplaces = [
  [1,3],
  [2,4],
  [2,5],
  [2,6],
  [2,7],
  [2,8],
]

const current = workplaces.findIndex(([a, b]) => a === desktops[0] && b === desktops[1])

// console.log("index:", current)

let newWorkspace = workplaces[current]

if(current === -1) newWorkspace = workplaces[0]
else if(dir === 'right' && current < workplaces.length-1) newWorkspace = workplaces[current + 1]
else if(dir === 'left' && current !== 0) newWorkspace = workplaces[current - 1]


// console.log('sending to ', newWorkspace)

const [m1Desktop, m2Desktop] = newWorkspace

const goToM1 = `bspc desktop -f '^${m1Desktop}'`
const goToM2 = `bspc desktop -f '^${m2Desktop}'`

// const focusMonitor = `bspc monitor --focus ${fc_monitor}`
const command = fc_monitor === 'HDMI-1' ?
  `${goToM2} && ${goToM1}`
  : `${goToM1} && ${goToM2}`

run(command)
