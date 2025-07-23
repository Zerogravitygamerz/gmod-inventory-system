if CLIENT then
    local PANEL

    local function OpenInventory()
        if IsValid(PANEL) then
            PANEL:Remove()
        end
        PANEL = vgui.Create("DFrame")
        PANEL:SetSize(ScrW(), ScrH())
        PANEL:SetPos(0,0)
        PANEL:SetTitle("")
        PANEL:SetDraggable(false)
        PANEL:ShowCloseButton(false)
        PANEL:MakePopup()

        local html = vgui.Create("DHTML", PANEL)
        html:Dock(FILL)
        html:OpenURL("asset://garrysmod/addons/gmod-inventory-system/html/ui.html")

        function html:ConsoleMessage(msg)
            local data = util.JSONToTable(msg)
            if data and data.action then
                hook.Run("GModInventoryAction", data.action, data.data)
            end
        end
    end

    concommand.Add("gmod_inv_open", OpenInventory)
end
