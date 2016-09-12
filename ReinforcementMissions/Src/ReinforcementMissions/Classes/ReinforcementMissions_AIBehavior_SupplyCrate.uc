class ReinforcementMissions_AIBehavior_SupplyCrate extends XGAIBehavior;

state ExecutingAI
{
Begin:	
	SkipTurn();
	GotoState('EndOfTurn');
}