function games(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
if Redis:get(Fast.."Game:Smile"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Smile"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Smile"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مرة اخرة وارسل - سمايل او سمايلات","md",true)  
end
end 
if Redis:get(Fast..msg.chat_id.."answers:photo") then
if text == Redis:get(Fast..msg.chat_id.."answers:photo") then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast..msg.chat_id.."answers:photo")
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مرة اخرة وارسل - صور","md",true)  
end
end 
if Redis:get(Fast.."Game:Monotonous"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Monotonous"..msg.chat_id) then
Redis:del(Fast.."Game:Monotonous"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مرة اخرة وارسل - الاسرع او ترتيب","md",true)  
end
end 
if Redis:get(Fast.."Game:Riddles"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Riddles"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Riddles"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مرة اخرة وارسل - حزوره","md",true)  
end
end
if Redis:get(Fast.."Game:Meaningof"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Meaningof"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Meaningof"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مرة اخرة وارسل - معاني","md",true)  
end
end
if Redis:get(Fast.."Game:Reflection"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Reflection"..msg.chat_id) then
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."Game:Reflection"..msg.chat_id)
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مرة اخرة وارسل - العكس","md",true)  
end
end
if Redis:get(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
return send(msg.chat_id,msg.id,"• عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 }\n","md",true)  
end 
local GETNUM = Redis:get(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id)
if tonumber(NUM) == tonumber(GETNUM) then
Redis:del(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id)
Redis:del(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,5)  
return send(msg.chat_id,msg.id,"• مبروك فزت ويانه وخمنت الرقم الصحيح\n🚸︙تم اضافة { 5 } من النقاط \n","md",true)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
Redis:incrby(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id,1)
if tonumber(Redis:get(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id)) >= 3 then
Redis:del(Fast.."SADD:NUM"..msg.chat_id..msg.sender_id.user_id)
Redis:del(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id)
return send(msg.chat_id,msg.id,"• اوبس لقد خسرت في اللعبه \n• حظآ اوفر في المرة القادمه \n• كان الرقم الذي تم تخمينه { "..GETNUM.." }","md",true)  
else
return send(msg.chat_id,msg.id,"• اوبس تخمينك غلط \n• ارسل رقم تخمنه مرة اخرى ","md",true)  
end
end
end
end
if Redis:get(Fast.."Game:Difference"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Difference"..msg.chat_id) then 
Redis:del(Fast.."Game:Difference"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مرة اخرة وارسل - المختلف","md",true)  
end
end
if Redis:get(Fast.."Game:Example"..msg.chat_id) then
if text == Redis:get(Fast.."Game:Example"..msg.chat_id) then 
Redis:del(Fast.."Game:Example"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
return send(msg.chat_id,msg.id,"\n• لقد فزت في اللعبه \n• اللعب مرة اخرة وارسل - امثله","md",true)  
end
end
if text == 'الالعاب' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊', url = 'http://t.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
• قائمــه العــاب البــوت
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• لعبة المختلف » المختلف
• لعبة الامثله » امثله
• لعبة العكس » العكس
• لعبة الحزوره » حزوره
• لعبة المعاني » معاني
• لعبة البات » بات
• لعبة التخمين » خمن
• لعبه الاسرع » الاسرع، ترتيب
• لعبة السمايلات » سمايلات
• اسئلة » اسئلة منوعه
• اسالني » اسئلة عامة متجدده
• لغز  » الغاز الذكاء متجدده
• روليت » الروليت بالمعرفات 
• الروليت » الروليت بالانضمام
• رياضيات » مسائل رياضيه 
• انكليزي » معاني الكلمات 
• كت تويت ،كت » اسئلة ترفيهيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
• نقاطي ← لعرض عدد النقاط 
• بيع نقاطي + { العدد } 
لبيع كل نقطه مقابل {50} رسالة
*]]
return send(msg_chat_id,msg_id,TextHelp,"md",false, false, false, false, reply_markup)
end
if text == "حجره" or text == "حجرة" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
baniusernamep = '✧ اختار حجره / ورقة / مقص'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✂️', data = msg.sender_id.user_id..'/mks'},{text = '📄', data = msg.sender_id.user_id..'/orka'},{text = '🪨️', data = msg.sender_id.user_id..'/hagra'},
},
}
}
return send(msg_chat_id,msg_id,baniusernamep,"md",false, false, false, false, reply_markup)
end
if text and Redis:get(Fast.."photo:test"..msg.sender_id.user_id) then
local phid = Redis:get(Fast.."photo:test"..msg.sender_id.user_id)
Redis:set(Fast.."get:photo:answer"..phid,text)
send(msg.chat_id,msg.id,"• تم حفظ جواب الصورة بنجاح")
Redis:del(Fast.."photo:test"..msg.sender_id.user_id)
end
if Redis:get(Fast.."add:photo"..msg.sender_id.user_id..":"..msg.chat_id) then
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
phid = msg.content.photo.sizes[1].photo.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
phid = msg.content.photo.sizes[2].photo.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
phid = msg.content.photo.sizes[3].photo.id
end
Redis:del(Fast.."add:photo"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:sadd(Fast.."photos:game",phid)
Redis:set(Fast.."get:photo"..phid,idPhoto)
Redis:set(Fast.."photo:test"..msg.sender_id.user_id,phid)
send(msg.chat_id,msg.id,"• تم حفظ الصورة ارسل الان جواب الصورة")
end
end
if text == "صور" then
local list = Redis:smembers(Fast.."photos:game")
if #list == 0 then
return send(msg.chat_id,msg.id,"• لا توجد صور مضافة")
end
local phid = list[math.random(#list)]
local getPhoto = Redis:get(Fast.."get:photo"..phid)
local getAnswer = Redis:get(Fast.."get:photo:answer"..phid)
Redis:set(Fast..msg.chat_id.."answers:photo",getAnswer)
bot.sendPhoto(msg.chat_id, msg.id, getPhoto,"• اسرع واحد يرسل اسم من في الصورة")
end
if text == "اضف صور" or text == "اضف صورة" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."add:photo"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"• ارسل الصورة الان ")
end
if text == "مسح الصور" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."photos:game")
if #list == 0 then
return send(msg.chat_id,msg.id,"• لا توجد صور مضافة")
end
for k,v in pairs(list) do
Redis:del(Fast.."get:photo:answer"..v)
Redis:del(Fast.."get:photo"..v)
end
Redis:del(Fast.."photos:game")
send(msg.chat_id,msg.id,"• تم مسح الصور المضافة")
end
if text == "مسح صورة" and  tonumber(msg.reply_to_message_id) > 0 then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local data = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if data.content.photo then
if data.content.photo.sizes[1].photo.remote.id then
phid = data.content.photo.sizes[1].photo.id
elseif data.content.photo.sizes[2].photo.remote.id then
phid = data.content.photo.sizes[2].photo.id
elseif data.content.photo.sizes[3].photo.remote.id then
phid = data.content.photo.sizes[3].photo.id
end
local getAnswer = Redis:get(Fast.."get:photo:answer"..phid)
Redis:srem(Fast.."photos:game",phid)
send(msg_chat_id,msg_id,'• تم حذف *['..getAnswer..']* من الصور بنجاح',"md")
Redis:del(Fast.."get:photo"..phid)
Redis:del(Fast.."get:photo:answer"..phid)
end
end
if Redis:get(Fast.."Start_Ahkamm"..msg.chat_id) then
if text == "انا" then
if Redis:sismember(Fast..'List_Ahkamm'..msg.chat_id,msg.sender_id.user_id) then
return bot.sendText(msg.chat_id,msg.id,'⇜ اسمك موجود من قبل',"md",true)
end
Redis:sadd(Fast..'members_Ahkamm'..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(Fast..'List_Ahkamm'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(Fast.."Witting_StartGamehh"..msg.chat_id,1400,true)
local AkZilzal = '⇜ تم ضفتك للعبة\n\n⇜ اللي يبي يلعب يرسل كلمة (انا) او يضغط الزر\n⇜ للانتهاء يرسل (نعم) اللي بدأ اللعبة'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اضغـط للانضمام', callback_data = '/Akab'},},}
local rep = msg.id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' ..msg_chat_id.. '&text=' .. URL.escape(AkZilzal).."&reply_to_message_id="..rep..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))
end
end
---------------------- احكـــام ----------------------
if text == "انا" and Redis:get(Fast.."Start_Ahkkam"..msg.chat_id) then
if Redis:sismember(Fast..'List_Ahkkam'..msg.chat_id,msg.sender_id.user_id) then
return bot.sendText(msg.chat_id,msg.id,'⇜ اسمك موجود من قبل',"md",true)
end
Redis:sadd(Fast..'List_Ahkkam'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(Fast.."Witting_StartGameh"..msg.chat_id,1400,true)
local list = Redis:smembers(Fast..'List_Ahkkam'..msg.chat_id) 
if #list == 2 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local zzllzz = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = 'اضغط للانضمام', data = '/joineahkam'},},}}
return bot.sendText(msg.chat_id,msg_id,zzllzz, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 3 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = 'اضغط للانضمام', data = '/joineahkam'},},
{{text = 'بدء اللعبة', data = '/startahkam'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 4 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = 'اضغط للانضمام', data = '/joineahkam'},},
{{text = 'بدء اللعبة', data = '/startahkam'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 5 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = 'اضغط للانضمام', data = '/joineahkam'},},
{{text = 'بدء اللعبة', data = '/startahkam'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 6 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = 'اضغط للانضمام', data = '/joineahkam'},},
{{text = 'بدء اللعبة', data = '/startahkam'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 7 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = 'اضغط للانضمام', data = '/joineahkam'},},
{{text = 'بدء اللعبة', data = '/startahkam'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 8 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = 'اضغط للانضمام', data = '/joineahkam'},},
{{text = 'بدء اللعبة', data = '/startahkam'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 9 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == 9 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id8 = "t.me/"..Uname
name9 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = name9, url = id8},},
{{text = 'اضغط للانضمام', data = '/joineahkam'},},
{{text = 'بدء اللعبة', data = '/startahkam'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 10 then
local message = '⇜ وصل عدد الاعبين للحد الاعلى\nالمشتركين في لعبة الاحكام هم :' 
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == 9 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id8 = "t.me/"..Uname
name9 = FlterBio(Nname)
end
if k == 10 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id9 = "t.me/"..Uname
name10 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = name9, url = id8},},
{{text = name10, url = id9},},
{{text = 'بدء اللعبة', data = '/startahkam'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
end
end
---------------------- كرســـي الاعتـــراف ----------------------
if text == "انا" and Redis:get(Fast.."Start_Koorsi"..msg.chat_id) then
if Redis:sismember(Fast..'List_Koorsi'..msg.chat_id,msg.sender_id.user_id) then
return bot.sendText(msg.chat_id,msg.id,'⇜ اسمك موجود من قبل',"md",true)
end
Redis:sadd(Fast..'List_Koorsi'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(Fast.."Witting_StartGameek"..msg.chat_id,1400,true)
local list = Redis:smembers(Fast..'List_Koorsi'..msg.chat_id) 
if #list == 2 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local zzllzz = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = 'اضغط للانضمام', data = '/Koorsy'},},}}
return bot.sendText(msg.chat_id,msg_id,zzllzz, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 3 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = 'اضغط للانضمام', data = '/Koorsy'},},
{{text = 'بدء اللعبة', data = '/startkoorsi'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 4 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = 'اضغط للانضمام', data = '/Koorsy'},},
{{text = 'بدء اللعبة', data = '/startkoorsi'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 5 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = 'اضغط للانضمام', data = '/Koorsy'},},
{{text = 'بدء اللعبة', data = '/startkoorsi'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 6 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = 'اضغط للانضمام', data = '/Koorsy'},},
{{text = 'بدء اللعبة', data = '/startkoorsi'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 7 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = 'اضغط للانضمام', data = '/Koorsy'},},
{{text = 'بدء اللعبة', data = '/startkoorsi'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 8 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = 'اضغط للانضمام', data = '/Koorsy'},},
{{text = 'بدء اللعبة', data = '/startkoorsi'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 9 then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')'
local message = '⇜ عدد الاعبين : '..#list..' \n⇜ انضم للعبة \n'..Teext
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == 9 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id8 = "t.me/"..Uname
name9 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = name9, url = id8},},
{{text = 'اضغط للانضمام', data = '/Koorsy'},},
{{text = 'بدء اللعبة', data = '/startkoorsi'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
elseif #list == 10 then
local message = '⇜ وصل عدد الاعبين للحد الاعلى\n⇜ المشاركين في لعبة كرسي الاعتراف هم :' 
for k,v in pairs(list) do
if k == 1 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id = "t.me/"..Uname
name1 = FlterBio(Nname)
end
if k == 2 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id1 = "t.me/"..Uname
name2 = FlterBio(Nname)
end
if k == 3 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id2 = "t.me/"..Uname
name3 = FlterBio(Nname)
end
if k == 4 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id3 = "t.me/"..Uname
name4 = FlterBio(Nname)
end
if k == 5 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id4 = "t.me/"..Uname
name5 = FlterBio(Nname)
end
if k == 6 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id5 = "t.me/"..Uname
name6 = FlterBio(Nname)
end
if k == 7 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id6 = "t.me/"..Uname
name7 = FlterBio(Nname)
end
if k == 8 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id7 = "t.me/"..Uname
name8 = FlterBio(Nname)
end
if k == 9 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id8 = "t.me/"..Uname
name9 = FlterBio(Nname)
end
if k == 10 then
local Nname = bot.getUser(v).first_name
local Uname = bot.getUser(v).username
id9 = "t.me/"..Uname
name10 = FlterBio(Nname)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = name1, url = id},},
{{text = name2, url = id1},},
{{text = name3, url = id2},},
{{text = name4, url = id3},},
{{text = name5, url = id4},},
{{text = name6, url = id5},},
{{text = name7, url = id6},},
{{text = name8, url = id7},},
{{text = name9, url = id8},},
{{text = name10, url = id9},},
{{text = 'بدء اللعبة', data = '/startkoorsi'},},}}
return bot.sendText(msg.chat_id,msg_id,message, 'md', true, false, false, false, reply_markup)
end
end
end
end

if Redis:get(Fast.."Fast:Game:Arbieq:aslame"..msg.chat_id) then
if text == Redis:get(Fast.."Fast:Game:Arbieq:aslame"..msg.chat_id) then 
Redis:del(Fast.."Fast:Game:Arbieq:aslame"..msg.chat_id)
Redis:incrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id, 1)  
local Num = Redis:get(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id) or 0
return send(msg_chat_id,msg_id,"\n⇜ كفو اجابتك صح \n⇜ تم اضافة لك نقطة\n⇜ نقاطك الان : "..Num.." \n✧","md",true) 
end
end
if Redis:get(Fast.."Fast:Game:Arbieq:aslamek"..msg.chat_id) then
if text == Redis:get(Fast.."Fast:Game:Arbieq:aslamek"..msg.chat_id) then 
Redis:del(Fast.."Fast:Game:Arbieq:aslamek"..msg.chat_id)
Redis:incrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id, 1)  
local Num = Redis:get(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id) or 0
return send(msg_chat_id,msg_id,"\n⇜ كفو اجابتك صح \n⇜ تم اضافة لك نقطة\n⇜ نقاطك الان : "..Num.." \n✧","md",true) 
end
end
if Redis:get(Fast.."Fast:Game:Monotonousss"..msg.chat_id) then
if text == Redis:get(Fast.."Fast:Game:Monotonousss"..msg.chat_id) then 
Redis:del(Fast.."Fast:Game:Monotonousss"..msg.chat_id)
Redis:incrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id, 1)  
local Num = Redis:get(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id) or 0
return send(msg_chat_id,msg_id,"\n⇜ كفو اجابتك صح \n⇜ تم اضافة لك نقطة\n⇜ نقاطك الان : "..Num.." \n✧","md",true) 
end
end

if Redis:get(Fast.."mshaher"..msg.chat_id) then
if text == Redis:get(Fast.."mshaher"..msg.chat_id) then
Redis:del(Fast.."mshaher"..msg.chat_id)
Redis:incrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id, 1)  
local Num = Redis:get(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id) or 0
return send(msg_chat_id,msg_id,"\n⇜ كفو اجابتك صح \n⇜ تم اضافة لك نقطة\n⇜ نقاطك الان : "..Num.." \n✧","md",true)  
end
end 
if Redis:get(Fast.."mshaherr"..msg.chat_id) then
if text == Redis:get(Fast.."mshaherr"..msg.chat_id) then
Redis:del(Fast.."mshaherr"..msg.chat_id)
Redis:incrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id, 1)  
local Num = Redis:get(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id) or 0
return send(msg_chat_id,msg_id,"\n⇜ كفو اجابتك صح \n⇜ تم اضافة لك نقطة\n⇜ نقاطك الان : "..Num.." \n✧","md",true)  
end
end
if Redis:get(Fast.."mshaherrr"..msg.chat_id) then
if text == Redis:get(Fast.."mshaherrr"..msg.chat_id) then
Redis:del(Fast.."mshaherrr"..msg.chat_id)
Redis:incrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id, 1)  
local Num = Redis:get(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id) or 0
return send(msg_chat_id,msg_id,"\n⇜ كفو اجابتك صح \n⇜ تم اضافة لك نقطة\n⇜ نقاطك الان : "..Num.." \n✧","md",true)  
end
end  
if Redis:get(Fast.."photohzr"..msg.chat_id) then
if text == Redis:get(Fast.."photohzr"..msg.chat_id) then
Redis:del(Fast.."photohzr"..msg.chat_id)
Redis:incrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id, 1)  
local Num = Redis:get(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id) or 0
return send(msg_chat_id,msg_id,"\n⇜ كفو اجابتك صح \n⇜ تم اضافة لك نقطة\n⇜ نقاطك الان : "..Num.." \n✧","md",true)  
end
end 

if Redis:get(Fast.."Start_rhan"..msg.chat_id) then
if text and text:match('^انا (.*)$') then
local UserName = text:match('^انا (.*)$')
local coniss = coin(UserName)
ballancee = Redis:get(Fast.."boob"..msg.sender_id.user_id) or 0
if tonumber(coniss) < 999 then
return send(msg.chat_id,msg.id, "⇜ الحد الادنى المسموح هو 1000 ريال 💵\n✧","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "⇜ فلوسك ماتكفي \n✧","md",true)
end
if Redis:sismember(Fast..'List_rhan'..msg.chat_id,msg.sender_id.user_id) then
return send(msg.chat_id,msg.id,'⇜ انت مضاف من قبل .',"md",true)
end
Redis:set(Fast.."playerrhan"..msg.chat_id,msg.sender_id.user_id)
Redis:set(Fast.."playercoins"..msg.chat_id..msg.sender_id.user_id,coniss)
Redis:sadd(Fast..'List_rhan'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(Fast.."Witting_Startrhan"..msg.chat_id,1400,true)
benrahan = Redis:get(Fast.."allrhan"..msg.chat_id..12345) or 0
rehan = tonumber(benrahan) + tonumber(coniss)
Redis:set(Fast.."allrhan"..msg.chat_id..12345 , rehan)
local ballancee = Redis:get(Fast.."boob"..msg.sender_id.user_id) or 0
rehan = tonumber(ballancee) - tonumber(coniss)
Redis:set(Fast.."boob"..msg.sender_id.user_id , rehan)
return send(msg.chat_id,msg.id,'⇜ تم ضفتك للرهان \n⇜ للانتهاء يرسل ( نعم ) اللي بدء الرهان .',"md",true)
end
end


if text == "حظي" then
if Redis:get(Fast.."Fast:Status:games:malk"..msg.chat_id) then
return false 
end
if not Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
return false
end
local list = {"3","5","-3","-5","="}
RtList = list[math.random(#list)]
if RtList == "3" then
Redis:incrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id,3)
StatusRt = "الف مبروك حظك حلو ربحت 3 نقاط"
elseif RtList == "5" then
Redis:incrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id,5)
StatusRt = "الف مبروك حظك حلو ربحت 5 نقاط"
elseif RtList == "-3" then
Redis:decrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id,3)  
StatusRt = "للاسف حظك زفت خسرت 3 نقاط"
elseif RtList == "-5" then
Redis:decrby(Fast.."Fast:Num:Add:games"..msg.chat_id..msg.sender_id.user_id,5)  
StatusRt = "للاسف حظك زفت خسرت 5 نقاط"
elseif RtList == "=" then
StatusRt = "حظك ماش اليوم لا ربح ولا خسارة"
end
return send(msg.chat_id,msg.id,"⇜ "..StatusRt,"md",true)  
end
if text == "عربي" or text == "العربي" then
if Redis:get(Fast.."Fast:Status:games:malk"..msg.chat_id) then
return false 
end
if not Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
return false
end
KlamSpeed = {
"فحوص",
"ملعقة",
"دروس",
"مراحل",
"صفوف",
"قائمة",
"حلق",
"طوابع",
"عصور",
"أوائل",
"وجه",
"أقارب",
"خد",
"جامع",
"أنوف",
"ذيول",
"فاكهة",
"ظروف",
"مسجد",
"رؤوس",
"شوارع",
"بطن",
"مسابح",
"لصوص",
"هاتف",
"خط",
"حدائق",
"سد",
"مسارح",
"عقل",
"مشكلة",
"ملك",
"رسالة",
"عقد",
"وظائف",
"فصول",
"جرائم",
"بيت",
"مرتبة",
"شهور",
"مدرسة",
"بحر",
"مائدة",
"بنك",
"منطقة",
"علم",
"كرسي",
"قدور",
"منازل"
};
name = KlamSpeed[math.random(#KlamSpeed)]
send(msg.chat_id,msg.id,"⇜ ارسل مفرد او جمع : ( "..name.." )","md",true)  
name = string.gsub(name,"فحوص","فحص")
name = string.gsub(name,"ملعقة","ملاعق")
name = string.gsub(name,"دروس","درس")
name = string.gsub(name,"مراحل","مرحله")
name = string.gsub(name,"صفوف","صف")
name = string.gsub(name,"قائمة","قوائم")
name = string.gsub(name,"حلق","حلوق")
name = string.gsub(name,"طوابع","طابع")
name = string.gsub(name,"عصور","عصر")
name = string.gsub(name,"أوائل","اول")
name = string.gsub(name,"وجه","وجوه")
name = string.gsub(name,"أقارب","قريب")
name = string.gsub(name,"خد","خدود")
name = string.gsub(name,"جامع","جوامع")
name = string.gsub(name,"أنوف","انف")
name = string.gsub(name,"ذيول","ذيل")
name = string.gsub(name,"فاكهة","فواكه")
name = string.gsub(name,"ظروف","ضرف")
name = string.gsub(name,"مسجد","مساجد")
name = string.gsub(name,"رؤوس","راس")
name = string.gsub(name,"شوارع","شارع")
name = string.gsub(name,"بطن","بطون")
name = string.gsub(name,"مسابح","مسبح")
name = string.gsub(name,"لصوص","لص")
name = string.gsub(name,"هاتف","هواتف")
name = string.gsub(name,"خط","خطوط")
name = string.gsub(name,"حدائق","حديقه")
name = string.gsub(name,"سد","سدود")
name = string.gsub(name,"مسارح","مسرح")
name = string.gsub(name,"عقل","عقول")
name = string.gsub(name,"مشكلة","مشاكل")
name = string.gsub(name,"ملك","ملوك")
name = string.gsub(name,"رسالة","رسائل")
name = string.gsub(name,"عقد","عقود")
name = string.gsub(name,"وظائف","وظيفه")
name = string.gsub(name,"فصول","فصل")
name = string.gsub(name,"جرائم","جريمه")
name = string.gsub(name,"بيت","بيوت")
name = string.gsub(name,"مرتبة","مراتب")
name = string.gsub(name,"شهور","شهر")
name = string.gsub(name,"مدرسة","مدارس")
name = string.gsub(name,"بحر","بحور")
name = string.gsub(name,"مائدة","موائد")
name = string.gsub(name,"بنك","بنوك")
name = string.gsub(name,"منطقة","مناطق")
name = string.gsub(name,"علم","علوم")
name = string.gsub(name,"كرسي","كراسي")
name = string.gsub(name,"قدور","قدر")
name = string.gsub(name,"منازل","منزل")
Redis:set(Fast.."Fast:Game:Arbieq"..msg.chat_id,name)
return false
end
if text== "اضف سؤال كت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"ارسل السؤال الان ")
end
if text== "مسح سؤال كت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"ارسل السؤال ")
end
if text == 'اسئلة كت' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
t = "• الاسئلة المضافة : \n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "• لا يوجد اسئلة"
end
return send(msg_chat_id,msg_id,t,'md')
end

if text == 'مسح اسئلة كت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
if #list == 0 then
send(msg_chat_id,msg_id,"• لا يوجد اسئلة")
end
Redis:del(Fast.."gamebot:List:Manager")
send(msg_chat_id,msg_id,'تم مسح الاسئلة')
end

if text== 'كت تويت ' or text== 'كت' or text == "تويت" then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
if #list ~= 0 then
local quschen = list[math.random(#list)]
return send(msg.chat_id,msg.id,quschen)
end
end
end
if text == 'اضف اسئلة كت' then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = {
'يومك ضاع على؟',
'من اصدق في الحب الولد ولا البنت؟.',
'اول ولد او بنت الك شنو تسمي ؟',
'من ايشدوله انت🌍؟',
'عبّر عن مودك بصورة ؟',
'تحب القرائه ؟',
'مع أو ضد لو كان خيراً لبقئ.؟',
'اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟',
'شيء من صغرك ماتغير فيك؟',
'هل ما زلت تعتقد ان هنالك حب حقيقي؟',
'نهارك يصير أجمل بوجود ..؟',
'أجمل شيء حصل معك خلال هذا الاسبوع ؟',
'وش تحس انك تحتاج الفترة هاذي ؟',
'شهر من أشهر العام له ذكرى جميلة معك؟',
'شنو هدفك بالمستقبل القريب ؟',
'صوت مغني م تحبه',
'نسبة جمال صوتك ؟',
'اكثر برنامج تواصل اجتماعي تحبه😎؟',
'اول سفره لك وين رح تكون✈️؟',
'لماذا لم تتم خطبتك حتى الآن..؟',
'متصالح مع نفسك؟.',
'متى لازم تقول لا ؟',
'أجمل بيت شعر سمعته ...',
'ماذا تفعل عندما تري دموع زوجتك..؟',
'كم كان عمرك/ج قبل ٨ سنين😈؟',
'لو بيدك تغير الزمن ، تقدمه ولا ترجعه🕰؟',
'اخر كلمة قالها لك حبيبك؟.',
'شيء يعدل نفسيتك بثواني.؟',
'شاركنا اقوئ نكتة عندك.؟',
'افضل هديه ممكن تناسبك؟',
'‏أكثر شيء شخصي ضاع منك؟',
'رحتي لعرس وأكتشفتي العريس حبيبك شنو ردة فعلك.؟',
'أنا آسف على ....؟',
'أجمل شيء حصل معك خلال هذا الاسبوع ؟',
'حط@منشن لشخص وقوله "حركتك مالها داعي"😼!',
'‏تتوقع الإنسان يحس بقرب موته؟',
'اكثر مشاكلك بسبب ؟',
'افضل ايام الاسبوع عندك🔖؟',
'صِف شعورك وأنت تُحب شخص يُحب غيرك؟👀💔',
'‏-لو امتلكت العصا السحرية ليوم واحد ماذا ستفعل ؟',
'انت من النوع الي دائما ينغدر من اقرب الناس اله ؟',
'كلمة غريبة ومعناها؟',
'متى حدث التغيير الكبير والملحوظ في شخصيتك؟',
'‏لوخيروك ⁞ الاكل لو النت ؟!',
'وقت حزنك تلجأ لمن يخفف عنك.؟',
'مغني تلاحظ أن صوته يعجب الجميع إلا أنت ؟',
'غزل بلهجتك ؟',
'قرارتك راضي عنها ام لا ؟',
'كم عدد المرات التي تعرضتِ فيها إلى أزمة نفسية وأردتِ الصراخ بأعلى صوتك..؟',
'تاريخ ميلادك؟',
'ردة فعلك لما تنظلم من شخص ؟',
'هل التعود على شخص والتحدث معه بشكل يومي يعتبر نوع من أنواع الحب ؟',
'كم مرة حبيت ؟',
'اول ماتصحى من النوم مين تكلمة؟',
'يهمك ملابسك تكون ماركة ؟',
'‏يوم لا يمكنك نسيانه؟',
'اكثر شيء يرفع ضغطك',
'تملك وسواس من شيء معين ؟',
'ما هي نقاط الضعف في شخصيتك..؟',
'أخر اتصال جاك من مين ؟',
'من أصحاب الماضي والحنين ولا الصفحات المطوية.؟',
'‏تاك لشخص لديك لا تخفي عنه شي؟',
'شاركني آخر صورة جميلة من كاميرا هاتفك.؟',
'أفضل صفة تحبه بنفسك؟',
'كلمة لشخص أسعدك رغم حزنك في يومٍ من الأيام ؟',
'أصعب صفة قد تتواجد في الرجل .؟',
'من الشخص الاقرب لقلبك؟.',
'تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب ؟',
'كلمة لشخص غالي اشتقت إليه؟💕',
'‏تقبل بالعودة لشخص كسر قلبك مرتين؟',
'يسكر على أصبعك الباب ولا تعض لسانك  بالغلط؟!',
'الفلوس او الحب ؟',
'هل خرجتي مع شخص تعرفتي عليه من خلال التليكرام من قبل..؟',
'هل لو تقدم شخص لاختك من أجل خطبتها وقامت برفضه تقبلين به..؟',
'عندك أخوان او خوات من الرضاعة؟',
'اذكر موقف ماتنساه بعمرك؟',
'لو اخذوك مستشفى المجانين كيف تثبت لهم انك صاحي ؟',
'اذا احد سألك عن شيء م تعرفه تقول م اعرف ولا تتفلسف ؟',
'ما السيء في هذه الحياة ؟',
'إذا كانت الصراحة ستبعد عنك من تحب هل تمتلك الشجاعة للمصارحة ام لا .؟',
'تؤمن ان في "حُب من أول نظرة" ولا لا ؟.',
'لو بتغير اسمك ايش بيكون الجديد ؟',
'مع او ضد : النوم افضل حل لـ مشاكل الحياة؟',
'هل يمكنك الكذب والاستمرار بارتكاب الأخطاء كمحاولة منك لعدم الكشف أنك مخطئ ؟',
'هل خرجتي مع شخص تعرفتي عليه من خلال التليكرام من قبل..؟',
'تحب تحتفظ بالذكريات ؟',
'لو حصل واشتريت جزيرة، ماذا ستختار اسمًا لها.؟',
'ما هي طريقتك في الحصول على الراحة النفسية؟',
'من أصحاب النسيان او التجاوز رغم الذكرى.؟',
'لو عندك امنية وبتحقق وش هي؟.',
'لو عندك فلوس وش السيارة اللي بتشتريها؟',
'عندك فوبيا او خوف شديد من شيء معين ؟',
'أمنية كنت تتمناها وحققتها ؟',
'تاك لشخص وكوله اعترف لك؟',
'‏- صريح، هل سبق وخذلت أحدهم ولو عن غير قصد؟',
'طبع يمكن يخليك تكره شخص حتى لو كنت تُحبه🙅🏻‍♀️؟',
}
for k,v in pairs(list) do
Redis:sadd(Fast.."gamebot:List:Manager",v)
end
return send(msg_chat_id,msg_id,'\n*• تم اضافة اسئلة كت* ',"md",true)  
end
if text == "سمايلات" or text == "سمايل" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Random = {"🍎","🍐","??","🍋","🍉","??","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","??","🥚","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🥤","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","🚚","🚛","🚜","⚔","🛡","🔮","🌡","💣","• ","📍","📓","📗","📂","📅","📪","??","• ","📭","⏰","??","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
Redis:set(Fast.."Game:Smile"..msg.chat_id,SM)
return send(msg.chat_id,msg.id,"• اسرع واحد يدز هذا السمايل ? ~ {`"..SM.."`}","md",true)  
end
end

if text == "الاسرع" or text == "ترتيب" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(Fast.."Game:Monotonous"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
return send(msg.chat_id,msg.id,"• اسرع واحد يرتبةا ~ {"..name.."}","md",true)  
end
end
if text == "حزوره" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Hzora = {"الجرس","عقرب الساعة","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعة","22","غلط","كم الساعة","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
Redis:set(Fast.."Game:Riddles"..msg.chat_id,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعة","اخوان لا يستطيعان تمضيه اكثر من دقيقة معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعة","ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مرة ينطبق عقربا الساعة على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمة الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعة","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","مهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
return send(msg.chat_id,msg.id,"• اسرع واحد يحل الحزوره ↓\n {"..name.."}","md",true)  
end
end
if text == "معاني" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Redis:del(Fast.."Set:Maany"..msg.chat_id)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
Redis:set(Fast.."Game:Meaningof"..msg.chat_id,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
return send(msg.chat_id,msg.id,"• اسرع واحد يدز معنى السمايل ~ {"..name.."}","md",true)  
end
end
if text == "العكس" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Redis:del(Fast.."Set:Aks"..msg.chat_id)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","قصير","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
Redis:set(Fast.."Game:Reflection"..msg.chat_id,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"قصير","طويل")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
return send(msg.chat_id,msg.id,"• اسرع واحد يدز العكس ~ {"..name.."}","md",true)  
end
end
if text == "بات" or text == "محيبس" then   
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '➀ » { 👊 }', data = '/Mahibes1'}, {text = '➁ » { 👊 }', data = '/Mahibes2'}, 
},
{
{text = '➂ » { 👊 }', data = '/Mahibes3'}, {text = '➃ » { 👊 }', data = '/Mahibes4'}, 
},
{
{text = '➄ » { 👊 }', data = '/Mahibes5'}, {text = '➅ » { 👊 }', data = '/Mahibes6'}, 
},
}
}
return send(msg.chat_id,msg.id, [[*
• لعبه المحيبس هي لعبة الحظ 
• جرب حظك ويه البوت واتونس 
• كل ما عليك هوا الضغط على اليد في الازرار
*]],"md",false, false, false, false, reply_markup)
end
end
if text == "خمن" or text == "تخمين" then   
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Num = math.random(1,20)
Redis:set(Fast.."Game:Estimate"..msg.chat_id..msg.sender_id.user_id,Num)  
return send(msg.chat_id,msg.id,"\n• اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n".."• ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n".."• سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ ","md",true)  
end
end
if text == 'اسئلة' then   
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
t1 = [[
مهو اطول نهر في العالم 
1- النيل  
2- الفرات 
3- نهر الكونغو

• ارسل  الجواب الصحيح فقط
]]
t2 = [[
ماعدد عظام الوجه؟
1- 15
2- 13
3- 14 

• ارسل  الجواب الصحيح فقط
]]
t3 =[[
كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون؟

1- الفم 
2- الاذن
3- الثلاجه

• ارسل  الجواب الصحيح فقط
]]
t4 =[[
كم جزء تحتوي مسلسل وادي الذئاب؟

1- 7
2- 15
3- 11

• ارسل  الجواب الصحيح فقط
]]
t5 =[[
كم جزء يحتوي القران الكريم؟

1- 60
2- 70
3- 30 

• ارسل  الجواب الصحيح فقط
]]
t6 =[[
من هوه اغنى رئيس في العالم؟

1- ترامب
2- اوباما
3- بوتين  

• ارسل  الجواب الصحيح فقط
]]

t7 =[[
من هوه مؤسس شركه ابل العالميه 

1-لاري بايج 
2- بيا غايتز
3- ستيف جوبر

• ارسل  الجواب الصحيح فقط
]]
t8 =[[
ماهي عاصمه فرنسا؟

1- باريس 
2- لوين 
3- موسكو 

• ارسل  الجواب الصحيح فقط
]]
t9 =[[
ماعدد دول العربيه التي توجد في افريقيا 

1- 10 
2- 17
3- 9

• ارسل  الجواب الصحيح فقط
]]
t11 =[[
مهو الحيوان الذي يحمل 50 فوق وزنه؟
1-الفيل
2- النمل  
3- الثور

• ارسل  الجواب الصحيح فقط
]]
t12 =[[
ماذا يوجد بيني وبينك؟  
1- الضل
2- الاخلاق
3-حرف الواو  

• ارسل  الجواب الصحيح فقط
]]
t13 =[[
مهو الشيء النبات ينبت للانسان بلا بذر؟
1-الاضافر 
2- الاسنان
3- الشعر

• ارسل  الجواب الصحيح فقط
]]
t14 =[[
م̷ـــِْن هو اول الرسول الى الارض؟
1- ادم
2- نوح
3-ابراهيم 

• ارسل  الجواب الصحيح فقط
]]
t15 =[[
ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين؟
1- سحاب
2- بئر
3- نهر

• ارسل  الجواب الصحيح فقط
]]
t16 =[[
ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا؟
1- العمر
2- ساعة
3- الاسم

• ارسل  الجواب الصحيح فقط
]]
t17 =[[
اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم
1- نحاس
2- الماس
3- ذهب

• ارسل  الجواب الصحيح فقط
]]
t18 =[[
في الليل ثلاثة لكنه في النهار واحده فما هو
 1- حرف الباء
 2- حرف الام 
3- حرف الراء

• ارسل  الجواب الصحيح فقط
]]
t19 =[[
على قدر اصل العزم تأتي؟
1- العزائم 
2- المكارم
3- المبائب

• ارسل  الجواب الصحيح فقط
]]

t20 =[[
ماهي جمع كلمة انسه ؟
1- سيدات
2- انسات 
3- قوانص

• ارسل  الجواب الصحيح فقط
]]
t21 =[[
اله اتسعلمت قديما في الحروب؟
1- الصاروخ
2- المسدس
3- المنجنيق 

• ارسل  الجواب الصحيح فقط
]]
t22 =[[
تقع لبنان في قاره؟
1- افريقيا 
2- اسيا  
3- امركيا الشماليه

• ارسل  الجواب الصحيح فقط
]]

t23 =[[
1- مهو الحيوان الذي يلقب بملك الغابه؟
1-الفيل
2- الاسد 
3- النمر

• ارسل  الجواب الصحيح فقط
]]
t24 =[[
كم صفرا للمليون ؟
1- 4 
2- 3
3-6

• ارسل  الجواب الصحيح فقط
]]
t25 =[[
ما اسم صغير الحصان؟
1- مهر  
2- جرو
3- عجل

• ارسل  الجواب الصحيح فقط
]]
t26 =[[
ما الحيوان الذي ينام واحدى عينه مفتوحه؟

1- القرش
2- الدلفين 
3- الثعلب

• ارسل  الجواب الصحيح فقط
]]
t27 =[[
ماهي القاره التي تلقب بالقاره العجوز؟

1- امريكا الشماليه 
2- امريكا الجنوبيه
3- افريقيا 

• ارسل  الجواب الصحيح فقط
]]
t28 =[[
ما اسم المعدن الموجود فيي الحاله السائله 

1- النحاس 
2- الحديد
3- الزئبق 
 
• ارسل  الجواب الصحيح فقط
]]
t29 =[[
ماهي عاصمه انجلترا؟
1- لندن  
2- لفرسول
3- تركيا

• ارسل  الجواب الصحيح فقط
]]
t30 =[[
مهو الشئ الذي برأسه سبع فتحات

1- الهاتف
2- التلفاز
3- الانسان 

• ارسل  الجواب الصحيح فقط
]]
t31 =[[
ماهي عاصمه اليابان ؟
1- بانقول
2- نيو دلهي
3- طوكيو 

• ارسل  الجواب الصحيح فقط
]]
t32 =[[
من هي زوجه الرسول الاكبر منه سنآ؟

1- حفضه
2- زينب 
3- خديجه 

• ارسل  الجواب الصحيح فقط
]]
TAHA = {t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t1,t2,t3,t4,t5,t6,t7,t8,t9,t11,t12,t13,t14,t15}
local SENDTEXT = TAHA[math.random(#TAHA)]
if SENDTEXT:find('النيل') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'النيل') 
elseif SENDTEXT:find('14') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'14') 
elseif SENDTEXT:find('الفم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الفم') 
elseif SENDTEXT:find('11') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'11') 
elseif SENDTEXT:find('30') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'30') 
elseif SENDTEXT:find('بوتين') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'بوتين') 
elseif SENDTEXT:find('ستيف جوبر') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'ستيف جوبر') 
elseif SENDTEXT:find('باريس') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'باريس') 
elseif SENDTEXT:find('10') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'10') 
elseif SENDTEXT:find('النمل') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'النمل') 
elseif SENDTEXT:find('حرف الواو') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'حرف الواو') 
elseif SENDTEXT:find('الشعر') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الشعر') 
elseif SENDTEXT:find('ابراهيم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'ابراهيم') 
elseif SENDTEXT:find('سحاب') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'سحاب') 
elseif SENDTEXT:find('الاسم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الاسم') 
elseif SENDTEXT:find('ذهب') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'ذهب') 
elseif SENDTEXT:find('حرف الام') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'حرف الام') 
elseif SENDTEXT:find('العزائم') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'العزائم') 
elseif SENDTEXT:find('انسات') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'انسات') 
elseif SENDTEXT:find('المنجنيق') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'المنجنيق') 
elseif SENDTEXT:find('اسيا') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'اسيا') 
elseif SENDTEXT:find('الاسد') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الاسد') 
elseif SENDTEXT:find('6') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'6') 
elseif SENDTEXT:find('مهر') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'مهر') 
elseif SENDTEXT:find('الدلفين') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الدلفين') 
elseif SENDTEXT:find('اوروبا') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'اوروبا') 
elseif SENDTEXT:find('الزئبق') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الزئبق') 
elseif SENDTEXT:find('لندن') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'لندن') 
elseif SENDTEXT:find('الانسان') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'الانسان') 
elseif SENDTEXT:find('طوكيو') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'طوكيو') 
elseif SENDTEXT:find('خديجه') then
Redis:set(Fast.."GAME:CHER"..msg.chat_id,'خديجه') 
end
send(msg.chat_id,msg.id,SENDTEXT)     
return false  
end
end
if Redis:get(Fast.."GAME:CHER"..msg.chat_id) and (text == Redis:get(Fast.."GAME:CHER"..msg.chat_id)) then  
if text then
send(msg.chat_id,msg.id,'*• احسنت اجابتك صحيحه ✓*',"md")     
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
Redis:del(Fast.."GAME:CHER"..msg.chat_id)
elseif text == 'الفيل' or text == 'الثور' or text == 'الحصان' or text == '7' or text == '9' or text == '8' or text == 'لوين' or text == 'موسكو' or text == 'مانكو' or text == '20' or text == '30' or text == '28' or text == 'ترامب' or text == 'اوباما' or text == 'كيم جونغ' or text == '50' or text == '70' or text == '40' or text == '7' or text == '3' or text == '10' or text == '4' or text == 'الاذن' or text == 'الثلاجه' or text == 'الغرفه' or text == '15' or text == '17' or text == '25' or text == 'الفرات' or text == 'نهر الكونغو' or text == 'المسيبي' or text == 'بيا بايج' or text == 'لاري بيج' or text == 'بيا مارك زوكيربرج' or text == 'الفيل' or text == 'النمر' or text == 'الفهد' or text == 'بانقول' or text == 'نيو دلهي' or text == 'بيكن' or text == 'الهاتف' or text == 'التلفاز' or text == 'المذياع' or text == 'لفرسول' or text == 'تركيا' or text == 'بغداد' or text == 'النحاس' or text == 'الحديد' or text == 'الفضه' or text == 'امريكا الشماليه' or text == 'امريكا الجنوبيه' or text == 'افريقيا' or text == 'القرش' or text == 'الثعلب' or text == 'الكلب' or text == 'للجرو' or text == 'العجل' or text == 'الحمار' or text == '3' or text == '5' or text == '6' or text == 'اوربا' or text == 'افريقيا' or text == 'امريكا الجنوبيه' or text == 'افريقيا' or text == 'امريكا الشماليه' or text == 'اوربا' or text == 'الصاروخ' or text == 'المسدس' or text == 'الطائرات' or text == 'سيدات' or text == 'قوانص' or text == 'عوانس' or text == 'المكارم' or text == 'المبائم' or text == 'المعازم' or text == 'حرف الغاء' or text == 'حرف الواو' or text == 'حرف النون' or text == 'نحاس' or text == 'الماس' or text == 'حديد' or text == 'العمر' or text == 'ساعة' or text == 'الحذاء' or text == 'بئر' or text == 'نهر' or text == 'شلال' or text == 'ادم' or text == 'نوح' or text == 'عيسئ' or text == 'الاضافر' or text == 'الاسنان' or text == 'الدموع' or text == 'الاخلاق' or text == 'الضل' or text == 'حرف النون'  then
local list = {'10' , 'براسي' , 'النمل' , '32' , 'بوتين' , '30' , '11' , 'الفم' , '14' , 'النيل' , 'ستيف جوبر' , 'خديجه' , 'الاسد' , 'طوكيو' , 'الانسان' , 'لندن' , 'الزئبق' , 'اورباالدولفين' , 'المهر' , '4' , 'اسيا' , 'اسيا' , 'المنجنيق' , 'انسات' , 'العزائم' , 'حرف الام' , 'ذهب' , 'الاسم' , 'سحاب' , 'ابراهيم' , 'الشعر' , 'حرف الواو'}
for k, v in pairs(list) do 
if text ~= v then
Redis:del(Fast.."GAME:CHER"..msg.chat_id)
send(msg.chat_id,msg.id,'• اجابتك خاطئه للاسف ,')     
return false  
end
end
end
end
if text == 'رياضيات' then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
xxx = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = xxx[math.random(#xxx)]

Redis:set(Fast..'bot:bkbk6'..msg.chat_id,name)
name = string.gsub(name,'9','7 + 2 = ?') name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?') name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?') name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?') name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?') name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?') name = string.gsub(name,'5','12 + 1 - 8 = ?') name = string.gsub(name,'16','16 + 16 - 16 = ?')
send(msg.chat_id,msg.id,'• اكمل المعادله ،\n - {'..name..'} .')     
end 
end
if text == "بوب" or text == "مشاهير" then
if not Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
return send(msg.chat_id,msg.id,"⇜ الالعاب معطلة من قبل المشرفين","md",true)
end
KlamSpeed = {"شوان","سام","ايد شيرين","جاستين","اريانا","سام سميث","ايد","جاستين","معزه","ميسي","صلاح","محمد صلاح","احمد عز","كريستيانو","كريستيانو رونالدو","رامز جلال","امير كراره","ويجز","بابلو","تامر حسني","ابيو","شيرين","نانسي عجرم","محمد رمضان","احمد حلمي","محمد هنيدي","حسن حسني","حماقي","احمد مكي"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(Fast.."mshaher"..msg.chat_id,name)
name = string.gsub(name,"شوان","https://t.me/HC6HH/8")
name = string.gsub(name,"سام","https://t.me/HC6HH/7")
name = string.gsub(name,"سام سميث","https://t.me/HC6HH/7")
name = string.gsub(name,"ايد شيرين","https://t.me/HC6HH/6")
name = string.gsub(name,"ايد","https://t.me/HC6HH/6")
name = string.gsub(name,"جاستين","https://t.me/HC6HH/4")
name = string.gsub(name,"جاستين بيبر","https://t.me/HC6HH/4")
name = string.gsub(name,"اريانا","https://t.me/HC6HH/5")
name = string.gsub(name,"ميسي","https://t.me/HC6HH/10")
name = string.gsub(name,"معزه","https://t.me/HC6HH/10")
name = string.gsub(name,"صلاح","https://t.me/HC6HH/9")
name = string.gsub(name,"محمد صلاح","https://t.me/HC6HH/9")
name = string.gsub(name,"احمد عز","https://t.me/HC6HH/12")
name = string.gsub(name,"كريم عبدالعزيز","https://t.me/HC6HH/11")
name = string.gsub(name,"كريستيانو رونالدو","https://t.me/HC6HH/13")
name = string.gsub(name,"كريستيانو","https://t.me/HC6HH/13")
name = string.gsub(name,"امير كراره","https://t.me/HC6HH/14")
name = string.gsub(name,"رامز جلال","https://t.me/HC6HH/15")
name = string.gsub(name,"ويجز","https://t.me/HC6HH/16")
name = string.gsub(name,"بابلو","https://t.me/HC6HH/17")
name = string.gsub(name,"ابيو","https://t.me/HC6HH/20")
name = string.gsub(name,"شيرين","https://t.me/HC6HH/21")
name = string.gsub(name,"نانسي عجرم","https://t.me/HC6HH/22")
name = string.gsub(name,"محمد رمضان","https://t.me/HC6HH/25")
name = string.gsub(name,"احمد حلمي","https://t.me/HC6HH/26")
name = string.gsub(name,"محمد هنيدي","https://t.me/HC6HH/27")
name = string.gsub(name,"حسن حسني","https://t.me/HC6HH/28")
name = string.gsub(name,"احمد مكي","https://t.me/HC6HH/29")
name = string.gsub(name,"تامر حسني","https://t.me/HC6HH/30")
name = string.gsub(name,"حماقي","https://t.me/HC6HH/31")
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo="..name.."&caption="..URL.escape("اسرع واحد يقول اسم هذا الفنان").."&reply_to_message_id="..(msg.id/2097152/0.5))
end
if text == "حيوان" or text == "حيوانات" then
if not Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
return send(msg.chat_id,msg.id,"⇜ الالعاب معطلة من قبل المشرفين","md",true)
end
KlamSpeedd = {"ثعلب","حمار وحشي","اسد","نمر","حصان","فرس النهر","سنجاب","كنغر","فيل","قطه","نسر","صقر","قرد","ضفدع","حرباء"};
name = KlamSpeedd[math.random(#KlamSpeedd)]
Redis:set(Fast.."mshaherr"..msg.chat_id,name)
name = string.gsub(name,"ثعلب","https://t.me/YAFAEVI/2")
name = string.gsub(name,"حمار وحشي","https://t.me/YAFAEVI/3")
name = string.gsub(name,"اسد","https://t.me/YAFAEVI/4")
name = string.gsub(name,"نمر","https://t.me/YAFAEVI/5")
name = string.gsub(name,"حصان","https://t.me/YAFAEVI/6")
name = string.gsub(name,"فرس النهر","https://t.me/YAFAEVI/7")
name = string.gsub(name,"سنجاب","https://t.me/YAFAEVI/8")
name = string.gsub(name,"كنغر","https://t.me/YAFAEVI/9")
name = string.gsub(name,"فيل","https://t.me/YAFAEVI/10")
name = string.gsub(name,"صقر","https://t.me/YAFAEVI/11")
name = string.gsub(name,"نسر","https://t.me/YAFAEVI/12")
name = string.gsub(name,"قطه","https://t.me/YAFAEVI/13")
name = string.gsub(name,"قرد","https://t.me/YAFAEVI/14")
name = string.gsub(name,"ضفدع","https://t.me/YAFAEVI/15")
name = string.gsub(name,"حرباء","https://t.me/YAFAEVI/16")
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo="..name.."&caption="..URL.escape("اسرع واحد يقول اسم هذا الحيوان").."&reply_to_message_id="..(msg.id/2097152/0.5))
end
if text == "زووم" or text == "زوم" then
if not Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
return send(msg.chat_id,msg.id,"⇜ الالعاب معطلة من قبل المشرفين","md",true)
end
KlamSpeeddd = {"فراوله","غيوم","قط","عشب","بطه","الماس","شمس","حاسبه","فطر","موقد","ساعه","حذاء","مفتاح","كرز","جبن","سلحفاه","شعر","نظاره","حمار وحشي","سلطه","بطيخ","كتاب","طماطم","ديك","كرسي","حجاب","بوصله"};
name = KlamSpeeddd[math.random(#KlamSpeeddd)]
Redis:set(Fast.."mshaherrr"..msg.chat_id,name)
name = string.gsub(name,"فراوله","https://t.me/zzommm/2")
name = string.gsub(name,"غيوم","https://t.me/zzommm/3")
name = string.gsub(name,"قط","https://t.me/zzommm/4")
name = string.gsub(name,"عشب","https://t.me/zzommm/5")
name = string.gsub(name,"بطه","https://t.me/zzommm/6")
name = string.gsub(name,"الماس","https://t.me/zzommm/7")
name = string.gsub(name,"شمس","https://t.me/zzommm/8")
name = string.gsub(name,"حاسبه","https://t.me/zzommm/9")
name = string.gsub(name,"فطر","https://t.me/zzommm/10")
name = string.gsub(name,"موقد","https://t.me/zzommm/11")
name = string.gsub(name,"ساعه","https://t.me/zzommm/12")
name = string.gsub(name,"حذاء","https://t.me/zzommm/13")
name = string.gsub(name,"مفتاح","https://t.me/zzommm/14")
name = string.gsub(name,"كرز","https://t.me/zzommm/15")
name = string.gsub(name,"جبن","https://t.me/zzommm/16")
name = string.gsub(name,"سلحفاه","https://t.me/zzommm/17")
name = string.gsub(name,"شعر","https://t.me/zzommm/18")
name = string.gsub(name,"نظاره","https://t.me/zzommm/19")
name = string.gsub(name,"حمار وحشي","https://t.me/zzommm/20")
name = string.gsub(name,"سلطه","https://t.me/zzommm/21")
name = string.gsub(name,"بطيخ","https://t.me/zzommm/22")
name = string.gsub(name,"كتاب","https://t.me/zzommm/23")
name = string.gsub(name,"طماطم","https://t.me/zzommm/24")
name = string.gsub(name,"ديك","https://t.me/zzommm/25")
name = string.gsub(name,"كرسي","https://t.me/zzommm/26")
name = string.gsub(name,"حجاب","https://t.me/zzommm/27")
name = string.gsub(name,"بوصله","https://t.me/zzommm/28")
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo="..name.."&caption="..URL.escape("اسرع واحد يعرف الصوره").."&reply_to_message_id="..(msg.id/2097152/0.5))
end
if text == "صور" then
if not Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
return send(msg.chat_id,msg.id,"⇜ الالعاب معطلة من قبل المشرفين","md",true)
end
KlamSpeeddd = {"ديل","زيتون","بن تن","ون بيس","نمله","توت","دكتور","باونتي","عسل","سابق ولاحق","دماغ","خروف","ميكي ماوس","كرسي","كيا","عين","بي ام دبليو","بشت","لاما","ببجي","سيمبا","سبونج بوب","شاي","طبله","كابتن ماجد","اليابان","بزر","ديك رومي","لاكوست","نوكيا","بطه","غوريلا","باب","كراش","لوتس","فرشه","اسعاف","تركيا","تشيلسي","طرزان","ال جي","نوتيلا","طفايه","عدنان ولينا","فتيات القوه","دمعه","قراند","قطط","سله","فلاش","يد","كبد","الصين","مكسرات","فيمتو","باباي","كالويس","مسجد","برايه","بطوط","باندا","كيندر","طياره","سنافر","الصين","سالي","بطريق","قرد","شاورما","ثريه","ميداليه","ماعز","سرير","هدى","بطاريه","احلام","نيسان","لابتوب","نسر","مسدس","مسواك","بير","قوقل","ملعب","دبابه","مغسله","سلم","دبور","كودو","بيانو","كهف","مشط","نقار الخشب","تفاح","طاوله","عنكبوت"};
name = KlamSpeeddd[math.random(#KlamSpeeddd)]
Redis:set(Fast.."photohzr"..msg.chat_id,name)
name = string.gsub(name,"ديل","https://t.me/hsjwjwhs82819/2")
name = string.gsub(name,"زيتون","https://t.me/hsjwjwhs82819/3")
name = string.gsub(name,"بن تن","https://t.me/hsjwjwhs82819/4")
name = string.gsub(name,"ون بيس","https://t.me/hsjwjwhs82819/5")
name = string.gsub(name,"نمله","https://t.me/hsjwjwhs82819/6")
name = string.gsub(name,"توت","https://t.me/hsjwjwhs82819/7")
name = string.gsub(name,"دكتور","https://t.me/hsjwjwhs82819/8")
name = string.gsub(name,"باونتي","https://t.me/hsjwjwhs82819/9")
name = string.gsub(name,"عسل","https://t.me/hsjwjwhs82819/10")
name = string.gsub(name,"سابق ولاحق","https://t.me/hsjwjwhs82819/11")
name = string.gsub(name,"دماغ","https://t.me/hsjwjwhs82819/12")
name = string.gsub(name,"خروف","https://t.me/hsjwjwhs82819/13")
name = string.gsub(name,"ميكي ماوس","https://t.me/hsjwjwhs82819/14")
name = string.gsub(name,"كرسي","https://t.me/hsjwjwhs82819/15")
name = string.gsub(name,"كيا","https://t.me/hsjwjwhs82819/16")
name = string.gsub(name,"عين","https://t.me/hsjwjwhs82819/17")
name = string.gsub(name,"بي ام دبليو","https://t.me/hsjwjwhs82819/18")
name = string.gsub(name,"بشت","https://t.me/hsjwjwhs82819/19")
name = string.gsub(name,"لاما","https://t.me/hsjwjwhs82819/20")
name = string.gsub(name,"ببجي","https://t.me/hsjwjwhs82819/21")
name = string.gsub(name,"سيمبا","https://t.me/hsjwjwhs82819/22")
name = string.gsub(name,"سبونج بوب","https://t.me/hsjwjwhs82819/23")
name = string.gsub(name,"شاي","https://t.me/hsjwjwhs82819/24")
name = string.gsub(name,"طبله","https://t.me/hsjwjwhs82819/25")
name = string.gsub(name,"كابتن ماجد","https://t.me/hsjwjwhs82819/26")
name = string.gsub(name,"اليابان","https://t.me/hsjwjwhs82819/27")
name = string.gsub(name,"بزر","https://t.me/hsjwjwhs82819/28")
name = string.gsub(name,"ديك رومي","https://t.me/hsjwjwhs82819/29")
name = string.gsub(name,"لاكوست","https://t.me/hsjwjwhs82819/30")
name = string.gsub(name,"نوكيا","https://t.me/hsjwjwhs82819/31")
name = string.gsub(name,"بطه","https://t.me/hsjwjwhs82819/32")
name = string.gsub(name,"غوريلا","https://t.me/hsjwjwhs82819/33")
name = string.gsub(name,"باب","https://t.me/hsjwjwhs82819/34")
name = string.gsub(name,"كراش","https://t.me/hsjwjwhs82819/35")
name = string.gsub(name,"لوتس","https://t.me/hsjwjwhs82819/36")
name = string.gsub(name,"فرشه","https://t.me/hsjwjwhs82819/37")
name = string.gsub(name,"اسعاف","https://t.me/hsjwjwhs82819/38")
name = string.gsub(name,"تركيا","https://t.me/hsjwjwhs82819/39")
name = string.gsub(name,"تشيلسي","https://t.me/hsjwjwhs82819/40")
name = string.gsub(name,"طرزان","https://t.me/hsjwjwhs82819/41")
name = string.gsub(name,"ال جي","https://t.me/hsjwjwhs82819/42")
name = string.gsub(name,"نوتيلا","https://t.me/hsjwjwhs82819/43")
name = string.gsub(name,"طفايه","https://t.me/hsjwjwhs82819/44")
name = string.gsub(name,"عدنان ولينا","https://t.me/hsjwjwhs82819/45")
name = string.gsub(name,"فتيات القوه","https://t.me/hsjwjwhs82819/46")
name = string.gsub(name,"دمعه","https://t.me/hsjwjwhs82819/47")
name = string.gsub(name,"قراند","https://t.me/hsjwjwhs82819/48")
name = string.gsub(name,"قطط","https://t.me/hsjwjwhs82819/49")
name = string.gsub(name,"سله","https://t.me/hsjwjwhs82819/50")
name = string.gsub(name,"فلاش","https://t.me/hsjwjwhs82819/51")
name = string.gsub(name,"يد","https://t.me/hsjwjwhs82819/52")
name = string.gsub(name,"كبد","https://t.me/hsjwjwhs82819/53")
name = string.gsub(name,"الصين","https://t.me/hsjwjwhs82819/54")
name = string.gsub(name,"مكسرات","https://t.me/hsjwjwhs82819/55")
name = string.gsub(name,"فيمتو","https://t.me/hsjwjwhs82819/56")
name = string.gsub(name,"باباي","https://t.me/hsjwjwhs82819/57")
name = string.gsub(name,"كالميرا","https://t.me/hsjwjwhs82819/58")
name = string.gsub(name,"مسجد","https://t.me/hsjwjwhs82819/59")
name = string.gsub(name,"برايه","https://t.me/hsjwjwhs82819/60")
name = string.gsub(name,"بطوط","https://t.me/hsjwjwhs82819/61")
name = string.gsub(name,"باندا","https://t.me/hsjwjwhs82819/62")
name = string.gsub(name,"كيندر","https://t.me/hsjwjwhs82819/63")
name = string.gsub(name,"طياره","https://t.me/hsjwjwhs82819/64")
name = string.gsub(name,"سنافر","https://t.me/hsjwjwhs82819/65")
name = string.gsub(name,"الصين","https://t.me/hsjwjwhs82819/66")
name = string.gsub(name,"سالي","https://t.me/hsjwjwhs82819/67")
name = string.gsub(name,"بطريق","https://t.me/hsjwjwhs82819/68")
name = string.gsub(name,"قرد","https://t.me/hsjwjwhs82819/69")
name = string.gsub(name,"شاورما","https://t.me/hsjwjwhs82819/70")
name = string.gsub(name,"ثريه","https://t.me/hsjwjwhs82819/71")
name = string.gsub(name,"ميداليه","https://t.me/hsjwjwhs82819/72")
name = string.gsub(name,"ماعز","https://t.me/hsjwjwhs82819/73")
name = string.gsub(name,"سرير","https://t.me/hsjwjwhs82819/74")
name = string.gsub(name,"هدى","https://t.me/hsjwjwhs82819/75")
name = string.gsub(name,"بطاريه","https://t.me/hsjwjwhs82819/76")
name = string.gsub(name,"احلام","https://t.me/hsjwjwhs82819/77")
name = string.gsub(name,"نيسان","https://t.me/hsjwjwhs82819/78")
name = string.gsub(name,"لابتوب","https://t.me/hsjwjwhs82819/79")
name = string.gsub(name,"نسر","https://t.me/hsjwjwhs82819/80")
name = string.gsub(name,"مسدس","https://t.me/hsjwjwhs82819/81")
name = string.gsub(name,"مسواك","https://t.me/hsjwjwhs82819/82")
name = string.gsub(name,"بير","https://t.me/hsjwjwhs82819/83")
name = string.gsub(name,"قوقل","https://t.me/hsjwjwhs82819/84")
name = string.gsub(name,"ملعب","https://t.me/hsjwjwhs82819/85")
name = string.gsub(name,"دبابه","https://t.me/hsjwjwhs82819/86")
name = string.gsub(name,"مغسله","https://t.me/hsjwjwhs82819/87")
name = string.gsub(name,"سلم","https://t.me/hsjwjwhs82819/88")
name = string.gsub(name,"دبور","https://t.me/hsjwjwhs82819/89")
name = string.gsub(name,"كودو","https://t.me/hsjwjwhs82819/90")
name = string.gsub(name,"بيانو","https://t.me/hsjwjwhs82819/91")
name = string.gsub(name,"كهف","https://t.me/hsjwjwhs82819/92")
name = string.gsub(name,"مشط","https://t.me/hsjwjwhs82819/93")
name = string.gsub(name,"نقار الخشب","https://t.me/hsjwjwhs82819/94")
name = string.gsub(name,"تفاح","https://t.me/hsjwjwhs82819/95")
name = string.gsub(name,"طاوله","https://t.me/hsjwjwhs82819/96")
name = string.gsub(name,"عنكبوت","https://t.me/hsjwjwhs82819/97")
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo="..name.."&caption="..URL.escape("اسرع واحد يعرف الصورة").."&reply_to_message_id="..(msg.id/2097152/0.5))
end
if text == 'انكليزي' then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
yyy = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = yyy[math.random(#yyy)]
Redis:set(Fast..'bot:bkbk7'..msg.chat_id,name)
name = string.gsub(name,'ذئب','Wolf') name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels') name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book') name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money') name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile') name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid') name = string.gsub(name,'صداقه','Friendchip')
name = string.gsub(name,'ذكي','Smart') 
send(msg.chat_id,msg.id,' •ما معنى كلمة {'..name..'} ، ')     
end
end
if text == "الحظ" then
if Redis:get(Fast.."Fast:Status:games:malk"..msg.chat_id) then
return false 
end
if Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
local xxffxx = 'اهلا بك في لعبه الحظ اضغط للانضمام'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط للانضمام', data = '/joineloce'},
},
}
}
Redis:del(Fast..'loce:list'..msg.chat_id) 
send(msg_chat_id,msg_id,xxffxx,"md",false, false, false, false, reply_markup)
end
end
if text == 'روليت' then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Redis:del(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) 
Redis:del(Fast..':List_Rolet:'..msg.chat_id)  
Redis:setex(Fast..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id,3600,true)  
return send(msg.chat_id,msg.id, '*• * حسننا لنلعب , ارسل عدد اللاعبين للروليت .',"md")
end
end
if text == 'نعم' and Redis:get(Fast..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id) then
local list = Redis:smembers(Fast..':List_Rolet:'..msg.chat_id) 
if #list == 1 then 
return send(msg.chat_id,msg.id,"• لم يكتمل العدد الكلي للاعبين .!؟" )
elseif #list == 0 then 
return send(msg.chat_id,msg.id,"• عذرا لم تقوم باضافة ايشلاعب .؟!" )
end 
local UserName = list[math.random(#list)]
local data = bot.searchPublicChat(UserName)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 5)  
Redis:del(Fast..':List_Rolet:'..msg.chat_id) 
Redis:del(Fast..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id)
return send(msg.chat_id,msg.id,'• تم اختيار الشخص الاتي\n• صاحب الحظ {'..UserName..'}\n• ربحت معنا 5 نقاط' )
end
if text == 'الاعبين' then
local list = Redis:smembers(Fast..':List_Rolet:'..msg.chat_id) 
local Text = '\n*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*\n' 
if #list == 0 then 
return send(msg.chat_id,msg.id, '*• * لا يوجد لاعبين هنا ' )
end 
for k, v in pairs(list) do 
Text = Text..k.."• » [" ..v.."] »\n"  
end 
return Text
end
if text and text:match("^(%d+)$") and Redis:get(Fast..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id) then  --// استقبال اللعبه الدمبله
if text == "1" then
Text = "*• * لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
Redis:set(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id,text)  
Text = '• تم بدء تسجيل اللسته \n• يرجى ارسال المعرفات \n• الفائز يحصل على (5) مجوهره\n• عدد الاعبين المطلوبه { *'..text..'* } لاعب \n 🏹'
end
Redis:del(Fast..":Start_Rolet:"..msg.chat_id..msg.sender_id.user_id)  
return send(msg.chat_id,msg.id,Text)    
end
if text and text:match('^(@[%a%d_]+)$') and Redis:get(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) then    --// استقبال الاسماء
if Redis:sismember(Fast..':List_Rolet:'..msg.chat_id,text) then
return send(msg.chat_id,msg.id,'*• * المعرف {['..text..']} موجود اساسا' ,"md")
end
Redis:sadd(Fast..':List_Rolet:'..msg.chat_id,text)
local CountAdd = Redis:get(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id)
local CountAll = Redis:scard(Fast..':List_Rolet:'..msg.chat_id)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
Redis:del(Fast..":Number_Add:"..msg.chat_id..msg.sender_id.user_id) 
Redis:setex(Fast..":Witting_StartGame:"..msg.chat_id..msg.sender_id.user_id,1400,true)  
return send(msg.chat_id,msg.id,"*• *تم ادخال المعرف { ["..text.."] } \n• **وتم اكتمال العدد الكلي \n• هل انت مستعد ؟ اجب بـ {* نعم *}","md")
end 
return send(msg.chat_id,msg.id,"*• * تم ادخال المعرف { ["..text.."] } \n• تبقى { *"..CountUser.."* } لاعبين ليكتمل العدد\n• ارسل المعرف التالي ",'md')
end
if text == ''..(Redis:get(Fast..'bot:bkbk6'..msg.chat_id) or 'لفاتع')..'' then
send(msg.chat_id,msg.id,'• مبروك لقد ربحت ،\nللعب مرة اخرى ارسل رياضيات . ',"md")   
Redis:del(Fast..'bot:bkbk6'..msg.chat_id)  
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
end 
if text == ''..(Redis:get(Fast..'bot:bkbk7'..msg.chat_id) or 'لفاتع')..'' then
send(msg.chat_id,msg.id,'• مبروك لقد ربحت ،\nللعب مرة اخرى ارسل انكليزي . ')     
Redis:del(Fast..'bot:bkbk7'..msg.chat_id)  
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id, 1)  
end

if text == "المختلف" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
mktlf = {"??","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","??‍🔧","??‍♀","??‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
Redis:set(Fast.."Game:Difference"..msg.chat_id,name)
name = string.gsub(name,"😸","😹??????😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠??💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻??👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑??🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨??🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍??👩‍‍💻👩‍‍??👩‍‍💻👨‍💻??‍💻👩‍💻👩‍💻")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧??‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍??","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳??‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂??‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️??‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅????")
return send(msg.chat_id,msg.id,"• اسرع واحد يدز الاختلاف ~ {"..name.."}","md",true)  
end
end
if text == "امثله" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
Redis:set(Fast.."Game:Example"..msg.chat_id,name)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يقول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يقول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
return send(msg.chat_id,msg.id,"• اسرع واحد يكمل المثل ~ {"..name.."}","md",true)  
end
end
if text == "كلمات" or text == "كلمه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Fast:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Fast:Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'\n⇜ عليك الاشتراك في قناة البوت لاستخدام الاوامر',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Fast:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Fast:Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'\n⇜ عليك الاشتراك في قناة البوت لاستخدام الاوامر',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Fast:Status:games:malk"..msg.chat_id) then
return false 
end
if Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
KlamSpeed = {
"مقاتل",
"سائق",
"غرفة",
"بطانية",
"طامس",
"شجاع",
"هاتف",
"تلكرام",
"مسافر",
"نعسان",
"بطيخ",
"عصبي",
"هادئ",
"عصير",
"دولمه",
"قدح",
"صباغ",
"كارتون",
"مدرسة",
"منزل",
"عاشق",
"فطور",
"مجموعة",
"اصدقاء",
"طلاب",
"فتيات",
"جميل",
"ذكي",
"فنان",
"نائم",
"دراجة",
"طائرة",
"صاروخ",
"الارض",
"الحلم",
"نبات",
"حيوان",
"انسان",
"دولة",
"حزين",
"سعيد",
"موظف",
"شركة",
"اتصال",
"حديقة",
"شارع",
"مستشفى",
"سيارة"
};
name = KlamSpeed[math.random(#KlamSpeed)]
send(msg_chat_id,msg_id,"⇜ اسرع واحد يكتب ( "..name.." )","md",true)  
Redis:set(Fast.."Fast:Game:klmaa"..msg.chat_id,name)
return false
end
end

if text == 'عقاب' then
if Redis:get(Fast.."Fast:Status:games:malk"..msg.chat_id) then
return false 
end
if not Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
return false
end
Redis:del(Fast..'List_Ahkamm'..msg.chat_id)
Redis:del(Fast..'members_Ahkamm'..msg.chat_id) 
Redis:set(Fast.."raeahkamm"..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(Fast..'List_Ahkamm'..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(Fast..'members_Ahkamm'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(Fast.."Start_Ahkamm"..msg.chat_id,3600,true)
local AkZilzal = '⇜ بدينا لعبة عقاب واضفت اسمك للعبة\n\n⇜ اللي يبي يلعب يرسل كلمة انا او يضغط الزر\n⇜ للانتهاء يرسل نعم اللي بدء العبة'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'اضغط للانضمام', callback_data = '/Akab'},},}
local rep = msg.id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' ..msg_chat_id.. '&text=' .. URL.escape(AkZilzal).."&reply_to_message_id="..rep..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard))
end
if text == 'لاعبين عقاب' then
local list = Redis:smembers(Fast..'List_Ahkamm'..msg.chat_id) 
local Text = 'قائمة لاعبين عقاب\nـــــــــــــــــــــــــــــــــــــــــــــــ\n\n' 
if #list == 0 then 
return bot.sendText(msg_chat_id,msg_id, '⇜ لا يوجد لاعبين بعد',"md")
end 
for k,v in pairs(list) do
local user_info = bot.getUser(v)
local name = user_info.first_name
Text = Text..k.." *- اللاعـب »* ["..name.."](tg://user?id="..v..")\n"
end
return bot.sendText(msg_chat_id,msg_id,Text,"md")
end
if text == 'نعم' and Redis:get(Fast.."Witting_StartGamehh"..msg.chat_id) then
rarahkam = Redis:get(Fast.."raeahkamm"..msg.chat_id)
if tonumber(rarahkam) == msg.sender_id.user_id then
local list = Redis:smembers(Fast..'List_Ahkamm'..msg.chat_id) 
if #list == 1 then 
return bot.sendText(msg.chat_id,msg.id,"⇜ لا استطيع بدء اللعبة بلاعب واحد فقط","md",true)
end 
local UserName = list[math.random(#list)]

local UserId_Info = bot.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '@['..UserId_Info.username..']'
else
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
end
Redis:sadd(Fast.."kk_Akab"..msg.chat_id,UserId_Info.id)
Redis:srem(Fast..'members_Ahkamm'..msg_chat_id,UserId_Info.id) 
local GetLike = Redis:incrby(Fast.."Num:Add:Akab"..msg.chat_id..UserId_Info.id, 1) 
Redis:hset(Fast..':GroupUserCountAkab:'..msg.chat_id,UserId_Info.id,GetLike)
local UserrrInfo = bot.getUser(UserName) 
if UserrrInfo.first_name then
NameLUser = UserrrInfo.first_name
else
NameLUser = UserrrInfo.first_name
end
NameLUser = NameLUser
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
Redis:hset(Fast..':GroupAkabNameUser:'..msg.chat_id,UserId_Info.id,NameLUser)
Redis:del(Fast..'raeahkamm'..msg.chat_id) 
Redis:del(Fast..'List_Ahkamm'..msg.chat_id) 
Redis:del(Fast.."Witting_StartGamehh"..msg.chat_id)
Redis:del(Fast.."Start_Ahkamm"..msg.chat_id)
katu = {
"*روح الى اي قروب عندك واكتب اي شيء يطلبه منك اللاعبين الحد الاقصى 3 رسائل*.",
"*قول نكتة ولازم احد الاعبين يضحك اذا ماضحك يعطونك كتم الى ان يجي دورك مرة ثانية*.",
"*سمعنا صوتك و غن اي اغنية من اختيار الاعبين الي معك*.",
"*ذي المرة لك لا تعيدها*.",
"*صور اي شيء يطلبه منك الاعبين*.",
"*سكر خشمك و قول كلمة من اختيار الاعبين الي معك*.",
"*روح عند اي احد بالخاص و قول له انك تحبه و الخ*.",
"*اكتب في الشات اي شيء يطلبه منك الاعبين في الخاص*.",
"*قول نكتة اذا و لازم احد الاعبين يضحك اذا محد ضحك يعطونك ميوت الى ان يجي دورك مرة ثانية*.",
"*سامحتك خلاص مافيه عقاب لك *.",
"*غير اسمك الى اسم من اختيار الاعبين الي معك*.",
"*منشن الجميع وقل انا اكرهكم*.",
"*قول لاي بنت موجود في المجموعـة كلمة حلوه*.",
"*قول قصيدة *.",
"*سامحتك خلاص مافيه عقاب لك *.",
"*تاخذ عقابين*.",
"*اذا انت ولد اكسر اغلى او احسن عطور عندك اذا انتي بنت اكسري الروج حقك او الميك اب حقك*.",
"*اذهب الى واحد ماتعرفه وقل له انا كيوت وابي بوسه*.",
"* تروح عند شخص وقول له احبك*."
}
name = katu[math.random(#katu)]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'كتم الخاسر', data = '/akabmute'},},}}
return bot.sendText(msg_chat_id,msg_id,'⇜ تم اختيار : '..ls..' لمعاقبته\n\n⇜ العقوبة هي : ( '..name..' ) \n⇜ تستطيع كتم الخاسر اذا لم ينفذ الحكم', 'md', true, false, reply_markup)
end
end
if text == 'احكام' then
if Redis:get(Fast.."Fast:Status:games:malk"..msg.chat_id) then
return false 
end
if not Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
return false
end
local zzllzz = '⇜ بدينا لعبة احكام واضفت اسمك\n\n⇜ اللي يبي يلعب يضغط الزر بالاسفل'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط للانضمام', data = '/joineahkam'},
},
}
}
Redis:del(Fast..'List_Ahkkam'..msg.chat_id)
Redis:set(Fast.."raeahkkam"..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(Fast..'List_Ahkkam'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(Fast.."Start_Ahkkam"..msg.chat_id,3600,true)
bot.sendText(msg_chat_id,msg_id,zzllzz,"md",false, false, false, false, reply_markup)
end
-------------------------------------------
if text == 'كرسي' or text == 'كرسي الاعتراف' then
if Redis:get(Fast.."Fast:Status:games:malk"..msg.chat_id) then
return false 
end
if not Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
return false
end
local Quuiz = Redis:get(Fast.."Quiz:Add:Koorsy"..msg.chat_id) or 0
if tonumber(Quuiz) < tonumber(10) and Quuiz ~= 0 then 
return bot.sendText(msg.chat_id,msg.id, "⇜ هنالك لعبة كرسي جارية حاليا\n⇜ ارسل (تصفير كرسي) للبدء من جديد","md",true)  
end
local zzllzz = '⇜ بدينا لعبة كرسي الاعتراف واضفت اسمك\n\n⇜ اللي يبي يلعب يرسل كلمة (انا) او يضغط الزر\n⇜ للانتهاء يرسل (نعم) اللي بدأ اللعبة'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط للانضمام', data = '/Koorsy'},
},
}
}
Redis:del(Fast..'List_Koorsi'..msg.chat_id)
Redis:del(Fast.."Quiz:Add:Koorsy"..msg.chat_id)
Redis:set(Fast.."raekoorsi"..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(Fast..'List_Koorsi'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(Fast.."Start_Koorsi"..msg.chat_id,3600,true)
bot.sendText(msg_chat_id,msg_id,zzllzz,"md",false, false, false, false, reply_markup)
end
----------------------------------------
if text == 'صراحه' or text == 'صراحة' or text == 'صارحني' then
if Redis:get(Fast.."Fast:Status:games:malk"..msg.chat_id) then
return false 
end
if not Redis:get(Fast.."Fast:Status:games"..msg.chat_id) then
return false
end
local Qiuiz = Redis:get(Fast.."Quiz:Add:Saraha"..msg.chat_id) or 0
if tonumber(Qiuiz) < tonumber(5) and Qiuiz ~= 0 then 
return bot.sendText(msg.chat_id,msg.id, "⇜ هنالك لعبة صراحة جارية حاليا\n⇜ ارسل (تصفير صراحه) للبدء من جديد","md",true)  
end
local zzllzz = '⇜ بدينا لعبة المصارحه واضفت اسمك\n\n⇜ اللي يبي يلعب يرسل كلمة (انا) او يضغط الزر\n⇜ للانتهاء يرسل (نعم) اللي بدأ اللعبة'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط للانضمام', data = '/Sarraha'},
},
}
}
Redis:del(Fast..'List_Saraha'..msg.chat_id)
Redis:del(Fast.."Quiz:Add:Saraha"..msg.chat_id)
Redis:set(Fast.."raesaraha"..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(Fast..'List_Saraha'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(Fast.."Start_Saraha"..msg.chat_id,3600,true)
bot.sendText(msg_chat_id,msg_id,zzllzz,"md",false, false, false, false, reply_markup)
end
----------------------------------
if text == "تصفير كرسي" then 
Redis:del(Fast.."Quiz:Add:Koorsy"..msg.chat_id)
return bot.sendText(msg_chat_id,msg_id, "*✦┊تم تصفيـر لعبـة كرسـي الاعتـراف .. بنجـاح ✓\n✦┊ارسـل الان ⇜ (كرسي) لـ بـدء اللعبـه*","md",true)  
end
if text == "تصفير صراحه" then 
Redis:del(Fast.."Quiz:Add:Saraha"..msg.chat_id)
return bot.sendText(msg_chat_id,msg_id, "*✦┊تم تصفيـر لعبـة صـارحني بسـريـه .. بنجـاح ✓\n✦┊ارسـل الان ⇜ (صراحه) لـ بـدء اللعبـه*","md",true)  
end

if text == 'اكتموه' and msg.reply_to_message_id ~= 0 then
if not Redis:get(Fast.."Status:Aktmooh"..msg.chat_id) then
return bot.sendText(msg.chat_id,msg.id,"⇜ مايمديك تصوت على كتم احد\n⇜ امر اكتموه معطل","md",true)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = bot.getUser(Message_Reply.sender_id.user_id)
if ban.id == 779108237 then
return bot.sendText(msg_chat_id,msg_id,'⇜ مايمديك تكتب بوب',"md",true) 
elseif ban.id == Sudo_Id then
return bot.sendText(msg_chat_id,msg_id,'⇜ هـييهه .. مايمديك تكتم المطور الاساسي',"md",true) 
end
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local RinkBot = Controller(msg_chat_id,Message_Reply.sender_id.user_id)
local zzllzz = '- المستخدم : '..Name..'\n- رتبته '..RinkBot..'\n- هل توافقون على كتمه\n\n-المطلوب 3 اصوات'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط للتصويت', data = '/Aktmooh'},
},
}
}
Redis:set(Fast.."Ak_Tmooh"..msg.chat_id,Message_Reply.sender_id.user_id)
Redis:del(Fast..'List_Aktooh'..msg.chat_id)
Redis:set(Fast.."raeaktooh"..msg.chat_id,msg.sender_id.user_id)
Redis:sadd(Fast..'List_Aktooh'..msg.chat_id,msg.sender_id.user_id)
Redis:setex(Fast.."Start_Aktmooh"..msg.chat_id,3600,true)
bot.sendText(msg_chat_id,msg_id,zzllzz,"md",false, false, false, false, reply_markup)
end
if text == 'مسح رسائله' and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(Fast..'Num:Message:User'..msg.chat_id..':'..rep_idd) 
return send(msg.chat_id,msg.id,"• تم مسح رسائله ", "md")
end
if text == 'مسح نقاطه' and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(Fast.."Num:Add:Games"..msg.chat_id..rep_idd)
return send(msg.chat_id,msg.id,"• تم مسح نقاطه ", "md")
end
if text == 'مسح تعديلاته' and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(Fast..'Num:Message:Edit'..msg.chat_id..rep_idd)
return send(msg.chat_id,msg.id,"• تم مسح تعديلاته ", "md")
end

if text and text:match("^بيع نقاطي (%d+)$") then
local NumGame = text:match("^بيع نقاطي (%d+)$") 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if tonumber(NumGame) == tonumber(0) then
return send(msg.chat_id,msg.id,"\n*• لا استطيع البيع اقل من 1 *","md",true)  
end
local NumberGame = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id)
if tonumber(NumberGame) == tonumber(0) then
return send(msg.chat_id,msg.id,"• ليس لديك جواهر من الالعاب \n• اذا كنت تريد ربح النقاط \n• ارسل الالعاب وابدأ اللعب ! ","md",true)  
end
if tonumber(NumGame) > tonumber(NumberGame) then
return send(msg.chat_id,msg.id,"\n• ليس لديك جواهر بهذا العدد \n• لزيادة نقاطك في اللعبه \n• ارسل الالعاب وابدأ اللعب !","md",true)   
end
local NumberGet = (tonumber(NumGame) * 50)
Redis:decrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,NumGame)  
Redis:incrby(Fast.."Num:Message:User"..msg.chat_id..":"..msg.sender_id.user_id,NumberGet)  
return send(msg.chat_id,msg.id,"• تم خصم *~ { "..NumGame.." }* من نقاطك \n• وتم اضافة* ~ { "..NumberGet.." } رسالة الى رسائلك *","md",true)  
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id ~= 0 and Redis:get(Fast.."Status:Games"..msg.chat_id) then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg.chat_id,msg.id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..rep_idd, text:match("^اضف نقاط (%d+)$"))  
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"• تم اضافة له { "..text:match("^اضف نقاط (%d+)$").." } من النقاط").Reply,"md",true)  
end
if text and text:match("^اضف تعديلات (%d+)$") and msg.reply_to_message_id ~= 0 and Redis:get(Fast.."Status:Games"..msg.chat_id) then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg.chat_id,msg.id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(Fast..'Num:Message:Edit'..msg.chat_id..rep_idd, text:match("^اضف تعديلات (%d+)$"))  
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"• تم اضافة له { "..text:match("^اضف تعديلات (%d+)$").." } من التعديلات").Reply,"md",true)  
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id ~= 0 and Redis:get(Fast.."Status:Games"..msg.chat_id) then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg.chat_id,msg.id,"\n• عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n• عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(Fast.."Num:Message:User"..msg.chat_id..":"..rep_idd, text:match("^اضف رسائل (%d+)$"))  
return send(msg.chat_id,msg.id,Reply_Status(rep_idd,"• تم اضافة له { "..text:match("^اضف رسائل (%d+)$").." } من الرسائل").Reply,"md",true)  
end
if text == "نقاطي" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في 𝕊𝕆𝕌ℝℂ𝔼 ℂ𝔸ℝ𝕆𝕃𝕌𝕊 لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id) or 0
if Num == 0 then 
return send(msg.chat_id,msg.id, "• ليس لديك نقاط ارسل الالعاب وابدأ اللعب ","md",true)  
else
return send(msg.chat_id,msg.id, "• عدد النقاط التي ربحتها *← "..Num.." *","md",true)  
end
end

end

return {Fast = games}
