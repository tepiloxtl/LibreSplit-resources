process("PPSSPPSDL")
-- process("PPSSPP.exe")

function startup()
    refreshRate = 1
end


function state()
    base = getBaseAddress()
--     print("base at" .. base)
--     print("sig at " .. sig_scan("CC CC 53 55 41 54 41 55 41 56 41 57 41 57 48 BB", 16))
    pspmem = readAddress("ulong", sig_scan("CC CC 53 55 41 54 41 55 41 56 41 57 41 57 48 BB", 16))
--     print("psp mem at " .. string.format("%d", pspmem))
    local level = readAddress("string7", pspmem - getBaseAddress() + 0x9316063)
    local baloons = readAddress("int", pspmem - getBaseAddress() + 0x9F6A338)
    print("baloons " .. baloons)
    print("mission " .. level)
end

-- function split()
--
-- end
