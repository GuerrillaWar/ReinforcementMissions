class X2DownloadableContentInfo_ReinforcementMissions extends X2DownloadableContentInfo Config(Game);

static event OnPostTemplatesCreated()
{
	`log("ReinforcementMissions :: Present And Correct");
	class'ReinforcementMissions_AllowFromATT'.static.UpdateCharacterTemplates();
}

static event OnPreMission(XComGameState NewGameState, XComGameState_MissionSite MissionState)
{
	local XComMissionLogic_Listener MissionListener;

	`log("ReinforcementMissions :: Ensuring presence of tactical game state listeners");
	
	MissionListener = XComMissionLogic_Listener(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComMissionLogic_Listener', true));

	if (MissionListener == none)
	{
		MissionListener = XComMissionLogic_Listener(NewGameState.CreateStateObject(class'XComMissionLogic_Listener'));
		NewGameState.AddStateObject(MissionListener);
	}

	MissionListener.RegisterToListen();
}