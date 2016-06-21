# Pagespeed Insights for bossrevolution.com

Grunt task that checks Pagespeed score for the list of urls.


## Install

Required:

1. **[Node.js](https://nodejs.org/)** installed
2. **[grunt-cli](http://gruntjs.com/using-the-cli)** installed globally: `sudo npm install -g grunt-cli`

Clone this repository. Open projects root folder in console and run:

```
npm install
```

## Usage

```
grunt --force
```

The `--force` key needed to pass to the next test if speed score below treshold.

Output example:

![Screenshot taken 20 June 2016](https://habrastorage.org/files/ff7/776/697/ff7776697dd544d3beb919c93f93858e.png)

Also the following tasks available:

* `grunt all --force` — the default task: all pages, desktop and mobile.
* `grunt homepage --force` — desktop and mobile tests for homepage.
* `grunt desktop --force` — all pages on desktop profile.
* `grunt mobile --force` — all pages on mobile profile
* `grunt save --force` - all pages, desktop and mobile. Output saved to files `results/pagespeed-desktop.json` and `results/pagespeed-mobile.json`

## Settings

Check **Gruntfile.coffee** for settings:

```coffee
# bossrev variables
bossrev:
    threshold:
        desktop: 80
        mobile: 70
    enus:
        url: 'https://www.bossrevolution.com/en-us'
        paths: [
            ''
            '/services'
            '/services/international-calling'
            '/services/money-transfer'
            '/services/international-mobile-topup'
            '/services/egift'
            '/services/domestic-mobile-topup'
            '/services/call-me'
            '/services/international-egifts'
            '/services/bill-pay'
            '/services/visa-virtual'
            '/rates'
            '/apps'
            '/support'
            '/brclub'
            '/login?ReturnUrl=%2Fen-us%2Fmy-account'
            '/register?ReturnUrl=%2Fen-us%2Fmy-account'
            '/about'
            '/brcares'
            '/faq'
            '/all-countries'
        ]
```
