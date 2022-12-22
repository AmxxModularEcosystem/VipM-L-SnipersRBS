#include <amxmodx>
#include <VipModular>

// Возвратит true, если этой команде нельзя брать снайперки
native snipers_get_check_team(id, Team);

#pragma semicolon 1
#pragma compress 1

public stock const PluginName[] = "[VipM-L] Snipers RBS";
public stock const PluginVersion[] = "1.0.0";
public stock const PluginAuthor[] = "ArKaNeMaN";
public stock const PluginURL[] = "t.me/arkanaplugins";
public stock const PluginDescription[] = "";

new const LIMIT_NAME[] = "SnipersRBS-CanTakeAwp";

public VipM_OnInitModules() {
    register_plugin(PluginName, PluginVersion, PluginAuthor);

    VipM_Limits_RegisterType(LIMIT_NAME, true, false);
    VipM_Limits_RegisterTypeEvent(LIMIT_NAME, Limit_OnCheck, "@OnCheck");
}

@OnCheck(const Trie:tParams, const UserId) {
    return !snipers_get_check_team(UserId, get_user_team(UserId));
}
