DilliDalliYeOldeAIBrainClass1 = AIBrain

local CreateDilliDalliBrain1 = import('/mods/TechAI/lua/AI/DilliDalli/Brain.lua').CreateBrain

AIBrain = Class(DilliDalliYeOldeAIBrainClass) {
    OnCreateAI = function(self, planName)
        local per = ScenarioInfo.ArmySetup[self.Name].AIPersonality
        if string.find(per, 'TechAI') then
            -- I don't call the standard OnCreateAI here, so do any necessary initialisation.
            self:CreateBrainShared(planName)
            LOG('Initialising TechAI AI - Name: ('..self.Name..') - personality: ('..per..') ')
            self.TechAI=true
            self.DilliDalli = true
            self.DilliDalliBrain = CreateDilliDalliBrain1(self)
            -- Set up cheating stuff?
            local cheatPos = string.find(per, 'TechAIcheat')
            if cheatPos then
                AIUtils.SetupCheat(self, true)
                ScenarioInfo.ArmySetup[self.Name].AIPersonality = string.sub(per, 1, cheatPos - 1)
            end
        else
            DilliDalliYeOldeAIBrainClass1.OnCreateAI(self,planName)
        end
    end,

    InitializeSkirmishSystems = function(self)
        if not self.DilliDalli then
            return DilliDalliYeOldeAIBrainClass1.InitializeSkirmishSystems(self)
        end
        -- Here lies the grave of the PlatoonFormManager; look on it's works ye mighty, and despair.
        --            _____                    _____                    _____
        --           /\    \                  /\    \                  /\    \
        --          /::\    \                /::\    \                /::\    \
        --         /::::\    \               \:::\    \              /::::\    \
        --        /::::::\    \               \:::\    \            /::::::\    \
        --       /:::/\:::\    \               \:::\    \          /:::/\:::\    \
        --      /:::/__\:::\    \               \:::\    \        /:::/__\:::\    \
        --     /::::\   \:::\    \              /::::\    \      /::::\   \:::\    \
        --    /::::::\   \:::\    \    ____    /::::::\    \    /::::::\   \:::\    \
        --   /:::/\:::\   \:::\____\  /\   \  /:::/\:::\    \  /:::/\:::\   \:::\____\
        --  /:::/  \:::\   \:::|    |/::\   \/:::/  \:::\____\/:::/  \:::\   \:::|    |
        --  \::/   |::::\  /:::|____|\:::\  /:::/    \::/    /\::/    \:::\  /:::|____|
        --   \/____|:::::\/:::/    /  \:::\/:::/    / \/____/  \/_____/\:::\/:::/    /
        --         |:::::::::/    /    \::::::/    /                    \::::::/    /
        --         |::|\::::/    /      \::::/____/                      \::::/    /
        --         |::| \::/____/        \:::\    \                       \::/____/
        --         |::|  ~|               \:::\    \                       ~~
        --         |::|   |                \:::\    \
        --         \::|   |                 \:::\____\
        --          \:|   |                  \::/    /
        --           \|___|                   \/____/
    end,

    OnIntelChange = function(self, blip, reconType, val)
        if not self.DilliDalli then
            return DilliDalliYeOldeAIBrainClass1.OnIntelChange(self, blip, reconType, val)
        end
        -- I may or may not pass this through at some point
    end,
}