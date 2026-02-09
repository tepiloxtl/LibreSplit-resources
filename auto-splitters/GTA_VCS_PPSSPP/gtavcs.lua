process("PPSSPPSDL")
-- process("PPSSPP.exe")

local pspmem = nil

function getpspbasememaddr()
--  This has been tested working with PPSSPP 1.19.3 Linux AppImage.
--  Flatpak version did not work for me in my testing, I was not able to read internal PSP memory
--  Potentially some permission issues somewhere...
    base = getBaseAddress()
--  print("base at" .. base)
--  print("sig at " .. sig_scan("CC CC 53 55 41 54 41 55 41 56 41 57 41 57 48 BB", 16))
    pspmem = readAddress("ulong", sig_scan("CC CC 53 55 41 54 41 55 41 56 41 57 41 57 48 BB", 16))
--  print("psp mem at " .. string.format("%d", pspmem))
    return pspmem - base
end

function startup()
    refreshRate = 1
end


function state()
    if pspmem == nil then
        pspmem = getpspbasememaddr()
    end
    local level = readAddress("string7", pspmem + 0x9316063)
    local baloons = readAddress("int", pspmem + 0x9F6A338)
    print("baloons " .. baloons)
    print("mission " .. level)
end

-- function split()
--
-- end
