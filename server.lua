addEventHandler("onPlayerCommand", root,
    function(command)
       logkaydet(source,command)
    end)

function logkaydet (source,text)
-------------- LOG SISTEMI --------------
	local hours = getRealTime().hour 
	local minutes = getRealTime().minute 
	local seconds = getRealTime().second 
	local day = getRealTime().monthday 
	local month = getRealTime().month+1 
	local year = getRealTime().year+1900 
	local dosyaismi = "/log.txt" 
	local dosya = olusturulmus_txt(dosyaismi) 
	local size = fileGetSize(dosya)
	fileSetPos(dosya, size)
	fileWrite(dosya, "Kullanılan Komut : /"..text.." | Kullanan Oyuncu : "..getPlayerName(source).." | Tarih :"..string.format("%02d/%02d/%02d", day, month, year).." / "..string.format("%02d:%02d:%02d", hours, minutes, seconds).."\n")
	fileFlush(dosya)
	fileClose(dosya)
end



 function olusturulmus_txt(dosyaismi)
	local dosya = nil
	if fileExists ( dosyaismi ) then
		dosya = fileOpen(dosyaismi)
	else
		dosya = fileCreate(dosyaismi)
	end
	return dosya
end
