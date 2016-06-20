# Grunt Configuration

module.exports = (grunt) ->

	# Initiate the Grunt configuration.
	grunt.initConfig

		# Allow use of the package.json data.
		pkg: grunt.file.readJSON('package.json')

		# bossrev variables
		bossrev:
			enus:
				url: 'https://www.bossrevolution.com/en-us'
				paths: [
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
			enushomedesktop:
				options:
					url: '<%= bossrev.enus.url %>'
					locale: 'en_US'
					strategy: 'desktop'
					threshold: 80
			enuspathsdesktop:
				options:
					paths: '<%= bossrev.enus.paths %>'
					locale: 'en_US'
					strategy: 'desktop'
					threshold: 80
			enushomemobile:
				options:
					url: '<%= bossrev.enus.url %>'
					locale: 'en_US'
					strategy: 'mobile'
					threshold: 70
			enuspathsmobile:
				options:
					paths: '<%= bossrev.enus.paths %>'
					locale: 'en_US'
					strategy: 'mobile'
					threshold: 70

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
	grunt.registerTask 'runpagespeed',	['pagespeed:enushomedesktop', 'pagespeed:enushomemobile', 'pagespeed:enuspathsdesktop', 'pagespeed:enuspathsmobile', 'notify:pagespeed']
	grunt.registerTask 'default',		['runpagespeed']
