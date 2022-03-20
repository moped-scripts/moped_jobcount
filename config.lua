Config = {}

Config.Framework = 'vorp' -- redemrp, vorp.
Config.Command = 'online' -- command name

Config.Locales = {
    ["info"] = "Job Info",
    ["currently"] = "There is currently",
    ["online"] = "online.",
}

Config.Jobs = {
	{
		job = "sheriff", -- jobname used in code
		label = "Sheriff", -- your label name that will be shown in the message to client
		count = 0, -- dont edit this
	},
	{
		job = "doctor",
		label = "Doctor",
		count = 0,
	},
}