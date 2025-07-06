--- Allows defining dialogs.
---
--- Dialogs can be used to create conversations between characters using
--- animated heads in a function-stripped briefing.
---



--- Initializes the builder for a briefing.
---
--- #### Functions `BriefingBuilder`:
--- * `SetName(_Name)`:              Sets the name of the briefing.
--- * `SetPlayer(_Player)`:          Sets the receiving player of the briefing.
--- * `UseRestoreCamera(_Flag)`:     Restores the camera to its original state after the briefing.
--- * `UseRestoreGameSpeed(_Flag)`:  Restores the game speed after the briefing.
--- * `UseGlobalImmortality(_Flag)`: Makes all entities invulnerable during the briefing.
--- * `SetHideNotes(_Flag)`:         Hides the notes window during the briefing.
--- * `SetEnableSky(_Flag)`:         Enables the sky during the briefing.
--- * `SetEnableFoW(_Flag)`:         Enables fog of war during the briefing.
--- * `SetEnableBorderPins(_Flag)`:  Enables border pins during the briefing.
--- * `SetBackground(_Flag)`:        Plays the dialog in background (experimentel)
--- * `SetOnBegin(_Function)`:       Function executed at the beginning of the briefing.
--- * `SetOnFinish(_Function)`:      Function executed at the end of the briefing.
--- * `BeginPage()`:                 Opens the `PageBuilder`.
--- * `Redirect(_Target)`:           Jumps to the page with the given name. No argument ends the briefing at this point.
--- * `Start()`:                     Starts the briefing.
---
--- #### Functions `PageBuilder`:
---
--- A briefing can have an unlimited number of pages.
--- * `SetName(_Name)`:            Sets the name of the page.
--- * `SetActor(_Actor)`:          Sets the actor of the page.
--- * `SetTitle(_Title)`:          Sets the title to display.
--- * `SetText(_Text)`:            Sets the text to display.
--- * `SetSpeech(_Speech)`:        Sets the path to the voice line.
--- * `SetDuration(_Duration)`:    Sets the display duration of the page.
--- * `UseCloseUp(_Flag)`:         Switches between close-up and wide view.
--- * `SetPosition(_Position)`:    Sets the camera position.
--- * `SetAngle(_Angle)`:          Sets the camera elevation angle.
--- * `SetRotation(_Rotation)`:    Sets the camera rotation angle.
--- * `SetZoom(_Zoom)`:            Sets the camera zoom level.
--- * `SetFadeIn(_Time)`:          Fades in from black.
--- * `SetFadeOut(_Time)`:         Fades out to black.
--- * `SetFaderAlpha(_Opacity)`:   Sets the alpha value of the fader mask.
--- * `SetAction(_Action)`:        Function executed each time the page is shown.
--- * `UseBigBars(_Flag)`:         Uses wide briefing bars on this page.
--- * `UsePerformanceMode(_Flag)`: Disables various graphic effects to improve performance.
--- * `UseSkipping(_Flag)`:        Allows the page to be skipped.
--- * `BeginChoice()`:             Opens the `ChoiceBuilder`.
--- * `EndPage()`:                 Ends the `PageBuilder` and returns to the `BriefingBuilder`.
---
--- #### Functions `ChoiceBuilder`:
---
--- * `Option(_ID?, _Text, _Target, _Condition?)`: Adds a new option. (Parameters marked with ? are optional)
--- * `EndChoice()`:                               Ends the `ChoiceBuilder` and returns to the `PageBuilder`.
---
--- @param _Name string Name of the NewDialog
--- @param _PlayerID integer Player ID of the recipient
--- @return table BriefingBuilder The builder object for the NewDialog
function NewDialog(_Name, _PlayerID)
    return {};
end
API.NewDialog = NewDialog;


--- Starts a dialog.
---
--- #### Fields `_Dialog`:
--- * `Starting`:                (optional) <b>function</b> Function called when the introduction starts              
--- * `Finished`:                (optional) <b>function</b> Function called when the introduction ends             
--- * `RestoreCamera`:           (optional) <b>boolean</b> Camera position is saved and restored after the introduction
--- * `RestoreGameSpeed`:        (optional) <b>boolean</b> Game speed is saved and restored after the introduction      
--- * `EnableGlobalImmortality`: (optional) <b>boolean</b> All entities are invulnerable during the introduction        
--- * `EnableSky`:               (optional) <b>boolean</b> Shows the sky during the introduction                   
--- * `EnableFoW`:               (optional) <b>boolean</b> Shows the fog of war during the introduction 
--- * `EnableBorderPins`:        (optional) <b>boolean</b> Shows border pins during the introduction      
--- * `HideNotes`:               (optional) <b>boolean</b> Hides messages
--- * `Background`:              (optional) <b>boolean</b> Plays the dialog in background (experimentel)
---
--- #### Example
---
--- ```lua
--- function Dialog1(_Name, _PlayerID)
---     local Dialog = {
---         DisableFow = true,
---         DisableBoderPins = true,
---     };
---     local AP, ASP = API.AddDialogPages(Dialog);
---     -- Pages
---     Dialog.Starting = function(_Data)
---     end
---     Dialog.Finished = function(_Data)
---     end
---     API.StartDialog(Dialog, _Name, _PlayerID);
--- end
--- ```
---
--- @param _Dialog table     Dialog table
--- @param _Name string      Name of the dialog
--- @param _PlayerID integer Player ID of the recipient
function StartDialog(_Dialog, _Name, _PlayerID)
end
API.StartDialog = StartDialog;

--- Asks the player for permission to change graphics settings.
---
--- If the BriefingSystem is loaded, its functionality is used.
---
--- This functionality is disabled in multiplayer.
function RequestDialogAlternateGraphics()
end
API.RequestDialogAlternateGraphics = RequestDialogAlternateGraphics;

--- Checks if a dialog is active.
--- @param _PlayerID integer Player ID of the recipient
--- @return boolean IsActive Dialog is active
function IsDialogActive(_PlayerID)
    return true;
end
API.IsDialogActive = IsDialogActive;

--- Prepares the dialog and returns the page functions.
---
--- Must be called before adding pages.
--- @param _Dialog table Dialog table
--- @return function AP  Page function
--- @return function ASP Simple page function
function AddDialogPages(_Dialog)
    return function(...) end, function(...) end
end
API.AddDialogPages = AddDialogPages;

--- Creates a page.
---
--- #### Fields `_Data`:
--- * `Actor`:      (optional) <b>integer</b> Player ID of actor
--- * `Title`:      (optional) <b>any</b> Name of actor (only with actor)
--- * `Text`:       (optional) <b>any</b> Displayed text (string or language table)
--- * `Speech`:     <b>string</b> Pfad zum Voiceover (MP3 file)
--- * `Position`:   <b>string</b> Position of camera (not with target)
--- * `Target`:     <b>string</b> Unit camera follows (not with position)
--- * `Distance`:   (optional) <b>float</b> Distance of camera
--- * `Action`:     (optional) <b>function</b> Function called when page is shown
--- * `FadeIn`:     (optional) <b>float</b> Duration of fade-in from black
--- * `FadeOut`:    (optional) <b>float</b> Duration of fade-out to black
--- * `FaderAlpha`: (optional) <b>float</b> Mask alpha
--- * `MC`:         (optional) <b>table</b> Table with choices for branching dialogues
--- 
--- #### Fields `_Data.MC`:
--- * `[1]`: <b>any</b> Displayed text (string oder language table)
--- * `[2]`: <b>any</b> Jump target (string or function)
---
--- #### Example:
--- Create a simple page.
--- ```lua
--- AP {
---    Title        = "Marcus",
---    Text         = "This is a simple page.",
---    Actor        = 1,
---    Duration     = 2,
---    FadeIn       = 2,
---    Position     = "npc1",
---    DialogCamera = true,
--- };
--- ```
---
--- #### Example:
--- Create a multiple choice page.
--- ```lua
--- AP {
---    Title        = "Marcus",
---    Text         = "This is not such a simple page.",
---    Actor        = 1,
---    Duration     = 2,
---    FadeIn       = 2,
---    Position     = "npc1",
---    DialogCamera = true,
---    MC = {
---        {"Option 1", "Option1"},
---        {"Option 2", "Option2"},
---    },
--- };
--- 
--- -- The branches in a briefing must be separated by an empty page
--- -- so the briefing knows it's done here.
--- ASP("Option1", "First Option", "This is the first option.", false, "Marcus");
--- AP();
--- ASP("Option2", "Second Option", "This is the second option.", false, "Marcus");
--- ```
---
--- #### Example:
--- The jump target of an option can be determined by a function.
--- ```lua
--- AP {
---    Title        = "Marcus",
---    Text         = "This is not such a simple page.",
---    Actor        = 1,
---    Duration     = 2,
---    FadeIn       = 2,
---    Position     = "npc1",
---    DialogCamera = true,
---    MC = {
---        {"Option 1", "Option1"},
---        {"Option 2", ForkingFunction},
---    },
--- };
--- ```
---
--- @param _Data table Seitendaten
--- @return table Erzeugte Seite
function AP(_Data)
    return {};
end

--- Creates a page in a simplified way.
---
--- The function can automatically generate a page name based on the page index.
--- A name can be optionally provided as the first parameter.
---
--- #### Example:
--- ```lua
--- -- Wide shot
--- ASP("Title", "Some important text.", false, "HQ");
--- -- With page name
--- ASP("Page1", "Title", "Some important text.", false, "HQ");
--- -- Close-up
--- ASP("Title", "Some important text.", true, "Marcus");
--- -- Triggering an action
--- ASP("Title", "Some important text.", true, "Marcus", MyFunction);
--- -- Allowing/disallowing skip
--- ASP("Title", "Some important text.", true, "HQ", nil, true);
--- ```
---
--- @param _Name? string Name of page
--- @param _Sender integer Player ID of actor
--- @param _Target string Entity the camera focuses on
--- @param _Title string Displayed page title
--- @param _Text string Displayed page text
--- @param _DialogCamera boolean Use dialog close-up camera
--- @param _Action? boolean Action when the page is shown
--- @return table Page Created page
function ASP(...)
    return {};
end

