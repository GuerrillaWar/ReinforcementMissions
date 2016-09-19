class ReinforcementMissions_SeqAct_GetTimerConfiguration extends SequenceAction config(ReinforcementMissions);

var() name TimerConfigurationName;
var int TimerTurns;
var bool TimerActive;

struct TimerConfiguration
{
	var name TimerName;
	var bool Active;
	var int Turns;

	structdefaultproperties
	{
		TimerActive = false
		TimerTurns = 8
	}
};

var const config array<TimerConfiguration> TimerConfigurations;

event Activated()
{
	local TimerConfiguration Conf;

	foreach default.TimerConfigurations(Conf)
	{
		if (Conf.TimerName == TimerConfigurationName)
		{
			TimerTurns = Conf.Turns;
			TimerActive = Conf.Active;
			return;
		}
	}
	`Redscreen("ReinforcementMissions :: Timer Configuration Not Found : " $ TimerConfigurationName);
}

DefaultProperties
{
	ObjName="Get and Apply Timer Configuration"
	ObjCategory="Unit"
	bCallHandler=false
	bAutoActivateOutputLinks=true

	InputLinks(0)=(LinkDesc="Load Config")

	bConvertedForReplaySystem=true
	bCanBeUsedForGameplaySequence=true

	VariableLinks(0)=(ExpectedType=class'SeqVar_Bool',LinkDesc="Timer Active",PropertyName=TimerActive, bWriteable=TRUE)
	VariableLinks(1)=(ExpectedType=class'SeqVar_Int',LinkDesc="Timer Turns",PropertyName=TimerTurns, bWriteable=TRUE)
}