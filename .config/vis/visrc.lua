-- load standard vis module, providing parts of the Lua API
require('vis')
require('vis-title')

vis.events.subscribe(vis.events.INIT, function()
	vis:command('set theme solarized')
end)
