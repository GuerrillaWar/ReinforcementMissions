// This is an Unreal Script

class ReinforcementMissions_AllowFromATT extends Object config(ReinforcementMissions);

var const config array<name> CharactersToUseATT;

static function UpdateCharacterTemplates()
{
    local array<X2DataTemplate> Templates, EmptyTemplates;
	local X2DataTemplate Template;
	local X2CharacterTemplate CharTemplate;
	local name TemplateName;
	local X2CharacterTemplateManager Manager;

	Manager = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();

	`log("ReinforcementMissions :: Updating Characters To Use ATT");
	foreach default.CharactersToUseATT(TemplateName) {
		Templates = EmptyTemplates;
		Manager.FindDataTemplateAllDifficulties(TemplateName, Templates);
		foreach Templates(Template) {
			`log("- " @ TemplateName);
			CharTemplate = X2CharacterTemplate(Template);
			CharTemplate.bAllowSpawnFromATT = true;
			Manager.AddCharacterTemplate(CharTemplate, true);
		}
	}
}