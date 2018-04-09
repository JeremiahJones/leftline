namespace :populate_default_settings do
  desc 'Populate default settings for games'
  task pubg_settings: :environment do
    puts "\rPopulating pubg default settings"
    DefaultSetting.create(game: 'pubg',
                          settings: {
                            'forward': 'w',
                            'back': 's',
                            'left': 'a',
                            'right': 'd',
                            'crouch': 'c',
                            'prone': 'z',
                            'jump': 'space',
                            'sprint': 'shift',
                            'vault': 'space',
                            'walk': 'ctrl',
                            'auto run': '=',
                            'lean': 'q/e',
                            'vehicle': {
                              'forward': 'w',
                              'back': 's',
                              'left': 'a',
                              'right': 'd',
                              'handbrake': 'space',
                              'boost': 'shift',
                              'honk': 'left-click',
                              'switch to drivers seat': 'ctrl + 1',
                              'switch seat': 'ctrl + 1/2/3/4',
                              'motorcycle air control': 'left control + space'
                            },
                            'view': {
                              '1st/3rd person toggle': 'v',
                              'switch to left/right shoulder': 'q/e',
                              'aim': 'right-click(hold)',
                              'scope/ads': 'right-click(tap-once)',
                              'hold breath': 'shift',
                              'watch bullet drop(while aiming)': 'left-click(hold)'
                            },
                            'weapon': {
                              'reload': 'r',
                              'fire-mode toggle': 'b',
                              'equip primary': '1',
                              'equip secondary': '2',
                              'equip pistol': '3',
                              'equip melee': '4',
                              'equip grenade': '5',
                              'cycle weapons': 'scroll up/down',
                              'change zeroing': 'page up/down',
                              'reset zeroing': 'mouse wheel click',
                              'variable zoom on 8x/15x': 'mouse wheel',
                              'holster weapon': 'x',
                              'shoot weapon': 'left click'
                            },
                            'other/misc': {
                              'emotes': '~ + left click',
                              'open/close/get-in/get-out/pickup': 'f'
                            }
                          })
    puts "\rFinished Populating pubg Default Settings"
  end
end
