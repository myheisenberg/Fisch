local ok, err = pcall(function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/myheisenberg/Fisch/main/nokey.luau?t=" .. tostring(os.time())))()
end)

if not ok then
    warn("[Loader Error]:", err)
end
