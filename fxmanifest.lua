fx_version 'cerulean'
games {'gta5'}

version '1.0.0'

shared_script '@es_extended/imports.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}

files {
    'ui/*'
}

ui_page 'ui/ui.html'