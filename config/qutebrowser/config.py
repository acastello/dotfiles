import subprocess

def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

nothing =   """
            var i, n, y;
            y = window.pageYOffset;
            n = document.getElementsByClassName('fileThumb');
            for (i=0; i < n.length - 1; i++) {
                if (n[i].classList.contains('image-expanded-anti')) {
                    n[i].children[1].click();
                } else if (n[i].parentElement.offsetTop > y) {
                    n[i].parentElement.scrollIntoView()
                    n[i].children[0].click()
                    break
                }
            }
            n.length
            """

xress = read_xresources('*')

c.backend = 'webengine'
c.downloads.remove_finished = 1500
c.url.searchengines['w'] =    "https://en.wikipedia.org/w/index.php?search={}"
c.url.searchengines['i'] =    "https://infogalactic.com/info/{}"
c.url.searchengines['aw'] =   "https://wiki.archlinux.org/index.php?search={}&title=Special%3ASearch&go=Go"
c.url.searchengines['g'] =    "https://github.com/search?utf8=%E2%9C%93&q={}"
c.url.searchengines['goes'] = "https://golang.org/search?q={}"
c.url.searchengines['4'] =    "http://boards.4chan.org/{}"
c.url.searchengines['c?'] =   "https://dictionary.cambridge.org/dictionary/english/{}"
c.hints.chars = "1234QWERASDFZXC"
c.keyhint.delay = 200
c.tabs.padding['top'] = 2
c.tabs.padding['bottom'] = 2
c.fonts.hints = "11px monospace"
c.fonts.tabs = "12px monospace"

c.colors.completion.fg = xress['*foreground']
c.colors.completion.odd.bg = "#444F54"
c.colors.completion.even.bg = "#343C40"
c.colors.hints.fg = xress['*color0']
c.colors.hints.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(255, 247, 133, 0.5), stop:1 rgba(255, 197, 66, 0.5))'
c.colors.statusbar.normal.bg = "#111415"
c.colors.statusbar.normal.fg = xress['*foreground']
c.colors.tabs.indicator.start = xress['*color5']
c.colors.tabs.indicator.stop = xress['*color2']
c.colors.tabs.indicator.error = xress['*color1']
c.colors.tabs.odd.bg = "#4F5C61"
c.colors.tabs.even.bg = "#384145"
c.colors.tabs.odd.fg = \
c.colors.tabs.even.fg = xress['*foreground']
c.colors.tabs.selected.odd.bg = \
c.colors.tabs.selected.even.bg = "#111415"
c.colors.tabs.selected.odd.fg = \
c.colors.tabs.selected.even.fg = xress['*foreground']
c.colors.webpage.bg = xress['*color7']

config.unbind('q')

config.bind('`',                    'tab-focus')
config.bind('~',                    'tab-focus -1')
config.bind('q`',                   'tab-focus 5')
config.bind('w`',                   'tab-focus 6')
config.bind('e`',                   'tab-focus 7')
config.bind('r`',                   'tab-focus 8')
config.bind('<Ctrl-1>',             'tab-focus 1')
config.bind('<Ctrl-2>',             'tab-focus 2')
config.bind('<Ctrl-3>',             'tab-focus 3')
config.bind('<Ctrl-4>',             'tab-focus 4')
config.bind('<Ctrl-5>',             'tab-focus 5')
config.bind('<Ctrl-6>',             'tab-focus 6')
config.bind('<Ctrl-7>',             'tab-focus 7')
config.bind('<Ctrl-8>',             'tab-focus 8')
config.bind('<Ctrl-9>',             'tab-focus -n -1')
config.bind('Shift+PgDown',    'tab-move -')
config.bind(',',                    'scroll-page 0 0.35')
config.bind('l',                    'jseval ' + nothing.replace('\n',';'))
