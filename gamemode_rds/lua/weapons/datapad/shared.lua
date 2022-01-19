--
/** [[   Datapad   ]]**/
// RISING DARKNESS!

SWEP.Author				= "RISING DARKNESS"
SWEP.Category				= "RDS - Sweps"
 
SWEP.PrintName				= "Datapad." 
SWEP.Slot			        = 0
SWEP.SlotPos				= 3
SWEP.DrawAmmo				= false
SWEP.UseHands = true

SWEP.Spawnable				= true
SWEP.AdminSpawnable		        = true
 
SWEP.DefaultHoldType                    = "normal"
SWEP.ViewModelFOV = 55
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/infopad.mdl"
SWEP.WorldModel = "models/infopad.mdl"

SWEP.Primary.ClipSize		        = -1
SWEP.Primary.DefaultClip	        = -1
SWEP.Primary.Automatic		        = false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		        = -1
SWEP.Secondary.DefaultClip	        = -1
SWEP.Secondary.Automatic	        = false  
SWEP.Secondary.Ammo			= "none"

SWEP.Weight				= 1
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false
SWEP.deactivateOnMove		        = 0 


function SWEP:PrimaryAttack(ply)
        
	if (self.Reloadtimer || 0) > CurTime() then return end
        if CLIENT then 
       --     TDS.Datapad.VGUI.OpenMainFrame()
        end
        self.Reloadtimer = CurTime() + 1

end    

function SWEP:Initialize()

	self:SetHoldType( "slam" )

	if ( CLIENT ) then return end

end


 
function SWEP:SecondaryAttack()
        
end
 