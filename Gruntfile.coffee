# Grunt Configuration

module.exports = (grunt) ->

	# Initiate the Grunt configuration.
	grunt.initConfig

		# Allow use of the package.json data.
		pkg: grunt.file.readJSON('package.json')

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

		# pagespeed config
		pagespeed:
			options:
				nokey: true
				url: '<%= bossrev.enus.url %>'
			enUsHomeDesktop:
				options:
					url: '<%= bossrev.enus.url %>'
					locale: 'en_US'
					strategy: 'desktop'
					threshold: '<%- bossrev.threshold.desktop %>'
			enUsPathsDesktop:
				options:
					paths: '<%= bossrev.enus.paths %>'
					locale: 'en_US'
					strategy: 'desktop'
					threshold: '<%- bossrev.threshold.desktop %>'
			enUsHomeMobile:
				options:
					url: '<%= bossrev.enus.url %>'
					locale: 'en_US'
					strategy: 'mobile'
					threshold: '<%- bossrev.threshold.mobile %>'
			enUsPathsMobile:
				options:
					paths: '<%= bossrev.enus.paths %>'
					locale: 'en_US'
					strategy: 'mobile'
					threshold: '<%- bossrev.threshold.mobile %>'
			enUsPathsDesktopToFile:
				options:
					paths: '<%= bossrev.enus.paths %>'
					locale: 'en_US'
					strategy: 'desktop'
					threshold: '<%- bossrev.threshold.desktop %>'
					format: "json"
					file: "pagespeed-desktop"
					filepath: "results/"
			enUsPathsMobileToFile:
				options:
					paths: '<%= bossrev.enus.paths %>'
					locale: 'en_US'
					strategy: 'mobile'
					threshold: '<%- bossrev.threshold.mobile %>'
					format: "json"
					file: "pagespeed-mobile"
					filepath: "results/"

		# notify
		notify:
			pagespeed:
				options:
					title: 'COMPLETED'
					message: 'Pagespeed Insights finished'

	# measures the time each task takes
	require('time-grunt')(grunt)

	# Build the available Grunt tasks.
	grunt.loadNpmTasks 'grunt-pagespeed'
	grunt.loadNpmTasks 'grunt-notify'

	# Register our Grunt tasks.
	grunt.registerTask 'desktop',	['pagespeed:enUsPathsDesktop',			'notify:pagespeed']
	grunt.registerTask 'mobile',	['pagespeed:enUsPathsMobile',			'notify:pagespeed']
	grunt.registerTask 'homepage',	['pagespeed:enUsHomeDesktop', 			'pagespeed:enUsHomeMobile', 		'notify:pagespeed']
	grunt.registerTask 'all',		['pagespeed:enUsPathsDesktop', 			'pagespeed:enUsPathsMobile', 		'notify:pagespeed']
	grunt.registerTask 'save',		['pagespeed:enUsPathsDesktopToFile', 	'pagespeed:enUsPathsMobileToFile', 	'notify:pagespeed']
	grunt.registerTask 'default',	['all']
